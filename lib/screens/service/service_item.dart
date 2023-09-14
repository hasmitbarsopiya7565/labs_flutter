import 'package:flutter/material.dart';
import 'package:labs/extensions/common_extensions.dart';
import 'package:labs/screens/service/service_model.dart';
import 'package:labs/utils/common.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_font_style.dart';
import '../../widgets/circular_fill_icon.dart';
import '../../widgets/icon_with_text.dart';
import '../../widgets/seperator.dart';
import '../../widgets/theme_button.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
    required this.serviceRequest,
    required this.serviceList,
    required this.viewDetails,
  });

  final ServiceRequest? serviceRequest;
  final List<ServiceModel> serviceList;
  final VoidCallback viewDetails;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${serviceRequest?.patient.name} ${serviceRequest?.patient.middleName} ${serviceRequest?.patient.lastName}, ${serviceRequest?.patient.age} Years",
                    style: MyFontStyle.bold(
                        fontSize: 16, color: AppColors.primaryColor),
                  ),
                  3.height,
                  Text(
                    serviceRequest?.caseId ?? "",
                    style: MyFontStyle.bold(
                        fontSize: 14, color: AppColors.primaryTextColor),
                  )
                ],
              ),
              Row(
                children: [
                  CircularFillIcon(
                    height: 38,
                    width: 38,
                    isShowShadow: false,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                    child: const Icon(
                      Icons.message,
                      size: 23,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  10.width,
                  Container(
                    height: 25,
                    width: 1,
                    color: AppColors.gray,
                  ),
                  10.width,
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.greenColor),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.punch_clock,
                          color: AppColors.white,
                          size: 15,
                        ),
                        10.width,
                        Text(
                          serviceRequest?.srEta ?? "",
                          style: MyFontStyle.regular(
                              color: AppColors.white, fontSize: 13),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          15.height,
          Seperator(
            color: AppColors.gray,
            height: 1,
            width: MediaQuery.of(context).size.width,
          ),
          15.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  children: [
                    IconWithText(
                      mainAxisAlignment: MainAxisAlignment.start,
                      icon: const Icon(Icons.calendar_month),
                      value:
                          "${formatDate(serviceRequest?.patient.dob ?? "", inputFormat: "yyyy-MM-dd HH:MM:ss", outputFormat: "dd")}${getDayOfMonthSuffix(int.parse(formatDate(serviceRequest?.patient.dob ?? "", inputFormat: "yyyy-MM-dd HH:MM:ss", outputFormat: "dd")))} ${formatDate(serviceRequest?.patient.dob ?? "", inputFormat: "yyyy-MM-dd HH:MM:ss", outputFormat: "MMM, yyyy")}",
                      textStyle: MyFontStyle.regular(
                          color: AppColors.secondaryTextColor, fontSize: 12),
                    ),
                    IconWithText(
                      mainAxisAlignment: MainAxisAlignment.start,
                      icon: const Icon(Icons.bed),
                      value: serviceRequest?.roomNo ?? "",
                      textStyle: MyFontStyle.regular(
                          color: AppColors.secondaryTextColor, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: List.generate(
                      (serviceRequest?.procedureDetails.length ?? 0),
                      (index) => IconWithText(
                            mainAxisAlignment: MainAxisAlignment.start,
                            icon: const Icon(Icons.file_present),
                            value:
                                serviceRequest?.procedureDetails[index].name ??
                                    "",
                            textStyle: MyFontStyle.regular(
                                color: AppColors.secondaryTextColor,
                                fontSize: 12),
                          )),
                ),
              ),
              Flexible(
                child: Column(
                  children: List.generate(
                      (serviceRequest?.clinicians.length ?? 0),
                      (index) => IconWithText(
                            mainAxisAlignment: MainAxisAlignment.start,
                            icon: const Icon(Icons.group),
                            value:
                                "${serviceRequest?.clinicians[index].name.capitalize()} - ${serviceRequest?.clinicians[index].role} -",
                            lable:
                                " ${serviceRequest?.clinicians[index].state == "pending_acknowledgement" ? "(Pending Ack.)" : ""}",
                            textStyle: MyFontStyle.regular(
                                color: AppColors.secondaryTextColor,
                                fontSize: 12),
                            labelStyle: MyFontStyle.regular(
                                color: AppColors.rejected, fontSize: 12),
                          )),
                ),
              ),
            ],
          ),
          15.height,
          Seperator(
            color: AppColors.gray,
            height: 1,
            width: MediaQuery.of(context).size.width,
          ),
          15.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: viewDetails,
                child: Text(
                  "View Details",
                  style: MyFontStyle.regular(
                      color: AppColors.resultBg, fontSize: 13),
                ),
              ),
              20.width,
              ThemeButton(
                height: 30,
                width: 180,
                onClick: () {},
                radius: 20,
                text:
                    " ${serviceRequest?.clinicians[0].state == "pending_acknowledgement" ? "Acknoledgment" : ""}",
                textStyle:
                    MyFontStyle.regular(color: AppColors.white, fontSize: 13),
              )
            ],
          )
        ],
      ),
    );
  }
}
