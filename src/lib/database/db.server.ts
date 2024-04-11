// db/db.server.ts
import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import { dev } from '$app/environment';
import { PRIVATE_DATABASE_URL } from '$env/static/private';


const client =  postgres(PRIVATE_DATABASE_URL) 
export const db = drizzle(client, {});