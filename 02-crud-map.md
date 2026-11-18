# ParSuFix CRUD Map

**Project:** ParSuFix — Partido State University Facility Fix  
**Database:** `campusfix_db`  
**Source:** Current `campusfix_db` SQL structure export

## 1. Purpose and role key

This CRUD map connects each database table to the pages that use it and identifies which role may create, read, update, or delete its records.

The current SQL export contains **16 physical tables**: 9 ParSuFix application tables and 7 Laravel framework/support tables. This document covers all 16 tables, including the framework tables that do not have ordinary user-facing CRUD pages.

| Role label | Meaning |
|---|---|
| **Reporter** | Student, Teaching Personnel, or Campus Support Personnel |
| **Admin** | Admin account. Admins review reports, assign maintenance work, verify repairs, and manage user accounts. |
| **Maintenance** | Maintenance Personnel assigned to repair tasks |
| **System** | Laravel/application background processes, not a normal signed-in user |
| **Developer/DB administrator** | Person responsible for database setup and maintenance outside the normal app screens |

**Legend:** C = Create, R = Read, U = Update, D = Delete, — = no action in the app. “Own” means the signed-in user’s own record or reports; “assigned” means tasks assigned to that maintenance account.

## 2. CRUD map for all database tables

| Table | C | R | U | D | Pages / screens | Who and reason |
|---|---|---|---|---|---|---|
| `users` | ✓ | ✓ | ✓ | — | Login; user list; add/edit user; account details | **Admin:** C/R/U for user accounts. **Account holder:** R own account. Accounts should be deactivated through `account_status` instead of physically deleted so report and assignment history remains connected. |
| `maintenance_staff` | ✓ | ✓ | ✓ | — | Manage maintenance personnel; maintenance profile; assignment form | **Admin:** C/R/U maintenance personnel records. **Maintenance:** R own staff profile. Do not physically delete a staff record because old assignments refer to it; update the linked account or availability status instead. |
| `locations` | — | ✓ | — | — | Report an Issue (location selector); issue details | **Reporter, Admin, Maintenance:** R locations as needed to identify an issue. The current workflow does not specify a location-management screen, so adding/editing/deleting campus locations is handled by the Developer/DB administrator outside the app. Keep locations referenced by existing reports. |
| `facility_issues` | ✓ | ✓ | ✓ | — | Report an Issue; My Reports; Issue Details; Manage Reports; Review Issue | **Reporter:** C and R own reports. **Admin:** R all reports and U review information, status, duplicate decision, and feedback. **Maintenance:** R issues connected to assigned tasks. No D: keep issue reports as an audit/history record; use status such as Duplicate or another workflow status instead. |
| `issue_assignments` | ✓ | ✓ | ✓ | — | Assign Maintenance; Assignment Details; My Assigned Tasks; Verify Repair | **Admin:** C assignments, R assignments, U staff/schedule/status and verification fields. **Maintenance:** R assigned tasks and U response/progress-related assignment fields such as acceptance/decline status and response reason. **Reporter:** R assignment/repair status for own report. No D: cancel an assignment through its status rather than deleting its history. |
| `issue_photos` | ✓ | ✓ | — | — | Report an Issue (photo upload); Issue Details; Manage Reports | **Reporter:** C photos for own report and R own photos. **Admin:** R report photos. **Maintenance:** R photos for assigned issues. No U/D: retain submitted photos as report evidence; a correction should follow the app’s report-handling process rather than silently replacing evidence. |
| `repair_records` | ✓ | ✓ | — | — | Update Repair; Repair Details; Verify Repair; My Reports / Issue Details | **Maintenance:** C repair-progress entries and R records for assigned work. **Admin:** R repair records for review and verification. **Reporter:** R repair progress for own report. No U/D: each progress update is a separate history entry (using `repair_no`); do not overwrite or delete earlier repair actions. |
| `repair_photos` | ✓ | ✓ | — | — | Update Repair (photo upload); Repair Details; Verify Repair | **Maintenance:** C photos for the repair record and R photos for assigned work. **Admin:** R photos when reviewing a repair. **Reporter:** R repair photos for own report. No U/D: preserve submitted repair documentation as part of the repair history. |
| `assignment_reworks` | ✓ | ✓ | ✓ | — | Return Repair for Rework; Rework Details; Assigned Tasks / Resubmit Repair | **Admin:** C a rework record with the reason and R rework history. **Maintenance:** R the return reason and U the resubmission information (the app records `resubmitted_at` when work is resubmitted). No D: keep the return/resubmission history for accountability. |
| `cache` | ✓ | ✓ | ✓ | ✓ | No user-facing page | **System only:** Laravel manages cached values and expiration automatically. Users do not create, view, edit, or delete cache records through ParSuFix screens. |
| `cache_locks` | ✓ | ✓ | ✓ | ✓ | No user-facing page | **System only:** Laravel creates and releases cache locks during application operations. No ordinary user CRUD page is needed. |
| `failed_jobs` | ✓ | ✓ | ✓ | ✓ | No user-facing page; technical maintenance only | **System/Developer:** Failed queue jobs are recorded and managed through Laravel queue tools or technical maintenance, not normal ParSuFix dashboards. |
| `jobs` | ✓ | ✓ | ✓ | ✓ | No user-facing page | **System only:** Laravel’s queue worker creates, reads, updates, and removes queued jobs while processing background tasks. |
| `job_batches` | ✓ | ✓ | ✓ | ✓ | No user-facing page | **System only:** Laravel tracks batches of queued jobs. These records are handled by the queue system, not by reporters, Admin, or Maintenance screens. |
| `migrations` | ✓ | ✓ | — | — | No user-facing page; developer command line / deployment | **Developer/DB administrator and migration system:** migration runs add tracking records and developers inspect them during setup. They are not editable/deletable through the app because they document database changes. |
| `notifications` | ✓ | ✓ | ✓ | — | Notification list/dropdown; notification details | **System:** C notifications when events occur. **Signed-in recipient (Reporter, Admin, or Maintenance):** R own notifications and U read status (such as `read_at`). No D in the current map; retain notification history. |

### CRUD rules used in this map

- Admin accounts share the Admin Dashboard. Any authorized Admin may review, assign, or verify an issue. The actual acting Admin must be stored in `assigned_by`, `reviewed_by`, `verified_by`, or `returned_by`, as applicable.
- Admins manage reports; they do **not** submit ordinary facility issue reports.
- Only Students, Teaching Personnel, and Campus Support Personnel submit facility issue reports.
- Maintenance Personnel can access their assigned tasks and submit repair progress and repair photos. They do not manage user accounts or assign work to other staff.
- Records that provide an audit trail (reports, assignments, repair records, photos, and rework history) are not physically deleted in this map. The app uses statuses or additional history records instead.
- The C/R/U/D entries for Laravel support tables describe framework/background operations, not buttons that should appear on the user dashboards.

## 3. From SQL columns to form controls

The following mapping is based on the column names and SQL types in the current export. System-generated values and file metadata should not be typed manually by users.

### `users`

| SQL column | SQL type | Form control / handling | Notes |
|---|---|---|---|
| `user_id` | `INT UNSIGNED` | None | Primary key; auto-generated. Do not show on Add User form. |
| `full_name` | `VARCHAR(150)` | Text input | Required; maximum 150 characters. |
| `email` | `VARCHAR(150)` | Email input | Required and unique. |
| `password_hash` | `VARCHAR(255)` | Password input (`password`) | Required when setting a password. The application hashes it; never display or ask users to type the stored hash. |
| `phone` | `VARCHAR(20)` | Telephone input | Optional. |
| `role` | `VARCHAR(40)` | Select dropdown | Required; options follow the approved app roles. |
| `account_status` | `VARCHAR(20)` | Select dropdown | Required; default is `Active`. Use the app’s allowed account statuses. |
| `created_at` | `DATETIME` | None | Automatically set to the current timestamp by the database. |

### `maintenance_staff`

| SQL column | SQL type | Form control / handling | Notes |
|---|---|---|---|
| `staff_id` | `INT UNSIGNED` | None | Primary key; auto-generated. |
| `user_id` | `INT UNSIGNED` | Select dropdown | Required foreign key; select an existing user account for Maintenance Personnel. Store the `user_id`, display the person’s name. |
| `specialization` | `VARCHAR(100)` | Text input or select | Optional specialization. Use a select only if the app defines a fixed list. |
| `availability_status` | `VARCHAR(30)` | Select dropdown | Required; default is `Available`. Use the app’s allowed availability values. |

### `locations`

| SQL column | SQL type | Form control / handling | Notes |
|---|---|---|---|
| `location_id` | `INT UNSIGNED` | None | Primary key; auto-generated. |
| `building_name` | `VARCHAR(150)` | Text input | Required in the location-maintenance form. |
| `floor_number` | `VARCHAR(30)` | Text input or select | Optional; values such as “1st Floor” are text in this schema. |
| `room_name` | `VARCHAR(100)` | Text input | Optional. In the issue report form, users select an existing location instead of typing a new location record. |

### `facility_issues`

| SQL column | SQL type | Form control / handling | Notes |
|---|---|---|---|
| `issue_id` | `INT UNSIGNED` | None | Primary key; auto-generated. |
| `reported_by` | `INT UNSIGNED` | None / hidden application value | Foreign key to `users`. Set from the signed-in Reporter; never let the user choose another reporter. |
| `location_id` | `INT UNSIGNED` | Select dropdown | Required foreign key to `locations`; display building/floor/room, store `location_id`. |
| `facility_name` | `VARCHAR(150)` | Text input or select | Required; name of the facility/equipment being reported. |
| `facility_identifier` | `VARCHAR(100)` | Text input | Optional asset/facility identifier. |
| `specific_area` | `VARCHAR(150)` | Text input | Optional specific position/area within the selected location. |
| `issue_category` | `VARCHAR(50)` | Select dropdown | Required; options are defined by the application (the SQL column is `VARCHAR`, not an SQL `ENUM`). |
| `description` | `TEXT` | Textarea | Required; detailed description of the problem. |
| `priority` | `VARCHAR(20)` | Select or system/admin-set value | Required; database default is `Medium`. Use only the priority choices supported by the app. |
| `status` | `VARCHAR(30)` | None on Reporter form; status control for Admin | Required; default is `Pending Review`. Status is controlled by the review/repair workflow. |
| `reported_at` | `DATETIME` | None | Database default is current timestamp. |
| `updated_at` | `DATETIME` | None | Database updates this timestamp automatically when the row changes. |
| `resolved_at` | `DATETIME` | None | Set by the application when the issue is resolved; nullable until then. |
| `reviewed_by` | `INT UNSIGNED` | None / hidden application value | Optional foreign key to `users`; set to the currently acting Admin during review. |
| `reviewed_at` | `DATETIME` | None | Set by the application when the Admin reviews the report. |
| `admin_feedback` | `TEXT` | Textarea | Optional; Admin enters feedback or review notes. |
| `duplicate_of_issue_id` | `INT UNSIGNED` | Select/search existing issue (Admin only) | Optional self-referencing foreign key; Admin links the report to the existing/original issue when marking it as a duplicate. |

### `issue_assignments`

| SQL column | SQL type | Form control / handling | Notes |
|---|---|---|---|
| `assignment_id` | `INT UNSIGNED` | None | Primary key; auto-generated. |
| `issue_id` | `INT UNSIGNED` | Select / hidden application value | Required foreign key to `facility_issues`; Admin selects the issue being assigned. |
| `staff_id` | `INT UNSIGNED` | Select dropdown | Required foreign key to `maintenance_staff`; display staff name, store `staff_id`. |
| `assigned_by` | `INT UNSIGNED` | None / hidden application value | Required foreign key to `users`; set to the currently acting Admin. |
| `verified_by` | `INT UNSIGNED` | None / hidden application value | Optional foreign key to `users`; set to the Admin who verifies the repair. |
| `verified_at` | `DATETIME` | None | Set by the application when verification happens. |
| `assigned_at` | `DATETIME` | None | Database default is current timestamp. |
| `scheduled_date` | `DATE` | Date input | Optional schedule date. |
| `scheduled_time` | `TIME` | Time input | Optional schedule time. |
| `assignment_status` | `VARCHAR(30)` | Select/status action | Required; default is `Assigned`. Allowed values follow the assignment workflow. |
| `responded_at` | `DATETIME` | None | Set by the application when Maintenance responds. |
| `assignment_notes` | `TEXT` | Textarea | Optional instructions or notes from Admin. |
| `response_reason` | `TEXT` | Textarea | Optional reason supplied by Maintenance, for example when declining an assignment. |

### `issue_photos`

| SQL column | SQL type | Form control / handling | Notes |
|---|---|---|---|
| `issue_photo_id` | `INT UNSIGNED` | None | Primary key; auto-generated. |
| `issue_id` | `INT UNSIGNED` | None / hidden application value | Required foreign key; attach the uploaded photo to the current issue report. |
| `file_path` | `VARCHAR(500)` | None | Generated by the application/file-storage process. |
| `original_filename` | `VARCHAR(255)` | None | Read from the uploaded file metadata. |
| `mime_type` | `VARCHAR(100)` | None | Read and validated by the application. |
| `file_size` | `BIGINT UNSIGNED` | None | Read from the uploaded file; validate the permitted size. |
| `uploaded_at` | `DATETIME` | None | Database default is current timestamp. |

**Visible upload control:** Use a file input such as `type="file"` for the issue photo. The metadata columns above are stored by the application; users should not type them manually.

### `repair_records`

| SQL column | SQL type | Form control / handling | Notes |
|---|---|---|---|
| `assignment_id` | `INT UNSIGNED` | None / hidden application value | Part of the composite primary key and foreign key to `issue_assignments`; use the current assigned task. |
| `repair_no` | `INT UNSIGNED` | None | Part of the composite primary key; assign the next repair number for that assignment in the application. |
| `action_taken` | `TEXT` | Textarea | Required; describe the repair work or progress completed. |
| `repair_date` | `DATETIME` | None or date/time input if the workflow permits manual scheduling | Database default is current timestamp. Usually let the application/database set it when the repair entry is recorded. |
| `remarks` | `TEXT` | Textarea | Optional additional remarks. |

### `repair_photos`

| SQL column | SQL type | Form control / handling | Notes |
|---|---|---|---|
| `repair_photo_id` | `INT UNSIGNED` | None | Primary key; auto-generated. |
| `assignment_id` | `INT UNSIGNED` | None / hidden application value | Part of the composite foreign key; taken from the current repair record. |
| `repair_no` | `INT UNSIGNED` | None / hidden application value | Part of the composite foreign key; identifies the repair record being documented. |
| `file_path` | `VARCHAR(500)` | None | Generated by the application/file-storage process. |
| `original_filename` | `VARCHAR(255)` | None | Read from the uploaded file metadata. |
| `mime_type` | `VARCHAR(100)` | None | Read and validated by the application. |
| `file_size` | `BIGINT UNSIGNED` | None | Read from the uploaded file; validate the permitted size. |
| `uploaded_at` | `DATETIME` | None | Database default is current timestamp. |

**Visible upload control:** Use a file input such as `type="file"` for repair photos. The file metadata is generated by the application.

### `assignment_reworks`

| SQL column | SQL type | Form control / handling | Notes |
|---|---|---|---|
| `rework_id` | `INT UNSIGNED` | None | Primary key; auto-generated. |
| `assignment_id` | `INT UNSIGNED` | None / hidden application value | Required foreign key to `issue_assignments`; use the assignment being returned for rework. |
| `repair_no` | `INT UNSIGNED` | None / hidden application value | Identifies the repair entry being returned; select it from the related repair history in the app. |
| `returned_by` | `INT UNSIGNED` | None / hidden application value | Required foreign key to `users`; set to the currently acting Admin. |
| `reason` | `TEXT` | Textarea | Required; Admin explains what needs to be corrected. |
| `returned_at` | `DATETIME` | None | Required in the database; set by the application when the Admin returns the work. |
| `resubmitted_at` | `DATETIME` | None | Optional; set by the application when Maintenance resubmits the work. |

### Laravel framework/support tables

The following tables do not need ordinary HTML forms in the ParSuFix prototype. Their columns are managed by Laravel or by developer/deployment tools:

- `cache`: `key`, `value`, `expiration`
- `cache_locks`: `key`, `owner`, `expiration`
- `failed_jobs`: `id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`
- `jobs`: `id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`
- `job_batches`: `id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`
- `migrations`: `id`, `migration`, `batch`
- `notifications`: `id`, `notifiable_type`, `notifiable_id`, `type`, `data`, `read_at`, `created_at`, `updated_at`

For `notifications`, the app shows a notification list/details view rather than asking users to fill in the database columns. The system creates the notification data; the recipient can view it and mark it as read.

## 4. Form-design rules to follow

- Do not show auto-generated primary keys on Add forms.
- Mark SQL `NOT NULL` input fields as required, except values supplied automatically by the application or database.
- Use `type="email"` for email addresses and `type="tel"` for phone numbers.
- Use `<textarea>` for `TEXT` fields such as descriptions, repair actions, remarks, feedback, and rework reasons.
- Use a date/time control for `DATE` and `TIME` fields only when the user is meant to choose the value. Automatically generated timestamps should not be typed by the user.
- Use a `<select>` for foreign keys. Show a meaningful name to the user but submit the related ID.
- Use file inputs for issue and repair photos. Generate `file_path`, filename, MIME type, file size, and upload timestamp in the application.
- The schema uses `VARCHAR` for fields such as `role`, `status`, `priority`, and `assignment_status`; these are not SQL `ENUM` columns. The application must define and validate their allowed choices.
- Enforce role permissions in the application. Hiding a button in the HTML prototype alone is not a security control.

## 5. Items to verify during the prototype

1. Confirm the exact page names and status choices against the current ParSuFix screens and workflow.
2. The SQL export contains `assignment_reworks` as an additional application table. Keep it in this map because it exists in the current database, even if the original ERD showed a smaller set of entities; update the ERD later if the approved database design now includes it.
3. The seven Laravel support tables are included in the physical database count but do not require user-facing CRUD pages.
4. This map describes the intended interface and access rules for the static prototype. It does not add PHP logic or a live database connection in this assignment stage.
