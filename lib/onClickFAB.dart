import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class OnClickFAB extends StatefulWidget {
  @override
  _OnClickFABState createState() => _OnClickFABState();
}

class _OnClickFABState extends State<OnClickFAB> {
  File _image;
  Future<File> imageFile;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
          );
        } else if (snapshot.error != null) {
          return Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return Text(
            'No Images Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  String title = "";
  String desc = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Stack(children: <Widget>[
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 2.6, bottom: 8),
              child: Image.asset(
                'images/app_bar_icon.png',
                scale: 1.5,
              ),
            ),
            left: -32,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '!Found',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ]),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Color(0xFF57606F),
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: <Widget>[ Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Add Items',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height / 4.5,
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                              color: Color(0x802D3E50),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: _image == null
                                ? Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      child: Stack(
                                        children: <Widget>[
                                          showImage(),
                                        ],
                                      ),
                                    ),
                                  )
                                : Image.file(_image)),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RawMaterialButton(
                                  fillColor: Color(0xFF2D3E50),
                                  constraints: BoxConstraints(
                                    minWidth: MediaQuery.of(context).size.width / 3,
                                    minHeight: 50,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(8.0)),
                                  child: Text('Capture Picture',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),),
                                  onPressed: getImage,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                RawMaterialButton(
                                  fillColor: Color(0xFF2D3E50),
                                  constraints: BoxConstraints(
                                    minWidth: MediaQuery.of(context)
                                        .size
                                        .width /
                                        3,
                                    minHeight: 50,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(
                                          8.0)),
                                  child: Text(
                                      'Add Picture',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  onPressed: () {
                                    pickImageFromGallery(
                                        ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextField(
                            maxLength: 40,
                            onChanged: (text) {
                              title = text;
                            },
                            decoration: InputDecoration(
                              labelText: 'Object',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextField(
                            maxLines: 6,
                            focusNode: myFocusNode,
                            onChanged: (text) {
                              desc = text;
                            },
                            decoration: InputDecoration(
                              hintText: 'Description',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RawMaterialButton(
                          fillColor: Colors.green,
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width / 2.5,
                            minHeight: 50,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0)),
                          onPressed: () {},
                          child: Text(
                            'Done',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ],
                ),
              ),
            ),
          ],
        ),
    ),);
  }
}
