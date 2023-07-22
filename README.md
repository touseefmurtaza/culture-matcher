# Empion Culture Matcher API

The Empion Culture Matcher API is a backend application that automates headhunting and connects applicants with the best company cultures. It provides a RESTful API to manage culture types, applicants, companies, and matches. The project aims to streamline the hiring process by matching applicants with companies based on their respective culture types.

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the API](#running-the-api)
  - [API Documentation](#api-documentation)
  - [Running Tests](#running-tests)
- [Available Endpoints](#available-endpoints)

## Getting Started

Follow the instructions below to set up and run the Empion Culture Matcher API on your local machine.

### Prerequisites

Before getting started, make sure you have the following software installed on your system:

- Ruby (recommended version: 3.0.3 or higher)
- Rails (recommended version: 7.0.6 or higher)
- PostgreSQL (recommended version: 12 or higher)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/touseefmurtaza/culture-matcher-api
   cd culture-matcher-api
   ```

2. Install the required gems:

   ```bash
   bundle install
   ```

3. Set up the database:

   ```bash
   rails db:setup
   ```

### Running the API

Start the Rails server:

```bash
rails s
```

The API will be accessible at `http://localhost:3000`.

### API Documentation

The API is documented using OpenAPI (Swagger). You can access the documentation at `http://localhost:3000/api-docs`.

### Running Tests

To run the test suite:

```bash
rails test
```

## Available Endpoints

The following endpoints are available in the API:

1. `/api/v1/culture_types`: Retrieve a list of culture types.
2. `/api/v1/culture_types`: Create a new culture type.
3. `/api/v1/culture_types/:id`: Retrieve details of a specific culture type.
4. `/api/v1/culture_types/:id`: Update a specific culture type.
5. `/api/v1/culture_types/:id`: Delete a specific culture type.

6. `/api/v1/applicants`: Retrieve a list of applicants.
7. `/api/v1/applicants`: Create a new applicant.
8. `/api/v1/applicants/:id`: Retrieve details of a specific applicant.
9. `/api/v1/applicants/:id`: Update a specific applicant.
10. `/api/v1/applicants/:id`: Delete a specific applicant.

11. `/api/v1/companies`: Retrieve a list of companies.
12. `/api/v1/companies`: Create a new company.
13. `/api/v1/companies/:id`: Retrieve details of a specific company.
14. `/api/v1/companies/:id`: Update a specific company.
15. `/api/v1/companies/:id`: Delete a specific company.

16. `/api/v1/matches`: Retrieve a list of matches.
17. `/api/v1/matches`: Create a new match.
18. `/api/v1/matches/:id`: Retrieve details of a specific match.
19. `/api/v1/matches/:id`: Update a specific match.
20. `/api/v1/matches/:id`: Delete a specific match.
