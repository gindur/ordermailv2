CREATE TABLE IF NOT EXISTS "contact_sources" (
	"source_id" integer,
	"email_address" text
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "contact_sources" ADD CONSTRAINT "contact_sources_source_id_sources_source_id_fk" FOREIGN KEY ("source_id") REFERENCES "sources"("source_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "contact_sources" ADD CONSTRAINT "contact_sources_email_address_contacts_email_address_fk" FOREIGN KEY ("email_address") REFERENCES "contacts"("email_address") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
