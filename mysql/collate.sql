SELECT schema_name, default_character_set_name, default_collation_name FROM information_schema.SCHEMATA;

ALTER DATABASE db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
