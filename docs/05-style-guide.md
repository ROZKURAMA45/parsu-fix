# ParSuFix – Style Guide

## 1. Design Direction

ParSuFix is a web-based system for reporting campus facility problems and tracking their repairs.

The design will be simple, clean, and easy to use. It will have three user areas: Reporting User, Admin, and Maintenance Personnel.

All pages will use the same colors, fonts, buttons, and input styles to make the system look consistent.

## 2. Color Palette

These are the colors that will be used in the ParSuFix prototype.

Use dark blue for buttons, links, and headings; light gray for the background; dark text for labels; green for success messages; and red for errors.

### Color  Check



Use dark text (#172B3A) on light gray (#F5F7FA), white text (#FFFFFF) on dark blue (#123B56), green text (#236B45) for success, and red text (#A12D2A) for errors. 


## 3. Fonts

Poppins will be used for headings and page titles, while Inter will be used for body text, labels, and buttons.
**Base font size:** 16px

These fonts are easy to read and suitable for a web application.

## 4. Buttons and Input Fields

**Primary Button**

- Dark blue background.
- White text.
- Used for main actions like Submit Report, Save, and Verify Repair.
- Rounded corners.

**Secondary Button**

- Light background.
- Dark blue text.
- Used for Cancel and Back buttons.
- Has a simple border.

**Text Input**

- Has a label above the field.
- Uses a light background.
- Has a simple border.
- Required fields have an asterisk (*).

**Error Message**

- Uses red text.
- Appears below the field with an error.
- Example: "Facility name is required."

**Status Labels**

The system will show clear status names such as Pending Review, Assigned, In Progress, Completed, Duplicate, and Returned for Rework.

## 5. CSS Custom Properties

These variables will be used in the `style.css` file for the HTML/CSS prototype.

```css
:root {
    /* Colors */
    --color-primary: #123B56;
    --color-bg: #F5F7FA;
    --color-text: #172B3A;
    --color-success: #236B45;
    --color-error: #A12D2A;

    /* Fonts */
    --font-heading: "Poppins", Arial, sans-serif;
    --font-body: "Inter", Arial, sans-serif;
    --font-size-base: 16px;

    /* Sizes */
    --radius: 8px;
    --input-height: 42px;
}
```

