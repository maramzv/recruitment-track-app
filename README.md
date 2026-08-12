# Hire Compass

Hire Compass is a single-page recruiting tool designed to help recruiting coordinators manage candidates, prioritize follow-ups, and make more informed hiring decisions using historical workforce data.

## Overview

Recruiters often have candidate information but lack a simple way to see **who needs attention first** and whether historical hiring patterns provide useful context for a candidate.

Hire Compass addresses this by combining:

* Candidate pipeline management
* Automatic follow-up prioritization
* Historical workforce analytics
* Candidate-level Hiring Intelligence
* A planned Dashboard tab that brings all of the above together into one at-a-glance overview (not yet built)

## Core Workflow

### 1. Manage Candidates

Recruiters can add and manage candidates through a simple form.

Candidate information includes:

* Name
* Role
* Department
* Recruitment source
* Hiring stage
* Last contact date
* Email
* Phone

Candidates can be moved through the hiring pipeline:

**Applied → Screening → Interview 1 → Interview 2 → Offer → Hired / Rejected**

### 2. Prioritize Follow-Ups

Hire Compass automatically evaluates how long it has been since each candidate was last contacted and categorizes follow-up urgency as:

* **On Track**
* **Needs Attention**
* **Overdue**

Candidates requiring attention are surfaced prominently so recruiters can focus on the most urgent follow-ups first.

### 3. Analyze Historical Hiring Outcomes

The app includes a static historical workforce dataset containing **311 employee records**.

The dataset is used to calculate historical insights such as:

* Retention and turnover
* Performance
* Tenure
* Engagement
* Satisfaction
* Salary

Insights can be viewed by recruitment source, department, and team.

### 4. Hiring Intelligence

Hire Compass compares a candidate's **recruitment source and department** against historical workforce outcomes.

Using fixed thresholds of:

* **80% retention**
* **3/4 performance**
* **Minimum 5 historical hires**

each source and department receives a historical performance classification. These results are combined into a simple candidate-facing signal:

* **Favorable**
* **Promising**
* **Inconclusive**
* **Conflict**
* **Concern**
* **Flagged**

The goal is not to automatically decide who should be hired, but to give recruiters additional context and suggest areas they may want to validate during the hiring process.

## Main Views

### Candidate Pipeline

The primary workspace for:

* Adding and managing candidates
* Tracking hiring stages
* Viewing follow-up urgency
* Prioritizing candidates who need attention

### Workforce Analytics

Provides historical insights across:

* Recruitment sources
* Departments
* Teams
* Retention and turnover
* Salary

### Hiring Intelligence

Provides candidate-level insights including:

* Hiring Intelligence signal
* Reasoning behind the signal
* Recommended recruiter focus
* Follow-up urgency
* Suggested interview questions
* Supporting historical evidence

## Tech Stack

* **Frontend:** Single-file HTML/CSS/JavaScript
* **Framework:** None
* **Data:** Static `employeeData.js` dataset with 311 historical employee records
* **Backend:** None
* **Persistence:** Client-side only

## Project Status

🚧 **Currently in development**
