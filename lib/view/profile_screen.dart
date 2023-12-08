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
  //Estados o controladores
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  late String _selectedImage;

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.user.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    final List userData = [
      {
        "controller": _nameController,
        "obscureText": false,
        "labelText": 'Usuario',
        "prefixIcon": Icons.account_circle,
      },
      {
        "controller": _lastnameController,
        "obscureText": false,
        "labelText": 'Apellido',
        "prefixIcon": Icons.group,
      },
      {
        "controller": _emailController,
        "obscureText": false,
        "labelText": 'Correo',
        "prefixIcon": Icons.email,
      },
      {
        "controller": _contrasenaController,
        "obscureText": true,
        "labelText": 'Contraseña',
        "prefixIcon": Icons.lock,
      },
    ];

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
                child: Builder(
                  builder: (context) {
                    return CustomList(
                      height: 300,
                        length: userData.length,
                        width: MediaQuery.of(context).size.width,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const SizedBox(height: 15,),
                              CustomTextFormField(
                                  controller: userData[index]['controller'],
                                  obscureText: userData[index]['obscureText'],
                                  labelText: userData[index]['labelText'],
                                  preIcon: userData[index]['prefixIcon']),
                            ],
                          );
                        },
                        axis: Axis.vertical);
                  }
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
                          text:
                              'Todos tus datos fueron actualizados con exito ${userData[0]['controller']}',
                          confirmBtnColor: Colors.teal);
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
