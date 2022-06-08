CREATE TABLE IF NOT EXISTS "public"."room"(
	"id" TEXT unique not null,
         "name" TEXT not null,
	"user_id" TEXT not null ,
CONSTRAINT "PK_room_id" PRIMARY KEY ("id"),
	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES "public"."user"(id)

);