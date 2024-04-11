CREATE TABLE IF NOT EXISTS "contacts" (
	"email_address" text PRIMARY KEY NOT NULL,
	"first_name" text,
	"last_name" text,
	"email_marketing" boolean,
	"company_id" uuid
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "contacts" ADD CONSTRAINT "contacts_company_id_companies_company_id_fk" FOREIGN KEY ("company_id") REFERENCES "companies"("company_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
