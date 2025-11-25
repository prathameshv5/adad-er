# AT-AD Enhanced Memory Bank

## 🎯 Project Identity
**AT-AD (Assistive Technology - Accessibility Database)** is a comprehensive platform connecting Persons with Disabilities (PwD) with assistive technology vendors, caregivers, donors, and employers through product discovery, reviews, support, and community engagement.

## 👥 Core Stakeholders

### Primary Users
- **PwD (Person with Disability)**: Primary beneficiaries seeking assistive technology
- **Vendor**: Companies/individuals selling assistive technology products  
- **Caregiver**: Support persons linked to PwD (1:1 relationship)
- **Admin**: Platform administrators with moderation capabilities
- **Donor**: Individuals/organizations providing financial support
- **Employer**: Organizations seeking to hire PwD

### User Relationships
- **PwD ↔ Caregiver**: One-to-one relationship via pwd_id
- **Vendor → Admin**: Approval required for profile activation
- **Product → Admin**: All products need admin approval
- **Review → Admin**: Content moderation workflow

## 🏗️ System Architecture

### Core Entity Groups

#### 1. User Management System
```
User (Central Hub)
├── Role (role-based access)
├── VendorDetails (business info, GST, license)
├── PwDDetails (UDID, disability %, support needs)
├── CaregiverDetails (relationship to PwD)
├── AdminDetails (access level, department)
├── DonorDetails (donation preferences)
└── EmployerDetails (organization info)
```

#### 2. Disability & Product Ecosystem
```
Disability
├── DisabilitySubCategory (granular classifications)
├── PwDDisability (PwD-to-disability mapping)
└── ProductDisabilitySubCategory (product-to-subcategory mapping)

Product
├── ProductMedia (images, videos, docs)
├── ProductInterest (PwD interest tracking)
├── ProductReview (rating & feedback)
└── ReviewReply (vendor/admin responses)
```

#### 3. Support & Community Systems
```
Help System
├── HelpCategory (organized by user type)
├── HelpArticle (detailed documentation)
├── FAQ (role-specific Q&A)
└── HelpAction (interaction tracking)

Community Features
├── Story (admin-created content)
├── StoryLike (PwD engagement)
└── Notification (system-wide messaging)
```

## 🔄 Critical Business Workflows

### User Registration Flow
1. **PwD Registration**: UDID verification → Profile creation → Disability mapping
2. **Vendor Registration**: Business license → GST verification → Admin approval
3. **Caregiver Setup**: Link to PwD → Relationship establishment

### Product Management Flow
1. **Vendor**: Create product → Map to disability subcategories → Submit for review
2. **Admin**: Review product → Approve/reject → Product goes live
3. **Version Control**: parent_product_id enables product iteration tracking

### Review & Moderation Flow
1. **PwD**: Submit review → AI moderation scan → Admin review (if flagged)
2. **Vendor/Admin**: Reply to review → Moderation → Public visibility
3. **Status Progression**: pending → ai_flagged → approved/rejected

### AI Moderation System
- **AIModeration**: Automated content screening with confidence scoring
- **Workflow**: AI scan → Flag suspicious content → Admin review → Final decision
- **Integration**: Links to ProductReview for comprehensive moderation

## 📊 Key Data Relationships

### Primary Relationships
- **User → Role**: Many-to-one (role-based access control)
- **User → UserDetails**: One-to-one for each role type
- **Vendor → Product**: One-to-many (vendor product catalog)
- **Product → Review**: One-to-many (product feedback system)
- **Review → Reply**: One-to-many (conversation threads)

### Approval Chains
- **VendorDetails.approved_by_admin_id → AdminDetails**
- **Product.approved_by_admin_id → AdminDetails**
- **ProductReview.moderated_by_admin_id → AdminDetails**

### Content Categorization
- **Disability → DisabilitySubCategory**: One-to-many hierarchy
- **Product ↔ DisabilitySubCategory**: Many-to-many via ProductDisabilitySubCategory
- **PwD ↔ Disability**: Many-to-many via PwDDisability

## 🎛️ Status Management

### Product Lifecycle
`pending → approved/rejected → live → archived`

### Profile Status (Vendor/Employer)
`pending → approved/rejected`

### Review Moderation
`pending → ai_flagged → approved/rejected`

### Help Content
`active/inactive`

## 🔧 Technical Specifications

### Data Types & Constraints
- **Primary Keys**: Auto-incrementing integers
- **Foreign Keys**: Referential integrity maintained
- **Timestamps**: created_at, updated_at for audit trails
- **Status Fields**: Enumerated workflow states
- **Ratings**: 1-5 scale validation
- **Percentages**: 0-100 range for disability levels

### Security Features
- **Password Hashing**: Secure authentication
- **Role-Based Access**: Granular permissions
- **Document Verification**: UDID, business licenses
- **Content Moderation**: AI + human review
- **Admin Gates**: Approval workflows for sensitive operations

### Scalability Design
- **Normalized Structure**: Efficient query performance
- **Indexed Foreign Keys**: Optimized relationships
- **Media References**: External storage integration
- **Notification Batching**: Bulk message delivery
- **Version Control**: Product iteration tracking

## 🎯 Primary Use Cases

### PwD Journey
1. **Discovery**: Browse products by disability subcategory
2. **Interest**: Express interest in relevant products
3. **Engagement**: Write reviews, read stories
4. **Support**: Access role-specific help content

### Vendor Operations
1. **Catalog Management**: List products with disability mapping
2. **Customer Interaction**: Respond to reviews and inquiries
3. **Analytics**: Track product interest and performance
4. **Compliance**: Maintain business verification status

### Admin Functions
1. **User Management**: Approve vendor/employer registrations
2. **Content Moderation**: Review products, reviews, replies
3. **Community Building**: Create and manage stories
4. **Support**: Maintain help articles and FAQs

### Caregiver Support
1. **Proxy Operations**: Assist PwD with platform navigation
2. **Product Research**: Help with selection and evaluation
3. **Communication**: Interface with vendors and support

## 🔗 Integration Points

### External Systems
- **Document Storage**: Business licenses, UDID verification
- **Notification Services**: Email/SMS delivery
- **Payment Gateways**: Donation processing
- **Media Hosting**: Product videos and images
- **AI Services**: Content moderation and analysis

### API Considerations
- **Authentication**: Role-based token management
- **Rate Limiting**: Prevent abuse and ensure performance
- **Data Validation**: Input sanitization and verification
- **Audit Logging**: Track all critical operations

## 📈 Success Metrics

### Platform Health
- **User Registration**: Growth across all user types
- **Product Catalog**: Active listings and approval rates
- **Engagement**: Review submissions and story interactions
- **Support Effectiveness**: Help article usage and feedback

### Quality Indicators
- **Moderation Accuracy**: AI vs human review alignment
- **User Satisfaction**: Review ratings and platform feedback
- **Vendor Success**: Product interest and conversion rates
- **Community Growth**: Story engagement and user interactions

## 🚀 Future Considerations

### Scalability Enhancements
- **Microservices**: Break down monolithic structure
- **Caching**: Redis for frequently accessed data
- **CDN**: Global content delivery for media
- **Search**: Elasticsearch for advanced product discovery

### Feature Extensions
- **Machine Learning**: Personalized product recommendations
- **Real-time Chat**: Direct vendor-PwD communication
- **Mobile Apps**: Native iOS/Android applications
- **Analytics Dashboard**: Comprehensive reporting for all stakeholders

---

*This Memory Bank serves as the definitive reference for the AT-AD platform, encompassing all critical aspects from database design to business logic and future roadmap.*