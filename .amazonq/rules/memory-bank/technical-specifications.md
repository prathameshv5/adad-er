# Technical Specifications

## Data Types & Constraints
- **Primary Keys**: Auto-incrementing integers for all entities
- **Foreign Keys**: Referential integrity maintained across all relationships
- **Timestamps**: Created_at and updated_at for audit trails
- **Status Fields**: Enumerated values for workflow states
- **Document Storage**: URL references to external file storage

## Key Fields & Validations
- **UDID**: Unique Disability ID for PwD verification
- **GST/PAN**: Business validation for vendor registration
- **Email/Phone**: Unique constraints for user identification
- **Ratings**: 1-5 scale for product reviews
- **Percentages**: Disability percentage (0-100)

## Security Considerations
- Password hashing for authentication
- Role-based access control
- Document verification workflows
- Content moderation for reviews and stories
- Admin approval gates for sensitive operations

## Scalability Features
- Normalized design for efficient queries
- Indexed foreign keys for performance
- Separate media storage references
- Notification batching capabilities
- Help content categorization for quick access

## Integration Points
- External document storage systems
- Email/SMS notification services
- Payment gateways (for donations)
- Video hosting platforms (demo videos)
- Authentication providers