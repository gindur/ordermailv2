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
