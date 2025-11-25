# Database Schema Architecture

## Core Entity Groups

### User Management System
- **User**: Central user table with role-based differentiation (vendor, admin, pwd, caregiver, donor, employer)
- **Role-specific Details**: Separate tables for each user type with specialized fields
- **Authentication**: Password hash and status management

### Disability & Product Ecosystem
- **Disability**: Main disability categories
- **DisabilitySubCategory**: Granular disability classifications
- **Product**: Vendor-listed assistive technology products
- **ProductDisabilitySubCategory**: Many-to-many mapping between products and disability subcategories
- **ProductMedia**: Product images, videos, and documentation

### Interaction & Engagement
- **ProductInterest**: PwD interest tracking in products
- **ProductReview**: Rating and review system with moderation
- **ReviewReply**: Vendor and admin responses to reviews
- **Notification**: System-wide notification management

### Support Systems
- **HelpCategory**: Organized help content by user type
- **HelpArticle**: Detailed help documentation
- **HelpAction**: User interaction tracking with help content
- **Story**: Admin-created inspirational content
- **StoryLike**: PwD engagement with stories

## Key Relationships
- One-to-one: User to role-specific details
- One-to-many: Disability to subcategories, Product to media/reviews
- Many-to-many: PwD to disabilities, Products to disability subcategories
- Hierarchical: Help categories to articles, Reviews to replies