import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart'as http;
import '../config/custom_package.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({super.key});

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
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
      log('No image selected.');
    }

  }


  getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);


    if (pickedFile != null) {
      setState(() {
        profilePic = File(pickedFile.path);
      });
    } else {
      log('No image selected.');
    }

  }

  Future getImageLicenseFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      setState(() {
        licencePic = File(pickedFile.path);
      });

    } else {
      log('No image selected.');

    }


  }
  getImageLicenseFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);


    if (pickedFile != null) {
      setState(() {
        licencePic = File(pickedFile.path);
      });

    } else {
      log('No image selected.');
    }
  }
  @override
  void initState() {
    print('object');
    get();
  }
  get() async {
    print('object');

    SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    print(sharedPreferences.getString('token'));
// Replace 'YOUR_BEARER_TOKEN' with your actual Bearer Token
    var bearerToken=sharedPreferences.getString('token');

    try {
      var response = await http.get(Uri.parse('https://news.wasiljo.com/public/api/v1/manager/shops'),
        headers: {'Authorization': 'Bearer $bearerToken'},);
      if (response.statusCode == 200) {
        var resData = jsonDecode(response.body);
        print(resData);
        setState(() {
          mangerNameArabic.text=resData['data']['shop']['name_ar'];
          mangerNameEnglish.text=resData['data']['shop']['name_en'];


          profile.text=resData['data']['shop']['avatar_url'];
          print(profile.text);

        });

        print(resData['data']['manager']['email']);
        return resData;
      } else {
        print('Status Code ${response.statusCode}');
        throw Exception('Failed to fetch data');
      }
    }  catch (error) {
      // Handle network or other errors
      print('Error: $error');
    }
  }
  updateStatus()async{
    log("statrr");
    SharedPreferences prefs= await SharedPreferences.getInstance();
    var bearerToken=   prefs.getString('token');
    try{
      var response=await http.post(Uri.parse('https://news.wasiljo.com/public/api/v1/manager/update_profile'),
        body: {
          'shop[category_id]':'2',
        },

        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if(response.statusCode==200){
        print(response.body);
        log("done update status");
        setState(() {

        });
      }
      else{
        print(response.body);
      }
    }
    catch(e){
      print(e);
    }
  }
    updateProfile()async{
      log("statrr");
      SharedPreferences prefs= await SharedPreferences.getInstance();
      var bearerToken=   prefs.getString('token');
      print(mangerNameEnglish.text);
      try{
        var response=await http.post(Uri.parse('https://news.wasiljo.com/public/api/v1/manager/update_profile'),
          body: {
        'shop[distance]':distance.text,
        'manager[name][en]':mangerNameEnglish.text,
        'manager[name][ar]':mangerNameArabic.text,

          },

          headers: {'Authorization': 'Bearer $bearerToken'},
        );
        if(response.statusCode==200){
          print(response.body);
          log("done update status");
          Get.snackbar('done hidden', '',
              backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
              icon: const Icon(Icons.done_outline_rounded));
          setState(() {

          });
        }
        else{
          print(response.body);
        }
      }
      catch(e){
        print(e);
      }
    }







  TextEditingController mangerNameEnglish = TextEditingController();
  TextEditingController mangerNameArabic = TextEditingController();
  TextEditingController profile = TextEditingController();
  TextEditingController distance = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: CommonViews().getAppBar(title: ""),
body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
  const Padding(padding: EdgeInsets.only(top: 10)),

  Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          Translator.translate("Update Profile"),
          style: boldPrimary,
        ),
      ),
    ],
  ),
const SizedBox(height: 30,),
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              image:
                   DecorationImage(
                image: NetworkImage('https://news.wasiljo.com/${profile.text}'),
                fit: BoxFit.cover,
              )

            ),



          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showImagePicker(context);

            },
          ),
        ],
      ),



      CustomTextField(

        keyBoard: TextInputType.text,
        controller: mangerNameArabic,
        hintText: Translator.translate("Manger name in arabic"),
        prefixIconData:const Icon(Icons.perm_identity),
        onPrefixIconPress: () {
          setState(() {});
        },
      ),

      CustomTextField(

    keyBoard: TextInputType.text,
    controller: mangerNameEnglish,
   hintText: Translator.translate("Manger name in English"),
    prefixIconData: const Icon(Icons.perm_identity),
    onPrefixIconPress: () {
      setState(() {});
    },
  ),


  CustomTextField(

    keyBoard: TextInputType.number,
    controller: distance,
    hintText: Translator.translate("Distance"),
    prefixIconData:const Icon( Icons.horizontal_distribute_rounded),
    onPrefixIconPress: () {
      setState(() {});
    },
  ),
  const SizedBox(height: 20,),
  CommonViews().createButton(title: 'Update profile', onPressed: () {
    updateStatus();
  },)
]),
    ));
  }
}
