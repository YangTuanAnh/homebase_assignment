CREATE TABLE "product" (
  "id" serial PRIMARY KEY,
  "name" varchar(255),
  "description" text,
  "price" float,
  "quantity" integer
);

CREATE TABLE "customer" (
  "id" serial PRIMARY KEY,
  "name" varchar(255),
  "address" varchar(255),
  "phone_number" integer
);

CREATE TABLE "order" (
  "id" serial PRIMARY KEY,
  "order_date" timestamp,
  "customer_id" integer REFERENCES "customer" ("id")
);

CREATE TABLE "order_product" (
  "product_id" integer REFERENCES "product" ("id"),
  "order_id" integer REFERENCES "order" ("id")
);

CREATE TABLE "transaction" (
  "id" serial PRIMARY KEY ,
  "product_id" integer REFERENCES "product" ("id"),
  "transaction_date" timestamp,
  "quantity_in" integer,
  "quantity_out" integer,
  "transaction_type" varchar(255)
);
