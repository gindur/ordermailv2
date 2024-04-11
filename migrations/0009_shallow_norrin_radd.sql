CREATE TABLE IF NOT EXISTS "orders" (
	"order_id" text PRIMARY KEY NOT NULL,
	"location_id" text,
	"email_address" text,
	"date_created" timestamp,
	"date_paid" timestamp,
	"date_shipped" timestamp,
	"currency" text,
	"total_qty" integer,
	"total_amount" real,
	"discount_amount" real,
	"tax_amount" real,
	"payment_method" text,
	"shipping_amount" real,
	"status" text
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "orders" ADD CONSTRAINT "orders_location_id_locations_location_id_fk" FOREIGN KEY ("location_id") REFERENCES "locations"("location_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "orders" ADD CONSTRAINT "orders_email_address_contacts_email_address_fk" FOREIGN KEY ("email_address") REFERENCES "contacts"("email_address") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
