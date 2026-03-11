# Optical Store DB

**Description**: Relational database for comprehensive management of an optical store, including product management, customers, sales, and inventory.

## 📌 Exercise Statement

Develop a relational database for an optical store that enables:
- Managing the product catalog (glasses, lenses, accessories)
- Registering customer information and their purchases
- Controlling inventory and stock levels
- Recording sales and transactions
- Maintaining a history of operations

## ✨ Features

- ✅ Product management and categorization
- ✅ Customer registration and contact information
- ✅ Inventory and stock control
- ✅ Sales and transaction history
- ✅ Complex table relationships (1:N, N:M)
- ✅ Referential integrity with foreign keys
- ✅ Pre-loaded demonstration data

## 🛠 Technologies

- **Database**: MySQL 8.0
- **Database Management**: MySQL Workbench
- **Containerization**: Docker & Docker Compose
- **Web Administration**: Adminer (optional web interface)

## 🚀 Installation & Execution

### Prerequisites
- Docker and Docker Compose installed
- MySQL 8.0+ (if running locally without Docker)
- MySQL Workbench (optional, to open the `.mwb` model)

### Option 1: With Docker (Recommended)

1. **Clone or download the project**
   ```bash
   cd /path/to/S201-MySQL
   ```

2. **Configure environment variables**
   Copy the example file and set your credentials:
   ```bash
   cp .env.example .env
   # Edit the .env file with your actual settings
   nano .env
   ```
   **⚠️ Important**: The `.env` file is ignored by Git and should never be committed.

3. **Start the services**
   ```bash
   docker-compose up -d
   ```
   
   This will start:
   - **MySQL**: Port 3306
   - **Adminer**: Port 8080 (accessible at http://localhost:8080)

4. **Create the schema and tables**
   ```bash
   docker exec mysql-local mysql -u $MYSQL_USER -p'$MYSQL_PASSWORD' $MYSQL_DATABASE < sql/optical_store.sql
   ```
   Or using values from your `.env` file:
   ```bash
   docker exec mysql-local mysql -u your_username -p'your_password' your_database < sql/optical_store.sql
   ```

5. **Load demonstration data**
   ```bash
   docker exec mysql-local mysql -u $MYSQL_USER -p'$MYSQL_PASSWORD' $MYSQL_DATABASE < sql/inserts_optical_store.sql
   ```
   Or using values from your `.env` file:
   ```bash
   docker exec mysql-local mysql -u your_username -p'your_password' your_database < sql/inserts_optical_store.sql
   ```

6. **Access the database**
   - **Adminer web interface**: http://localhost:8080
     - Server: `mysql`
     - User: `$MYSQL_USER` (from your .env)
     - Password: `$MYSQL_PASSWORD` (from your .env)
     - Database: `$MYSQL_DATABASE` (from your .env)
   
   - **Local MySQL client**:
     ```bash
     mysql -h 127.0.0.1 -u your_username -p'your_password' your_database
     ```

7. **Stop the services**
   ```bash
   docker-compose down
   ```

### Option 2: Local Installation (without Docker)

1. **Create the database**
   ```bash
   mysql -u root -p < sql/optical_store.sql
   ```

2. **Load the data**
   ```bash
   mysql -u root -p mi_base_datos < sql/inserts_optical_store.sql
   ```

## 📁 Project Structure

```text
n1e1-OpticalStore/
├── README.md                          # This file
├── model/
│   └── optical_store.mwb              # MySQL Workbench model
├── doc/
│   └── optical_store.png              # Entity-Relationship Diagram (E-R)
└── sql/
    ├── optical_store.sql              # Schema and table creation
    └── inserts_optical_store.sql      # Demonstration data
```

## 🧩 Diagrams and Technical Decision Justification

### Data Model

The database is organized with the following main tables:

- **products**: Catalog of available products
- **clients**: Customer information
- **sales**: Sales transaction records
- **inventory**: Stock control
- **categories**: Product categorization

### Design Decisions

1. **Normalization**: The database is normalized to 3NF to avoid redundancies
2. **Foreign Keys**: Implementation of constraints to maintain referential integrity
3. **Docker**: Use of containers to facilitate environment reproducibility
4. **Adminer**: Web interface to inspect the database without needing a local client

### Accessing the E-R Diagram

Open `model/optical_store.mwb` with MySQL Workbench to view the complete entity-relationship diagram.

## 🔧 Environment Variables

Configuration is managed through the `.env` file in the project root. 

### Setup Instructions

1. Copy the example file:
   ```bash
   cp .env.example .env
   ```

2. Edit `.env` with your actual credentials:
   ```bash
   nano .env
   ```

3. The `.env` file contains:
   ```env
   # MySQL Database Configuration
   MYSQL_ROOT_PASSWORD=your_root_password_here
   MYSQL_DATABASE=your_database_name
   MYSQL_USER=your_username
   MYSQL_PASSWORD=your_user_password
   
   # Database Connection Settings
   DB_HOST=mysql
   DB_PORT=3306
   DB_NAME=your_database_name
   DB_USER=your_username
   DB_PASSWORD=your_user_password
   
   # Docker Container Names
   MYSQL_CONTAINER=mysql-local
   ADMINER_CONTAINER=adminer
   
   # Service Ports
   MYSQL_PORT=3306
   ADMINER_PORT=8080
   ```

### Security Notes

- **`.env` file**: Contains real credentials. Add to `.gitignore` (already configured) to prevent accidental commits.
- **`.env.example` file**: Safe template with placeholder values. Commit this to the repository.
- **Production**: Never use default credentials. Always use strong, unique passwords.
- **Version Control**: The `.gitignore` file prevents `.env` from being committed automatically.

## 📝 Additional Notes

- SQL scripts in `sql/` are idempotent (can be executed multiple times)
- The `mysql_data` volume persists data between Docker restarts
- Adminer provides a graphical interface to query and modify the database

---

**Last updated**: March 2026
