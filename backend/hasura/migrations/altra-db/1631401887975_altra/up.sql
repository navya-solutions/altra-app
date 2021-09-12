-- liquibase formatted sql

-- changeset yogesh:1631403947481-1
CREATE TABLE "block_aud" ("id"  SERIAL NOT NULL, "rev" INTEGER NOT NULL, "revtype" SMALLINT, "voting_minus_count" BIGINT, "archived" BOOLEAN, "block" JSONB, "block_type" VARCHAR(255), "created_time" BIGINT, "has_public_access" BOOLEAN, "last_edited_time" BIGINT,  "ref_block_id" VARCHAR(255), "url" VARCHAR(255), "voting_plus_count" BIGINT, CONSTRAINT "block_aud_pkey" PRIMARY KEY ("id", "rev"));

-- changeset yogesh:1631403947481-2
CREATE TABLE "block_change_request" ("id"  SERIAL NOT NULL, "change_description" VARCHAR(255), "change_request_block_type" VARCHAR(255), "change_request_status_type" VARCHAR(255), "change_request_type" VARCHAR(255),  "ref_id" VARCHAR(255), "user_ref_id" VARCHAR(255), "block_id" BIGINT, CONSTRAINT "block_change_request_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-3
CREATE TABLE "block" ("id"  SERIAL NOT NULL, "voting_minus_count" BIGINT, "archived" BOOLEAN NOT NULL, "block" JSONB, "block_type" VARCHAR(255), "created_time" BIGINT, "has_public_access" BOOLEAN NOT NULL, "last_edited_time" BIGINT,  "ref_block_id" VARCHAR(255), "url" VARCHAR(255), "voting_plus_count" BIGINT, "topic_id" BIGINT, CONSTRAINT "block_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-4
CREATE TABLE "block_tag" ("id"  SERIAL NOT NULL, "topic_ref_id" VARCHAR(255), "topic_title" VARCHAR(255), "block_id" BIGINT, CONSTRAINT "block_tag_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-5
CREATE TABLE "country" ("id"  SERIAL NOT NULL,  "short_code" VARCHAR(255), "title" VARCHAR(255), "curriculum_id" BIGINT, CONSTRAINT "country_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-6
CREATE TABLE "curriculum_change_request" ("id"  SERIAL NOT NULL, "change_description" VARCHAR(255), "change_request_object_type" VARCHAR(255), "change_request_status_type" VARCHAR(255), "change_request_type" VARCHAR(255),  "ref_id" VARCHAR(255), "user_ref_id" VARCHAR(255), "curriculum_id" BIGINT, CONSTRAINT "curriculum_change_request_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-7
CREATE TABLE "curriculum" ("id"  SERIAL NOT NULL, "description" VARCHAR(255), "has_public_access" BOOLEAN NOT NULL,  "ref_curriculum_id" VARCHAR(255), "short_title" VARCHAR(255), "title" VARCHAR(255), CONSTRAINT "curriculum_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-8
CREATE TABLE "topic_label" ("id"  SERIAL NOT NULL,  "sequence" INTEGER, "title" VARCHAR(255), "curriculum_id" BIGINT, CONSTRAINT "topic_label_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-9
CREATE TABLE "role" ("id"  SERIAL NOT NULL, "description" VARCHAR(255), "name" VARCHAR(255),  CONSTRAINT "role_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-10
CREATE TABLE "users" ("id"  SERIAL NOT NULL, "display_name" VARCHAR(255), "name" VARCHAR(255),  "subscription_id" BIGINT NOT NULL, "institution_id" BIGINT, "role_id" BIGINT NOT NULL, CONSTRAINT "users_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-11
CREATE TABLE "language" ("id"  SERIAL NOT NULL, "short_code" VARCHAR(255), "title" VARCHAR(255), "block_id" BIGINT, CONSTRAINT "language_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-12
CREATE TABLE "language_aud" ("id"  SERIAL NOT NULL, "rev" INTEGER NOT NULL, "revtype" SMALLINT, "short_code" VARCHAR(255), "title" VARCHAR(255), "block_id" BIGINT, CONSTRAINT "language_aud_pkey" PRIMARY KEY ("id", "rev"));

-- changeset yogesh:1631403947481-13
CREATE TABLE "revinfo" ("rev" INTEGER NOT NULL, "revtstmp" BIGINT, CONSTRAINT "revinfo_pkey" PRIMARY KEY ("rev"));

-- changeset yogesh:1631403947481-14
CREATE TABLE "topic" ("id"  SERIAL NOT NULL, "description" VARCHAR(255), "has_children" BOOLEAN NOT NULL, "label" VARCHAR(255),  "same_as" VARCHAR(255), "similar_to" VARCHAR(255), "title" VARCHAR(255), "topic_unit_title" VARCHAR(255), "curriculum_id" BIGINT, "parent_id" BIGINT, "topic_label_id" BIGINT, CONSTRAINT "topic_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-15
CREATE TABLE "institution" ("id"  SERIAL NOT NULL, "description" VARCHAR(255), "name" VARCHAR(255),  "ref_id" VARCHAR(255), "curriculum_id" BIGINT, CONSTRAINT "institution_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-16
CREATE TABLE "tag" ("id"  SERIAL NOT NULL, "name" VARCHAR(255), "level_interests_id" BIGINT, "topic_interests_id" BIGINT, CONSTRAINT "tag_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-17
CREATE TABLE "subscription_type" ("id"  SERIAL NOT NULL, "description" VARCHAR(255), "name" VARCHAR(255),  CONSTRAINT "subscription_type_pkey" PRIMARY KEY ("id"));

-- changeset yogesh:1631403947481-19
ALTER TABLE "language" ADD CONSTRAINT "fk8ds1h4nn6wdqkic7afhgnym5" FOREIGN KEY ("block_id") REFERENCES "block" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-20
ALTER TABLE "block_change_request" ADD CONSTRAINT "fka7lpq8r7bt3r8keu9duwasss" FOREIGN KEY ("block_id") REFERENCES "block" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-21
ALTER TABLE "block_tag" ADD CONSTRAINT "fkhx7gaag30pnd7w5tjmwycyo5e" FOREIGN KEY ("block_id") REFERENCES "block" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-25
ALTER TABLE "topic_label" ADD CONSTRAINT "fk3mvb8hl32uqukmeux59wjp5hu" FOREIGN KEY ("curriculum_id") REFERENCES "curriculum" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-26
ALTER TABLE "country" ADD CONSTRAINT "fk6r0ntnbjx5546v63mem686r7v" FOREIGN KEY ("curriculum_id") REFERENCES "curriculum" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-27
ALTER TABLE "topic" ADD CONSTRAINT "fkgymh5vic7lrfoy8lyln35a1aa" FOREIGN KEY ("curriculum_id") REFERENCES "curriculum" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-28
ALTER TABLE "curriculum_change_request" ADD CONSTRAINT "fkouqc3ymvdwh8mheebcfmnk5i7" FOREIGN KEY ("curriculum_id") REFERENCES "curriculum" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-29
ALTER TABLE "institution" ADD CONSTRAINT "fkrwvc5mmqe65rktt9i3ufbi394" FOREIGN KEY ("curriculum_id") REFERENCES "curriculum" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-33
ALTER TABLE "users" ADD CONSTRAINT "fk4qu1gr772nnf6ve5af002rwya" FOREIGN KEY ("role_id") REFERENCES "role" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;


-- changeset yogesh:1631403947481-35
ALTER TABLE "topic" ADD CONSTRAINT "fke679b6a4edyobvprraj7mjoih" FOREIGN KEY ("topic_label_id") REFERENCES "topic_label" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;


-- changeset yogesh:1631403947481-39
ALTER TABLE "block_aud" ADD CONSTRAINT "fkndsyvqjax1wwk4gb3xjlilc6o" FOREIGN KEY ("rev") REFERENCES "revinfo" ("rev") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-40
ALTER TABLE "block" ADD CONSTRAINT "fkdxh7ihwqxcqhnkspsa91ubcc6" FOREIGN KEY ("topic_id") REFERENCES "topic" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-41
ALTER TABLE "users" ADD CONSTRAINT "fkes3l5tviwmnu2d0gy350kdfht" FOREIGN KEY ("institution_id") REFERENCES "institution" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-42
ALTER TABLE "users" ADD CONSTRAINT "fklyno40pkyawttif0n60i04772" FOREIGN KEY ("subscription_id") REFERENCES "subscription_type" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-43
ALTER TABLE "language_aud" ADD CONSTRAINT "fkadkpre8edt1b93q10c2us67in" FOREIGN KEY ("rev") REFERENCES "revinfo" ("rev") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-44
ALTER TABLE "topic" ADD CONSTRAINT "fkipo6144dvb6o1rb1rgo88ut4d" FOREIGN KEY ("parent_id") REFERENCES "topic" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-45
ALTER TABLE "tag" ADD CONSTRAINT "fkeyprhq1kxbxqna036txwl3fyc" FOREIGN KEY ("topic_interests_id") REFERENCES "tag" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;

-- changeset yogesh:1631403947481-46
ALTER TABLE "tag" ADD CONSTRAINT "fkrhdmb044knqxknwjjfgeqnxcy" FOREIGN KEY ("level_interests_id") REFERENCES "tag" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION;
