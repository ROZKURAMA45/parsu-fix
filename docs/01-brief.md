# Project Brief: ParSuFix
**Partido State University Facility Fix**

## 1. The problem

Students, teaching personnel, and campus support personnel need a convenient way to report damaged or malfunctioning campus facilities. Without a centralized reporting and tracking system, reports, maintenance assignments, and repair updates can be difficult to organize and monitor. ParSuFix provides a centralized platform for reporting facility issues and tracking their repair progress.

## 2. Users and what they need to do

| User role | What they need to do in the app |
|---|---|
| Student | Submit facility issue reports, upload photos, and monitor report status. |
| Teaching Personnel | Report classroom and campus facility problems and track updates. |
| Campus Support Personnel | Submit facility issue reports and monitor their progress. |
| Maintenance Personnel | View assigned issues, update repair progress, and upload repair photos. |
| Admin | Review reports, manage assignments, monitor repairs, verify completed work, and manage user accounts. |

## 3. The database behind it

**Database name:** `campusfix_db`  
**Total tables:** 16

| Table | Description |
|---|---|
| `users` | Stores user accounts, login information, roles, and account status. |
| `maintenance_staff` | Stores maintenance personnel information and availability. |
| `locations` | Stores campus building, floor, and room information. |
| `facility_issues` | Stores facility problems submitted by users. |
| `issue_assignments` | Stores maintenance assignments, schedules, and verification details. |
| `repair_records` | Stores repair actions, dates, and remarks. |
| `issue_photos` | Stores photos attached to reported facility issues. |
| `repair_photos` | Stores photos documenting completed or ongoing repair work. |
| `assignment_reworks` | Stores repair submissions returned for correction and their resubmission details. |
| `notifications` | Stores system notifications for users. |
| `migrations` | Tracks database migrations performed by Laravel. |
| `cache` | Stores application cache data. |
| `cache_locks` | Manages application cache locks. |
| `jobs` | Stores queued background jobs. |
| `job_batches` | Stores information about grouped queued jobs. |
| `failed_jobs` | Stores queued jobs that failed to execute. |

## 4. Must-have features

1. **Register and authenticate** user accounts using the `users` table.
2. **Submit** facility issue reports and attach photos using the `facility_issues` and `issue_photos` tables.
3. **Identify** campus buildings and rooms using the `locations` table.
4. **Assign** maintenance personnel and schedules using the `issue_assignments` and `maintenance_staff` tables.
5. **Record** repair activities and upload repair documentation using the `repair_records` and `repair_photos` tables.
6. **Verify** completed repairs and record returned repair submissions using the `issue_assignments` and `assignment_reworks` tables.

## 5. Nice-to-have features

- Add dashboard analytics and repair performance summaries.
- Add advanced issue filtering and search.
- Improve notification preferences for different user roles.

## 6. Similar apps I looked at

- **FixMyStreet** – Borrow the idea of organized issue reporting with location details and visibility of previously reported problems.
- **SeeClickFix** – Borrow the idea of photo-supported issue submissions and tracking the status of reported problems.