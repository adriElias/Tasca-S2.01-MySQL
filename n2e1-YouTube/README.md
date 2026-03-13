# YouTube Simplified DB

**Description**: Relational database for a simplified version of YouTube, including user management, video publishing, channels, subscriptions, reactions, playlists, and comments.

## 📌 Exercise Statement

Design a simplified YouTube-like database with the following requirements:

**User Management**:
- Contains: ID, Email, Password, Nickname, Birthdate, Gender, Postal Code
- Each user linked to a Country
- Email must be unique
- Gender options: MALE, FEMALE, NOT_BINARY, I_PREFER_NOT_TO_SAY_IT

**Videos**:
- Contains: ID, Title, Description, Size, File Name, Duration, Thumbnail URL, Views, Likes, Dislikes
- Status: PRIVATE, PUBLIC, or HIDDEN
- Published date/time tracked
- Each video belongs to one user (video creator)
- Videos can have multiple hashtags (N:M relationship)

**Hashtags**:
- Contains: ID, Name
- Multiple videos can have the same hashtag

**Channels**:
- Contains: ID, Name, Description, Creation Date
- Each channel belongs to one user
- A user can create only one channel (implicitly, through relationships)

**Subscriptions**:
- Users can subscribe to channels
- Track: Subscribing user, Target channel, Subscription date
- N:M relationship between USER and CHANNEL

**Video Reactions**:
- Users can give ONE like OR dislike per video (not both)
- Track: Video, User, Reaction type (LIKE or DISLIKE), Reaction date
- Only one reaction allowed per user per video

**Playlists**:
- Contains: ID, Name, Creation Date, Status (PRIVATE or PUBLIC)
- Each playlist belongs to one user
- Playlists contain multiple videos (N:M relationship)
- Videos added to playlist are tracked with date

**Comments**:
- Contains: ID, Comment text, Comment date
- Each comment belongs to one user and one video
- Multiple comments per video allowed

**Comment Reactions**:
- Users can give ONE like OR dislike per comment
- Track: User, Comment, Reaction type (LIKE or DISLIKE), Reaction date
- Similar structure to video reactions

## ✨ Features

- ✅ Complete user authentication system with profile data
- ✅ Video management with multiple states (public, private, hidden)
- ✅ Dynamic hashtag system with multiple videos per hashtag
- ✅ Channel management with user subscriptions
- ✅ Flexible subscription system with subscription date tracking
- ✅ Reaction system for videos (likes/dislikes with mutual exclusion)
- ✅ Playlist creation and management
- ✅ Comment system with nested reactions
- ✅ Comment reaction system (likes/dislikes)
- ✅ Complete audit trail with timestamps
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
   cd /path/to/S201-MySQL/n2e1-YouTube
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
   docker exec mysql-local mysql -u $MYSQL_USER -p'$MYSQL_PASSWORD' $MYSQL_DATABASE < n2e1-YouTube/sql/youtube.sql
   ```
   Or using values from your `.env` file:
   ```bash
   docker exec mysql-local mysql -u your_username -p'your_password' your_database < n2e1-YouTube/sql/youtube.sql
   ```

5. **Load demonstration data**
   ```bash
   docker exec mysql-local mysql -u $MYSQL_USER -p'$MYSQL_PASSWORD' $MYSQL_DATABASE < n2e1-YouTube/sql/inserts_youtube.sql
   ```
   Or using values from your `.env` file:
   ```bash
   docker exec mysql-local mysql -u your_username -p'your_password' your_database < n2e1-YouTube/sql/inserts_youtube.sql
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
   mysql -u root -p < n2e1-YouTube/sql/youtube.sql
   ```

2. **Load the data**
   ```bash
   mysql -u root -p your_database < n2e1-YouTube/sql/inserts_youtube.sql
   ```

## 📁 Project Structure

```text
n2e1-YouTube/
├── README.md                          # This file
├── model/
│   ├── youtube.mwb                    # MySQL Workbench model
│   └── youtube.mwb.bak                # Backup of the model
├── doc/
│   └── [Entity-Relationship Diagrams]
└── sql/
    ├── youtube.sql                    # Schema and table creation
    └── inserts_youtube.sql            # Demonstration data
```

## 🧩 Diagrams and Technical Decision Justification

### Data Model

The database is organized with the following main tables:

- **COUNTRY**: Country information (id_country, name)
- **USER**: User account data (id_user, email, password, nickname, birthdate, gender, zip_code, id_country)
- **VIDEO**: Video records (id_video, title, description, size, file_name, duration, thumbnail_url, views_number, likes_number, dislikes_number, status, published_at, id_user)
- **HASHTAG**: Hashtag catalog (id_hashtag, name)
- **VIDEO_HASHTAG**: Video-to-hashtag relationships (id_video, id_hashtag, count) - N:M junction
- **CHANNEL**: Channel information (id_channel, name, description, date_at, id_user)
- **SUBSCRIPTION**: Channel subscriptions (id_user, id_channel, date_subscription) - N:M junction
- **VIDEO_USER_REACTION**: Video reactions (id_video, id_user, reaction ENUM: LIKE/DISLIKE, reaction_date)
- **PLAYLIST**: Playlist information (id_playlist, name, created_at, status, id_user)
- **PLAYLIST_VIDEO**: Playlist contents (id_playlist, id_video, added_at) - N:M junction
- **COMMENT**: Video comments (id_comment, comment, date_comment, id_user, id_video)
- **REACTION_COMMENT**: Comment reactions (id_user, id_comment, reaction ENUM: LIKE/DISLIKE, date_reaction_comment)

### Design Decisions

1. **Normalization**: Database normalized to 3NF to avoid data redundancy
   - Separate `COUNTRY` table to avoid country name duplication
   - Junction tables for N:M relationships: VIDEO_HASHTAG, SUBSCRIPTION, PLAYLIST_VIDEO
   - User authentication fields stored securely (password field exists but should be hashed in practice)

2. **Relationships**:
   - 1:N between COUNTRY ↔ USER
   - 1:N between USER ↔ VIDEO (one user, many videos)
   - 1:N between USER ↔ CHANNEL (typically one channel per user)
   - N:M between USER ↔ CHANNEL (via SUBSCRIPTION for subscriptions)
   - N:M between VIDEO ↔ HASHTAG (via VIDEO_HASHTAG junction)
   - N:M between USER ↔ VIDEO (via VIDEO_USER_REACTION for reactions)
   - N:M between USER ↔ COMMENT (via COMMENT creation)
   - N:M between VIDEO ↔ COMMENT (via COMMENT creation)
   - N:M between USER ↔ COMMENT (via REACTION_COMMENT for reactions)
   - N:M between USER ↔ PLAYLIST (via PLAYLIST creation)
   - N:M between PLAYLIST ↔ VIDEO (via PLAYLIST_VIDEO junction)

3. **Reaction Management**:
   - **Video Reactions**: PRIMARY KEY (id_video, id_user) ensures one user can only react once per video
   - **Comment Reactions**: PRIMARY KEY (id_user, id_comment) ensures one user can only react once per comment
   - Reaction type stored as ENUM (LIKE or DISLIKE) - mutually exclusive by application logic
   - Timestamps tracked for all reactions

4. **Video Status Control**:
   - Status ENUM allows three states: PRIVATE, PUBLIC, HIDDEN
   - Provides granular access control for video visibility
   - Supports content filtering in UI/API layer

5. **Audit Trail**:
   - Comprehensive timestamp tracking: published_at, date_subscription, reaction_date, etc.
   - CURRENT_TIMESTAMP defaults ensure automatic recording
   - Allows analysis of user behavior and trends

6. **Flexibility & Scalability**:
   - Gender ENUM provides inclusive options while maintaining data integrity
   - Hashtag system allows dynamic tagging without predefined taxonomy
   - CASCADE delete policies maintain referential integrity when users/videos are deleted
   - Playlist system supports user curation independent of video ownership
   - Comment system supports community engagement and moderation

### Accessing the E-R Diagram

Open `model/youtube.mwb` with MySQL Workbench to view the complete entity-relationship diagram, or check `doc/` for visual representations.

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
- **Password Hashing**: In production, passwords should be hashed (bcrypt, scrypt, etc.), not stored as plain text.
- **Version Control**: The `.gitignore` file prevents `.env` from being committed automatically.

## 📝 Additional Notes

- SQL scripts in `sql/` are idempotent (can be executed multiple times)
- The `mysql_data` volume persists data between Docker restarts
- Adminer provides a graphical interface to query and modify the database
- Thumbnail URLs are stored as VARCHAR; actual image files should be stored separately (CDN recommended)
- Video file names reference actual files; file storage should be handled separately (cloud storage recommended)
- For production deployment, consider:
  - Implementing an API layer for frontend integration
  - Using proper password hashing and authentication mechanisms
  - Adding indexing on frequently queried fields (email, nickname, etc.)
  - Implementing caching for popular videos/channels
  - Adding soft deletes for user privacy compliance
- Review the E-R diagram to understand relationships before querying

## 🔍 Key Constraints & Validations

- **Unique Email**: Each user must have a unique email address
- **Reaction Exclusivity**: A user can only LIKE or DISLIKE a video once (enforced by PRIMARY KEY)
- **Comment Reactions**: Similarly, a user can only LIKE or DISLIKE a comment once
- **Cascading Deletes**: Deleting a user deletes their videos, channels, comments, and reactions
- **Video Status**: Enforced ENUM ensures only valid states (PRIVATE, PUBLIC, HIDDEN)
- **Playlist Status**: Enforced ENUM ensures valid states (PRIVATE, PUBLIC, HIDDEN)

---

**Last updated**: March 2026
