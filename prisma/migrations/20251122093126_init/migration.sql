-- CreateEnum
CREATE TYPE "CourseVisibility" AS ENUM ('DRAFT', 'PUBLISHED', 'ARCHIVED');

-- CreateEnum
CREATE TYPE "QuizAttemptStatus" AS ENUM ('IN_PROGRESS', 'SUBMITTED', 'GRADED');

-- CreateEnum
CREATE TYPE "SubmissionStatus" AS ENUM ('DRAFT', 'SUBMITTED', 'RETURNED', 'GRADED');

-- CreateEnum
CREATE TYPE "MessageStatus" AS ENUM ('PENDING', 'SENT', 'DELIVERED', 'READ');

-- CreateEnum
CREATE TYPE "SectionType" AS ENUM ('SCRIPTURE', 'ANNOUNCEMENT', 'ENCOURAGEMENT');

-- CreateEnum
CREATE TYPE "EnrollmentStatus" AS ENUM ('ACTIVE', 'COMPLETED', 'CANCELLED', 'EXPIRED');

-- CreateEnum
CREATE TYPE "EnrollType" AS ENUM ('PAID', 'SCHOLARSHIP', 'FREE');

-- CreateEnum
CREATE TYPE "ScheduleStatus" AS ENUM ('SCHEDULED', 'COMPLETED', 'CANCELED');

-- CreateEnum
CREATE TYPE "ScheduleType" AS ENUM ('GENERAL', 'LECTURE', 'ASSIGNMENT', 'QUIZ', 'EXAM', 'MEETING', 'CLASS');

-- CreateTable
CREATE TABLE "accounts" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_id" TEXT NOT NULL,
    "type" TEXT,
    "provider" TEXT,
    "provider_account_id" TEXT,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" TIMESTAMP(3),
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,

    CONSTRAINT "accounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "status" SMALLINT DEFAULT 1,
    "approved_at" TIMESTAMP(3),
    "availability" TEXT,
    "email" TEXT,
    "username" TEXT,
    "name" VARCHAR(255),
    "first_name" VARCHAR(255),
    "last_name" VARCHAR(255),
    "password" VARCHAR(255),
    "domain" TEXT,
    "avatar" TEXT,
    "phone_number" TEXT,
    "whatsapp_number" TEXT,
    "country" TEXT,
    "state" TEXT,
    "city" TEXT,
    "address" TEXT,
    "zip_code" TEXT,
    "gender" TEXT,
    "date_of_birth" DATE,
    "billing_id" TEXT,
    "type" TEXT DEFAULT 'user',
    "email_verified_at" TIMESTAMP(3),
    "is_two_factor_enabled" INTEGER DEFAULT 0,
    "two_factor_secret" TEXT,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ucodes" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" SMALLINT DEFAULT 1,
    "user_id" TEXT,
    "token" TEXT,
    "email" TEXT,
    "expired_at" TIMESTAMP(3),

    CONSTRAINT "ucodes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "status" SMALLINT DEFAULT 1,
    "title" TEXT,
    "name" TEXT,
    "user_id" TEXT,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permissions" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "status" SMALLINT DEFAULT 1,
    "title" TEXT,
    "action" TEXT,
    "subject" TEXT,
    "conditions" TEXT,
    "fields" TEXT,

    CONSTRAINT "permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permission_roles" (
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "permission_id" TEXT NOT NULL,
    "role_id" TEXT NOT NULL,

    CONSTRAINT "permission_roles_pkey" PRIMARY KEY ("permission_id","role_id")
);

-- CreateTable
CREATE TABLE "role_users" (
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "role_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "role_users_pkey" PRIMARY KEY ("role_id","user_id")
);

-- CreateTable
CREATE TABLE "notification_events" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "status" SMALLINT DEFAULT 1,
    "type" TEXT,
    "text" TEXT,

    CONSTRAINT "notification_events_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "notifications" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "read_at" TIMESTAMP(3),
    "status" SMALLINT DEFAULT 1,
    "sender_id" TEXT,
    "receiver_id" TEXT,
    "notification_event_id" TEXT,
    "entity_id" TEXT,

    CONSTRAINT "notifications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_payment_methods" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "user_id" TEXT,
    "payment_method_id" TEXT,
    "checkout_id" TEXT,

    CONSTRAINT "user_payment_methods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "payment_transactions" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "store_id" TEXT,
    "user_id" TEXT,
    "enrollment_id" TEXT,
    "order_id" TEXT,
    "type" TEXT DEFAULT 'order',
    "withdraw_via" TEXT DEFAULT 'wallet',
    "provider" TEXT,
    "reference_number" TEXT,
    "status" TEXT DEFAULT 'pending',
    "raw_status" TEXT,
    "amount" DECIMAL(65,30),
    "currency" TEXT,
    "paid_amount" DECIMAL(65,30),
    "paid_currency" TEXT,

    CONSTRAINT "payment_transactions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "messages" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "status" "MessageStatus" DEFAULT 'PENDING',
    "sender_id" TEXT,
    "receiver_id" TEXT,
    "conversation_id" TEXT,
    "attachment_id" TEXT,
    "message" TEXT,

    CONSTRAINT "messages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attachments" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "name" TEXT,
    "type" TEXT,
    "size" INTEGER,
    "file" TEXT,
    "file_alt" TEXT,

    CONSTRAINT "attachments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "conversations" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "creator_id" TEXT,
    "participant_id" TEXT,

    CONSTRAINT "conversations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "faqs" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "status" SMALLINT DEFAULT 1,
    "sort_order" INTEGER DEFAULT 0,
    "question" TEXT,
    "answer" TEXT,

    CONSTRAINT "faqs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "social_medias" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "status" SMALLINT DEFAULT 1,
    "sort_order" INTEGER DEFAULT 0,
    "name" TEXT,
    "url" TEXT,
    "icon" TEXT,

    CONSTRAINT "social_medias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "website_infos" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "name" TEXT,
    "phone_number" TEXT,
    "email" TEXT,
    "address" TEXT,
    "logo" TEXT,
    "favicon" TEXT,
    "copyright" TEXT,
    "cancellation_policy" TEXT,

    CONSTRAINT "website_infos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "settings" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "category" TEXT,
    "label" TEXT,
    "description" TEXT,
    "key" TEXT,
    "default_value" TEXT,

    CONSTRAINT "settings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_settings" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "user_id" TEXT,
    "setting_id" TEXT,
    "value" TEXT,

    CONSTRAINT "user_settings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "languages" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,

    CONSTRAINT "languages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "series" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "summary" TEXT,
    "description" TEXT,
    "visibility" TEXT DEFAULT 'DRAFT',
    "video_length" TEXT,
    "duration" TEXT,
    "start_date" TIMESTAMP(3),
    "end_date" TIMESTAMP(3),
    "thumbnail" TEXT,
    "total_price" DECIMAL(65,30),
    "course_type" TEXT DEFAULT 'regular',
    "note" TEXT,
    "total_site" INTEGER DEFAULT 0,
    "available_site" INTEGER DEFAULT 0,
    "publication_status" TEXT DEFAULT 'DRAFT',
    "scheduled_publish_at" TIMESTAMP(3),
    "language" TEXT,

    CONSTRAINT "series_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "courses" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "series_id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "price" DECIMAL(65,30),
    "video_length" TEXT,

    CONSTRAINT "courses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lesson_files" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "title" TEXT,
    "url" TEXT,
    "doc" TEXT,
    "kind" TEXT NOT NULL DEFAULT 'video',
    "alt" TEXT,
    "video_length" TEXT,
    "video_resolution" TEXT,
    "video_qualities" JSONB,
    "course_id" TEXT,

    CONSTRAINT "lesson_files_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MaterialsFile" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "title" TEXT NOT NULL,
    "description" TEXT,
    "lecture_type" TEXT,
    "url" TEXT,
    "type" TEXT,
    "kind" TEXT,
    "alt" TEXT,
    "position" INTEGER NOT NULL DEFAULT 0,
    "series_id" TEXT,
    "course_id" TEXT,

    CONSTRAINT "MaterialsFile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher_sections" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "section_type" "SectionType" NOT NULL,
    "category" TEXT,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "duration" TEXT,
    "release_date" TIMESTAMP(3),
    "is_released" BOOLEAN NOT NULL DEFAULT false,
    "position" INTEGER NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL DEFAULT 'published',
    "view_count" INTEGER NOT NULL DEFAULT 0,
    "file_url" TEXT,
    "release_status" TEXT NOT NULL DEFAULT 'DRAFT',
    "scheduled_release_at" TIMESTAMP(3),

    CONSTRAINT "teacher_sections_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "student_files" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "type" TEXT,
    "url" TEXT,
    "kind" TEXT,
    "alt" TEXT,
    "week_number" INTEGER,
    "section_type" TEXT NOT NULL,
    "student_id" TEXT,
    "series_id" TEXT NOT NULL,
    "course_id" TEXT NOT NULL,

    CONSTRAINT "student_files_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quizzes" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "series_id" TEXT NOT NULL,
    "course_id" TEXT,
    "title" TEXT NOT NULL,
    "instructions" TEXT,
    "total_marks" INTEGER NOT NULL DEFAULT 0,
    "due_at" TIMESTAMP(3),
    "is_published" BOOLEAN NOT NULL DEFAULT false,
    "published_at" TIMESTAMP(3),
    "metadata" JSONB,
    "publication_status" TEXT NOT NULL DEFAULT 'DRAFT',
    "scheduled_publish_at" TIMESTAMP(3),

    CONSTRAINT "quizzes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quiz_questions" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "quiz_id" TEXT NOT NULL,
    "prompt" TEXT NOT NULL,
    "points" INTEGER NOT NULL DEFAULT 1,
    "position" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "quiz_questions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quiz_question_options" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "is_correct" BOOLEAN NOT NULL DEFAULT false,
    "question_id" TEXT NOT NULL,
    "option" TEXT NOT NULL,
    "position" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "quiz_question_options_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quiz_submissions" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "quiz_id" TEXT NOT NULL,
    "student_id" TEXT NOT NULL,
    "status" "QuizAttemptStatus" NOT NULL DEFAULT 'IN_PROGRESS',
    "total_grade" INTEGER NOT NULL DEFAULT 0,
    "percentage" DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    "time_taken" INTEGER,
    "started_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "submitted_at" TIMESTAMP(3),
    "graded_at" TIMESTAMP(3),
    "feedback" TEXT,
    "metadata" JSONB,

    CONSTRAINT "quiz_submissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quiz_submission_answers" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "submission_id" TEXT NOT NULL,
    "question_id" TEXT NOT NULL,
    "answer_id" TEXT,
    "answer_text" TEXT,
    "is_correct" BOOLEAN NOT NULL DEFAULT false,
    "points_earned" INTEGER NOT NULL DEFAULT 0,
    "feedback" TEXT,

    CONSTRAINT "quiz_submission_answers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "assignments" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "series_id" TEXT NOT NULL,
    "course_id" TEXT,
    "title" TEXT,
    "description" TEXT,
    "total_marks" INTEGER NOT NULL DEFAULT 0,
    "due_at" TIMESTAMP(3),
    "is_published" BOOLEAN NOT NULL DEFAULT false,
    "published_at" TIMESTAMP(3),
    "publication_status" TEXT NOT NULL DEFAULT 'DRAFT',
    "scheduled_publish_at" TIMESTAMP(3),

    CONSTRAINT "assignments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "assignment_questions" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "assignment_id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "points" INTEGER NOT NULL DEFAULT 0,
    "position" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "assignment_questions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "assignment_submissions" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "assignment_id" TEXT NOT NULL,
    "student_id" TEXT NOT NULL,
    "status" "SubmissionStatus" NOT NULL DEFAULT 'DRAFT',
    "total_grade" INTEGER NOT NULL DEFAULT 0,
    "percentage" DOUBLE PRECISION NOT NULL DEFAULT 0.0,
    "overall_feedback" TEXT,
    "graded_by_id" TEXT,
    "graded_at" TIMESTAMP(3),
    "submitted_at" TIMESTAMP(3),

    CONSTRAINT "assignment_submissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "assignment_answers" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "submission_id" TEXT NOT NULL,
    "question_id" TEXT NOT NULL,
    "answer_text" TEXT,
    "marks_awarded" INTEGER NOT NULL DEFAULT 0,
    "feedback" TEXT,

    CONSTRAINT "assignment_answers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "submission_attachments" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "submission_id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "name" TEXT,

    CONSTRAINT "submission_attachments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "enrollments" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "user_id" TEXT NOT NULL,
    "series_id" TEXT,
    "checkout_id" TEXT,
    "status" "EnrollmentStatus" NOT NULL DEFAULT 'ACTIVE',
    "enroll_type" "EnrollType" NOT NULL DEFAULT 'PAID',
    "enrolled_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completed_at" TIMESTAMP(3),
    "expires_at" TIMESTAMP(3),
    "progress_percentage" INTEGER NOT NULL DEFAULT 0,
    "last_accessed_at" TIMESTAMP(3),
    "payment_status" TEXT DEFAULT 'pending',
    "payment_raw_status" TEXT,
    "paid_amount" DECIMAL(65,30),
    "paid_currency" TEXT,
    "payment_provider" TEXT,
    "payment_reference_number" TEXT,
    "payment_provider_charge_type" TEXT DEFAULT 'percentage',
    "payment_provider_charge" DECIMAL(65,30),

    CONSTRAINT "enrollments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_progress" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "user_id" TEXT NOT NULL,
    "series_id" TEXT NOT NULL,
    "is_completed" BOOLEAN NOT NULL DEFAULT false,
    "completed_at" TIMESTAMP(3),
    "time_spent" INTEGER,
    "last_position" INTEGER,

    CONSTRAINT "user_progress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "course_progress" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "user_id" TEXT NOT NULL,
    "course_id" TEXT NOT NULL,
    "series_id" TEXT NOT NULL,
    "status" TEXT DEFAULT 'pending',
    "started_at" TIMESTAMP(3),
    "is_completed" BOOLEAN NOT NULL DEFAULT false,
    "completed_at" TIMESTAMP(3),
    "completion_percentage" DOUBLE PRECISION DEFAULT 0,

    CONSTRAINT "course_progress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lesson_progress" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "user_id" TEXT NOT NULL,
    "lesson_id" TEXT NOT NULL,
    "course_id" TEXT NOT NULL,
    "series_id" TEXT NOT NULL,
    "is_completed" BOOLEAN NOT NULL DEFAULT false,
    "is_viewed" BOOLEAN NOT NULL DEFAULT false,
    "completed_at" TIMESTAMP(3),
    "viewed_at" TIMESTAMP(3),
    "time_spent" INTEGER,
    "last_position" INTEGER,
    "completion_percentage" DOUBLE PRECISION DEFAULT 0,
    "is_unlocked" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "lesson_progress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "certificates" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "user_id" TEXT NOT NULL,
    "series_id" TEXT NOT NULL,
    "certificate_number" TEXT NOT NULL,
    "issued_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expires_at" TIMESTAMP(3),

    CONSTRAINT "certificates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "checkouts" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "status" TEXT,
    "total_price" DECIMAL(65,30),
    "type" TEXT DEFAULT 'PAID',
    "user_id" TEXT,
    "series_id" TEXT,

    CONSTRAINT "checkouts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "scholarship_codes" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "status" SMALLINT DEFAULT 1,
    "code" TEXT,
    "code_type" TEXT DEFAULT 'code',
    "name" TEXT,
    "description" TEXT,
    "scholarship_type" TEXT DEFAULT 'scholarship',
    "series_id" TEXT,
    "student_id" TEXT,

    CONSTRAINT "scholarship_codes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "feedbacks" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "week_number" TEXT,
    "type" TEXT DEFAULT 'course_review',
    "title" TEXT,
    "description" TEXT,
    "status" TEXT DEFAULT 'pending',
    "file_url" TEXT,
    "series_id" TEXT,
    "course_id" TEXT,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "feedbacks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contacts" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "first_name" TEXT,
    "last_name" TEXT,
    "email" TEXT,
    "phone_number" TEXT,
    "whatsapp_number" TEXT,
    "status" TEXT DEFAULT 'pending',
    "date" TIMESTAMP(3),
    "reason" TEXT,
    "message" TEXT,

    CONSTRAINT "contacts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "donations" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "first_name" TEXT,
    "last_name" TEXT,
    "email" TEXT,
    "phone_number" TEXT,
    "frequency" TEXT,
    "amount" DECIMAL(65,30),
    "currency" TEXT,
    "type" TEXT,
    "date" TIMESTAMP(3),
    "comment" TEXT,
    "status" TEXT DEFAULT 'pending',

    CONSTRAINT "donations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "schedule_events" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "title" TEXT NOT NULL,
    "description" TEXT,
    "class_link" TEXT,
    "start_at" TIMESTAMP(3) NOT NULL,
    "end_at" TIMESTAMP(3) NOT NULL,
    "timezone" TEXT,
    "status" "ScheduleStatus" NOT NULL DEFAULT 'SCHEDULED',
    "type" "ScheduleType" NOT NULL DEFAULT 'GENERAL',
    "metadata" JSONB,
    "user_id" TEXT,
    "assignment_id" TEXT,
    "quiz_id" TEXT,
    "course_id" TEXT,
    "series_id" TEXT,

    CONSTRAINT "schedule_events_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "card_generators" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),
    "title" TEXT,
    "message" TEXT,
    "image" TEXT NOT NULL,
    "recipient_name" TEXT,
    "recipient_email" TEXT,
    "sender_name" TEXT,
    "student_id" TEXT NOT NULL,

    CONSTRAINT "card_generators_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_PermissionToRole" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_PermissionToRole_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ScholarshipCourse" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ScholarshipCourse_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "accounts_provider_provider_account_id_key" ON "accounts"("provider", "provider_account_id");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_domain_key" ON "users"("domain");

-- CreateIndex
CREATE UNIQUE INDEX "settings_key_key" ON "settings"("key");

-- CreateIndex
CREATE UNIQUE INDEX "series_slug_key" ON "series"("slug");

-- CreateIndex
CREATE INDEX "lesson_files_course_id_idx" ON "lesson_files"("course_id");

-- CreateIndex
CREATE INDEX "quiz_questions_quiz_id_position_idx" ON "quiz_questions"("quiz_id", "position");

-- CreateIndex
CREATE INDEX "quiz_question_options_question_id_position_idx" ON "quiz_question_options"("question_id", "position");

-- CreateIndex
CREATE UNIQUE INDEX "quiz_question_options_question_id_position_key" ON "quiz_question_options"("question_id", "position");

-- CreateIndex
CREATE INDEX "quiz_submissions_quiz_id_status_idx" ON "quiz_submissions"("quiz_id", "status");

-- CreateIndex
CREATE INDEX "quiz_submissions_student_id_status_idx" ON "quiz_submissions"("student_id", "status");

-- CreateIndex
CREATE INDEX "quiz_submissions_submitted_at_idx" ON "quiz_submissions"("submitted_at");

-- CreateIndex
CREATE UNIQUE INDEX "quiz_submissions_quiz_id_student_id_key" ON "quiz_submissions"("quiz_id", "student_id");

-- CreateIndex
CREATE INDEX "quiz_submission_answers_submission_id_idx" ON "quiz_submission_answers"("submission_id");

-- CreateIndex
CREATE INDEX "quiz_submission_answers_question_id_idx" ON "quiz_submission_answers"("question_id");

-- CreateIndex
CREATE UNIQUE INDEX "quiz_submission_answers_submission_id_question_id_key" ON "quiz_submission_answers"("submission_id", "question_id");

-- CreateIndex
CREATE INDEX "assignment_questions_assignment_id_position_idx" ON "assignment_questions"("assignment_id", "position");

-- CreateIndex
CREATE INDEX "assignment_submissions_assignment_id_status_idx" ON "assignment_submissions"("assignment_id", "status");

-- CreateIndex
CREATE UNIQUE INDEX "assignment_submissions_assignment_id_student_id_key" ON "assignment_submissions"("assignment_id", "student_id");

-- CreateIndex
CREATE UNIQUE INDEX "assignment_answers_submission_id_question_id_key" ON "assignment_answers"("submission_id", "question_id");

-- CreateIndex
CREATE UNIQUE INDEX "enrollments_user_id_series_id_key" ON "enrollments"("user_id", "series_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_progress_user_id_series_id_key" ON "user_progress"("user_id", "series_id");

-- CreateIndex
CREATE INDEX "course_progress_user_id_course_id_idx" ON "course_progress"("user_id", "course_id");

-- CreateIndex
CREATE INDEX "course_progress_user_id_series_id_idx" ON "course_progress"("user_id", "series_id");

-- CreateIndex
CREATE UNIQUE INDEX "course_progress_user_id_course_id_key" ON "course_progress"("user_id", "course_id");

-- CreateIndex
CREATE INDEX "lesson_progress_user_id_course_id_idx" ON "lesson_progress"("user_id", "course_id");

-- CreateIndex
CREATE INDEX "lesson_progress_user_id_series_id_idx" ON "lesson_progress"("user_id", "series_id");

-- CreateIndex
CREATE UNIQUE INDEX "lesson_progress_user_id_lesson_id_key" ON "lesson_progress"("user_id", "lesson_id");

-- CreateIndex
CREATE UNIQUE INDEX "certificates_certificate_number_key" ON "certificates"("certificate_number");

-- CreateIndex
CREATE UNIQUE INDEX "certificates_user_id_series_id_key" ON "certificates"("user_id", "series_id");

-- CreateIndex
CREATE INDEX "schedule_events_status_start_at_idx" ON "schedule_events"("status", "start_at");

-- CreateIndex
CREATE INDEX "_PermissionToRole_B_index" ON "_PermissionToRole"("B");

-- CreateIndex
CREATE INDEX "_ScholarshipCourse_B_index" ON "_ScholarshipCourse"("B");

-- AddForeignKey
ALTER TABLE "accounts" ADD CONSTRAINT "accounts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ucodes" ADD CONSTRAINT "ucodes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "roles" ADD CONSTRAINT "roles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permission_roles" ADD CONSTRAINT "permission_roles_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "permissions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permission_roles" ADD CONSTRAINT "permission_roles_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_users" ADD CONSTRAINT "role_users_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_users" ADD CONSTRAINT "role_users_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_sender_id_fkey" FOREIGN KEY ("sender_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_receiver_id_fkey" FOREIGN KEY ("receiver_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_notification_event_id_fkey" FOREIGN KEY ("notification_event_id") REFERENCES "notification_events"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_payment_methods" ADD CONSTRAINT "user_payment_methods_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_transactions" ADD CONSTRAINT "payment_transactions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payment_transactions" ADD CONSTRAINT "payment_transactions_enrollment_id_fkey" FOREIGN KEY ("enrollment_id") REFERENCES "enrollments"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_sender_id_fkey" FOREIGN KEY ("sender_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_receiver_id_fkey" FOREIGN KEY ("receiver_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_conversation_id_fkey" FOREIGN KEY ("conversation_id") REFERENCES "conversations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_attachment_id_fkey" FOREIGN KEY ("attachment_id") REFERENCES "attachments"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "conversations" ADD CONSTRAINT "conversations_creator_id_fkey" FOREIGN KEY ("creator_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "conversations" ADD CONSTRAINT "conversations_participant_id_fkey" FOREIGN KEY ("participant_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_settings" ADD CONSTRAINT "user_settings_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_settings" ADD CONSTRAINT "user_settings_setting_id_fkey" FOREIGN KEY ("setting_id") REFERENCES "settings"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "courses" ADD CONSTRAINT "courses_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lesson_files" ADD CONSTRAINT "lesson_files_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "courses"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MaterialsFile" ADD CONSTRAINT "MaterialsFile_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MaterialsFile" ADD CONSTRAINT "MaterialsFile_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "courses"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_files" ADD CONSTRAINT "student_files_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_files" ADD CONSTRAINT "student_files_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_files" ADD CONSTRAINT "student_files_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "courses"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quizzes" ADD CONSTRAINT "quizzes_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quizzes" ADD CONSTRAINT "quizzes_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "courses"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quiz_questions" ADD CONSTRAINT "quiz_questions_quiz_id_fkey" FOREIGN KEY ("quiz_id") REFERENCES "quizzes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quiz_question_options" ADD CONSTRAINT "quiz_question_options_question_id_fkey" FOREIGN KEY ("question_id") REFERENCES "quiz_questions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quiz_submissions" ADD CONSTRAINT "quiz_submissions_quiz_id_fkey" FOREIGN KEY ("quiz_id") REFERENCES "quizzes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quiz_submissions" ADD CONSTRAINT "quiz_submissions_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quiz_submission_answers" ADD CONSTRAINT "quiz_submission_answers_submission_id_fkey" FOREIGN KEY ("submission_id") REFERENCES "quiz_submissions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quiz_submission_answers" ADD CONSTRAINT "quiz_submission_answers_question_id_fkey" FOREIGN KEY ("question_id") REFERENCES "quiz_questions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quiz_submission_answers" ADD CONSTRAINT "quiz_submission_answers_answer_id_fkey" FOREIGN KEY ("answer_id") REFERENCES "quiz_question_options"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assignments" ADD CONSTRAINT "assignments_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assignments" ADD CONSTRAINT "assignments_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "courses"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assignment_questions" ADD CONSTRAINT "assignment_questions_assignment_id_fkey" FOREIGN KEY ("assignment_id") REFERENCES "assignments"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assignment_submissions" ADD CONSTRAINT "assignment_submissions_assignment_id_fkey" FOREIGN KEY ("assignment_id") REFERENCES "assignments"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assignment_submissions" ADD CONSTRAINT "assignment_submissions_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assignment_submissions" ADD CONSTRAINT "assignment_submissions_graded_by_id_fkey" FOREIGN KEY ("graded_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assignment_answers" ADD CONSTRAINT "assignment_answers_submission_id_fkey" FOREIGN KEY ("submission_id") REFERENCES "assignment_submissions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assignment_answers" ADD CONSTRAINT "assignment_answers_question_id_fkey" FOREIGN KEY ("question_id") REFERENCES "assignment_questions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "submission_attachments" ADD CONSTRAINT "submission_attachments_submission_id_fkey" FOREIGN KEY ("submission_id") REFERENCES "assignment_submissions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enrollments" ADD CONSTRAINT "enrollments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enrollments" ADD CONSTRAINT "enrollments_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enrollments" ADD CONSTRAINT "enrollments_checkout_id_fkey" FOREIGN KEY ("checkout_id") REFERENCES "checkouts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_progress" ADD CONSTRAINT "user_progress_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_progress" ADD CONSTRAINT "user_progress_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course_progress" ADD CONSTRAINT "course_progress_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course_progress" ADD CONSTRAINT "course_progress_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "courses"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course_progress" ADD CONSTRAINT "course_progress_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lesson_progress" ADD CONSTRAINT "lesson_progress_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lesson_progress" ADD CONSTRAINT "lesson_progress_lesson_id_fkey" FOREIGN KEY ("lesson_id") REFERENCES "lesson_files"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lesson_progress" ADD CONSTRAINT "lesson_progress_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "courses"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lesson_progress" ADD CONSTRAINT "lesson_progress_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "certificates" ADD CONSTRAINT "certificates_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "certificates" ADD CONSTRAINT "certificates_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "checkouts" ADD CONSTRAINT "checkouts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "checkouts" ADD CONSTRAINT "checkouts_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "scholarship_codes" ADD CONSTRAINT "scholarship_codes_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "scholarship_codes" ADD CONSTRAINT "scholarship_codes_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedbacks" ADD CONSTRAINT "feedbacks_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedbacks" ADD CONSTRAINT "feedbacks_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "courses"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedbacks" ADD CONSTRAINT "feedbacks_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schedule_events" ADD CONSTRAINT "schedule_events_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schedule_events" ADD CONSTRAINT "schedule_events_assignment_id_fkey" FOREIGN KEY ("assignment_id") REFERENCES "assignments"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schedule_events" ADD CONSTRAINT "schedule_events_quiz_id_fkey" FOREIGN KEY ("quiz_id") REFERENCES "quizzes"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schedule_events" ADD CONSTRAINT "schedule_events_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "courses"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schedule_events" ADD CONSTRAINT "schedule_events_series_id_fkey" FOREIGN KEY ("series_id") REFERENCES "series"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "card_generators" ADD CONSTRAINT "card_generators_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PermissionToRole" ADD CONSTRAINT "_PermissionToRole_A_fkey" FOREIGN KEY ("A") REFERENCES "permissions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PermissionToRole" ADD CONSTRAINT "_PermissionToRole_B_fkey" FOREIGN KEY ("B") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ScholarshipCourse" ADD CONSTRAINT "_ScholarshipCourse_A_fkey" FOREIGN KEY ("A") REFERENCES "courses"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ScholarshipCourse" ADD CONSTRAINT "_ScholarshipCourse_B_fkey" FOREIGN KEY ("B") REFERENCES "scholarship_codes"("id") ON DELETE CASCADE ON UPDATE CASCADE;
