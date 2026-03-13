# S201-MySQL - Database Management Projects

**Description**: Collection of database design exercises using MySQL, implementing various real-world scenarios including an optical store, pizzeria delivery system, and simplified YouTube platform. All projects are containerized using Docker for easy deployment and consistency across environments.

## 📌 Exercise Context

This repository contains three mini-projects from Sprint 2, each implementing a complete relational database design following professional standards:

1. **n1e1-OpticalStore** - Database for optical store management
2. **n1e2-Pizzeria** - Database for online food delivery system
3. **n2e1-YouTube** - Database for simplified YouTube platform

Each project includes database schema, sample data, and comprehensive documentation.

## ✨ Features

- ✅ Three complete database projects with different complexity levels
- ✅ Docker containerization for unified environment
- ✅ MySQL 8.0 with persistent data volumes
- ✅ Adminer web interface for database inspection
- ✅ Pre-loaded demonstration data for each project
- ✅ Normalized database designs following 3NF standards
- ✅ Secure environment configuration with .env files
- ✅ MySQL Workbench models for each project
- ✅ Comprehensive README files for each project

## 🛠 Technologies

- **Database**: MySQL 8.0
- **Database Management**: MySQL Workbench
- **Containerization**: Docker & Docker Compose
- **Web Administration**: Adminer
- **Version Control**: Git

## 🚀 Installation & Execution

### Prerequisites
- Docker and Docker Compose installed
- MySQL Workbench (optional, for viewing `.mwb` models)
- Git (for version control)

### Quick Start

1. **Clone or download the repository**
   ```bash
   cd /path/to/S201-MySQL
   ```

2. **Configure environment variables**
   ```bash
   cp .env.example .env
   # Edit with your actual settings
   nano .env
   ```

3. **Start Docker services**
   ```bash
   docker-compose up -d
   ```

4. **Load a project** (choose one)

   **For Optical Store:**
   ```bash
   docker exec mysql-local mysql -u your_username -p'your_password' your_database < n1e1-OpticalStore/sql/optical_store.sql
   docker exec mysql-local mysql -u your_username -p'your_password' your_database < n1e1-OpticalStore/sql/inserts_optical_store.sql
   ```

   **For Pizzeria:**
   ```bash
   docker exec mysql-local mysql -u your_username -p'your_password' your_database < n1e2-Pizzeria/sql/pizzeria.sql
   docker exec mysql-local mysql -u your_username -p'your_password' your_database < n1e2-Pizzeria/sql/inserts_pizzeria.sql
   ```

   **For YouTube:**
   ```bash
   docker exec mysql-local mysql -u your_username -p'your_password' your_database < n2e1-YouTube/sql/youtube.sql
   docker exec mysql-local mysql -u your_username -p'your_password' your_database < n2e1-YouTube/sql/inserts_youtube.sql
   ```

5. **Access the database**
   - **Adminer web interface**: http://localhost:8080
   - **MySQL client**:
     ```bash
     mysql -h 127.0.0.1 -u your_username -p'your_password' your_database
     ```

6. **Stop services**
   ```bash
   docker-compose down
   ```

## 📁 Repository Structure

```
S201-MySQL/
├── docker-compose.yml                 # Docker Compose configuration
├── .env                               # Environment variables (DO NOT commit)
├── .env.example                       # Environment template
├── .gitignore                         # Git ignore rules
├── README.md                          # This file
│
├── n1e1-OpticalStore/                 # Optical store database
│   ├── README.md                      # Detailed documentation
│   ├── model/
│   │   └── optical_store.mwb          # MySQL Workbench model
│   ├── doc/
│   │   └── optical_store.png          # E-R diagram
│   └── sql/
│       ├── optical_store.sql          # Schema creation
│       └── inserts_optical_store.sql  # Sample data
│
├── n1e2-Pizzeria/                     # Pizzeria delivery database
│   ├── README.md                      # Detailed documentation
│   ├── model/
│   │   └── pizzeria.mwb               # MySQL Workbench model
│   ├── doc/
│   │   └── pizzeria.png               # E-R diagram
│   └── sql/
│       ├── pizzeria.sql               # Schema creation
│       └── inserts_pizzeria.sql       # Sample data
│
└── n2e1-YouTube/                      # YouTube database
    ├── README.md                      # Detailed documentation
    ├── model/
    │   ├── youtube.mwb                # MySQL Workbench model
    │   └── youtube.mwb.bak            # Backup
    ├── doc/
    │   └── [E-R diagrams]
    └── sql/
        ├── youtube.sql                # Schema creation
        └── inserts_youtube.sql        # Sample data
```

## 🧩 Project Descriptions

### n1e1-OpticalStore
**Database for optical store management** with customer profiles, product catalog, inventory tracking, and sales management.
- Tables: Customers, Products, Orders, Inventory, Categories
- Key features: Location management, product categorization, order history

### n1e2-Pizzeria
**Online food delivery system database** with complete order management, employee tracking, and delivery coordination.
- Tables: Clients, Stores, Employees, Products, Orders, Categories
- Key features: Multi-location support, delivery driver tracking, dynamic categorization

### n2e1-YouTube
**Simplified YouTube platform database** with user profiles, video management, channels, subscriptions, and social features.
- Tables: Users, Videos, Channels, Playlists, Comments, Reactions, Hashtags
- Key features: Video reactions, comment system, playlist management, subscription tracking

## 🔧 Environment Configuration

### .env File Structure

```env
# MySQL Configuration
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_DATABASE=your_database
MYSQL_USER=your_user
MYSQL_PASSWORD=your_password

# Connection Settings
DB_HOST=mysql
DB_PORT=3306

# Docker
MYSQL_CONTAINER=mysql-local
ADMINER_CONTAINER=adminer
MYSQL_PORT=3306
ADMINER_PORT=8080
```

**⚠️ Security Notes:**
- `.env` file contains sensitive credentials and must NOT be committed
- `.gitignore` automatically prevents `.env` from being tracked
- Use `.env.example` as template for new environments
- Always use strong, unique passwords in production

## 📚 Documentation

Each project includes detailed documentation:

- **README.md** - Complete project documentation with enunciate, features, and technical decisions
- **Model (.mwb)** - MySQL Workbench files for visual schema inspection and modifications
- **Diagrams (.png)** - Entity-Relationship diagrams for quick reference
- **SQL Scripts** - Schema creation and sample data scripts

## 🚀 Deployment

### Local Development
```bash
docker-compose up -d
```

### Accessing Data
- **Web Interface**: http://localhost:8080 (Adminer)
- **Command Line**: `mysql -h 127.0.0.1 -u user -p database`

### Backup & Restore
```bash
# Backup
docker exec mysql-local mysqldump -u user -p database > backup.sql

# Restore
docker exec mysql-local mysql -u user -p database < backup.sql
```

## 🔍 Common Tasks

### View Database Schema
```bash
docker exec mysql-local mysql -u user -p database -e "SHOW TABLES;"
```

### Execute Custom SQL
```bash
docker exec mysql-local mysql -u user -p database < your_script.sql
```

### Access MySQL Shell
```bash
docker exec -it mysql-local mysql -u user -p database
```

### View Logs
```bash
docker-compose logs mysql
```

## ⚙️ Technical Standards

- **Normalization**: All databases normalized to 3NF
- **Referential Integrity**: Foreign keys with appropriate cascade rules
- **Data Types**: Appropriate ENUM, DECIMAL, DATE/DATETIME usage
- **Indexes**: Optimized for query performance
- **Timestamps**: Automatic tracking with CURRENT_TIMESTAMP
- **Constraints**: Unique, NOT NULL, and CHECK constraints where needed

## 📝 Notes

- SQL scripts are idempotent (safe to run multiple times)
- Sample data is provided for testing and demonstration
- `mysql_data` volume persists data between container restarts
- Adminer provides web-based database browsing and editing
- Each project can be used independently or alongside others

## 🔐 Production Considerations

- Implement proper authentication mechanisms
- Use environment-specific .env files
- Enable SSL/TLS for database connections
- Implement regular backups
- Add query logging and monitoring
- Use connection pooling for high-traffic scenarios
- Implement proper access controls and user privileges

## 📖 Additional Resources

- [MySQL Documentation](https://dev.mysql.com/doc/)
- [MySQL Workbench Guide](https://dev.mysql.com/doc/workbench/en/)
- [Docker Documentation](https://docs.docker.com/)
- [Adminer Documentation](https://www.adminer.org/)

---

**Last updated**: March 2026

**Maintainers**: Database Design - Sprint 2 Projects
