import { NextResponse } from "next/server";
import { getServerSession } from "next-auth";
import { authOptions } from "@/lib/authOptions";
import prisma from "@/lib/db";

export async function POST(
  _req: Request,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const session = await getServerSession(authOptions);
    if (!session) {
      return NextResponse.json({ message: "Unauthorized" }, { status: 401 });
    }

    const { id: newsFeedId } = await params;
    const userId = session.user.id;

    const feed = await prisma.newsFeed.findUnique({
      where: { id: newsFeedId },
      select: { id: true },
    });

    if (!feed) {
      return NextResponse.json({ message: "News feed not found" }, { status: 404 });
    }

    const result = await prisma.$transaction(async (tx) => {
      const existingLike = await tx.newsFeedLike.findUnique({
        where: { userId_newsFeedId: { userId, newsFeedId } },
        select: { id: true },
      });

      if (existingLike) {
        await tx.newsFeedLike.delete({
          where: { userId_newsFeedId: { userId, newsFeedId } },
        });

        const updatedFeed = await tx.newsFeed.update({
          where: { id: newsFeedId },
          data: { likes: { decrement: 1 } },
          select: { likes: true },
        });

        return {
          liked: false,
          likes: Math.max(0, updatedFeed.likes ?? 0),
        };
      }

      await tx.newsFeedLike.create({
        data: { userId, newsFeedId },
      });

      const updatedFeed = await tx.newsFeed.update({
        where: { id: newsFeedId },
        data: { likes: { increment: 1 } },
        select: { likes: true },
      });

      return {
        liked: true,
        likes: updatedFeed.likes ?? 0,
      };
    });

    return NextResponse.json(result, { status: 200 });
  } catch (e: unknown) {
    console.error("News feed like error:", e);
    return NextResponse.json(
      { message: e instanceof Error ? e.message : "Internal server error" },
      { status: 500 }
    );
  }
}
