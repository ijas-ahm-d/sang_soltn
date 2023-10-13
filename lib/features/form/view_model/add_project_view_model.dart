import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sang/features/form/components/simple_dialog.dart';
import 'package:sang/features/form/model/employee_model.dart';
import 'package:sang/features/form/model/hse_observation_model.dart';
import 'package:sang/features/form/model/project_description_model.dart';
import 'package:sang/features/form/model/project_name_model.dart';
import 'package:sang/features/form/repository/employee_repository.dart';
import 'package:sang/features/form/repository/hse_observation_repository.dart';
import 'package:sang/features/form/repository/project_name_repository.dart';
import 'package:sang/res/app_url.dart';
import 'package:sang/utils/routes/routes_name.dart';
import 'package:signature/signature.dart';

class AddProjectViewModel extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignatureController signatureController = SignatureController();
  TextEditingController dateController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locController = TextEditingController();
  TextEditingController actionByController = TextEditingController();
  TextEditingController employeeCodeController = TextEditingController();
  TextEditingController observationsController = TextEditingController();
  TextEditingController actionRequiredController = TextEditingController();
  TextEditingController targetDateController = TextEditingController();

  final _myrepo = ProjectNameRepository();
  final _postRepo = HseObservationRepository();
  final _employeRepo = EmployeeRepository();

  File? _projectImage;
  File? get projectImage => _projectImage;

  Uint8List? _signatureData;
  Uint8List? get signatureData => _signatureData;

  final List<Body> _subformList = [];
  List<Body> get subFormList => _subformList;

  String? imgUrl;
  int? _projectId;

  String? _signString;
  String? get signString => _signString;

  int? _selectedRiskLevel;
  int? get selectedRiskLevel => _selectedRiskLevel;

  ProjectNameModel _projectModel = ProjectNameModel();
  ProjectNameModel get projectModel => _projectModel;

  EmployeeModel _employeeModel = EmployeeModel();
  EmployeeModel get employeeModel => _employeeModel;

  List<dynamic> _employeeSuggestions = [];
  List<dynamic> get employeeSuggestions => _employeeSuggestions;

  List<dynamic> _projectSuggestions = [];
  List<dynamic> get projectSuggestion => _projectSuggestions;

  final List<String> _namesList = [];
  List<String> get namesList => _namesList;

  final List<String> _employeeList = [];
  List<String> get employeeList => _employeeList;

  setImage(File? img) {
    _projectImage = img;
    notifyListeners();
  }

  setSignature(Uint8List? data) {
    _signatureData = data;

    notifyListeners();
  }

  setSignString(String? data) {
    _signString = data;
    notifyListeners();
  }

  setProjectId(int id) {
    _projectId = id;
    notifyListeners();
  }

  setRisklevel(int val) {
    _selectedRiskLevel = val;
    notifyListeners();
  }

  setDescription(ProjectDescriptionModel desc) {
    List<dynamic> descriptionList = jsonDecode(desc.resultData!);
    for (var element in descriptionList) {
      descriptionController.text = (element['sDescription']);
    }
  }

  getEmployeeCode(String suggestion) {
    actionByController.text = suggestion;
    for (var item in _employeeSuggestions) {
      if (item['sName'] == suggestion) {
        employeeCodeController.text = item['sCode'];
      }
    }
  }

  getiIdForSuggestion(String suggestion) {
    projectNameController.text = suggestion;
    for (var item in _projectSuggestions) {
      if (item['sName'] == suggestion) {
        getDescription(item['iId'].toString());
        setProjectId(item['iId']);
      }
    }
  }

  setProjectName() {
    if (_projectModel.resultData != null) {
      _projectSuggestions = jsonDecode(_projectModel.resultData!);
    }

    for (var suggestion in _projectSuggestions) {
      _namesList.add(suggestion['sName']);
    }
  }

  setEmployeeName() {
    if (_employeeModel.resultData != null) {
      _employeeSuggestions = jsonDecode(_employeeModel.resultData!);
    }

    for (var suggestion in _employeeSuggestions) {
      _employeeList.add(suggestion['sName']);
    }
  }

  void setAllProjects(ProjectNameModel response) {
    _projectModel = response;
    notifyListeners();
  }

  setAllEmployees(EmployeeModel response) {
    _employeeModel = response;
    notifyListeners();
  }

  void setDate() {
    targetDateController = dateController = TextEditingController(
      text: DateFormat('dd-MM-yyyy').format(
        DateTime.now(),
      ),
    );
  }

  Future getAllProjects() async {
    const url = AppUrl.baseUrl + AppUrl.projects;
    log("111111");
    _myrepo.getAllProjects(url).then((response) {
      log("VIEW MODEL");
      setAllProjects(response as ProjectNameModel);
    }).onError((error, stackTrace) {
      log("^^^");
    });
  }

  Future getAllEmployees() async {
    const url = AppUrl.baseUrl + AppUrl.employee;
    _employeRepo.getAllEmployees(url).then((value) {
      setAllEmployees(value as EmployeeModel);
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }

  clearFields() {
    setImage(null);
    imgUrl = "";
    _selectedRiskLevel = null;
    // targetDateController.clear();
    observationsController.clear();
    actionRequiredController.clear();
    actionByController.clear();
    employeeCodeController.clear();
  }

  Future getDescription(String id) async {
    log("#####$id#####");
    final url = AppUrl.baseUrl + AppUrl.description + id;
    log(url);
    _myrepo.getDescription(url).then((value) {
      setDescription(value);
    });
  }

  submitForm(BuildContext context) async {
    const url = AppUrl.baseUrl + AppUrl.post;
    _postRepo.submitForm(url: url, body: formDataBody()).then((value) {
      showSuccessDialog(context);
      Navigator.pushNamed(context, RoutesNames.hseFormScreen);
    });
  }

  Map<String, dynamic> formDataBody() {
    final body = HseObservationModel(
      body: _subformList,
      docDate: DateTime.now(),
      iTransId: 4227,
      location: locController.text,
      project: _projectId,
      projectDes: descriptionController.text,
      signature: _signString,
      userId: 3,
    );
    return body.toJson();
  }

  onSubFormSubmit() {
    Body model = Body(
      observation: observationsController.text,
      actionBy: 1234,
      actionReq: actionRequiredController.text,
      images: imgUrl ?? "",
      riskLevel: _selectedRiskLevel,
      targetDate: DateTime.now(),
    );
    _subformList.add(model);

    notifyListeners();
  }

  final cloudinary = Cloudinary.signedConfig(
      apiKey: AppUrl.cloudApikey,
      apiSecret: AppUrl.cloudApiSecret,
      cloudName: AppUrl.cloudName);

  pickImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    File? projectImg;

    if (img != null) {
      log("image on cloudinary");
      projectImg = File(img.path);
      setImage(projectImg);

      CloudinaryResponse response = await cloudinary.upload(
        file: projectImg.path,
        fileBytes: projectImg.readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
      );

      if (response.isSuccessful) {
        imgUrl = response.secureUrl.toString();
        log(imgUrl.toString());
      }
    }
  }

  signatureOnCloud() async {
    CloudinaryResponse response = await cloudinary.upload(
      fileBytes: _signatureData,
      resourceType: CloudinaryResourceType.image,
    );
    setSignString(response.secureUrl.toString());
  }
}
