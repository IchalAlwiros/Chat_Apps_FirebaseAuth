import 'package:cobacli/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  UserCredential? userCredential;

  Future<void> firstInitialized() async {
    await autoLogin().then((value) {
      if (value) {
        isAuth.value = true;
      }
    });

    await skipIntro().then((value) {
      if (value) {
        isSkipIntro.value = true;
      }
    });
    //Mengubah isAurh => true => autoLogin
    // try {
    //   final isSignIn = await _googleSignIn.isSignedIn();
    //   if (isSignIn) {
    //     isAuth.value = true;
    //   }
    // } catch (err) {
    //   print(err);
    // }

    //mengubah isSkipIntro => true
  }

  Future<bool> skipIntro() async {
    final box = GetStorage();
    if (box.read('skipIntro') != null || box.read('skipIntro') == true) {
      isSkipIntro.value = true;
    }
    return false;
  }

  Future<bool> autoLogin() async {
//kita akan mengubah isAuth => true => authoLogin
    try {
      final isSignIn = await _googleSignIn.isSignedIn();
      if (isSignIn) {
        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

  Future<void> login() async {
    try {
      // Ini untuk handle kebocoran data user sebelum login
      await _googleSignIn.signOut();

      //Ini digunakan untuk mendapatkan google account
      await _googleSignIn.signIn().then((value) => _currentUser = value);

      //ini untuk mengecek status ;pgin user
      final isSignin = await _googleSignIn.isSignedIn();

      if (isSignin) {
        // kondisi login berhasil
        print("SUDAH BERHASIL LOGIN DENGAN AKUN : ");
        print(_currentUser);

        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        // final userCredential =
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print("USER CREDENTIAL");
        print(userCredential);

        //Simpan status user bahwa sudah pernah login & tidak akan menammpilkan introduction
        final box = GetStorage();
        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }

        box.write('skipIntro', true);

        isAuth.value = true;
        Get.offAllNamed(Routes.HOME);
      } else {
        print("TIDAK BERHASIL LOGIN");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
