// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

List<ServiceModel> serviceModelFromJson(String str) => List<ServiceModel>.from(
    json.decode(str).map((x) => ServiceModel.fromJson(x)));

String serviceModelToJson(List<ServiceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceRequest {
  String caseId;
  String requestIntakeDate;
  String isHomePatient;
  String serviceRequestAppointment;
  String srEta;
  int recordId;
  String caseStatus;
  double distance;
  double completionPercentageCalculation;
  bool pause;
  List<dynamic> pdfUrlsForReport;
  double timeTaken;
  bool isLock;
  String srLockedBy;
  String caseRequestCompletionDate;
  CancelMoment cancelReason;
  CancelMoment cancelMoment;
  String roomNo;
  String mrnNo;
  String serviceRequestDate;
  String serviceRequestTime;
  String reportedTo;
  String requesterName;
  bool isVerifiedPdf;
  ServiceModel facility;
  Patient patient;
  List<ProcedureDetail> procedureDetails;
  List<dynamic> intakeNotes;
  List<PatientNote> patientNotes;
  List<Clinician> clinicians;
  List<PreProcedureDatum> preProcedureData;
  List<dynamic> fieldNotesList;
  List<dynamic> procedureDocList;
  List<dynamic> intakeDocList;

  ServiceRequest({
    required this.caseId,
    required this.requestIntakeDate,
    required this.isHomePatient,
    required this.serviceRequestAppointment,
    required this.srEta,
    required this.recordId,
    required this.caseStatus,
    required this.distance,
    required this.completionPercentageCalculation,
    required this.pause,
    required this.pdfUrlsForReport,
    required this.timeTaken,
    required this.isLock,
    required this.srLockedBy,
    required this.caseRequestCompletionDate,
    required this.cancelReason,
    required this.cancelMoment,
    required this.roomNo,
    required this.mrnNo,
    required this.serviceRequestDate,
    required this.serviceRequestTime,
    required this.reportedTo,
    required this.requesterName,
    required this.isVerifiedPdf,
    required this.facility,
    required this.patient,
    required this.procedureDetails,
    required this.intakeNotes,
    required this.patientNotes,
    required this.clinicians,
    required this.preProcedureData,
    required this.fieldNotesList,
    required this.procedureDocList,
    required this.intakeDocList,
  });

  factory ServiceRequest.fromJson(Map<String, dynamic> json) => ServiceRequest(
        caseId: json["case_id"],
        requestIntakeDate: json["request_intake_date"],
        isHomePatient: json["is_home_patient"],
        serviceRequestAppointment: json["service_request_appointment"],
        srEta: json["sr_eta"],
        recordId: json["record_id"],
        caseStatus: json["case_status"],
        distance: json["distance"],
        completionPercentageCalculation:
            json["completion_percentage_calculation"],
        pause: json["pause"],
        pdfUrlsForReport:
            List<dynamic>.from(json["pdf_urls_for_report"].map((x) => x)),
        timeTaken: json["time_taken"],
        isLock: json["is_lock"],
        srLockedBy: json["sr_locked_by"],
        caseRequestCompletionDate: json["case_request_completion_date"],
        cancelReason: CancelMoment.fromJson(json["cancel_reason"]),
        cancelMoment: CancelMoment.fromJson(json["cancel_moment"]),
        roomNo: json["room_no"],
        mrnNo: json["mrn_no"],
        serviceRequestDate: json["service_request_date"],
        serviceRequestTime: json["service_request_time"],
        reportedTo: json["reported_to"],
        requesterName: json["requester_name"],
        isVerifiedPdf: json["is_verified_pdf"],
        facility: ServiceModel.fromJson(json["facility"]),
        patient: Patient.fromJson(json["patient"]),
        procedureDetails: List<ProcedureDetail>.from(
            json["procedure_details"].map((x) => ProcedureDetail.fromJson(x))),
        intakeNotes: List<dynamic>.from(json["intake_notes"].map((x) => x)),
        patientNotes: List<PatientNote>.from(
            json["patient_notes"].map((x) => PatientNote.fromJson(x))),
        clinicians: List<Clinician>.from(
            json["Clinicians"].map((x) => Clinician.fromJson(x))),
        preProcedureData: List<PreProcedureDatum>.from(
            json["pre_procedure_data"]
                .map((x) => PreProcedureDatum.fromJson(x))),
        fieldNotesList:
            List<dynamic>.from(json["field_notes_list"].map((x) => x)),
        procedureDocList:
            List<dynamic>.from(json["procedure_doc_list"].map((x) => x)),
        intakeDocList:
            List<dynamic>.from(json["intake_doc_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "case_id": caseId,
        "request_intake_date": requestIntakeDate,
        "is_home_patient": isHomePatient,
        "service_request_appointment": serviceRequestAppointment,
        "sr_eta": srEta,
        "record_id": recordId,
        "case_status": caseStatus,
        "distance": distance,
        "completion_percentage_calculation": completionPercentageCalculation,
        "pause": pause,
        "pdf_urls_for_report":
            List<dynamic>.from(pdfUrlsForReport.map((x) => x)),
        "time_taken": timeTaken,
        "is_lock": isLock,
        "sr_locked_by": srLockedBy,
        "case_request_completion_date": caseRequestCompletionDate,
        "cancel_reason": cancelReason.toJson(),
        "cancel_moment": cancelMoment.toJson(),
        "room_no": roomNo,
        "mrn_no": mrnNo,
        "service_request_date": serviceRequestDate,
        "service_request_time": serviceRequestTime,
        "reported_to": reportedTo,
        "requester_name": requesterName,
        "is_verified_pdf": isVerifiedPdf,
        "facility": facility.toJson(),
        "patient": patient.toJson(),
        "procedure_details":
            List<dynamic>.from(procedureDetails.map((x) => x.toJson())),
        "intake_notes": List<dynamic>.from(intakeNotes.map((x) => x)),
        "patient_notes":
            List<dynamic>.from(patientNotes.map((x) => x.toJson())),
        "Clinicians": List<dynamic>.from(clinicians.map((x) => x.toJson())),
        "pre_procedure_data":
            List<dynamic>.from(preProcedureData.map((x) => x.toJson())),
        "field_notes_list": List<dynamic>.from(fieldNotesList.map((x) => x)),
        "procedure_doc_list":
            List<dynamic>.from(procedureDocList.map((x) => x)),
        "intake_doc_list": List<dynamic>.from(intakeDocList.map((x) => x)),
      };
}

class ServiceModel {
  String facilityNumber;
  String name;
  String phone;
  String street;
  String street2;
  String city;
  String zip;
  String state;
  String country;
  String territory;
  String county;
  int recordId;
  List<ServiceRequest>? serviceRequests;

  ServiceModel({
    required this.facilityNumber,
    required this.name,
    required this.phone,
    required this.street,
    required this.street2,
    required this.city,
    required this.zip,
    required this.state,
    required this.country,
    required this.territory,
    required this.county,
    required this.recordId,
    this.serviceRequests,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        facilityNumber: json["facility_number"],
        name: json["name"],
        phone: json["phone"],
        street: json["street"],
        street2: json["street2"],
        city: json["city"],
        zip: json["zip"],
        state: json["state"],
        country: json["country"],
        territory: json["territory"],
        county: json["county"],
        recordId: json["record_id"],
        serviceRequests: json["service_requests"] == null
            ? []
            : List<ServiceRequest>.from(json["service_requests"]!
                .map((x) => ServiceRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "facility_number": facilityNumber,
        "name": name,
        "phone": phone,
        "street": street,
        "street2": street2,
        "city": city,
        "zip": zip,
        "state": state,
        "country": country,
        "territory": territory,
        "county": county,
        "record_id": recordId,
        "service_requests": serviceRequests == null
            ? []
            : List<dynamic>.from(serviceRequests!.map((x) => x.toJson())),
      };
}

class CancelMoment {
  CancelMoment();

  factory CancelMoment.fromJson(Map<String, dynamic> json) => CancelMoment();

  Map<String, dynamic> toJson() => {};
}

class Clinician {
  int userId;
  int clinicianId;
  String name;
  String role;
  String state;
  String signatureUrl;
  bool locked;
  int recordId;
  String fcmToken;

  Clinician({
    required this.userId,
    required this.clinicianId,
    required this.name,
    required this.role,
    required this.state,
    required this.signatureUrl,
    required this.locked,
    required this.recordId,
    required this.fcmToken,
  });

  factory Clinician.fromJson(Map<String, dynamic> json) => Clinician(
        userId: json["user_id"],
        clinicianId: json["clinician_id"],
        name: json["name"],
        role: json["role"],
        state: json["state"],
        signatureUrl: json["signature_url"],
        locked: json["locked"],
        recordId: json["record_id"],
        fcmToken: json["fcm_token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "clinician_id": clinicianId,
        "name": name,
        "role": role,
        "state": state,
        "signature_url": signatureUrl,
        "locked": locked,
        "record_id": recordId,
        "fcm_token": fcmToken,
      };
}

class Patient {
  String patientNumber;
  String name;
  String dob;
  int age;
  int ageInMonth;
  String street;
  String street2;
  String state;
  String city;
  String country;
  String zip;
  int recordId;
  String prefix;
  String suffix;
  String middleName;
  String lastName;
  String alias;
  String phoneNumber;
  String language;
  List<dynamic> associatedPatientInformation;

  Patient({
    required this.patientNumber,
    required this.name,
    required this.dob,
    required this.age,
    required this.ageInMonth,
    required this.street,
    required this.street2,
    required this.state,
    required this.city,
    required this.country,
    required this.zip,
    required this.recordId,
    required this.prefix,
    required this.suffix,
    required this.middleName,
    required this.lastName,
    required this.alias,
    required this.phoneNumber,
    required this.language,
    required this.associatedPatientInformation,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        patientNumber: json["patient_number"],
        name: json["name"],
        dob: json["dob"],
        age: json["age"],
        ageInMonth: json["age_in_month"],
        street: json["street"],
        street2: json["street2"],
        state: json["state"],
        city: json["city"],
        country: json["country"],
        zip: json["zip"],
        recordId: json["record_id"],
        prefix: json["prefix"],
        suffix: json["suffix"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        alias: json["alias"],
        phoneNumber: json["phone_number"],
        language: json["language"],
        associatedPatientInformation: List<dynamic>.from(
            json["associated_patient_information"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "patient_number": patientNumber,
        "name": name,
        "dob": dob,
        "age": age,
        "age_in_month": ageInMonth,
        "street": street,
        "street2": street2,
        "state": state,
        "city": city,
        "country": country,
        "zip": zip,
        "record_id": recordId,
        "prefix": prefix,
        "suffix": suffix,
        "middle_name": middleName,
        "last_name": lastName,
        "alias": alias,
        "phone_number": phoneNumber,
        "language": language,
        "associated_patient_information":
            List<dynamic>.from(associatedPatientInformation.map((x) => x)),
      };
}

class PatientNote {
  UserInfo userInfo;
  String date;
  String description;
  List<dynamic> tags;
  int recordId;
  String caseId;
  bool flag;

  PatientNote({
    required this.userInfo,
    required this.date,
    required this.description,
    required this.tags,
    required this.recordId,
    required this.caseId,
    required this.flag,
  });

  factory PatientNote.fromJson(Map<String, dynamic> json) => PatientNote(
        userInfo: UserInfo.fromJson(json["user_info"]),
        date: json["date"],
        description: json["description"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        recordId: json["record_id"],
        caseId: json["case_id"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "user_info": userInfo.toJson(),
        "date": date,
        "description": description,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "record_id": recordId,
        "case_id": caseId,
        "flag": flag,
      };
}

class UserInfo {
  String name;
  int recordId;

  UserInfo({
    required this.name,
    required this.recordId,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        name: json["name"],
        recordId: json["record_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "record_id": recordId,
      };
}

class PreProcedureDatum {
  String? startTime;
  String? endTime;
  String? pauseTime;
  String? status;
  String? lastModifiedTime;
  String? groupName;
  String? latex;
  String? lidocaine;
  String? chlorhexidine;
  String? feverTemperature;
  String? covidResult;
  String? otherAllergy;
  String? adhesive;
  String? cathflo;
  String? medicationReviewed;
  String? covidTestDate;
  String? confused;
  String? combative;
  String? poorAccess;
  String? trached;
  String? chronicKidneyDisease;
  String? pacemakerPlacementDate;
  String? paralyzedArea;
  List<dynamic>? cvc;
  List<dynamic>? sites;
  List<dynamic>? currentSites;
  List<dynamic>? historyOfDvtAreas;
  String? fistula;
  String? agitated;
  String? accessHistory;
  String? intubated;
  String? ivcFilter;
  String? pacemakerArea;
  String? mastectomyAreas;
  String? pacemakerDefibrillatorArea;
  List<dynamic>? sides;
  List<dynamic>? currentSides;
  List<dynamic>? contractedArea;
  List<dynamic>? restrictedLimbArea;
  String? lymphNodeDissection;
  String? renalTransplant;
  String? renalStatusApprovedBy;
  List<dynamic>? bloodThinner;
  String? bloodThinnersOther;
  String? plateletCount;
  String? pttValue;
  String? creatinine;
  String? dialysis;
  String? historyNephrectomy;
  String? wbc;
  String? results;
  String? inr;
  String? pt;
  String? bun;
  String? gfr;
  String? bloodCultureDate;
  String? weight;
  String? handicapped;
  String? developmentalDelays;
  String? congenitalAnomalies;

  PreProcedureDatum({
    this.startTime,
    this.endTime,
    this.pauseTime,
    this.status,
    this.lastModifiedTime,
    this.groupName,
    this.latex,
    this.lidocaine,
    this.chlorhexidine,
    this.feverTemperature,
    this.covidResult,
    this.otherAllergy,
    this.adhesive,
    this.cathflo,
    this.medicationReviewed,
    this.covidTestDate,
    this.confused,
    this.combative,
    this.poorAccess,
    this.trached,
    this.chronicKidneyDisease,
    this.pacemakerPlacementDate,
    this.paralyzedArea,
    this.cvc,
    this.sites,
    this.currentSites,
    this.historyOfDvtAreas,
    this.fistula,
    this.agitated,
    this.accessHistory,
    this.intubated,
    this.ivcFilter,
    this.pacemakerArea,
    this.mastectomyAreas,
    this.pacemakerDefibrillatorArea,
    this.sides,
    this.currentSides,
    this.contractedArea,
    this.restrictedLimbArea,
    this.lymphNodeDissection,
    this.renalTransplant,
    this.renalStatusApprovedBy,
    this.bloodThinner,
    this.bloodThinnersOther,
    this.plateletCount,
    this.pttValue,
    this.creatinine,
    this.dialysis,
    this.historyNephrectomy,
    this.wbc,
    this.results,
    this.inr,
    this.pt,
    this.bun,
    this.gfr,
    this.bloodCultureDate,
    this.weight,
    this.handicapped,
    this.developmentalDelays,
    this.congenitalAnomalies,
  });

  factory PreProcedureDatum.fromJson(Map<String, dynamic> json) =>
      PreProcedureDatum(
        startTime: json["start_time"],
        endTime: json["end_time"],
        pauseTime: json["pause_time"],
        status: json["status"],
        lastModifiedTime: json["last_modified_time"],
        groupName: json["group_name"],
        latex: json["latex"],
        lidocaine: json["lidocaine"],
        chlorhexidine: json["chlorhexidine"],
        feverTemperature: json["fever_temperature"],
        covidResult: json["covid_result"],
        otherAllergy: json["other_allergy"],
        adhesive: json["adhesive"],
        cathflo: json["cathflo"],
        medicationReviewed: json["medication_reviewed"],
        covidTestDate: json["covid_test_date"],
        confused: json["confused"],
        combative: json["combative"],
        poorAccess: json["poor_access"],
        trached: json["trached"],
        chronicKidneyDisease: json["chronic_kidney_disease"],
        pacemakerPlacementDate: json["pacemaker_placement_date"],
        paralyzedArea: json["paralyzed_area"],
        cvc: json["cvc"] == null
            ? []
            : List<dynamic>.from(json["cvc"]!.map((x) => x)),
        sites: json["sites"] == null
            ? []
            : List<dynamic>.from(json["sites"]!.map((x) => x)),
        currentSites: json["current_sites"] == null
            ? []
            : List<dynamic>.from(json["current_sites"]!.map((x) => x)),
        historyOfDvtAreas: json["history_of_dvt_areas"] == null
            ? []
            : List<dynamic>.from(json["history_of_dvt_areas"]!.map((x) => x)),
        fistula: json["fistula"],
        agitated: json["agitated"],
        accessHistory: json["access_history"],
        intubated: json["intubated"],
        ivcFilter: json["ivc_filter"],
        pacemakerArea: json["pacemaker_area"],
        mastectomyAreas: json["mastectomy_areas"],
        pacemakerDefibrillatorArea: json["pacemaker_defibrillator_area"],
        sides: json["sides"] == null
            ? []
            : List<dynamic>.from(json["sides"]!.map((x) => x)),
        currentSides: json["current_sides"] == null
            ? []
            : List<dynamic>.from(json["current_sides"]!.map((x) => x)),
        contractedArea: json["contracted_area"] == null
            ? []
            : List<dynamic>.from(json["contracted_area"]!.map((x) => x)),
        restrictedLimbArea: json["restricted_limb_area"] == null
            ? []
            : List<dynamic>.from(json["restricted_limb_area"]!.map((x) => x)),
        lymphNodeDissection: json["lymph_node_dissection"],
        renalTransplant: json["renal_transplant"],
        renalStatusApprovedBy: json["renal_status_approved_by"],
        bloodThinner: json["blood_thinner"] == null
            ? []
            : List<dynamic>.from(json["blood_thinner"]!.map((x) => x)),
        bloodThinnersOther: json["blood_thinners_other"],
        plateletCount: json["platelet_count"],
        pttValue: json["ptt_value"],
        creatinine: json["creatinine"],
        dialysis: json["dialysis"],
        historyNephrectomy: json["history_nephrectomy"],
        wbc: json["wbc"],
        results: json["results"],
        inr: json["inr"],
        pt: json["pt"],
        bun: json["bun"],
        gfr: json["gfr"],
        bloodCultureDate: json["blood_culture_date"],
        weight: json["weight"],
        handicapped: json["handicapped"],
        developmentalDelays: json["developmental_delays"],
        congenitalAnomalies: json["congenital_anomalies"],
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "end_time": endTime,
        "pause_time": pauseTime,
        "status": status,
        "last_modified_time": lastModifiedTime,
        "group_name": groupName,
        "latex": latex,
        "lidocaine": lidocaine,
        "chlorhexidine": chlorhexidine,
        "fever_temperature": feverTemperature,
        "covid_result": covidResult,
        "other_allergy": otherAllergy,
        "adhesive": adhesive,
        "cathflo": cathflo,
        "medication_reviewed": medicationReviewed,
        "covid_test_date": covidTestDate,
        "confused": confused,
        "combative": combative,
        "poor_access": poorAccess,
        "trached": trached,
        "chronic_kidney_disease": chronicKidneyDisease,
        "pacemaker_placement_date": pacemakerPlacementDate,
        "paralyzed_area": paralyzedArea,
        "cvc": cvc == null ? [] : List<dynamic>.from(cvc!.map((x) => x)),
        "sites": sites == null ? [] : List<dynamic>.from(sites!.map((x) => x)),
        "current_sites": currentSites == null
            ? []
            : List<dynamic>.from(currentSites!.map((x) => x)),
        "history_of_dvt_areas": historyOfDvtAreas == null
            ? []
            : List<dynamic>.from(historyOfDvtAreas!.map((x) => x)),
        "fistula": fistula,
        "agitated": agitated,
        "access_history": accessHistory,
        "intubated": intubated,
        "ivc_filter": ivcFilter,
        "pacemaker_area": pacemakerArea,
        "mastectomy_areas": mastectomyAreas,
        "pacemaker_defibrillator_area": pacemakerDefibrillatorArea,
        "sides": sides == null ? [] : List<dynamic>.from(sides!.map((x) => x)),
        "current_sides": currentSides == null
            ? []
            : List<dynamic>.from(currentSides!.map((x) => x)),
        "contracted_area": contractedArea == null
            ? []
            : List<dynamic>.from(contractedArea!.map((x) => x)),
        "restricted_limb_area": restrictedLimbArea == null
            ? []
            : List<dynamic>.from(restrictedLimbArea!.map((x) => x)),
        "lymph_node_dissection": lymphNodeDissection,
        "renal_transplant": renalTransplant,
        "renal_status_approved_by": renalStatusApprovedBy,
        "blood_thinner": bloodThinner == null
            ? []
            : List<dynamic>.from(bloodThinner!.map((x) => x)),
        "blood_thinners_other": bloodThinnersOther,
        "platelet_count": plateletCount,
        "ptt_value": pttValue,
        "creatinine": creatinine,
        "dialysis": dialysis,
        "history_nephrectomy": historyNephrectomy,
        "wbc": wbc,
        "results": results,
        "inr": inr,
        "pt": pt,
        "bun": bun,
        "gfr": gfr,
        "blood_culture_date": bloodCultureDate,
        "weight": weight,
        "handicapped": handicapped,
        "developmental_delays": developmentalDelays,
        "congenital_anomalies": congenitalAnomalies,
      };
}

class ProcedureDetail {
  UserInfo procedureData;
  String name;
  String status;
  List<dynamic> vadIndications;
  String cancelReasonOther;
  String cancelMomentOther;
  CancelMoment outcomes;
  List<dynamic> performers;
  List<dynamic> perceptees;
  List<dynamic> perceptors;
  List<dynamic> circulators;
  String startTime;
  String endTime;
  String startBy;
  String endBy;
  String pauseTime;
  CancelMoment cancellationReasonId;
  CancelMoment cancellationMomentId;
  int recordId;
  String procedureNumber;
  List<dynamic> consumedItems;
  List<dynamic> site;
  List<dynamic> side;
  List<dynamic> side2;
  List<dynamic> vein;
  String catheterLength;
  String extLength;
  String macMtc;

  ProcedureDetail({
    required this.procedureData,
    required this.name,
    required this.status,
    required this.vadIndications,
    required this.cancelReasonOther,
    required this.cancelMomentOther,
    required this.outcomes,
    required this.performers,
    required this.perceptees,
    required this.perceptors,
    required this.circulators,
    required this.startTime,
    required this.endTime,
    required this.startBy,
    required this.endBy,
    required this.pauseTime,
    required this.cancellationReasonId,
    required this.cancellationMomentId,
    required this.recordId,
    required this.procedureNumber,
    required this.consumedItems,
    required this.site,
    required this.side,
    required this.side2,
    required this.vein,
    required this.catheterLength,
    required this.extLength,
    required this.macMtc,
  });

  factory ProcedureDetail.fromJson(Map<String, dynamic> json) =>
      ProcedureDetail(
        procedureData: UserInfo.fromJson(json["procedure_data"]),
        name: json["name"],
        status: json["status"],
        vadIndications:
            List<dynamic>.from(json["vad_indications"].map((x) => x)),
        cancelReasonOther: json["cancel_reason_other"],
        cancelMomentOther: json["cancel_moment_other"],
        outcomes: CancelMoment.fromJson(json["outcomes"]),
        performers: List<dynamic>.from(json["performers"].map((x) => x)),
        perceptees: List<dynamic>.from(json["perceptees"].map((x) => x)),
        perceptors: List<dynamic>.from(json["perceptors"].map((x) => x)),
        circulators: List<dynamic>.from(json["circulators"].map((x) => x)),
        startTime: json["start_time"],
        endTime: json["end_time"],
        startBy: json["start_by"],
        endBy: json["end_by"],
        pauseTime: json["pause_time"],
        cancellationReasonId:
            CancelMoment.fromJson(json["cancellation_reason_id"]),
        cancellationMomentId:
            CancelMoment.fromJson(json["cancellation_moment_id"]),
        recordId: json["record_id"],
        procedureNumber: json["procedure_number"],
        consumedItems: List<dynamic>.from(json["consumed_items"].map((x) => x)),
        site: List<dynamic>.from(json["site"].map((x) => x)),
        side: List<dynamic>.from(json["side"].map((x) => x)),
        side2: List<dynamic>.from(json["side2"].map((x) => x)),
        vein: List<dynamic>.from(json["vein"].map((x) => x)),
        catheterLength: json["catheter_length"],
        extLength: json["ext_length"],
        macMtc: json["mac_mtc"],
      );

  Map<String, dynamic> toJson() => {
        "procedure_data": procedureData.toJson(),
        "name": name,
        "status": status,
        "vad_indications": List<dynamic>.from(vadIndications.map((x) => x)),
        "cancel_reason_other": cancelReasonOther,
        "cancel_moment_other": cancelMomentOther,
        "outcomes": outcomes.toJson(),
        "performers": List<dynamic>.from(performers.map((x) => x)),
        "perceptees": List<dynamic>.from(perceptees.map((x) => x)),
        "perceptors": List<dynamic>.from(perceptors.map((x) => x)),
        "circulators": List<dynamic>.from(circulators.map((x) => x)),
        "start_time": startTime,
        "end_time": endTime,
        "start_by": startBy,
        "end_by": endBy,
        "pause_time": pauseTime,
        "cancellation_reason_id": cancellationReasonId.toJson(),
        "cancellation_moment_id": cancellationMomentId.toJson(),
        "record_id": recordId,
        "procedure_number": procedureNumber,
        "consumed_items": List<dynamic>.from(consumedItems.map((x) => x)),
        "site": List<dynamic>.from(site.map((x) => x)),
        "side": List<dynamic>.from(side.map((x) => x)),
        "side2": List<dynamic>.from(side2.map((x) => x)),
        "vein": List<dynamic>.from(vein.map((x) => x)),
        "catheter_length": catheterLength,
        "ext_length": extLength,
        "mac_mtc": macMtc,
      };
}
