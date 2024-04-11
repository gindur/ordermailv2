// db/db.server.ts
import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import { dev } from '$app/environment';

const database_url = process.env.PRIVATE_DATABASE_URL;
const client =  postgres(database_url) 
export const db = drizzle(client, {});