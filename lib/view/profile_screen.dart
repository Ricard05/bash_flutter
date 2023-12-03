import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bash/models/models.dart';
import 'package:flutter_bash/widgets/widgets.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
// ignore: depend_on_referenced_packages

class ProfileScreen extends StatefulWidget {
  final MyAppUser user;

  const ProfileScreen({super.key, required this.user});

  @override
  // ignore: library_private_types_in_public_api
  _UserProfileEditScreenState createState() => _UserProfileEditScreenState();
}

class _UserProfileEditScreenState extends State<ProfileScreen> {
  late String _selectedImage;
  final userData = {
      "name": "",
      "lastname": "",
      "email": "",
      "password": ""
  };

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.user.imageUrl;
    setState(() {
      userData["name"] = widget.user.name;
      userData["lastname"] = widget.user.lastname;
      userData["email"] = widget.user.email;
      userData["password"] = widget.user.password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Editar Perfil'),
      ),

      drawer: Nav(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: FadeIn(
                  duration: const Duration(seconds: 1),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: _selectedImage,
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 50,
                          backgroundImage: imageProvider,
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 1,
                        child: GestureDetector(
                          onTap: () {
                            _showImageSelectionMenu(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.teal.shade900,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                duration: const Duration(seconds: 1),
                child: Column(
                  children: [
      
                    //Nombre
                    TextFormField(
                      initialValue: userData['name'],
                      onChanged: (value) {
                        setState(() {
                          userData['name'] = value;
                        });
                      },
                      decoration: const InputDecoration(labelText: 'Nombre', prefixIcon: Icon(Icons.person)),
                    ),
      
                    SizedBox(height: 20,),
                    //Apellido
                    TextFormField(
                      initialValue: userData['lastname'],
                      onChanged: (value) {
                        setState(() {
                          userData['lastname'] = value;
                        });
                      },
                      decoration: const InputDecoration(labelText: 'Apellido', prefixIcon: Icon(Icons.group)),
                    ),
      
                    SizedBox(height: 20,),
                    //Apellido
                    TextFormField(
                      initialValue: userData['email'],
                      onChanged: (value) {
                        setState(() {
                          userData['email'] = value;
                        });
                      },
                      decoration: const InputDecoration(labelText: 'Correo', prefixIcon: Icon(Icons.email)),
                    ),
      
                    SizedBox(height: 20,),
                    //Apellido
                    TextFormField(
                      initialValue: userData['password'],
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          userData['password'] = value;
                        });
                      },
                      decoration: const InputDecoration(labelText: 'Contraseña', prefixIcon: Icon(Icons.lock), suffixIcon: Icon(Icons.visibility)),
                    ),
      
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                duration: const Duration(seconds: 1),
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        title: 'Datos actualizados',
                        text: 'Todos tus datos fueron actualizados con exito ${userData['name']}',
                        confirmBtnColor: Colors.teal
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Guardar Cambios'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showImageSelectionMenu(BuildContext context) {
    final List<String> imageOptions = [
      'https://robohash.org/bash1',
      'https://robohash.org/bash2',
      'https://robohash.org/bash3',
      'https://robohash.org/bash4',
      'https://robohash.org/bash5',
    ];

    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, 100, 0, 0),
      items: imageOptions.map((String imageUrl) {
        return PopupMenuItem<String>(
          value: imageUrl,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: 50,
            height: 50,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      }).toList(),
    ).then((selectedImage) {
      if (selectedImage != null) {
        setState(() {
          _selectedImage = selectedImage;
        });
      }
    });
  }
}
