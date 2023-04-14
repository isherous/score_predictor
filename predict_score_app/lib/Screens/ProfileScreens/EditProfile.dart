import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:predict_score_app/Constants/colors.dart';
import 'package:predict_score_app/Constants/values.dart';
import 'package:predict_score_app/Providers/AuthProvider.dart';
import 'package:predict_score_app/Providers/MainProvider.dart';
import 'package:predict_score_app/Scaffolds/BackButtonScaffold.dart';
import 'package:predict_score_app/Services/CommonServices.dart';
import 'package:predict_score_app/Widgets/TextFields/TextFieldWidget.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../Constants/styles.dart';
import '../../Widgets/TextFields/UnderlineTextField.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  static const id = "edit_profile_screen";

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _commonServices = CommonServices();

  TextEditingController nameController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController youtubeController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  XFile? imagePicked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    twitterController.dispose();
    instagramController.dispose();
    youtubeController.dispose();
  }

  ///Image Shown
  imageWidget() {
    ///When an image is selected
    if (imagePicked != null) {
      File image = File(imagePicked!.path);
      return Container(
        width: 114,
        height: 114,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: kDarkBlue.withOpacity(0.1),
            width: 8,
          ),
          image: DecorationImage(
            image: FileImage(image),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    // ///User Image Stored in Firebase
    // else if (widget.userClass.image != null) {
    //   return Container(
    //     width: 114,
    //     height: 114,
    //     decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       border: Border.all(
    //         color: kPurpleLight.withOpacity(0.1),
    //         width: 8,
    //       ),
    //       image: DecorationImage(
    //         image: CachedNetworkImageProvider(widget.userClass.image!),
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //   );
    // }

    ///Default Image Icon
    else {
      return Container(
        width: 114,
        height: 114,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kDarkBlue,
          border: Border.all(
            color: kBorderBlack.withOpacity(0.3),
            width: 4,
          ),
        ),
        child: Center(child: SvgPicture.asset(kProfileSVG, height: 24)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = Provider.of<MainProvider>(context);
    MainProvider mainProviderFalse =
        Provider.of<MainProvider>(context, listen: false);

    AuthProvider authProviderFalse =
        Provider.of<AuthProvider>(context, listen: false);

    return BackButtonScaffold(
      title: "Edit Profile",

      ///Save FAB Button
      fab: FloatingActionButton.extended(
        backgroundColor: kDarkBlue,
        onPressed: () async {
          // ///Name and its validation
          // String name = nameController.text.trim();
          // if (name.isEmpty) {
          //   _commonServices.showToast(
          //       text: "Please fill your name", context: context);
          //   return;
          // }
          //
          // mainProviderFalse.changeShowProgress(true);
          //
          // ///Social Links
          // String twitter = twitterController.text.trim();
          // String instagram = instagramController.text.trim();
          // String youtube = youtubeController.text.trim();
          //
          // ///Updating the UserClass
          // UserClass newUserClass = widget.userClass;
          // newUserClass.name = _name;
          // newUserClass.socialLinks = {
          //   "twitter": _twitter,
          //   "instagram": _instagram,
          //   "youtube": _youtube,
          // };
          //
          // ///Uploading the image
          // if (imagePicked != null) {
          //   bool _result = await _storageServices.uploadUserImage(imagePicked!);
          //
          //   ///If image cannot be uploaded
          //   if (!_result) {
          //     _commonServices.showToast(
          //         text: "There was an error uploading the image",
          //         context: context);
          //   }
          // }
          //
          // ///Updating the user display name
          // await authProviderFalse.updateDisplayNameOfUser(_name);
          //
          //
          // ///Updating Profile
          // bool result = await _databaseServices.updateProfile(newUserClass);
          // mainProviderFalse.changeShowProgress(false);
          //
          // ///If Profile is successfully updated
          // if (result) {
          //   Navigator.pop(context);
          // }
          //
          // ///If profile fails to update
          // else {
          //   _commonServices.showToast(
          //       text: "There was an error updating your profile",
          //       context: context);
          // }
        },
        label: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text("Save", style: k15Medium),
        ),
      ),

      ///Main Screen
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 32),

            ///Image
            Center(
              child: InkWell(
                onTap: () async {
                  ///Mixpanel
                  // _mixpanelServices.trackTapOnScreen(
                  //     widgetName: "Profile Picture",
                  //     screenName: "Edit Profile");

                  ///Checking if Photos permission is enabled
                  PermissionStatus status = await Permission.photos.status;
                  if (status.isRestricted || status.isPermanentlyDenied) {
                    await openAppSettings();
                    return;
                  }

                  ///Setting the image
                  imagePicked =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                child: imageWidget(),
              ),
            ),
            const SizedBox(height: 15),

            ///Select an Image
            Center(
              child: InkWell(
                onTap: () async {
                  ///Mixpanel
                  // _mixpanelServices.trackTapOnScreen(
                  //     widgetName: "Select an image", screenName: "Edit Profile");

                  ///Selecting an image
                  ///Checking if Photos permission is enabled
                  PermissionStatus _status = await Permission.photos.status;
                  if (_status.isRestricted || _status.isPermanentlyDenied) {
                    await openAppSettings();
                    return;
                  }

                  ///Setting the image
                  imagePicked =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: kWhite,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Text(
                    "Select an image",
                    style: k16Medium,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 48),

            ///Name
            TextFieldWidget(
              labelText: "Name",
              hintText: "Enter your name",
            ),
            const SizedBox(height: 40),

            ///Connect
            Text("Connect your social media handles", style: k16Medium),
            const SizedBox(height: 12),

            ///Twitter
            Row(
              children: [
                ///Twitter Icon
                const Icon(
                  FontAwesomeIcons.twitter,
                  color: kWhite,
                  size: 18,
                ),
                const SizedBox(width: 18),

                ///Twitter.com
                Text(
                  "twitter.com/",
                  style: k13Medium.copyWith(
                    color: kWhite.withOpacity(0.7),
                  ),
                ),
                const SizedBox(width: 24),

                ///Username
                Expanded(
                  child: UnderlineTextField(
                    hint: "username",
                    controller: twitterController,
                  ),
                )
              ],
            ),

            const SizedBox(height: 6),

            ///Instagram
            Row(
              children: [
                ///Instagram Icon
                Icon(
                  FontAwesomeIcons.instagram,
                  color: kWhite,
                  size: 18,
                ),
                SizedBox(width: 18),

                ///instagram.com
                Text(
                  "instagram.com/",
                  style: k13Medium.copyWith(
                    color: kWhite.withOpacity(0.7),
                  ),
                ),
                SizedBox(width: 6),

                ///username
                Expanded(
                  child: UnderlineTextField(
                    hint: "username",
                    controller: instagramController,
                  ),
                )
              ],
            ),

            const SizedBox(height: 6),

            ///Youtube
            Row(
              children: [
                ///Youtube Icon
                Icon(
                  FontAwesomeIcons.youtube,
                  color: kWhite,
                  size: 18,
                ),
                SizedBox(width: 18),

                ///youtube.com
                Text(
                  "youtube.com/@",
                  style: k13Medium.copyWith(
                    color: kWhite.withOpacity(0.7),
                  ),
                ),
                SizedBox(width: 6),

                ///username
                Expanded(
                  child: UnderlineTextField(
                    hint: "username",
                    controller: youtubeController,
                  ),
                )
              ],
            ),
            const SizedBox(height: 104),
          ],
        ),
      ),
    );
  }
}
