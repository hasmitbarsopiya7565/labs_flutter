import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labs/screens/service/service_item.dart';
import 'package:labs/screens/service/service_model.dart';
import 'package:labs/utils/common.dart';
import 'package:labs/widgets/custom_toast.dart';
import '../../dialogs/loading.dart';
import '../../manager/rest/api_manager.dart';
import '../../navigation/routes.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  List<ServiceModel> serviceList = [];
  @override
  void initState() {
    if (getDeviceType() == "phone") {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      _getServices();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: serviceList.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.all(40),
                shrinkWrap: true,
                itemCount: serviceList[0].serviceRequests?.length,
                itemBuilder: (context, index) {
                  return ServiceItem(
                    serviceRequest: serviceList[0].serviceRequests?[index],
                    serviceList: serviceList,
                    viewDetails: () {
                      Navigator.pushNamed(context, Routes.serviceDetailsScreen,
                          arguments: {
                            "caseId":
                                serviceList[0].serviceRequests?[index].caseId,
                            "preProcedureData": serviceList[0]
                                .serviceRequests?[index]
                                .preProcedureData
                          }).then((isAdded) {
                        if (isAdded == true) {
                          _getServices();
                        }
                      });
                    },
                  );
                })
            : const SizedBox(),
      )),
    );
  }

  _getServices() async {
    Loading.show(context);
    serviceList = [];
    await ApiManger.instance.serviceStatus(bodyData: {
      "params": {
        "sr_status": ["assigned"],
        "date": "2023-09-12",
        "clinician_status": ["acknowledged", "pending_acknowledgement"]
      }
    }).then((Map res) {
      Loading.hide();
      if (res['status']) {
        serviceList = (res['data']['facilities'] as List)
            .map((e) => ServiceModel.fromJson(e))
            .toList();
      } else {
        CustomToast.showToast(
            context: context,
            message: res['message'],
            toastType: ToastTypes.error);
      }
    });
    setState(() {});
  }
}
