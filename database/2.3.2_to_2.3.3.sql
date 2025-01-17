ALTER TABLE `ospos_suppliers`
   ADD COLUMN `agency_name` VARCHAR(255) NOT NULL;

INSERT INTO `ospos_app_config` (`key`, `value`) VALUES
   ('dateformat', 'm-d-Y'),
   ('timeformat', 'H:i:s');

ALTER TABLE `ospos_sales_suspended`
    DROP KEY `invoice_number`;

-- Clear out emptied comments (0 inserted in comment if empty #192)
UPDATE `ospos_sales` SET comment = NULL WHERE comment = '0';
UPDATE `ospos_receivings` SET comment = NULL WHERE comment = '0';
UPDATE `ospos_sales_suspended` SET comment = NULL WHERE comment = '0';