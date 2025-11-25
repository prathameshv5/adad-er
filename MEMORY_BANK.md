# AT-AD (Assistive Technology - Accessibility Database) Memory Bank

## Project Overview
AT-AD is a comprehensive platform connecting Persons with Disabilities (PwD) with assistive technology vendors, caregivers, donors, and employers. The system facilitates product discovery, reviews, support, and community engagement.

## Core User Roles
- **PwD (Person with Disability)**: Primary beneficiaries seeking assistive technology
- **Vendor**: Companies/individuals selling assistive technology products
- **Caregiver**: Support persons linked to PwD (1:1 relationship)
- **Admin**: Platform administrators with moderation capabilities
- **Donor**: Individuals/organizations providing financial support
- **Employer**: Organizations seeking to hire PwD

## Key System Components

### 1. User Management & Authentication
- **User**: Central entity with role-based access (role_id FK)
- **Role**: Defines user permissions and access levels
- **User Details**: Role-specific extended profiles (VendorDetails, PwDDetails, etc.)

### 2. Disability & Product Categorization
- **Disability**: Main disability categories
- **DisabilitySubCategory**: Granular disability classifications
- **PwDDisability**: Links PwD to their specific disabilities
- **Product**: Assistive technology items with vendor ownership
- **ProductDisabilitySubCategory**: Maps products to relevant disability subcategories

### 3. Product Management & Versioning
- **Product Versioning**: parent_product_id enables version tracking
- **ProductMedia**: Stores images, videos, documents for products
- **Product Status Flow**: pending → approved/rejected → live → archived
- **Admin Approval**: All products require admin approval (approved_by_admin_id)

### 4. User Interactions & Engagement
- **ProductInterest**: PwD can express interest in products
- **ProductReview**: PwD can rate and review products (1-5 rating)
- **ReviewReply**: Vendors/admins can respond to reviews
- **StoryLike**: PwD can like inspirational stories

### 5. AI-Powered Moderation System
- **AIModeration**: Automated content screening for reviews
- **Moderation Flow**: AI screening → admin review → approval/rejection
- **Confidence Scoring**: AI provides confidence levels for moderation decisions

### 6. Help & Support System
- **HelpCategory**: Organizes support content
- **HelpArticle**: Role-specific help documentation
- **FAQ**: Frequently asked questions by role
- **HelpAction**: Tracks user engagement with help content (view, helpful, not_helpful, request_support)

### 7. Communication & Notifications
- **Notification**: System-wide notification delivery
- **Related Entity Tracking**: Links notifications to specific entities (products, reviews, etc.)

### 8. Content Management
- **Story**: Admin-created inspirational content
- **StoryLike**: Community engagement tracking

## Critical Business Rules

### User Registration & Verification
- PwD must provide UDID (Unique Disability ID) documentation
- Vendors require business license and GST verification
- All vendor profiles need admin approval before activation

### Product Lifecycle
1. Vendor creates product (status: pending)
2. Admin reviews and approves/rejects
3. Approved products go live
4. Version control maintains product history

### Review & Moderation Workflow
1. PwD submits review
2. AI moderation scans content
3. Flagged content requires admin review
4. Approved reviews become public
5. Vendors can reply to reviews (also moderated)

### Caregiver Relationship
- One-to-one relationship between PwD and Caregiver
- Caregiver linked via pwd_id foreign key
- Enables support person access to PwD account

## Data Relationships Summary

### Primary Relationships
- User → Role (many-to-one)
- User → UserDetails (one-to-one for each role type)
- PwD → Caregiver (one-to-one)
- Vendor → Product (one-to-many)
- Product → ProductReview (one-to-many)
- ProductReview → ReviewReply (one-to-many)

### Approval Chains
- VendorDetails.approved_by_admin_id → AdminDetails
- Product.approved_by_admin_id → AdminDetails
- ProductReview.moderated_by_admin_id → AdminDetails
- ReviewReply.moderated_by_admin_id → AdminDetails

### Content Categorization
- Disability → DisabilitySubCategory (one-to-many)
- Product → ProductDisabilitySubCategory → DisabilitySubCategory (many-to-many)
- PwD → PwDDisability → Disability (many-to-many)

## Status Enumerations

### Product Status
- pending, approved, rejected, live, archived

### Profile Status (Vendor/Employer)
- pending, approved, rejected

### Review Status
- pending, ai_flagged, approved, rejected

### Help Content Status
- active, inactive

### Notification Status
- read, unread (is_read boolean)

## Key Features & Capabilities

### For PwD
- Browse products by disability category
- Express interest in products
- Write and read reviews
- Access role-specific help content
- Receive personalized notifications

### For Vendors
- List and manage products
- Respond to customer reviews
- Track product performance
- Access vendor-specific support

### For Admins
- Approve vendor registrations
- Moderate product listings
- Review and approve content
- Create help articles and FAQs
- Manage system stories

### For Caregivers
- Support linked PwD account
- Access relevant help resources

### For Donors/Employers
- Access platform for their specific needs
- Receive targeted notifications
- Access role-appropriate help content

## Technical Considerations

### Scalability
- Product versioning supports iterative improvements
- Modular user detail tables enable role-specific scaling
- Notification system supports bulk messaging

### Security
- Password hashing for authentication
- Role-based access control
- Document verification for sensitive roles
- AI-powered content moderation

### Data Integrity
- Foreign key constraints maintain referential integrity
- Status fields control workflow progression
- Timestamp tracking for audit trails

## Integration Points
- AI moderation service integration
- Document verification systems
- Notification delivery systems
- Media storage for product assets
- Payment processing (implied for donor functionality)