// src/lib/db/schema.ts

import { integer, pgTable,text, real, boolean, unique, timestamp, uuid } from "drizzle-orm/pg-core";

export const companies = pgTable("companies", {
    company_id: uuid("company_id").defaultRandom().primaryKey(),
    company_name: text("company_name").unique(),
    nbr_of_orders: integer("nbr_of_orders"),
    order_total: real("order_total"),
    email_marketing: boolean("email_marketing")
});

export const contacts = pgTable("contacts",{   
    email_address: text("email_address").primaryKey(),
    first_name: text("first_name"),
    last_name: text("last_name"),
    email_marketing: boolean("email_marketing"),
    company_id: uuid("company_id").references(() => companies.company_id)
});

export const phonenumbers = pgTable("phonenumbers", {
    phonenumber: text("phonenumber").primaryKey()
});

export const contact_phonenumbers = pgTable("contact_phonenumbers", {
    email_address: text("email_address").references(() => contacts.email_address),
    phonenumber: text("phonenumber").references(() => phonenumbers.phonenumber)
});

export const sources = pgTable("sources", {
    source_id: integer("source_id").primaryKey(),
    source_name: text("source_name")
});

export const contact_sources = pgTable("contact_sources", {
    source_id: integer("source_id").references(() => sources.source_id),
    email_address: text("email_address").references(() => contacts.email_address)
});

export const locations = pgTable("locations", {
    company_id: uuid("company_id").references(() => companies.company_id),
    location_id: text("location_id").primaryKey(),
    address: text("address"),
    address2: text("address2"),
    zipcode: integer("zipcode"),
    city: text("city"),
    country: text("country"),
}, (table) => ({
    unq: unique().on(table.address, table.address2, table.zipcode, table.city, table.country)
})
);

export const orders = pgTable("orders", {
    order_id: text("order_id").primaryKey(),
    location_id: text("location_id").references(() => locations.location_id),
    email_address: text("email_address").references(() => contacts.email_address),
    date_created: timestamp("date_created"),
    date_paid: timestamp("date_paid"),
    date_shipped: timestamp("date_shipped"),
    currency: text("currency"),
    total_qty: integer("total_qty"),
    total_amount: real("total_amount"),
    discount_amount: real("discount_amount"),
    tax_amount: real("tax_amount"),
    payment_method: text("payment_method"),
    shipping_amount: real("shipping_amount"),
    status: text("status")
});

export const products = pgTable("products", {
    sku: text("sku").primaryKey(),
    title: text("title"),
    price: real("price"),
    original_price: real("original_price"),
    vid: text("vid"),
    description: text("description"),
    sold: integer("sold"),
    purchase_price: real("purchase_price"),
    images: text("images"),
    product_sku: text("product_sku")
});

export const orderlines = pgTable("orderlines", {
    sku: text("sku").references(() => products.sku),
    order_id: text("order_id").references(() => orders.order_id),
    item_price: real("item_price"),
    total_price: real("total_price"),
    qty: integer("qty"),
    desc: text("desc"),
    orderline_status: text("orderline_status")
});
