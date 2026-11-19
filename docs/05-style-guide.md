# ParSuFix – Style Guide

## 1. Design Direction

ParSuFix is a web-based system for reporting campus facility problems and tracking their repairs.

The design will be simple, clean, and easy to use. It will have three user areas: Reporting User, Admin, and Maintenance Personnel.

All pages will use the same colors, fonts, buttons, and input styles to make the system look consistent.

## 2. Color Palette

These are the colors that will be used in the ParSuFix prototype.

| Color | Hex Code | Purpose |
|---|---|---|
| Primary | `#123B56` | Buttons, links, and headings |
| Background | `#F5F7FA` | Main page background |
| Text | `#172B3A` | Text and labels |
| Success | `#236B45` | Completed messages and successful actions |
| Error | `#A12D2A` | Error messages and warnings |

### Color  Check



| Text Color| Background Color 
| `#172B3A` | `#F5F7FA` 
| `#FFFFFF` | `#123B56` 
| `#236B45` | `#F5F7FA` 
| `#A12D2A` | `#F5F7FA` 


## 3. Fonts

The prototype will use two fonts:

 Font  Purpose
|---|---|
| Poppins | Headings and page titles |
| Inter | Body text, labels, and buttons |

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

## 6. Usage in Task 6

These styles will be used when creating the static HTML/CSS prototype.

The same colors, fonts, buttons, and input styles will be used on the pages to keep the ParSuFix design consistent.

This style guide is only for the new HTML/CSS prototype. It does not use the existing PHP code or database connection.