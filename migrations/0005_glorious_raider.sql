CREATE TABLE IF NOT EXISTS "contact_phonenumbers" (
	"email_address" text,
	"phonenumber" text
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "contact_phonenumbers" ADD CONSTRAINT "contact_phonenumbers_email_address_contacts_email_address_fk" FOREIGN KEY ("email_address") REFERENCES "contacts"("email_address") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "contact_phonenumbers" ADD CONSTRAINT "contact_phonenumbers_phonenumber_phonenumbers_phonenumber_fk" FOREIGN KEY ("phonenumber") REFERENCES "phonenumbers"("phonenumber") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
