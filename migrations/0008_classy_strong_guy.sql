CREATE TABLE IF NOT EXISTS "locations" (
	"company_id" uuid,
	"location_id" text PRIMARY KEY NOT NULL,
	"address" text,
	"address2" text,
	"zipcode" integer,
	"city" text,
	"country" text,
	CONSTRAINT "locations_address_address2_zipcode_city_country_unique" UNIQUE("address","address2","zipcode","city","country")
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "locations" ADD CONSTRAINT "locations_company_id_companies_company_id_fk" FOREIGN KEY ("company_id") REFERENCES "companies"("company_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
