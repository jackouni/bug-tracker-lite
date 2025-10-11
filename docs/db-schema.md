# Schema

## Conceptual ERD:

![Conceptual Entity Relationship Diagram For Database](ERDs/conceptual.png)

## Physical ERD:

![Physical Entity Relationship Diagram For Database](ERDs/physical.png)

### Users Table

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | SERIAL | PRIMARY KEY | Unique identifier for user |
| first_name | VARCHAR(50) | NOT NULL | User's first name |
| last_name | VARCHAR(50) | NOT NULL | User's last name |
| email | VARCHAR(255) | NOT NULL, UNIQUE | User's email address |
| password_hash | VARCHAR(255) | NOT NULL | Hashed password for authentication |
| created_at | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Account creation timestamp |
| last_login | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Last login timestamp |

### Projects Table

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | SERIAL | PRIMARY KEY | Unique identifier for project |
| user_id | INTEGER | NOT NULL, FOREIGN KEY → users(id) ON DELETE CASCADE | Project owner reference |
| title | VARCHAR(255) | NOT NULL | Project name/title |
| description | TEXT | | Detailed project description |
| deadline | DATE | | Project deadline (optional) |
| priority | VARCHAR(50) | CHECK (priority IN ('low', 'medium', 'high', 'critical')) | Project priority level |
| is_pinned | BOOLEAN | NOT NULL, DEFAULT FALSE | Whether project is pinned to top |
| created_at | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Project creation timestamp |
| updated_at | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Last update timestamp |

### Bugs Table

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | SERIAL | PRIMARY KEY | Unique identifier for bug |
| project_id | INTEGER | NOT NULL, FOREIGN KEY → projects(id) ON DELETE CASCADE | Parent project reference |
| title | VARCHAR(255) | NOT NULL | Bug title/summary |
| description | TEXT | | Detailed bug description |
| deadline | DATE | | Bug resolution deadline (optional) |
| status | VARCHAR(50) | NOT NULL, DEFAULT 'open', CHECK (status IN ('open', 'in_progress', 'resolved', 'closed', 'wont_fix')) | Current bug status |
| priority | VARCHAR(50) | CHECK (priority IN ('low', 'medium', 'high', 'critical')) | Bug priority level |
| is_pinned | BOOLEAN | NOT NULL, DEFAULT FALSE | Whether bug is pinned to top |
| created_at | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Bug creation timestamp |
| updated_at | TIMESTAMP | NOT NULL, DEFAULT CURRENT_TIMESTAMP | Last update timestamp |

### Relationships

- **Users → Projects**: One-to-Many
- **Projects → Bugs**: One-to-Many (One project can have multiple bugs)

### Indexes
```sql
CREATE INDEX idx_projects_user_id ON projects(user_id);
CREATE INDEX idx_projects_is_pinned ON projects(is_pinned);
CREATE INDEX idx_bugs_project_id ON bugs(project_id);
CREATE INDEX idx_bugs_status ON bugs(status);
CREATE INDEX idx_bugs_priority ON bugs(priority);
CREATE INDEX idx_bugs_is_pinned ON bugs(is_pinned);

-- Unique constraint for email:
CREATE UNIQUE INDEX idx_users_email ON users(email);
```