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
