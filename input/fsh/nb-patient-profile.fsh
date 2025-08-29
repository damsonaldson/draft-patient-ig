Profile: NBPatient
Parent: Patient
Id: NBPatient
Title: "New Brunswick Patient Profile"
Description: "Patient profile for submissions to provincial systems in New Brunswick, Canada. Requires a local MRN, and supports a submitter tracking extension on meta."

// Require at least one identifier
* identifier 1..* MS

// Define slice for local MRN
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type.coding"
* identifier ^slicing.rules = #open
* identifier contains emr-mrn 1..1 MS
* identifier[emr-mrn].type.coding.code = http://terminology.hl7.org/CodeSystem/v2-0203#MR

// Require meta and extension
* meta 1..1 MS
* meta.source 1..1 MS
* meta.extension contains DataSubmitter named data-submitter 1..1

// Optional communication
* communication 0..*

// Client Registry minimum data set
* name 1..* MS
* name.family 1..1 MS
* name.given 1..* MS
* gender 1..1 MS
* birthDate 1..1 MS

// Require managingOrganization and constrain to contained
* managingOrganization 1..1
* managingOrganization ^constraint[+].key = "nb-1"
* managingOrganization ^constraint[=].severity = #error
* managingOrganization ^constraint[=].human = "managingOrganization must reference a contained Organization resource"
* managingOrganization ^constraint[=].expression = "reference.startsWith('#')"

// Optional generalPractitioner, but if present must be contained
* generalPractitioner 0..1
* generalPractitioner ^constraint[+].key = "nb-2"
* generalPractitioner ^constraint[=].severity = #error
* generalPractitioner ^constraint[=].human = "generalPractitioner must reference a contained Practitioner resource"
* generalPractitioner ^constraint[=].expression = "reference.startsWith('#')"

