-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: briarcrm
-- Source Schemata: briarcrm
-- Created: Mon Aug 26 06:15:26 2024
-- Workbench Version: 8.0.38
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema briarcrm
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `briarcrm` ;
CREATE SCHEMA IF NOT EXISTS `briarcrm` ;

-- ----------------------------------------------------------------------------
-- Table briarcrm.account_documents
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`account_documents` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `user_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `name` VARCHAR(255) NOT NULL,
  `path` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 106
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.account_notes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`account_notes` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `user_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `note` VARCHAR(2000) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.accounts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`accounts` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NULL DEFAULT NULL,
  `lead_id` INT UNSIGNED NULL DEFAULT NULL,
  `lead_source_id` INT UNSIGNED NULL DEFAULT NULL,
  `lead_list_id` INT UNSIGNED NULL DEFAULT NULL,
  `lead_status_id` INT UNSIGNED NULL DEFAULT NULL,
  `company` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `zipcode` VARCHAR(10) NULL DEFAULT NULL,
  `contact` VARCHAR(255) NULL DEFAULT NULL,
  `contact_title` VARCHAR(255) NULL DEFAULT NULL,
  `contact_phone` VARCHAR(255) NULL DEFAULT NULL,
  `contact_email` VARCHAR(255) NULL DEFAULT NULL,
  `notes` VARCHAR(2000) NULL DEFAULT NULL,
  `callback_date` DATE NULL DEFAULT NULL,
  `callback_time` TIME NULL DEFAULT NULL,
  `callback_note` VARCHAR(2000) NULL DEFAULT NULL,
  `current_vendor` VARCHAR(255) NULL DEFAULT NULL,
  `current_exp_date` DATE NULL DEFAULT NULL,
  `converted` TINYINT UNSIGNED NULL DEFAULT '1',
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 137
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.call_history
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`call_history` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `phone` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1449
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.checks
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`checks` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `contract_id` BIGINT NULL DEFAULT NULL,
  `check_number` VARCHAR(255) NULL DEFAULT NULL,
  `check_date` DATE NULL DEFAULT NULL,
  `contract_number` VARCHAR(255) NULL DEFAULT NULL,
  `payment` DECIMAL(8,2) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `checks_user_id_foreign` (`user_id` ASC) VISIBLE,
  CONSTRAINT `checks_user_id_foreign`
    FOREIGN KEY (`user_id`)
    REFERENCES `briarcrm`.`users` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 268
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.contract_documents
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`contract_documents` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `user_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `name` VARCHAR(255) NOT NULL,
  `path` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 40
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.contract_meters
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`contract_meters` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_id` BIGINT UNSIGNED NOT NULL,
  `meter_id` BIGINT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `move_in_type` VARCHAR(45) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `move_in_start` VARCHAR(45) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `contract_esi_esi_id_foreign` (`meter_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.contract_notes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`contract_notes` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `user_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `note` VARCHAR(2000) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.contract_payments
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`contract_payments` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_id` BIGINT UNSIGNED NOT NULL,
  `projected_amount` DECIMAL(8,2) NULL DEFAULT NULL,
  `projected_date` DATE NULL DEFAULT NULL,
  `actual_amount` DECIMAL(8,2) NULL DEFAULT NULL,
  `actual_date` DATE NULL DEFAULT NULL,
  `actual_ref_number` VARCHAR(45) NULL DEFAULT NULL,
  `check_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `contract_payments_contract_id_foreign` (`contract_id` ASC) VISIBLE,
  INDEX `contract_payments_check_id_foreign` (`check_id` ASC) VISIBLE,
  CONSTRAINT `contract_payments_check_id_foreign`
    FOREIGN KEY (`check_id`)
    REFERENCES `briarcrm`.`checks` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `contract_payments_contract_id_foreign`
    FOREIGN KEY (`contract_id`)
    REFERENCES `briarcrm`.`contracts` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 30
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.contract_pricing_types
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`contract_pricing_types` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_pricing_type` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.contract_statuses
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`contract_statuses` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_status` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.contract_types
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`contract_types` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_type` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.contracts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`contracts` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `contract_number` VARCHAR(255) NULL DEFAULT NULL,
  `rep_contract_number` VARCHAR(255) NULL DEFAULT NULL,
  `contract_type_id` INT NULL DEFAULT NULL,
  `account_id` INT UNSIGNED NULL DEFAULT NULL,
  `status` VARCHAR(255) NULL DEFAULT NULL,
  `commodity` VARCHAR(255) NULL DEFAULT NULL,
  `supplier_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `utility_id` INT NULL DEFAULT NULL,
  `signature_date` DATE NULL DEFAULT NULL,
  `confirmation_date` DATE NULL DEFAULT NULL,
  `effective_date` DATE NULL DEFAULT NULL,
  `expiration_date` DATE NULL DEFAULT NULL,
  `confirmed_annual_usage` VARCHAR(255) NULL DEFAULT NULL,
  `load_factor` VARCHAR(255) NULL DEFAULT NULL,
  `annual_usage` VARCHAR(45) NULL DEFAULT NULL,
  `rate` VARCHAR(255) NULL DEFAULT NULL,
  `term` VARCHAR(255) NULL DEFAULT NULL,
  `margin` VARCHAR(255) NULL DEFAULT NULL,
  `move_in_type` VARCHAR(255) NULL DEFAULT NULL,
  `tax_exempt` VARCHAR(255) NULL DEFAULT NULL,
  `annual_value` VARCHAR(255) NULL DEFAULT NULL,
  `contract_value` VARCHAR(255) NULL DEFAULT NULL,
  `generator_id` INT UNSIGNED NULL DEFAULT NULL,
  `closer_id` INT UNSIGNED NULL DEFAULT NULL,
  `closer_mentor_id` INT UNSIGNED NULL DEFAULT NULL,
  `generator_percent` VARCHAR(255) NULL DEFAULT NULL,
  `closer_percent` VARCHAR(255) NULL DEFAULT NULL,
  `closer_mentor_percent` VARCHAR(255) NULL DEFAULT NULL,
  `generator_commission` VARCHAR(255) NULL DEFAULT NULL,
  `closer_commission` VARCHAR(255) NULL DEFAULT NULL,
  `closer_mentor_commission` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `company` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state` VARCHAR(45) NULL DEFAULT NULL,
  `zipcode` VARCHAR(45) NULL DEFAULT NULL,
  `contact` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `payment_type` VARCHAR(45) NULL DEFAULT NULL,
  `billing_address` VARCHAR(45) NULL DEFAULT NULL,
  `billing_city` VARCHAR(45) NULL DEFAULT NULL,
  `billing_state` VARCHAR(45) NULL DEFAULT NULL,
  `billing_zipcode` VARCHAR(45) NULL DEFAULT NULL,
  `language` VARCHAR(45) NULL DEFAULT NULL,
  `tax_id` VARCHAR(45) NULL DEFAULT NULL,
  `peak` VARCHAR(45) NULL DEFAULT NULL,
  `audit_date` DATETIME NULL DEFAULT NULL,
  `audit_by_id` BIGINT NULL DEFAULT NULL,
  `contract_pricing_type` VARCHAR(45) NULL DEFAULT NULL,
  `is_green` BIT(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  INDEX `contracts_supplier_id_foreign` (`supplier_id` ASC) VISIBLE,
  CONSTRAINT `contracts_supplier_id_foreign`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `briarcrm`.`suppliers` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 163
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.dialer_agents
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`dialer_agents` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NULL DEFAULT NULL,
  `lead_list` VARCHAR(255) NULL DEFAULT NULL,
  `company` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `zipcode` VARCHAR(10) NULL DEFAULT NULL,
  `employees` VARCHAR(10) NULL DEFAULT NULL,
  `sales` VARCHAR(10) NULL DEFAULT NULL,
  `sic` VARCHAR(10) NULL DEFAULT NULL,
  `contact` VARCHAR(255) NULL DEFAULT NULL,
  `contact_title` VARCHAR(255) NULL DEFAULT NULL,
  `contact_phone` VARCHAR(255) NULL DEFAULT NULL,
  `contact_email` VARCHAR(255) NULL DEFAULT NULL,
  `dialer_status_id` TINYINT UNSIGNED NULL DEFAULT NULL,
  `converted` TINYINT UNSIGNED NULL DEFAULT '0',
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.dialer_histories
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`dialer_histories` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dialer_id` INT UNSIGNED NULL DEFAULT NULL,
  `user_id` INT UNSIGNED NULL DEFAULT NULL,
  `dialer_result` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `dialer_note` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 42184
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.dialer_results
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`dialer_results` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dialer_result` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.dialers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`dialers` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NULL DEFAULT NULL,
  `lead_list` VARCHAR(255) NULL DEFAULT NULL,
  `company` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `zipcode` VARCHAR(10) NULL DEFAULT NULL,
  `employees` VARCHAR(255) NULL DEFAULT NULL,
  `sales` VARCHAR(255) NULL DEFAULT NULL,
  `sic` VARCHAR(10) NULL DEFAULT NULL,
  `contact` VARCHAR(255) NULL DEFAULT NULL,
  `contact_title` VARCHAR(255) NULL DEFAULT NULL,
  `contact_phone` VARCHAR(255) NULL DEFAULT NULL,
  `contact_email` VARCHAR(255) NULL DEFAULT NULL,
  `dialer_status_id` TINYINT UNSIGNED NULL DEFAULT NULL,
  `converted` TINYINT UNSIGNED NULL DEFAULT '0',
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `last_call_date` VARCHAR(45) NULL DEFAULT NULL,
  `last_call_agent_id` INT NULL DEFAULT NULL,
  `last_call_result` VARCHAR(45) NULL DEFAULT NULL,
  `assigned_to` INT NULL DEFAULT NULL,
  `dialer_note` VARCHAR(250) NULL DEFAULT NULL,
  `keyword_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `website_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `dialers_phone_unique` (`phone` ASC) VISIBLE,
  INDEX `dialers_keyword_id_index` (`keyword_id` ASC) VISIBLE,
  INDEX `dialers_website_id_index` (`website_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2945631
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.dialers_temp
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`dialers_temp` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_list` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `company` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `email` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `phone` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  `address` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `city` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `state` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `zipcode` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `employees` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `sales` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `sic` VARCHAR(10) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `contact` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `contact_title` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `contact_phone` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `contact_email` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL DEFAULT NULL,
  `sic_name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 77330
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.generator_hours
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`generator_hours` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `work_day` DATE NULL DEFAULT NULL,
  `work_start` DATETIME NOT NULL,
  `work_end` DATETIME NOT NULL,
  `work_hours` INT NOT NULL,
  `work_minutes` INT NOT NULL,
  `rate` DECIMAL(10,2) NOT NULL,
  `total_wage` DECIMAL(10,2) NOT NULL,
  `calls` INT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `generator_hours_user_id_foreign` (`user_id` ASC) VISIBLE,
  CONSTRAINT `generator_hours_user_id_foreign`
    FOREIGN KEY (`user_id`)
    REFERENCES `briarcrm`.`users` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.goals
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`goals` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `goal_name` VARCHAR(45) NULL DEFAULT NULL,
  `goal_amount` VARCHAR(45) NULL DEFAULT NULL,
  `goal_total` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.lead_call_statuses
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`lead_call_statuses` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_call_status` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.lead_callbacks
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`lead_callbacks` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` VARCHAR(255) NOT NULL,
  `call_date` VARCHAR(255) NULL DEFAULT NULL,
  `call_time` VARCHAR(255) NULL DEFAULT NULL,
  `call_note` VARCHAR(255) NULL DEFAULT NULL,
  `lead_call_status_id` INT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.lead_calls
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`lead_calls` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` INT UNSIGNED NOT NULL,
  `call_status_id` INT UNSIGNED NULL DEFAULT NULL,
  `note` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.lead_contacts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`lead_contacts` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` INT UNSIGNED NOT NULL,
  `contact` VARCHAR(255) NULL DEFAULT NULL,
  `contact_title` VARCHAR(255) NULL DEFAULT NULL,
  `contact_phone` VARCHAR(255) NULL DEFAULT NULL,
  `contact_email` VARCHAR(255) NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.lead_documents
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`lead_documents` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `user_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `name` VARCHAR(255) NOT NULL,
  `path` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 50
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.lead_lists
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`lead_lists` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_list` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.lead_notes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`lead_notes` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` INT UNSIGNED NULL DEFAULT NULL,
  `user_id` INT UNSIGNED NULL DEFAULT NULL,
  `note` VARCHAR(2000) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3022
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.lead_sources
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`lead_sources` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_source` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.lead_statuses
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`lead_statuses` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_status` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.leads
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`leads` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NULL DEFAULT NULL,
  `lead_source_id` INT UNSIGNED NULL DEFAULT NULL,
  `lead_list_id` INT UNSIGNED NULL DEFAULT NULL,
  `company` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `lead_status_id` INT UNSIGNED NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `zipcode` VARCHAR(10) NULL DEFAULT NULL,
  `converted` TINYINT UNSIGNED NULL DEFAULT '0',
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `notes` VARCHAR(2000) NULL DEFAULT NULL,
  `contact` VARCHAR(45) NULL DEFAULT NULL,
  `contact_title` VARCHAR(45) NULL DEFAULT NULL,
  `contact_phone` VARCHAR(45) NULL DEFAULT NULL,
  `contact_email` VARCHAR(255) NULL DEFAULT NULL,
  `callback_date` DATE NULL DEFAULT NULL,
  `callback_time` TIME NULL DEFAULT NULL,
  `callback_note` VARCHAR(2000) NULL DEFAULT NULL,
  `current_vendor` VARCHAR(45) NULL DEFAULT NULL,
  `current_exp_date` DATE NULL DEFAULT NULL,
  `list_id` INT NULL DEFAULT NULL,
  `zip` VARCHAR(45) NULL DEFAULT NULL,
  `contract_electric` VARCHAR(45) NULL DEFAULT '0',
  `contract_gas` VARCHAR(45) NULL DEFAULT '0',
  `contract_audit` VARCHAR(45) NULL DEFAULT '0',
  `coming_electric` VARCHAR(45) NULL DEFAULT '0',
  `coming_gas` VARCHAR(45) NULL DEFAULT '0',
  `coming_audit` VARCHAR(45) NULL DEFAULT '0',
  `sent_email` INT NULL DEFAULT '0',
  `converted_date` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2935
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.menus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`menus` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `href` VARCHAR(255) NULL DEFAULT NULL,
  `icon` VARCHAR(255) NULL DEFAULT NULL,
  `required_permission` VARCHAR(255) NULL DEFAULT NULL,
  `parent_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `order` INT NOT NULL DEFAULT '0',
  `active` INT NOT NULL DEFAULT '1',
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.meters
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`meters` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `esi_id` VARCHAR(100) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(100) NULL DEFAULT NULL,
  `state` CHAR(2) NULL DEFAULT NULL,
  `zip` CHAR(5) NULL DEFAULT NULL,
  `plus4` CHAR(4) NULL DEFAULT NULL,
  `mtr` VARCHAR(100) NULL DEFAULT NULL,
  `premise` VARCHAR(255) NULL DEFAULT NULL,
  `rd` VARCHAR(255) NULL DEFAULT NULL,
  `status` VARCHAR(50) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `peak` VARCHAR(45) NULL DEFAULT '0',
  `usage` VARCHAR(45) NULL DEFAULT '0',
  `assigned_to` BIGINT NULL DEFAULT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 48
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.migrations
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`migrations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) NOT NULL,
  `batch` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 92
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.move_in_types
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`move_in_types` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `move_in_type` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.password_reset_tokens
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`password_reset_tokens` (
  `email` VARCHAR(255) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.personal_access_tokens
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`personal_access_tokens` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` VARCHAR(255) NOT NULL,
  `tokenable_id` BIGINT UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `token` VARCHAR(64) NOT NULL,
  `abilities` TEXT NULL DEFAULT NULL,
  `last_used_at` TIMESTAMP NULL DEFAULT NULL,
  `expires_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `personal_access_tokens_token_unique` (`token` ASC) VISIBLE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type` ASC, `tokenable_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.roles
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`roles` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `roles_name_unique` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.suppliers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`suppliers` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.sys_states
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`sys_states` (
  `id` BIGINT UNSIGNED NOT NULL,
  `country_id` TINYINT UNSIGNED NULL DEFAULT '1',
  `state_long` VARCHAR(255) NULL DEFAULT NULL,
  `state_short` CHAR(2) NULL DEFAULT NULL,
  `sort_order` TINYINT UNSIGNED NULL DEFAULT NULL,
  `state_electric` VARCHAR(2) NULL DEFAULT '0',
  `state_gas` VARCHAR(2) NULL DEFAULT '0',
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `state_active` VARCHAR(45) NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.sys_zips
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`sys_zips` (
  `id` BIGINT UNSIGNED NOT NULL,
  `zip` VARCHAR(45) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state` VARCHAR(45) NULL DEFAULT NULL,
  `county` VARCHAR(100) NULL DEFAULT NULL,
  `latitude` VARCHAR(45) NULL DEFAULT NULL,
  `longitude` VARCHAR(45) NULL DEFAULT NULL,
  `population` VARCHAR(45) NULL DEFAULT NULL,
  `electric` INT NULL DEFAULT '0',
  `gas` INT NULL DEFAULT '0',
  `suppier` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `sys_zips_zip_index` (`zip` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `screen_name` VARCHAR(45) NULL DEFAULT NULL,
  `user_type` VARCHAR(45) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NULL DEFAULT NULL,
  `team_lead` INT NULL DEFAULT NULL,
  `user_password` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `remember_token` VARCHAR(100) NULL DEFAULT NULL,
  `date_of_birth` VARCHAR(45) NULL DEFAULT NULL,
  `personal_email` VARCHAR(45) NULL DEFAULT NULL,
  `personal_phone` VARCHAR(45) NULL DEFAULT NULL,
  `computer_login` VARCHAR(45) NULL DEFAULT NULL,
  `3cx_password` VARCHAR(45) NULL DEFAULT NULL,
  `contract_password` VARCHAR(45) NULL DEFAULT NULL,
  `outlook_password` VARCHAR(45) NULL DEFAULT NULL,
  `crm_password` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state` VARCHAR(45) NULL DEFAULT NULL,
  `zip` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `users_role_id_foreign` (`role_id` ASC) VISIBLE,
  CONSTRAINT `users_role_id_foreign`
    FOREIGN KEY (`role_id`)
    REFERENCES `briarcrm`.`roles` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
AUTO_INCREMENT = 39
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table briarcrm.utilities
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `briarcrm`.`utilities` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `utility` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  `kwh_1500` DECIMAL(4,3) NOT NULL,
  `kwh_2500` DECIMAL(4,3) NOT NULL,
  `kwh_3500` DECIMAL(4,3) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
