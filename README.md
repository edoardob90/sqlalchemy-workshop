# SQLAlchemy Workshop

## No More Raw SQL: SQLAlchemy, ORMs and asyncio

This repository contains the code for the Marketplace service demo to follow along the **No More Raw SQL: SQLAlchemy, ORMs and asyncio workshop**.

**Workshop instructions can be found [here](https://aelsayed95.github.io/sqlalchemy-wkshop/)**

### How to run this service?

#### Prerequisites

1. Install [uv](https://docs.astral.sh/uv/) for Python package management
2. Install [just](https://github.com/casey/just) for task running:
   - macOS: `brew install just`
   - Linux: `cargo install just` or download from releases
   - Windows: `scoop install just` or `cargo install just`

#### Quick Start

1. Install dependencies using uv:

    ```sh
    just install
    ```

2. Run the service:

    ```sh
    just run
    ```

3. In a new terminal window, test the API:

    ```sh
    # Get all customers
    just customers
    
    # Get orders for customer 1
    just orders
    
    # Get orders for a specific customer
    just orders 2
    
    # Get order total
    just order-total 1
    
    # Create a new order
    just new-order
    
    # Test all endpoints at once
    just test-all
    ```

#### Available Commands

Run `just` or `just --list` to see all available commands:

- `just run` - Start the marketplace server
- `just customers` - Get all customers
- `just orders [customer_id]` - Get customer orders (default customer_id=1)
- `just order-total [order_id]` - Get order total cost (default order_id=1)
- `just orders-between [before] [after]` - Get orders between dates
- `just new-order` - Create a new order with default values
- `just new-order-custom <customer_id> <items_json>` - Create a custom order
- `just test-all` - Test all API endpoints
- `just endpoints` - Show available API endpoints
- `just install` - Install dependencies
- `just lint` - Run code linting
- `just format` - Format code
- `just clean` - Clean up Python cache files

#### Legacy Method (still works)

If you prefer the old approach:

1. Create a python virtual environment and activate it:

    ```sh
    python3.12 -m venv ./venv
    source ./venv/bin/activate
    ```

2. Install your service dependencies:

    ```sh
    python3.12 -m pip install -r requirements.txt
    ```

3. Run the service:

    ```sh
    ./run.sh run
    ```

4. Test the API:

    ```sh
    ./run.sh customers
    ```
