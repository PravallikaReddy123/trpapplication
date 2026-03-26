/*
  Warnings:

  - You are about to drop the column `mediaType` on the `NewsFeed` table. All the data in the column will be lost.
  - You are about to drop the column `mediaUrl` on the `NewsFeed` table. All the data in the column will be lost.
  - You are about to drop the column `juspayOrderId` on the `Payment` table. All the data in the column will be lost.
  - You are about to drop the column `juspayPaymentId` on the `Payment` table. All the data in the column will be lost.
  - You are about to drop the column `juspayStatus` on the `Payment` table. All the data in the column will be lost.
  - You are about to drop the column `razorpayOrderId` on the `Payment` table. All the data in the column will be lost.
  - You are about to drop the column `razorpayPaymentId` on the `Payment` table. All the data in the column will be lost.
  - You are about to drop the column `razorpaySignature` on the `Payment` table. All the data in the column will be lost.
  - You are about to drop the `Bus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `BusBooking` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `BusRoute` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ClassRoom` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CotBooking` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Hostel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `LibraryIssue` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Room` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RoomAllocation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RoomStudentAssignment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RoomTeacherAssignment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TeacherDailyAttendance` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Timetable` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `level` to the `Event` table without a default value. This is not possible if the table is not empty.
  - Added the required column `location` to the `Event` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mode` to the `Event` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `Event` table without a default value. This is not possible if the table is not empty.
  - Made the column `amount` on table `Event` required. This step will fail if there are existing NULL values in that column.

*/
-- CreateEnum
CREATE TYPE "NotificationType" AS ENUM ('LEAVE', 'FEES', 'CERTIFICATES', 'ATTENDANCE', 'WORKSHOPS', 'NEWS', 'CIRCULAR', 'MARKS', 'HOMEWORK');

-- CreateEnum
CREATE TYPE "SubscriptionStatus" AS ENUM ('ACTIVE', 'EXPIRED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "TeacherAuditCategory" AS ENUM ('TEACHING_METHOD', 'PUNCTUALITY', 'STUDENT_ENGAGEMENT', 'INNOVATION', 'EXTRA_CURRICULAR', 'RESULTS', 'CUSTOM');

-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE');

-- CreateEnum
CREATE TYPE "BoardingType" AS ENUM ('SEMI_RESIDENTIAL', 'REGULAR_BOARDER');

-- CreateEnum
CREATE TYPE "Grade" AS ENUM ('LKG', 'UKG', 'GRADE_1', 'GRADE_2', 'GRADE_3', 'GRADE_4', 'GRADE_5', 'GRADE_6', 'GRADE_7', 'GRADE_8', 'GRADE_9', 'GRADE_11');

-- AlterEnum
ALTER TYPE "LeaveStatus" ADD VALUE 'CONDITIONALLY_APPROVED';

-- DropForeignKey
ALTER TABLE "Bus" DROP CONSTRAINT "Bus_schoolId_fkey";

-- DropForeignKey
ALTER TABLE "BusBooking" DROP CONSTRAINT "BusBooking_busId_fkey";

-- DropForeignKey
ALTER TABLE "BusBooking" DROP CONSTRAINT "BusBooking_routeId_fkey";

-- DropForeignKey
ALTER TABLE "BusBooking" DROP CONSTRAINT "BusBooking_schoolId_fkey";

-- DropForeignKey
ALTER TABLE "BusBooking" DROP CONSTRAINT "BusBooking_studentId_fkey";

-- DropForeignKey
ALTER TABLE "BusRoute" DROP CONSTRAINT "BusRoute_busId_fkey";

-- DropForeignKey
ALTER TABLE "ClassRoom" DROP CONSTRAINT "ClassRoom_classId_fkey";

-- DropForeignKey
ALTER TABLE "ClassRoom" DROP CONSTRAINT "ClassRoom_roomAllocationId_fkey";

-- DropForeignKey
ALTER TABLE "CotBooking" DROP CONSTRAINT "CotBooking_roomId_fkey";

-- DropForeignKey
ALTER TABLE "CotBooking" DROP CONSTRAINT "CotBooking_schoolId_fkey";

-- DropForeignKey
ALTER TABLE "CotBooking" DROP CONSTRAINT "CotBooking_studentId_fkey";

-- DropForeignKey
ALTER TABLE "Hostel" DROP CONSTRAINT "Hostel_schoolId_fkey";

-- DropForeignKey
ALTER TABLE "LibraryIssue" DROP CONSTRAINT "LibraryIssue_issuedById_fkey";

-- DropForeignKey
ALTER TABLE "LibraryIssue" DROP CONSTRAINT "LibraryIssue_schoolId_fkey";

-- DropForeignKey
ALTER TABLE "LibraryIssue" DROP CONSTRAINT "LibraryIssue_studentId_fkey";

-- DropForeignKey
ALTER TABLE "Room" DROP CONSTRAINT "Room_hostelId_fkey";

-- DropForeignKey
ALTER TABLE "RoomAllocation" DROP CONSTRAINT "RoomAllocation_schoolId_fkey";

-- DropForeignKey
ALTER TABLE "RoomStudentAssignment" DROP CONSTRAINT "RoomStudentAssignment_roomAllocationId_fkey";

-- DropForeignKey
ALTER TABLE "RoomStudentAssignment" DROP CONSTRAINT "RoomStudentAssignment_studentId_fkey";

-- DropForeignKey
ALTER TABLE "RoomTeacherAssignment" DROP CONSTRAINT "RoomTeacherAssignment_roomAllocationId_fkey";

-- DropForeignKey
ALTER TABLE "RoomTeacherAssignment" DROP CONSTRAINT "RoomTeacherAssignment_teacherId_fkey";

-- DropForeignKey
ALTER TABLE "TeacherDailyAttendance" DROP CONSTRAINT "TeacherDailyAttendance_schoolId_fkey";

-- DropForeignKey
ALTER TABLE "TeacherDailyAttendance" DROP CONSTRAINT "TeacherDailyAttendance_teacherId_fkey";

-- DropForeignKey
ALTER TABLE "Timetable" DROP CONSTRAINT "Timetable_classId_fkey";

-- DropIndex
DROP INDEX "PaymentWebhookEvent_hyperpgOrderId_idx";

-- DropIndex
DROP INDEX "PaymentWebhookEvent_orderId_idx";

-- AlterTable
ALTER TABLE "Event" ADD COLUMN     "additionalInfo" TEXT,
ADD COLUMN     "level" TEXT NOT NULL,
ADD COLUMN     "location" TEXT NOT NULL,
ADD COLUMN     "mode" TEXT NOT NULL,
ADD COLUMN     "type" TEXT NOT NULL,
ALTER COLUMN "amount" SET NOT NULL,
ALTER COLUMN "amount" SET DEFAULT 0;

-- AlterTable
ALTER TABLE "Homework" ADD COLUMN     "assignedDate" TIMESTAMP(3),
ADD COLUMN     "file" TEXT;

-- AlterTable
ALTER TABLE "Mark" ADD COLUMN     "examType" TEXT;

-- AlterTable
ALTER TABLE "NewsFeed" DROP COLUMN "mediaType",
DROP COLUMN "mediaUrl";

-- AlterTable
ALTER TABLE "Payment" DROP COLUMN "juspayOrderId",
DROP COLUMN "juspayPaymentId",
DROP COLUMN "juspayStatus",
DROP COLUMN "razorpayOrderId",
DROP COLUMN "razorpayPaymentId",
DROP COLUMN "razorpaySignature",
ADD COLUMN     "purpose" TEXT NOT NULL DEFAULT 'FEES',
ALTER COLUMN "status" SET DEFAULT 'PENDING';

-- AlterTable
ALTER TABLE "School" ADD COLUMN     "billingMode" TEXT NOT NULL DEFAULT 'PARENT_SUBSCRIPTION',
ADD COLUMN     "parentSubscriptionAmount" DOUBLE PRECISION,
ADD COLUMN     "parentSubscriptionTrialDays" INTEGER DEFAULT 0;

-- AlterTable
ALTER TABLE "SchoolSettings" ADD COLUMN     "emailDomain" TEXT;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "address" TEXT,
ADD COLUMN     "experience" TEXT,
ADD COLUMN     "joiningDate" DATE,
ADD COLUMN     "language" TEXT DEFAULT 'English',
ADD COLUMN     "photoUrl" TEXT,
ADD COLUMN     "qualification" TEXT,
ADD COLUMN     "subject" TEXT,
ADD COLUMN     "subjects" TEXT[] DEFAULT ARRAY[]::TEXT[],
ADD COLUMN     "teacherId" TEXT,
ADD COLUMN     "teacherStatus" TEXT DEFAULT 'Active';

-- DropTable
DROP TABLE "Bus";

-- DropTable
DROP TABLE "BusBooking";

-- DropTable
DROP TABLE "BusRoute";

-- DropTable
DROP TABLE "ClassRoom";

-- DropTable
DROP TABLE "CotBooking";

-- DropTable
DROP TABLE "Hostel";

-- DropTable
DROP TABLE "LibraryIssue";

-- DropTable
DROP TABLE "Room";

-- DropTable
DROP TABLE "RoomAllocation";

-- DropTable
DROP TABLE "RoomStudentAssignment";

-- DropTable
DROP TABLE "RoomTeacherAssignment";

-- DropTable
DROP TABLE "TeacherDailyAttendance";

-- DropTable
DROP TABLE "Timetable";

-- CreateTable
CREATE TABLE "Notification" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "type" "NotificationType" NOT NULL,
    "isRead" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TeacherAuditRecord" (
    "id" TEXT NOT NULL,
    "teacherId" TEXT NOT NULL,
    "createdById" TEXT NOT NULL,
    "category" "TeacherAuditCategory" NOT NULL,
    "customCategory" TEXT,
    "description" TEXT NOT NULL,
    "scoreImpact" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TeacherAuditRecord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExamType" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "schoolId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ExamType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentFeeAllocation" (
    "id" TEXT NOT NULL,
    "paymentId" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "headType" TEXT NOT NULL,
    "componentIndex" INTEGER,
    "componentName" TEXT,
    "extraFeeId" TEXT,
    "allocationType" TEXT NOT NULL,
    "allocatedAmount" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PaymentFeeAllocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ParentSubscription" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "schoolId" TEXT NOT NULL,
    "status" "SubscriptionStatus" NOT NULL DEFAULT 'ACTIVE',
    "isTrial" BOOLEAN NOT NULL DEFAULT false,
    "startedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "trialEndsAt" TIMESTAMP(3),
    "currentPeriodEnd" TIMESTAMP(3) NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "currency" TEXT NOT NULL DEFAULT 'INR',
    "paymentId" TEXT,
    "invoiceUrl" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ParentSubscription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Refund" (
    "id" TEXT NOT NULL,
    "paymentId" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "reason" TEXT,
    "status" TEXT NOT NULL DEFAULT 'SUCCESS',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Refund_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StudentApplication" (
    "id" TEXT NOT NULL,
    "schoolId" TEXT NOT NULL,
    "classId" TEXT,
    "className" TEXT,
    "section" TEXT,
    "studentId" TEXT,
    "applicationNo" TEXT NOT NULL,
    "fedenaNo" TEXT,
    "admissionNo" TEXT,
    "gradeSought" "Grade" NOT NULL,
    "boardingType" "BoardingType" NOT NULL,
    "totalFee" DOUBLE PRECISION,
    "discountPercent" DOUBLE PRECISION,
    "rollNo" TEXT,
    "firstName" TEXT NOT NULL,
    "middleName" TEXT,
    "lastName" TEXT NOT NULL,
    "gender" "Gender" NOT NULL,
    "dateOfBirth" TIMESTAMP(3) NOT NULL,
    "aadharNo" TEXT NOT NULL,
    "firstLanguage" TEXT NOT NULL,
    "nationality" TEXT NOT NULL,
    "languagesAtHome" TEXT NOT NULL,
    "caste" TEXT,
    "religion" TEXT,
    "houseNo" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "town" TEXT,
    "state" TEXT NOT NULL,
    "pinCode" TEXT NOT NULL,
    "parentName" TEXT NOT NULL,
    "parentOccupation" TEXT NOT NULL,
    "officeAddress" TEXT NOT NULL,
    "parentPhone" TEXT NOT NULL,
    "parentEmail" TEXT NOT NULL,
    "parentAadharNo" TEXT NOT NULL,
    "parentWhatsapp" TEXT NOT NULL,
    "bankAccountNo" TEXT NOT NULL,
    "previousSchoolName" TEXT NOT NULL,
    "previousSchoolAddress" TEXT NOT NULL,
    "emergencyFatherNo" TEXT NOT NULL,
    "emergencyMotherNo" TEXT NOT NULL,
    "emergencyGuardianNo" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StudentApplication_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Notification_userId_idx" ON "Notification"("userId");

-- CreateIndex
CREATE INDEX "Notification_userId_isRead_idx" ON "Notification"("userId", "isRead");

-- CreateIndex
CREATE INDEX "Notification_userId_type_idx" ON "Notification"("userId", "type");

-- CreateIndex
CREATE INDEX "Notification_createdAt_idx" ON "Notification"("createdAt");

-- CreateIndex
CREATE INDEX "TeacherAuditRecord_teacherId_idx" ON "TeacherAuditRecord"("teacherId");

-- CreateIndex
CREATE INDEX "TeacherAuditRecord_createdById_idx" ON "TeacherAuditRecord"("createdById");

-- CreateIndex
CREATE INDEX "TeacherAuditRecord_category_idx" ON "TeacherAuditRecord"("category");

-- CreateIndex
CREATE INDEX "TeacherAuditRecord_createdAt_idx" ON "TeacherAuditRecord"("createdAt");

-- CreateIndex
CREATE INDEX "ExamType_schoolId_idx" ON "ExamType"("schoolId");

-- CreateIndex
CREATE UNIQUE INDEX "ExamType_schoolId_name_key" ON "ExamType"("schoolId", "name");

-- CreateIndex
CREATE INDEX "PaymentFeeAllocation_paymentId_idx" ON "PaymentFeeAllocation"("paymentId");

-- CreateIndex
CREATE INDEX "PaymentFeeAllocation_studentId_headType_idx" ON "PaymentFeeAllocation"("studentId", "headType");

-- CreateIndex
CREATE INDEX "PaymentFeeAllocation_componentIndex_idx" ON "PaymentFeeAllocation"("componentIndex");

-- CreateIndex
CREATE INDEX "PaymentFeeAllocation_extraFeeId_idx" ON "PaymentFeeAllocation"("extraFeeId");

-- CreateIndex
CREATE INDEX "ParentSubscription_studentId_status_idx" ON "ParentSubscription"("studentId", "status");

-- CreateIndex
CREATE INDEX "ParentSubscription_schoolId_idx" ON "ParentSubscription"("schoolId");

-- CreateIndex
CREATE INDEX "Refund_paymentId_idx" ON "Refund"("paymentId");

-- CreateIndex
CREATE UNIQUE INDEX "StudentApplication_studentId_key" ON "StudentApplication"("studentId");

-- CreateIndex
CREATE UNIQUE INDEX "StudentApplication_applicationNo_key" ON "StudentApplication"("applicationNo");

-- CreateIndex
CREATE UNIQUE INDEX "StudentApplication_fedenaNo_key" ON "StudentApplication"("fedenaNo");

-- CreateIndex
CREATE UNIQUE INDEX "StudentApplication_admissionNo_key" ON "StudentApplication"("admissionNo");

-- CreateIndex
CREATE UNIQUE INDEX "StudentApplication_aadharNo_key" ON "StudentApplication"("aadharNo");

-- CreateIndex
CREATE UNIQUE INDEX "StudentApplication_parentAadharNo_key" ON "StudentApplication"("parentAadharNo");

-- CreateIndex
CREATE INDEX "StudentApplication_schoolId_idx" ON "StudentApplication"("schoolId");

-- CreateIndex
CREATE INDEX "StudentApplication_classId_idx" ON "StudentApplication"("classId");

-- CreateIndex
CREATE INDEX "StudentApplication_studentId_idx" ON "StudentApplication"("studentId");

-- CreateIndex
CREATE INDEX "StudentApplication_gradeSought_idx" ON "StudentApplication"("gradeSought");

-- CreateIndex
CREATE INDEX "StudentApplication_boardingType_idx" ON "StudentApplication"("boardingType");

-- CreateIndex
CREATE INDEX "StudentApplication_createdAt_idx" ON "StudentApplication"("createdAt");

-- CreateIndex
CREATE INDEX "Mark_examType_idx" ON "Mark"("examType");

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TeacherAuditRecord" ADD CONSTRAINT "TeacherAuditRecord_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TeacherAuditRecord" ADD CONSTRAINT "TeacherAuditRecord_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Circular" ADD CONSTRAINT "Circular_classId_fkey" FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExamType" ADD CONSTRAINT "ExamType_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentFeeAllocation" ADD CONSTRAINT "PaymentFeeAllocation_paymentId_fkey" FOREIGN KEY ("paymentId") REFERENCES "Payment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ParentSubscription" ADD CONSTRAINT "ParentSubscription_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ParentSubscription" ADD CONSTRAINT "ParentSubscription_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ParentSubscription" ADD CONSTRAINT "ParentSubscription_paymentId_fkey" FOREIGN KEY ("paymentId") REFERENCES "Payment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_paymentId_fkey" FOREIGN KEY ("paymentId") REFERENCES "Payment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentApplication" ADD CONSTRAINT "StudentApplication_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentApplication" ADD CONSTRAINT "StudentApplication_classId_fkey" FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentApplication" ADD CONSTRAINT "StudentApplication_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE SET NULL ON UPDATE CASCADE;
