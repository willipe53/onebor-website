-- Core tables
CREATE TABLE users (
  user_id VARCHAR(64) PRIMARY KEY,     -- Cognito sub, UUID, etc.
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255)
);

CREATE TABLE client_groups (
  client_group_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);

-- Join table: Users ↔ Client Groups
CREATE TABLE client_group_users (
  client_group_id INT NOT NULL,
  user_id VARCHAR(64) NOT NULL,
  PRIMARY KEY (client_group_id, user_id),
  FOREIGN KEY (client_group_id) REFERENCES client_groups(client_group_id)
    ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON DELETE CASCADE
);

-- Join table: Entities ↔ Client Groups
CREATE TABLE client_group_entities (
  client_group_id INT NOT NULL,
  entity_id INT NOT NULL,
  PRIMARY KEY (client_group_id, entity_id),
  FOREIGN KEY (client_group_id) REFERENCES client_groups(client_group_id)
    ON DELETE CASCADE,
  FOREIGN KEY (entity_id) REFERENCES entities(entity_id)
    ON DELETE CASCADE
);
