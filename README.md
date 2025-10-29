# Docker WP Boilerplate

A simplified yet refined Docker Compose workflow that sets up a LEMP network of containers for local WordPress development.

## Features

*   **Web Server:** Nginx
*   **PHP:** PHP-FPM (version can be customized in `php.dockerfile`)
*   **Database:** MySQL (version can be customized in the `.env` file)
*   **Database Management:** Adminer (a lightweight database management tool)
*   **WordPress CLI:** WP-CLI included for managing WordPress core, plugins, and more.

## Prerequisites

*   [Docker](https://docs.docker.com/get-docker/)
*   [Docker Compose](https://docs.docker.com/compose/install/)

## Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/md-emran-hossain/docker-wp-boilerplate.git
    cd docker-wp-boilerplate
    ```

2.  **Configure your environment:**
    Create a `.env` file by copying the example `.env.example` file:
    ```bash
    cp .env.example .env
    ```
    Update the `.env` file with your desired MySQL credentials.

3.  **Build and start the containers:**
    ```bash
    docker-compose up -d --build
    ```
    The `--build` flag ensures that Docker images are built before the containers are started. This is important for the first time you run the command or after making changes to the Dockerfiles.

## Usage

*   **Access your WordPress site:**
    Open your web browser and navigate to `http://localhost:${APP_PORT}` (the default is `8000`).

*   **Use WP-CLI:**
    You can run any WP-CLI command from your project root. For example:
    ```bash
    docker-compose run --rm wp core version
    docker-compose run --rm wp plugin list
    ```

*   **Access the database:**
    Adminer is available at `http://localhost:${DB_ADMIN_PORT}` (the default is `8080`). You can log in using the MySQL credentials from your `.env` file. The "Server" should be `mysql`.

*   **Stop the environment:**
    ```bash
    docker-compose down
    ```

## Configuration

All environment configuration is managed through the `.env` file, which you create during the installation process. You can customize the variables within this file to change the database credentials, ports, and other settings.

### Environment Variables

The following environment variables can be set in the `.env` file:

**MySQL Settings**
*   `MYSQL_DATABASE`: The name of the WordPress database.
*   `MYSQL_USER`: The username for the WordPress database.
*   `MYSQL_PASSWORD`: The password for the WordPress database user.
*   `MYSQL_ROOT_PASSWORD`: The root password for the MySQL server.
*   `MYSQL_VERSION`: The version of MySQL to use (e.g., `5.7` or `8.0`).

**Port Configuration**
*   `APP_PORT`: The port to access the application (e.g., `8000`).
*   `DB_ADMIN_PORT`: The port to access the database admin tool (e.g., `8080`).

### Customizing PHP and Nginx

*   **PHP:** You can change the PHP version by modifying the `FROM` instruction in the `php.dockerfile`. You can also customize the PHP configuration by editing the `php/www.conf` file.
*   **Nginx:** The Nginx configuration can be customized by editing the `nginx/default.conf` file.

## Data Persistence

The MySQL database is persisted in a Docker volume named `mysql_data`. This means your data will not be lost when you stop and start the containers.