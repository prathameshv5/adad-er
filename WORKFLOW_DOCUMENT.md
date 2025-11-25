# AT-AD Platform Workflow Documentation

## 🎯 Overview
This document outlines all critical workflows in the AT-AD (Assistive Devices - Accessibility Database) platform based on the Enhanced Memory Bank reference.

## 👥 User Registration Workflows

### 1. PwD Integration Flow (via Swarajability)
```
Swarajability Registration → AT-AD Integration → Profile Sync → Account Active
```
**Steps:**
1. PwD registers on Swarajability platform (external)
2. AT-AD integrates with Swarajability for PwD data
3. PwD profile synced to AT-AD database
4. Disability mapping maintained via PwDDisability table
5. Account active for product discovery and reviews

### 2. Donor Registration Flow
```
Registration → Identity Verification → Donation Preferences → Account Active
```
**Steps:**
1. Donor creates account with personal/organization details
2. Uploads ID proof document
3. Sets donation preferences and type
4. Account active for product pledging

### 3. Employer Registration Flow
```
Registration → Document Upload → Admin Review → Approval/Rejection
```
**Steps:**
1. Employer submits organization details and contact person
2. Uploads registration document
3. Profile status set to "pending"
4. Admin reviews credentials and organization legitimacy
5. Admin approves/rejects with reasons
6. Approved employers can access platform features

### 4. Vendor Registration Flow
```
Registration → Business License Upload → GST Verification → Admin Review → Approval/Rejection
```
**Steps:**
1. Vendor submits company details and GST number
2. Uploads business license document
3. Profile status set to "pending"
4. Admin reviews credentials
5. Admin approves/rejects with reasons
6. Approved vendors can list products

### 5. Caregiver Registration Flow
```
Registration → PwD Linking/Creation → Swarajability Sync → Relationship Verification → Account Active
```
**Steps:**
1. Caregiver creates account on AT-AD platform
2. **Option A - Link Existing PwD**: Links to PwD from Swarajability via Aadhar
3. **Option B - Create New PwD**: Enters complete PwD information
4. If new PwD, data synced to Swarajability platform
5. Specifies relationship type (guardian, family, professional)
6. Account active for proxy operations and PwD support

## 📦 Product Management Workflows

### 1. Product Listing Workflow
```
Vendor Creates Product → Disability Mapping → Admin Review → Approval/Rejection → Live Product
```
**Steps:**
1. Vendor creates product with specifications
2. Maps product to disability subcategories
3. Uploads media (images, videos, documents)
4. Product listing_status set to "draft"
5. Vendor submits for review (listing_status: "under_review")
6. Admin reviews product details
7. Admin approves/rejects (listing_status: "approved"/"rejected")
8. Approved products: website_status can be set "active"/"inactive"

### 2. Product Edit/Versioning Workflow
```
Vendor Edits Product → New Version Created → Admin Review → Approval → Old Version Deleted
```
**Steps:**
1. Vendor attempts to edit existing approved product
2. System creates new version with parent_product_id link
3. Increments version_number, sets is_current_version=false
4. New version listing_status set to "under_review"
5. Admin reviews and approves/rejects new version
6. If approved: New version becomes current (listing_status: "approved"), old version deleted
7. If rejected: Old version remains current, new version deleted

## 💬 Review & Moderation Workflows

### 1. Product Review Workflow
```
PwD Submits Review → AI Moderation → Admin Review (if flagged) → Approval/Rejection → Public Visibility
```
**Steps:**
1. PwD writes review with 1-5 rating
2. AI moderation scans content automatically
3. If flagged, admin reviews manually
4. Status progression: pending → ai_flagged → approved/rejected
5. Approved reviews become public

### 2. Review Reply Workflow
```
Vendor/Admin Reply → Content Moderation → Admin Approval → Public Visibility
```
**Steps:**
1. Vendor or admin replies to review
2. Content goes through moderation
3. Admin approves/rejects reply
4. Approved replies appear under reviews

## 💰 Donor Pledge Workflow

### 1. Pledge Creation Flow
```
Donor Browses Products → Creates Pledge → Admin Visibility → Status Management → Fulfillment Tracking
```
**Steps:**
1. Donor discovers products needing support
2. Creates pledge with quantity and amount
3. Adds optional pledge note
4. Pledge status set to "pending"
5. Admin sees pledge in dashboard
6. Admin updates status: pending → approved → fulfilled/cancelled
7. Admin adds fulfillment notes
8. Donor receives status notifications

### 2. Pledge Status Management
```
Pending → Admin Review → Approved/Cancelled → Fulfillment → Completed
```
**Status Values:**
- **pending**: Initial pledge state
- **approved**: Admin validates pledge
- **cancelled**: Admin rejects pledge
- **fulfilled**: Pledge completed successfully

## 🔔 Notification Workflows

### 1. System Notification Flow
```
Trigger Event → Notification Creation → User Targeting → Delivery → Read Status Tracking
```
**Events Triggering Notifications:**
- Product approval/rejection
- Review moderation results
- Pledge status updates
- New product matches for PwD interests
- Admin announcements

### 2. Role-Based Notifications
- **PwD**: Product matches, review replies, story updates
- **Vendor**: Product status, review notifications, pledge updates
- **Donor**: Pledge status changes, impact reports
- **Admin**: Pending approvals, flagged content

## 🆘 Help & Support Workflows

### 1. Help Content Management
```
Admin Creates Content → Role Assignment → Category Organization → Publication
```
**Steps:**
1. Admin creates help articles or FAQs
2. Assigns to specific user roles
3. Organizes by help categories
4. Sets status to active/inactive

### 2. User Help Access Flow
```
User Issue → Help Category Browse → Article Access → Content Consumption
```
**Process:**
1. User identifies issue or question
2. Browses relevant help categories
3. Accesses role-specific articles or FAQs
4. Reads content for resolution

## 📖 Story & Community Workflows

### 1. Story Creation Flow
```
Admin Creates Story → Content Review → Publication → Community Engagement → Like Tracking
```
**Steps:**
1. Admin writes inspirational story
2. Adds image and content
3. Sets status to active
4. PwD users can like stories
5. Engagement tracked via StoryLike

## 🔍 AI Moderation Workflow

### 1. Automated Review Content Screening (PwD Reviews)
```
PwD Review Submission → AI Analysis → Confidence Scoring → Flag Decision → Admin Queue (if needed)
```
**Process:**
1. AI scans PwD review content automatically
2. Generates confidence score (0-1)
3. Flags inappropriate/suspicious reviews based on thresholds
4. Flagged reviews queued for admin review
5. Admin makes final moderation decision on flagged reviews

## 🎛️ Admin Management Workflows

### 1. User Approval Workflow
```
Registration Request → Document Verification → Background Check → Approval Decision → Status Update
```
**Admin Reviews:**
- Vendor business licenses and GST verification
- Employer registration documents
- Profile completeness and authenticity

### 2. Content Moderation Workflow
```
Flagged Content → Admin Review → Decision → Status Update → User Notification
```
**Admin Actions:**
- Approve/reject products
- Moderate reviews and replies
- Manage pledge statuses
- Update help content

## 📊 Status Progression Summary

### Product Status System
**Listing Status**: `draft → under_review → approved/rejected`
**Website Status**: `active/inactive` (for approved products)

### Profile Status (Vendor/Employer)
`pending → approved/rejected`

### Review Moderation
`pending → ai_flagged → approved/rejected`

### Pledge Status
`pending → approved/cancelled → fulfilled`

### Help Content
`active/inactive`

---

*This workflow document serves as the operational guide for all AT-AD platform processes, ensuring consistent user experiences and proper system functionality.*