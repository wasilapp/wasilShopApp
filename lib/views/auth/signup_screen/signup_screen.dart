
import 'package:sizer/sizer.dart';
import '../../../config/custom_package.dart';
import '../../../generated/l10n.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  List<String> errorMessages = [];
  String error = '';
   TextEditingController mobile=TextEditingController();
 TextEditingController emailTFController=TextEditingController();
   TextEditingController shopNameEnglish=TextEditingController();
   TextEditingController shopNameArabic=TextEditingController();
   TextEditingController mangerNameEnglish=TextEditingController();
   TextEditingController mangerNameArabic=TextEditingController();
  TextEditingController shopCategory = TextEditingController();
   TextEditingController passwordTFController=TextEditingController();
  TextEditingController profile = TextEditingController();
  TextEditingController licence = TextEditingController();
  TextEditingController confirm = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
   TextEditingController addressController=TextEditingController();
  int selectedCountryCode = 0;
  List<PopupMenuEntry<Object>>? countryList;
  List<dynamic> countryCode = TextUtils.countryCode;

  bool isInProgress = false;
  bool showPassword = false;
  String contryCode = "962";


  File? profilePic;
  final picker = ImagePicker();

  File? licencePic;
  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                          child: const Column(
                            children: [
                              Icon(
                                Icons.image,
                                size: 60.0,
                                color: primaryColor,
                              ),
                              SizedBox(height: 12.0),
                              Text(
                                "Gallery",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            getImageFromGallery();
                            Navigator.pop(context);
                          },
                        )),
                    Expanded(
                        child: InkWell(
                          child: const SizedBox(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 60.0,
                                  color: primaryColor,
                                ),
                                SizedBox(height: 12.0),
                                Text(
                                  "Camera",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            getImageFromCamera();
                            Navigator.pop(context);
                          },
                        ))
                  ],
                )),
          );
        });
  }

  void showImagePicker2(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                          child: const Column(
                            children: [
                              Icon(
                                Icons.image,
                                size: 60.0,
                                color: primaryColor,
                              ),
                              SizedBox(height: 12.0),
                              Text(
                                "Gallery",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            getImageLicenseFromGallery();
                            Navigator.pop(context);
                          },
                        )),
                    Expanded(
                        child: InkWell(
                          child: const SizedBox(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 60.0,
                                  color: primaryColor,
                                ),
                                SizedBox(height: 12.0),
                                Text(
                                  "Camera",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            getImageLicenseFromCamera();
                            Navigator.pop(context);
                          },
                        ))
                  ],
                )),
          );
        });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profilePic = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }

  }

  getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);


    if (pickedFile != null) {
      setState(() {
        profilePic = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }

  }

  Future getImageLicenseFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      setState(() {
        licencePic = File(pickedFile.path);
      });

    } else {
      print('No image selected.');

    }


  }
  getImageLicenseFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);


    if (pickedFile != null) {
      setState(() {
        licencePic = File(pickedFile.path);
      });

    } else {
      print('No image selected.');
    }
  }



  String address = '';

  @override
  void initState() {
    super.initState();

    emailTFController = TextEditingController();
    passwordTFController = TextEditingController();
    mobile = TextEditingController();
    shopNameEnglish = TextEditingController();
    shopNameArabic = TextEditingController();
    mangerNameArabic = TextEditingController();
    mangerNameEnglish = TextEditingController();
    addressController = TextEditingController();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Form(
        key: _formKey,
        child: ListView(

          children: <Widget>[
            SizedBox(height: 2.h,),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 20.0.w,
                height: 12.0.h,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: Text(
                    (S.of(context).signUp),
                    style: boldPrimary,
                  ),
                ),
              ],
            ),
            const SignupForm(),
    ])))
    );
  }


}

