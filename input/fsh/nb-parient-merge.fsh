Profile: NBPatientMerge
Parent: Parameters
Id: NBPatientMerge
Title: "New Brunswick Patient Merge Profile"
Description: "Patient profile for $merge operations to provincial systems in New Brunswick, Canada"

// Require meta and extension for submitter
* meta 1..1
* meta.source 1..1

// Require at least the source and target patient identifiers
/*
* parameter contains
    source-patient 0..1 and
    source-patient-identifier 1..1 and
    target-patient 0..1 and
    target-patient-identifier 1..1 and
    result-patient 0..1
*/
/* Slices for parameters
* parameter[source-patient].name = "source-patient"
* parameter[source-patient].valueReference only Reference(Patient)

* parameter[source-patient-identifier].name = "source-patient-identifier"
* parameter[source-patient-identifier].valueIdentifier

* parameter[target-patient].name = "target-patient"
* parameter[target-patient].valueReference only Reference(Patient)

* parameter[target-patient-identifier].name = "target-patient-identifier"
* parameter[target-patient-identifier].valueIdentifier

* parameter[result-patient].name = "result-patient"
* parameter[result-patient].resource 1..1
* parameter[result-patient].resource only Patient
*/
