import 'package:flutter/material.dart';
import 'package:office/app_ui/provider/api_provider.dart';
import 'package:provider/provider.dart';

class CompectApidetail extends StatefulWidget {
  const CompectApidetail({Key? key}) : super(key: key);
  @override
  _CompectApidetailState createState() => _CompectApidetailState();
}

class _CompectApidetailState extends State<CompectApidetail> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second api'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Consumer<ApiFetchDataProvider>(builder: (_, compactapiDetail, __) {
              // ignore: unnecessary_null_comparison
              if (compactapiDetail == null) return CircularProgressIndicator();
              if (compactapiDetail.compactDetailApiDetail.isEmpty) return Center(child: CircularProgressIndicator());
              return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: compactapiDetail.compactDetailApiDetail.length,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: ListTile(
                      title: Text("Name:- ${compactapiDetail.compactDetailApiDetail[index].name}"),
                      subtitle: Text(
                          "Email:- ${compactapiDetail.compactDetailApiDetail[index].email}"),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
