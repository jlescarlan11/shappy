CREATE TABLE `carts` (
  `id` binary(16) NOT NULL DEFAULT (uuid_to_bin(uuid())),
  `date_created` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`)
);

CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_id` binary(16) NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_product_unique` (`cart_id`, `product_id`),
  KEY `cart_items_products__fk_idx` (`product_id`),
  CONSTRAINT `cart_items_carts__fk` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_products__fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
);