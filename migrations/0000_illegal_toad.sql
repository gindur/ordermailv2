CREATE TABLE IF NOT EXISTS "companies" (
	"company_id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"company_name" text,
	"nbr_of_orders" integer,
	"order_total" real,
	"email_marketing" boolean,
	CONSTRAINT "companies_company_name_unique" UNIQUE("company_name")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "contact_phonenumbers" (
	"email_address" text,
	"phonenumber" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "contact_sources" (
	"source_id" integer,
	"email_address" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "contacts" (
	"email_address" text PRIMARY KEY NOT NULL,
	"first_name" text,
	"last_name" text,
	"email_marketing" boolean,
	"company_id" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "locations" (
	"company_id" text,
	"location_id" text PRIMARY KEY NOT NULL,
	"address" text,
	"address2" text,
	"zipcode" integer,
	"city" text,
	"country" text,
	CONSTRAINT "locations_address_address2_zipcode_city_country_unique" UNIQUE("address","address2","zipcode","city","country")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "orderlines" (
	"sku" text,
	"order_id" text,
	"item_price" real,
	"total_price" real,
	"qty" integer,
	"desc" text,
	"orderline_status" text
);
--> statement-breakpoint
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
CREATE TABLE IF NOT EXISTS "phonenumbers" (
	"phonenumber" text PRIMARY KEY NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "products" (
	"sku" text PRIMARY KEY NOT NULL,
	"title" text,
	"price" real,
	"original_price" real,
	"vid" text,
	"description" text,
	"sold" integer,
	"purchase_price" real,
	"images" text,
	"product_sku" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "sources" (
	"source_id" integer PRIMARY KEY NOT NULL,
	"source_name" text
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
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "contacts" ADD CONSTRAINT "contacts_company_id_companies_company_id_fk" FOREIGN KEY ("company_id") REFERENCES "companies"("company_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "locations" ADD CONSTRAINT "locations_company_id_companies_company_id_fk" FOREIGN KEY ("company_id") REFERENCES "companies"("company_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "orderlines" ADD CONSTRAINT "orderlines_sku_products_sku_fk" FOREIGN KEY ("sku") REFERENCES "products"("sku") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "orderlines" ADD CONSTRAINT "orderlines_order_id_orders_order_id_fk" FOREIGN KEY ("order_id") REFERENCES "orders"("order_id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
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
