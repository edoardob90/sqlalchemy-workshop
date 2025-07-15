# Marketplace SQLAlchemy Workshop - Task Runner
# Use 'just --list' to see all available commands

# Default recipe to display help
default:
    @just --list

# Run the marketplace server
run:
    uv run python marketsvc/server.py

# Get all customers
customers:
    curl http://localhost:9090/api/customers

# Get customer orders (specify customer_id, default=1)
orders customer_id="1":
    curl http://localhost:9090/api/orders/{{customer_id}}

# Get order total cost (specify order_id, default=1)
order-total order_id="1":
    curl http://localhost:9090/api/order_total/{{order_id}}

# Get orders between dates
orders-between before="2024-03-22" after="2024-03-14":
    curl "http://localhost:9090/api/orders_between_dates/{{before}}/{{after}}"

# Create a new order
new-order:
    curl -H "Content-Type: application/json" -d '{"customer_id":1,"items":[{"id":2,"quantity":4},{"id":3,"quantity":6}]}' http://localhost:9090/api/add_new_order

# Create a custom new order (specify customer_id and items as JSON string)
new-order-custom customer_id items:
    curl -H "Content-Type: application/json" -d '{"customer_id":{{customer_id}},"items":{{items}}}' http://localhost:9090/api/add_new_order

# Install dependencies using uv
install:
    uv sync

# Install development dependencies
install-dev:
    uv sync --dev

# Run linting with ruff
lint:
    uv run ruff check .

# Format code with ruff
format:
    uv run ruff format .

# Run both linting and formatting
check: lint format

# Clean up Python cache files
clean:
    find . -type f -name "*.pyc" -delete
    find . -type d -name "__pycache__" -delete

# Show API endpoints (requires server to be running)
endpoints:
    @echo "Available API endpoints:"
    @echo "  GET  http://localhost:9090/"
    @echo "  GET  http://localhost:9090/api/customers"
    @echo "  GET  http://localhost:9090/api/orders/{customer_id}"
    @echo "  GET  http://localhost:9090/api/order_total/{order_id}"
    @echo "  GET  http://localhost:9090/api/orders_between_dates/{before}/{after}"
    @echo "  POST http://localhost:9090/api/add_new_order"

# Test all endpoints (requires server to be running in another terminal)
test-all:
    @echo "Testing all endpoints..."
    @echo "\n1. Testing root endpoint:"
    -curl -s http://localhost:9090/
    @echo "\n\n2. Testing customers:"
    -curl -s http://localhost:9090/api/customers
    @echo "\n\n3. Testing customer orders:"
    -curl -s http://localhost:9090/api/orders/1
    @echo "\n\n4. Testing order total:"
    -curl -s http://localhost:9090/api/order_total/1
    @echo "\n\n5. Testing orders between dates:"
    -curl -s "http://localhost:9090/api/orders_between_dates/2024-03-22/2024-03-14"
    @echo "\n\n6. Testing new order creation:"
    -curl -s -H "Content-Type: application/json" -d '{"customer_id":1,"items":[{"id":2,"quantity":4},{"id":3,"quantity":6}]}' http://localhost:9090/api/add_new_order
    @echo "\n\nAll tests completed!"
