import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'auth.signInButton': 'Sign In',
          'auth.signUpButton': 'Sign Up',
          'auth.resetPasswordButton': 'Send Password Reset',
          'auth.emailFormField': 'Email',
          'auth.passwordFormField': 'Password',
          'auth.nameFormField': 'Name',
          'auth.signInErrorTitle': 'Sign In Error',
          'auth.signInError': 'Login failed: email or password incorrect.',
          'auth.resetPasswordLabelButton': 'Forgot password?',
          'auth.signUpLabelButton': 'Create an Account',
          'auth.signUpErrorTitle': 'Sign Up Failed.',
          'auth.signUpError':
              'There was a problem signing up.  Please try again later.',
          'auth.signInLabelButton': 'Have an Account? Sign In.',
          'auth.resetPasswordNoticeTitle': 'Password Reset Email Sent',
          'auth.resetPasswordNotice':
              'Check your email and follow the instructions to reset your password.',
          'auth.resetPasswordFailed': 'Password Reset Email Failed',
          'auth.signInonResetPasswordLabelButton': 'Sign In',
          'auth.updateUser': 'Update Profile',
          'auth.updateUserSuccessNoticeTitle': 'User Updated',
          'auth.updateUserSuccessNotice':
              'User information successfully updated.',
          'auth.updateUserEmailInUse':
              'That email address already has an account.',
          'auth.updateUserFailNotice': 'Failed to update user',
          'auth.enterPassword': 'Enter your password',
          'auth.cancel': 'Cancel',
          'auth.submit': 'Submit',
          'auth.changePasswordLabelButton': 'Change Password',
          'auth.resetPasswordTitle': 'Reset Password',
          'auth.updateProfileTitle': 'Update Profile',
          'auth.wrongPasswordNoticeTitle': 'Login Failed',
          'auth.wrongPasswordNotice':
              'The password does not match our records.',
          'auth.unknownError': 'Unknown Error',
          'settings.title': 'Settings',
          'settings.language': 'Language',
          'settings.theme': 'Theme',
          'settings.signOut': 'Sign Out',
          'settings.dark': 'Dark',
          'settings.light': 'Light',
          'settings.system': 'System',
          'settings.updateProfile': 'Update Profile',
          'home.title': 'Home',
          'home.nameLabel': 'Name',
          'home.uidLabel': 'UID',
          'home.emailLabel': 'Email',
          'home.adminUserLabel': 'Admin User',
          'app.title': 'Flutter Starter Project',
          'validator.email': 'Please enter a valid email address.',
          'validator.password': 'Password must be at least 6 characters.',
          'validator.name': 'Please enter a name.',
          'validator.number': 'Please enter a number.',
          'validator.notEmpty': 'This is a required field.',
          'validator.amount':
              'Please enter a number i.e. 250 - no dollar symbol and no cents',
          'barcode.scan': 'Boarding Pass Scan'
        },
        'es': {
          'auth.signInButton': 'Iniciar sesión',
          'auth.signUpButton': 'Inscribirse',
          'auth.resetPasswordButton': 'Enviar restablecimiento de contraseña',
          'auth.emailFormField': 'Correo electrónico',
          'auth.passwordFormField': 'Contraseña',
          'auth.nameFormField': 'Nombre',
          'auth.signInErrorTitle': 'Error al iniciar sesión',
          'auth.signInError':
              'La conexión falló: correo electrónico o contraseña incorrecta.',
          'auth.resetPasswordLabelButton': '¿Se te olvidó tu contraseña?',
          'auth.signUpLabelButton': 'Crea una cuenta',
          'auth.signUpErrorTitle': 'Registro fallido.',
          'auth.signUpError':
              'Hubo un problema al inscribirse. Por favor, inténtelo de nuevo más tarde.',
          'auth.signInLabelButton': '¿Tener una cuenta? Iniciar sesión.',
          'auth.resetPasswordNoticeTitle':
              'Restablecer contraseña de correo electrónico enviados',
          'auth.resetPasswordNotice':
              'Consultar su correo electrónico y siga las instrucciones para restablecer su contraseña.',
          'auth.resetPasswordFailed':
              'Restablecer contraseña de correo electrónico incorrecto',
          'auth.signInonResetPasswordLabelButton': 'Iniciar sesión',
          'auth.updateUser': 'Actualización del perfil',
          'auth.updateUserSuccessNoticeTitle': 'Actualización de usuario',
          'auth.updateUserSuccessNotice':
              'La información de usuario actualizada correctamente.',
          'auth.updateUserEmailInUse':
              'Esa dirección de correo electrónico ya tiene una cuenta.',
          'auth.updateUserFailNotice': 'Error al usuario la actualización',
          'auth.enterPassword': 'Ingresa tu contraseña',
          'auth.cancel': 'Cancelar',
          'auth.submit': 'Enviar',
          'auth.changePasswordLabelButton': 'Cambiar la contraseña',
          'auth.resetPasswordTitle': 'Restablecer la contraseña',
          'auth.updateProfileTitle': 'Actualización del perfil',
          'auth.wrongPasswordNoticeTitle': 'Error de inicio de sesion',
          'auth.wrongPasswordNotice':
              'La contraseña no coincide con nuestros registros.',
          'auth.unknownError': 'Error desconocido',
          'settings.title': 'Ajustes',
          'settings.language': 'Idioma',
          'settings.theme': 'Tema',
          'settings.signOut': 'Desconectar',
          'settings.dark': 'Oscuro',
          'settings.light': 'Luz',
          'settings.system': 'Sistema',
          'settings.updateProfile': 'Actualización del perfil',
          'home.title': 'Casa',
          'home.nameLabel': 'Nombre',
          'home.uidLabel': 'UID',
          'home.emailLabel': 'Correo electrónico',
          'home.adminUserLabel': 'admin User',
          'app.title': 'Proyecto de arranque aleteo',
          'validator.email':
              'Por favor, introduce una dirección de correo electrónico válida.',
          'validator.password':
              'La contraseña debe tener al menos 6 caracteres.',
          'validator.name': 'Por favor, introduzca un nombre.',
          'validator.number': 'Por favor, introduzca un número.',
          'validator.notEmpty': 'Este es un campo obligatorio.',
          'validator.amount':
              'Por favor, introduzca un número, es decir 250 - ningún símbolo del dólar y sin centavos',
          'barcode.scan': 'Boarding Pass Scan'
        },
      };
}
