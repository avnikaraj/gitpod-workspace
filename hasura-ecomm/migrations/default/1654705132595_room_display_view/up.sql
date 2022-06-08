CREATE VIEW IF NOT EXISTS "public"."room_display_view" as
select 
"r"."id" as "room_id", 
"r"."name" as "room_name", 
"messages"."total_message" as "total_message", 
"u"."name" as "last_message_username", 
"messages"."message" as "last_message_content",
"messages"."date_time_created" as "last_message_created_at"
from "public"."room" as "r"
inner join (
	select "msg2".*, "total_message" from "public"."messages" as "msg2"
	inner join (
		select max("msg1"."id") as "max_msg_id", "total_message" from "public"."messages" as "msg1"
		inner join (
		   select "m"."room_id", max("m"."date_time_created") as "max_date_time_created", count(*) as "total_message" 
		   from "public"."messages" as "m" group by "m"."room_id"
			) as "msg_max" on "msg1"."room_id" = "msg_max"."room_id" and "msg1"."date_time_created" = "msg_max"."max_date_time_created"
		   group by "msg1"."room_id", "total_message"
		) as "msg3" on "msg3"."max_msg_id" = "msg2"."id" 
) as "messages" on "messages"."room_id" = "r"."id"
inner join "public"."user" as "u" on "u"."id" = "messages"."user_id";
