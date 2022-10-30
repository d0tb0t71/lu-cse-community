import 'package:flutter/material.dart';
import 'package:lu_cse_community/provider/notice_provider.dart';
import 'package:provider/provider.dart';
import '../../public_widget/custom_app_bar.dart';
import '../../sign_in_sign_up/widgets/custom_button.dart';
import 'individual_notice_section.dart';

class AddNotice extends StatefulWidget {
  const AddNotice({Key? key}) : super(key: key);

  @override
  State<AddNotice> createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {


  @override
  Widget build(BuildContext context) {

    var pro = Provider.of<NoticeProvider>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: customAppBar("Create Notice", context),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return  IndividualNoticeSection(
                  pageName: index == 0 ? "For All Users" : index == 1 ? "For all Teachers" : index == 2 ? "For a Batch" : index == 3 ? "For a Section" : "For a Person" ,
                  //pageName: "For All Users",

                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
