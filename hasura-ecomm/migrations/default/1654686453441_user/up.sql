CREATE TABLE IF NOT EXISTS "public"."user"(
	"id" TEXT unique not null,
	"name" TEXT NOT NULL,

CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

