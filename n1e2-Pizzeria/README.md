# Pizzeria Delivery DB

**Description**: Relational database for managing an online food delivery system for a pizzeria, including customer orders, products, stores, and employee management.

## 📌 Exercise Statement

Design a web application for ordering food delivery online for a pizzeria with the following requirements:

**Customer Management**:
- Contains: ID, Name, Surname, Phone, Address
- Address includes: Street, Number, Floor, Door, City, Postal Code, Country, Town
- Towns and Provinces stored in separate tables (1:N relationship)
- Each town belongs to exactly one province

**Orders**:
- Contains: ID, Date/Time, Order Type (DELIVERY or PICKUP), Total Price
- Relationship: 1 customer → many orders (1:N)
- For delivery orders: Track delivery driver (Employee) and delivery date/time

**Products**:
- Types: PIZZA, BURGER, DRINK
- Each product contains: ID, Name, Description, Image, Price, Type
- Pizza-specific: Additional relationship to Categories (changeable throughout the year)

**Stores**:
- Contains: ID, Name, Address
- Relationship: 1 store → many orders (1:N)

**Employees**:
- Contains: ID, Name, Surname, NIF, Phone, Role (COOK or DELIVERY_DRIVER), Address
- Relationship: 1 store → many employees (1:N)
- For delivery orders: Assign a DELIVERY_DRIVER employee and record delivery time

**Order Items**:
- Track products per order with quantity (N:M relationship via ORDER_PRODUCT junction table)

## ✨ Features

- ✅ Customer management with location and province data
- ✅ Multi-product order system (pizzas, burgers, beverages)
- ✅ Dynamic pizza categorization
- ✅ Store management with multiple locations
- ✅ Employee management with role assignment (chef/driver)
- ✅ Delivery tracking with driver assignment
- ✅ Complete order history and management
- ✅ Complex relational structure with proper normalization
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
   cd /path/to/S201-MySQL/n1e2-Pizzeria
   ```

2. **Configure environment variables**
   Copy the example file and set your credentials (from parent directory):
   ```bash
   cd ..
   cp .env.example .env
   # Edit the .env file with your actual settings
   nano .env
   ```
   **⚠️ Important**: The `.env` file is ignored by Git and should never be committed.

3. **Start the services** (run from parent directory)
   ```bash
   docker-compose up -d
   ```
   
   This will start:
   - **MySQL**: Port 3306
   - **Adminer**: Port 8080 (accessible at http://localhost:8080)

4. **Create the schema and tables**
   ```bash
   docker exec mysql-local mysql -u $MYSQL_USER -p'$MYSQL_PASSWORD' $MYSQL_DATABASE < n1e2-Pizzeria/sql/pizzeria.sql
   ```
   Or using values from your `.env` file:
   ```bash
   docker exec mysql-local mysql -u your_username -p'your_password' your_database < n1e2-Pizzeria/sql/pizzeria.sql
   ```

5. **Load demonstration data**
   ```bash
   docker exec mysql-local mysql -u $MYSQL_USER -p'$MYSQL_PASSWORD' $MYSQL_DATABASE < n1e2-Pizzeria/sql/inserts_pizzeria.sql
   ```
   Or using values from your `.env` file:
   ```bash
   docker exec mysql-local mysql -u your_username -p'your_password' your_database < n1e2-Pizzeria/sql/inserts_pizzeria.sql
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
   mysql -u root -p < n1e2-Pizzeria/sql/pizzeria.sql
   ```

2. **Load the data**
   ```bash
   mysql -u root -p your_database < n1e2-Pizzeria/sql/inserts_pizzeria.sql
   ```

## 📁 Project Structure

```text
n1e2-Pizzeria/
├── README.md                          # This file
├── model/
│   └── pizzeria.mwb                   # MySQL Workbench model
├── doc/
│   └── pizzeria.png                   # Entity-Relationship Diagram (E-R)
└── sql/
    ├── pizzeria.sql                   # Schema and table creation
    └── inserts_pizzeria.sql           # Demonstration data
```

## 🧩 Diagrams and Technical Decision Justification

### Data Model

The database is organized with the following main tables:

- **PROVINCE**: Province information (id_province, name)
- **TOWN**: City/Town info (id_town, name, id_province)
- **ADDRESS**: Detailed address information (id_address, street, number, floor, door, city, zip_code, country, id_town)
- **CLIENT**: Customer data (id_client, name, surname, phone_number, id_address)
- **CATEGORY**: Pizza categories (id_category, name)
- **PRODUCT**: Product catalog (id_product, name, description, image, price, type_product ENUM: 'PIZZA', 'BURGER', 'DRINK')
- **IS_PIZZA**: Pizza-to-category relationship (id_ispizza, id_product, id_category)
- **STORE**: Store information (id_store, name, id_address)
- **EMPLOYEE**: Employee data (id_employee, name, surname, nif, phone_number, role ENUM: 'COOK', 'DELIVERY_DRIVER', id_store, id_address)
- **ORDER**: Order records (id_order, date_time, order_type ENUM: 'DELIVERY', 'PICKUP', total_price, id_client, id_store, id_delivery_driver, delivery_time)
- **ORDER_PRODUCT**: Order line items junction table (id_order, id_product, quantity)

### Design Decisions

1. **Normalization**: Database normalized to 3NF to avoid data redundancy
   - Separate `PROVINCE` and `TOWN` tables to avoid duplication
   - Detailed `ADDRESS` table to handle complete address information
   - Product type handling: `type_product` ENUM field for all products (PIZZA, BURGER, DRINK)
   - Pizzas additionally reference categories through the `IS_PIZZA` junction table

2. **Relationships**:
   - 1:N between PROVINCE ↔ TOWN
   - 1:N between TOWN ↔ ADDRESS (both clients and stores have addresses)
   - 1:N between CLIENT ↔ ORDER
   - 1:N between STORE ↔ ORDER
   - 1:N between STORE ↔ EMPLOYEE
   - 1:N between CATEGORY ↔ IS_PIZZA ↔ PRODUCT (for pizzas only, via IS_PIZZA junction)
   - N:M between ORDER ↔ PRODUCT (via ORDER_PRODUCT junction table)
   - 0..1:N between EMPLOYEE ↔ ORDER (optional delivery driver)

3. **Delivery Tracking**:
   - Orders track delivery type: `order_type` ENUM (DELIVERY or PICKUP)
   - For delivery orders: `id_delivery_driver` links to a DELIVERY_DRIVER employee
   - `delivery_time` field stores the actual delivery completion timestamp
   - Can be NULL for pickup orders or pending deliveries

4. **Flexibility**:
   - Product categories are dynamic and stored separately from products
   - Employee roles (COOK or DELIVERY_DRIVER) stored as ENUM for data integrity
   - Product images stored as VARCHAR (URL/path references)
   - Address information is reusable for both clients and stores

5. **Scalability**:
   - Docker containerization for easy deployment
   - Separate stores allow multi-branch expansion
   - Adminer provides web-based database management
   - IS_PIZZA junction table allows flexible pizza categorization changes


### Accessing the E-R Diagram

Open `model/pizzeria.mwb` with MySQL Workbench to view the complete entity-relationship diagram, or view `doc/pizzeria.png` for a visual representation.

## 🔧 Environment Variables

Configuration is managed through the `.env` file in the parent directory (`S201-MySQL/.env`). 

### Setup Instructions

1. Copy the example file (from parent directory):
   ```bash
   cd ..
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
- Product images are stored as URL/path references; image files should be stored separately
- For production deployment, consider implementing API layer for frontend integration
- Review the E-R diagram to understand relationships before querying

---

**Last updated**: March 2026
