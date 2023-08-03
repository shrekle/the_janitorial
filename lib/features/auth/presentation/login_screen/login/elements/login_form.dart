import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_janitorial/common_widgets/textfield_widget.dart';
import 'package:the_janitorial/features/auth/presentation/login_screen/login/elements/build_primary_button.dart';
import 'package:the_janitorial/providers/auth_provider.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
//
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
//
    final authVM = ref.watch(authProvider);

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
//TEXTFIELDS
            TextfieldWidget(
              placeholder: 'email',
              validator: (value) {
                // refactor the validators into a diff file
                if (value == null ||
                    value.trim().isEmpty ||
                    !value.contains('@') ||
                    !value.contains('.')) {
                  return 'Enter a valid Email';
                }
                return null;
              },
              onSaved: (newValue) {
                authVM.email = newValue!;
              },
            ),

            const SizedBox(height: 10),

            TextfieldWidget(
              placeholder: 'password',
              isPassword: true,
              validator: (value) {
                //check out the password length in firebase, to check against it
                // refactor the validators into a diff file
                if (value == null || value.trim().isEmpty) {
                  return 'Enter a valid Password';
                }
                return null;
              },
              onSaved: (newValue) {
                authVM.password = newValue!;
              },
            ),

            const SizedBox(height: 20),
// BUTTONS
            BuildPrimaryButton(
              authVM: authVM,
              formKey: _formKey,
              text: 'Sign in',
            ),

            TextButton(
              onPressed: () {},
              child: const Text('Create An Account'),
            )
          ],
        ),
      ),
    );
  }
}



//  decoration: const InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       bottomRight: Radius.circular(10),
//                       topRight: Radius.circular(10),
//                       bottomLeft: Radius.circular(10)),
//                 ),
//               ),

// // TEXTFIELD 1
//           Container(
//             padding: const EdgeInsets.all(5),
//             margin: const EdgeInsets.only(left: 20, right: 20),
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(15),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   // spreadRadius: 3,
//                   blurRadius: 7,
//                   blurStyle: BlurStyle.outer,
//                 ),
//               ],
//             ),
//             child: TextFormField(
//               key: _formKey,
//               cursorColor: Theme.of(context).colorScheme.primary,
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
