import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/config/utils.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/screens/login/login.dart';
import 'package:bethriftytoday/screens/settings/settings.dart';
import 'package:bethriftytoday/services/auth.dart';
import 'package:bethriftytoday/shared/thrifty/thrifty_logo.dart';
import 'package:bethriftytoday/shared/wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThriftyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return SafeArea(
      child: Column(
        children: <Widget>[
          DrawerHeader(user),
          SizedBox(height: 10),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, SettingsScreen.routeName);
            },
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          Divider(),
          ListTile(
            onTap: () async {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationIcon: ThriftyLogo(size: 80, isLight: true),
                applicationName: 'Be Thrifty Today',
                applicationLegalese:
                    'This application is open source and free-to-use, governed under the Apache License 2.0. If you are a developer, please feel free to contribute to the application on GitHub.',
                applicationVersion: await getVersionCode(),
                children: [
                  SizedBox(height: 30),
                  Text(
                    'If you love the app and use it regularly, please donate as little as you can, enough to keep the app alive and running on it\'s own. Donation details can be found on the GitHub homepage or the website. Thank you so much!',
                  ),
                ],
              );
            },
            leading: Icon(Icons.local_library),
            title: Text('About the App'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.rate_review),
            title: Text('Rate the App'),
          ),
          ListTile(
            onTap: () => logout(context),
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
          ),
          Spacer(),
          FutureBuilder(
            initialData: '',
            future: getVersionCode(),
            builder: (context, snapshot) {
              return Text(
                snapshot.data,
                style: Theme.of(context).textTheme.caption,
              );
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  logout(BuildContext context) {
    AuthService authService = AuthService();
    Navigator.pop(context);
    authService.signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
      (route) => false,
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader(this.user);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        width: double.infinity,
        height: 180,
        color: thriftyBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 45),
            Text(
              user?.name ?? '',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Text(
              user?.email ?? '',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      clipper: WaveClipper(),
    );
  }
}
