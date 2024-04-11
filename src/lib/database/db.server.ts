// db/db.server.ts
import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import { env } from '$env/dynamic/private';
import { dev } from '$app/environment';

// const client = dev ? postgres(DATABASE_URL) : postgres(DATABASE_URL, { ssl: 'require' });
const client =  postgres(env.PRIVATE_DATABASE_URL) 
export const db = drizzle(client, {});