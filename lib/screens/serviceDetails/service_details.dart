import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:labs/extensions/common_extensions.dart';
import 'package:labs/screens/serviceDetails/blood_thinner_model.dart';
import 'package:labs/screens/serviceDetails/service_details_item.dart';
import 'package:labs/utils/common.dart';
import 'package:labs/utils/labels.dart';
import 'package:labs/utils/my_font_style.dart';
import 'package:labs/widgets/radius_container.dart';
import 'package:labs/widgets/seperator.dart';
import 'package:labs/widgets/theme_button.dart';
import 'package:labs/widgets/theme_textfield.dart';

import '../../dialogs/loading.dart';
import '../../manager/rest/api_manager.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_toast.dart';
import '../service/service_model.dart';

class ServiceDetailsScreen extends StatefulWidget {
  const ServiceDetailsScreen({super.key});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  List<String> selectedBloodThinnerList = [];
  List<BloodThinnerModel> bloodThinnerList = [];
  PreProcedureDatum? preProcedureDataHistory;
  PreProcedureDatum? preProcedureDataLab;
  List<PreProcedureDatum>? preProcedureDataList = [];
  String? caseId;
  TextEditingController otherController = TextEditingController();
  TextEditingController bloodCultureDateController = TextEditingController();
  TextEditingController renalStatusApprovedByController =
      TextEditingController();
  bool isDialysis = false;
  bool isNephrectomy = false;
  bool isRenalTransplant = false;
  bool isNegative = false;
  bool isPositive = false;
  bool isPending = false;
  Map? data;
  @override
  void initState() {
    bloodThinnerList = [
      BloodThinnerModel("Apixaban", false),
      BloodThinnerModel("Dabigatran", false),
      BloodThinnerModel("Edoxaban", false),
      BloodThinnerModel("Fondaparinux", false),
      BloodThinnerModel("Heparin", false),
      BloodThinnerModel("Rivaroxaban", false),
      BloodThinnerModel("Warfarin", false),
      BloodThinnerModel("Asprin", false),
      BloodThinnerModel("Coumadin", false),
      BloodThinnerModel("Lovenox", false),
      BloodThinnerModel("Other", false),
    ];
    if (getDeviceType() == "phone") {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getArguments();
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                Labels.appName.toUpperCase(),
                style: MyFontStyle.bold(
                    color: AppColors.primaryColor, fontSize: 30),
              ),
            ),
            Seperator(
                height: 2,
                width: MediaQuery.of(context).size.width,
                color: AppColors.gray),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Blood Thinner:",
                          style: MyFontStyle.regular(fontSize: 14),
                        ),
                      ),
                      5.width,
                      Flexible(
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: List.generate(
                              bloodThinnerList.length,
                              (index) => Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                        fillColor:
                                            const MaterialStatePropertyAll(
                                                AppColors.primaryColor),
                                        value: bloodThinnerList[index].value,
                                        onChanged: (value) {
                                          setState(() {
                                            if (value == true) {
                                              selectedBloodThinnerList.add(
                                                  bloodThinnerList[index]
                                                      .title
                                                      .toLowerCase());
                                            } else {
                                              selectedBloodThinnerList
                                                  .removeWhere((element) =>
                                                      element ==
                                                      bloodThinnerList[index]
                                                          .title
                                                          .toLowerCase());
                                              selectedBloodThinnerList.remove(
                                                  bloodThinnerList[index]
                                                      .title
                                                      .toLowerCase());
                                            }
                                            bloodThinnerList[index].value =
                                                value!;
                                            preProcedureDataLab?.bloodThinner =
                                                selectedBloodThinnerList;
                                            preProcedureDataLab
                                                ?.bloodThinnersOther = "";
                                          });
                                        },
                                      ),
                                      Text(bloodThinnerList[index].title),
                                      if (bloodThinnerList[index].title ==
                                              "Other" &&
                                          bloodThinnerList[index].value)
                                        10.width,
                                      if (bloodThinnerList[index].title ==
                                              "Other" &&
                                          bloodThinnerList[index].value)
                                        SizedBox(
                                          height: 40,
                                          width: 100,
                                          child: ThemeTextField(
                                            readOnly:
                                                !bloodThinnerList[index].value,
                                            hint: "",
                                            controller: otherController,
                                            onChanged: (val) =>
                                                preProcedureDataLab
                                                    ?.bloodThinnersOther = val,
                                          ),
                                        )
                                    ],
                                  )),
                        ),
                      )
                    ],
                  ),
                  15.height,
                  Seperator(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.gray),
                  15.height,
                  Row(
                    children: [
                      ServiceDetailsItem(
                        label: 'INR',
                        value: preProcedureDataLab?.inr,
                        hint: preProcedureDataLab?.inr == null ? '1.1' : "",
                        color: AppColors.greenColor,
                        onChanged: (val) => preProcedureDataLab?.inr = val,
                      ),
                      25.width,
                      ServiceDetailsItem(
                        label: 'Platelet Count(k):',
                        value: preProcedureDataLab?.plateletCount,
                        hint: 'uL/dL',
                        color: AppColors.warning,
                        onChanged: (val) =>
                            preProcedureDataLab?.plateletCount = val,
                      ),
                      25.width,
                      ServiceDetailsItem(
                        label: 'PT:',
                        value: preProcedureDataLab?.pt,
                        hint: 'Sec',
                        color: AppColors.greenColor,
                        onChanged: (val) => preProcedureDataLab?.pt = val,
                      ),
                      25.width,
                      ServiceDetailsItem(
                        label: 'PTT:',
                        value: preProcedureDataLab?.pttValue,
                        hint: 'Sec',
                        color: AppColors.greenColor,
                        onChanged: (val) => preProcedureDataLab?.pttValue = val,
                      ),
                    ],
                  ),
                  15.height,
                  Seperator(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.gray),
                  15.height,
                  Row(
                    children: [
                      ServiceDetailsItem(
                        label: 'BUN:',
                        value: preProcedureDataLab?.bun,
                        hint: 'mg/dl',
                        color: AppColors.greenColor,
                        onChanged: (val) => preProcedureDataLab?.bun = val,
                      ),
                      25.width,
                      ServiceDetailsItem(
                        label: 'Creatinine:',
                        value: preProcedureDataLab?.creatinine,
                        hint: 'mg/dl',
                        color: AppColors.warning,
                        onChanged: (val) =>
                            preProcedureDataLab?.creatinine = val,
                      ),
                      25.width,
                      ServiceDetailsItem(
                        inputType: TextInputType.text,
                        label: 'GFR:',
                        value: preProcedureDataLab?.gfr,
                        hint: '    ',
                        color: AppColors.error,
                        onChanged: (val) => preProcedureDataLab?.gfr = val,
                      ),
                    ],
                  ),
                  15.height,
                  Seperator(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.gray),
                  15.height,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dialysis:",
                              style: MyFontStyle.regular(fontSize: 14),
                            ),
                            10.width,
                            Row(
                              children: [
                                RadiusContainer(
                                  onTap: () => setState(() {
                                    isDialysis = true;
                                    preProcedureDataLab?.dialysis = "yes";
                                  }),
                                  value: Labels.yes,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.1),
                                  borderColor: AppColors.primaryColor,
                                  radius: 5,
                                  isFill: isDialysis,
                                  style: MyFontStyle.regular(
                                      color: AppColors.primaryColor),
                                ),
                                20.width,
                                RadiusContainer(
                                  onTap: () => setState(() {
                                    isDialysis = false;
                                    preProcedureDataLab?.dialysis = "no";
                                  }),
                                  value: Labels.no,
                                  isFill: !isDialysis,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.1),
                                  borderColor: AppColors.primaryColor,
                                  radius: 5,
                                  style: MyFontStyle.regular(
                                      color: AppColors.primaryColor),
                                ),
                                100.width
                              ],
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Renal Transplant:",
                              style: MyFontStyle.regular(fontSize: 14),
                            ),
                            Row(
                              children: [
                                RadiusContainer(
                                  onTap: () => setState(() {
                                    isRenalTransplant = true;
                                    preProcedureDataHistory?.renalTransplant =
                                        "yes";
                                  }),
                                  value: Labels.yes,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.1),
                                  borderColor: AppColors.primaryColor,
                                  radius: 5,
                                  isFill: isRenalTransplant,
                                  style: MyFontStyle.regular(
                                      color: AppColors.primaryColor),
                                ),
                                20.width,
                                RadiusContainer(
                                  onTap: () => setState(() {
                                    isRenalTransplant = false;
                                    preProcedureDataHistory?.renalTransplant =
                                        "no";
                                  }),
                                  value: Labels.no,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.1),
                                  borderColor: AppColors.primaryColor,
                                  radius: 5,
                                  isFill: !isRenalTransplant,
                                  style: MyFontStyle.regular(
                                      color: AppColors.primaryColor),
                                ),
                                100.width
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  10.height,
                  Row(
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hisotry Of \nNephrectomy:",
                              style: MyFontStyle.regular(fontSize: 14),
                            ),
                            Row(
                              children: [
                                RadiusContainer(
                                  onTap: () => setState(() {
                                    isNephrectomy = true;
                                    preProcedureDataLab?.historyNephrectomy =
                                        "yes";
                                  }),
                                  isFill: isNephrectomy,
                                  value: Labels.yes,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.1),
                                  borderColor: AppColors.primaryColor,
                                  radius: 5,
                                  style: MyFontStyle.regular(
                                      color: AppColors.primaryColor),
                                ),
                                20.width,
                                RadiusContainer(
                                  onTap: () => setState(() {
                                    isNephrectomy = false;
                                    preProcedureDataLab?.historyNephrectomy =
                                        "no";
                                  }),
                                  value: Labels.no,
                                  isFill: !isNephrectomy,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.1),
                                  borderColor: AppColors.primaryColor,
                                  radius: 5,
                                  style: MyFontStyle.regular(
                                      color: AppColors.primaryColor),
                                ),
                                100.width
                              ],
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Renal Status \nApproved By:",
                              style: MyFontStyle.regular(fontSize: 14),
                            ),
                            3.width,
                            SizedBox(
                              height: 40,
                              width: 150,
                              child: ThemeTextField(
                                  controller: renalStatusApprovedByController,
                                  onChanged: (val) => preProcedureDataHistory
                                      ?.renalStatusApprovedBy = val,
                                  hint: ""),
                            ),
                            60.width
                          ],
                        ),
                      )
                    ],
                  ),
                  15.height,
                  Seperator(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.gray),
                  15.height,
                  ServiceDetailsItem(
                    label: 'WBC:',
                    value: preProcedureDataLab?.wbc,
                    hint: "/mL",
                    color: AppColors.greenColor,
                    onChanged: (val) => preProcedureDataLab?.wbc = val,
                  ),
                  15.height,
                  Seperator(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.gray),
                  15.height,
                  Row(
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Text(
                              "Blood Culture Date:",
                              style: MyFontStyle.regular(fontSize: 14),
                            ),
                            10.width,
                            SizedBox(
                              height: 40,
                              width: 150,
                              child: ThemeTextField(
                                ontap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedDate);

                                    setState(() {
                                      bloodCultureDateController.text =
                                          formattedDate;
                                      preProcedureDataLab?.bloodCultureDate =
                                          formattedDate;
                                    });
                                  }
                                },
                                readOnly: true,
                                controller: bloodCultureDateController,
                                onChanged: (val) =>
                                    preProcedureDataLab?.bloodCultureDate = val,
                                hint: "",
                                suffixIcon: const Icon(Icons.calendar_month),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Text(
                              "Results:",
                              style: MyFontStyle.regular(fontSize: 14),
                            ),
                            10.width,
                            RadiusContainer(
                              onTap: () => setState(() {
                                preProcedureDataLab?.results = "negative";
                                isNegative = true;
                                isPositive = false;
                                isPending = false;
                              }),
                              value: Labels.negative,
                              color: AppColors.primaryColor.withOpacity(0.1),
                              borderColor: AppColors.primaryColor,
                              radius: 5,
                              isFill: isNegative,
                              style: MyFontStyle.regular(
                                  color: AppColors.primaryColor),
                            ),
                            10.width,
                            RadiusContainer(
                              onTap: () => setState(() {
                                preProcedureDataLab?.results = "positive";
                                isNegative = false;
                                isPositive = true;
                                isPending = false;
                              }),
                              value: Labels.positive,
                              color: AppColors.primaryColor.withOpacity(0.1),
                              borderColor: AppColors.primaryColor,
                              radius: 5,
                              isFill: isPositive,
                              style: MyFontStyle.regular(
                                  color: AppColors.primaryColor),
                            ),
                            10.width,
                            RadiusContainer(
                              onTap: () => setState(() {
                                preProcedureDataLab?.results = "pending";
                                isNegative = false;
                                isPositive = false;
                                isPending = true;
                              }),
                              value: Labels.pending,
                              color: AppColors.primaryColor.withOpacity(0.1),
                              borderColor: AppColors.primaryColor,
                              radius: 5,
                              isFill: isPending,
                              style: MyFontStyle.regular(
                                  color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  15.height,
                  Seperator(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.gray),
                  35.height,
                  ThemeButton(
                    height: 40,
                    width: 100,
                    onClick: () {
                      _submitProcedure();
                    },
                    radius: 10,
                    text: preProcedureDataList?.isEmpty == true
                        ? Labels.submit
                        : Labels.update,
                    textStyle: MyFontStyle.regular(color: AppColors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  bool getBoolValue(String? value) {
    switch (value) {
      case "yes":
        return true;
      case "no":
        return false;
      default:
        return false;
    }
  }

  void getArguments() {
    if (ModalRoute.of(context)!.settings.arguments != null && data == null) {
      data = ModalRoute.of(context)!.settings.arguments as Map;
      caseId = data?['caseId'];
      preProcedureDataList = data?['preProcedureData'];
      initData();
    }
  }

  void initData() {
    preProcedureDataLab = preProcedureDataList?[preProcedureDataList
            ?.indexWhere((element) => element.groupName == "Labs") ??
        0];
    preProcedureDataHistory = preProcedureDataList?[preProcedureDataList
            ?.indexWhere((element) => element.groupName == "History") ??
        0];

    if (preProcedureDataLab != null) {
      preProcedureDataLab?.bloodThinner?.forEach((element) {
        selectedBloodThinnerList.add(element.toLowerCase());
      });
      for (var bloodThinner in bloodThinnerList) {
        for (var element in selectedBloodThinnerList) {
          if (element.toLowerCase() == bloodThinner.title.toLowerCase()) {
            bloodThinner.value = true;
          }
        }
      }
      isDialysis = getBoolValue(preProcedureDataLab?.dialysis);
      isNephrectomy = getBoolValue(preProcedureDataLab?.historyNephrectomy);
      isNephrectomy = getBoolValue(preProcedureDataLab?.historyNephrectomy);
      isRenalTransplant =
          getBoolValue(preProcedureDataHistory?.renalTransplant);
      renalStatusApprovedByController.text =
          preProcedureDataHistory?.renalStatusApprovedBy ?? "";
      isPositive = preProcedureDataLab?.results == "positive";
      isNegative = preProcedureDataLab?.results == "negative";
      isPending = preProcedureDataLab?.results == "pending";
      otherController.text = preProcedureDataLab?.bloodThinnersOther ?? "";
      bloodCultureDateController.text =
          preProcedureDataLab?.bloodCultureDate != null
              ? formatDate(preProcedureDataLab?.bloodCultureDate ?? "",
                  inputFormat: "yyyy-MM-dd HH:MM:SS")
              : "";
    }
  }

  _submitProcedure() {
    removeFocus(context);
    Loading.show(context);
    ApiManger.instance.addOrUpdateProcedure(bodyData: {
      "params": {
        "case_id": caseId,
        "pre_procedure_data": {
          "blood_thinner": preProcedureDataLab?.bloodThinner,
          "blood_thinners_other": otherController.text.trim().toString(),
          "platelet_count": preProcedureDataLab?.plateletCount,
          "ptt_value": preProcedureDataLab?.pttValue,
          "creatinine": preProcedureDataLab?.creatinine,
          "dialysis": preProcedureDataLab?.dialysis,
          "history_nephrectomy": preProcedureDataLab?.historyNephrectomy,
          "wbc": preProcedureDataLab?.wbc,
          "results": preProcedureDataLab?.results,
          "inr": preProcedureDataLab?.inr,
          "pt": preProcedureDataLab?.pt,
          "bun": preProcedureDataLab?.bun,
          "gfr": preProcedureDataLab?.gfr,
          "renal_transplant": preProcedureDataHistory?.renalTransplant,
          "renal_status_approved_by":
              renalStatusApprovedByController.text.trim(),
          "blood_culture_date": formatDate(
              bloodCultureDateController.text.trim(),
              inputFormat: "dd-MM-yyyy",
              outputFormat: "yyyy-MM-dd")
        }
      }
    }).then(
      (Map res) async {
        Loading.hide();
        if (res['status']) {
          CustomToast.showToast(
              context: context,
              message: res['message'],
              toastType: ToastTypes.success);
          Navigator.pop(context, true);
        } else {
          CustomToast.showToast(
              context: context,
              message: res['message'],
              toastType: ToastTypes.error);
        }
      },
    );
  }
}
