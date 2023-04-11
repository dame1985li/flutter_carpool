import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ja', 'en', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? jaText = '',
    String? enText = '',
    String? zh_HansText = '',
  }) =>
      [jaText, enText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'hjj1xrdu': {
      'ja': 'メールアドレス',
      'en': 'mail address',
      'zh_Hans': '邮件地址',
    },
    'en47izbh': {
      'ja': 'メールアドレス',
      'en': 'mail address',
      'zh_Hans': '邮件地址',
    },
    'aj1wwqpy': {
      'ja': 'パスワード',
      'en': 'password',
      'zh_Hans': '密码',
    },
    'o2e7bqjp': {
      'ja': 'パスワード',
      'en': 'password',
      'zh_Hans': '密码',
    },
    'j74asd35': {
      'ja': 'ログイン',
      'en': 'login',
      'zh_Hans': '登录',
    },
    '3dc3f6ro': {
      'ja': 'アカウント持ってない?',
      'en': 'Don\'t have an account?',
      'zh_Hans': '没有帐户？',
    },
    'pqruce81': {
      'ja': 'アカウント作成',
      'en': 'Create Account',
      'zh_Hans': '创建账户',
    },
    'rdzjaarj': {
      'ja': 'パスワード忘れた?',
      'en': 'Forgot Password?',
      'zh_Hans': '忘记密码？',
    },
    'kh43te36': {
      'ja': 'ゲスト',
      'en': 'Continue as Guest',
      'zh_Hans': '以访客继续',
    },
    's5ezc31x': {
      'ja': 'ホーム',
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // Register
  {
    's6l3okkg': {
      'ja': 'Email Address',
      'en': 'Email address',
      'zh_Hans': '电子邮件地址',
    },
    'fhmdmwlv': {
      'ja': 'Email Address',
      'en': 'Email address',
      'zh_Hans': '电子邮件地址',
    },
    '38ak57o1': {
      'ja': 'Choose Password',
      'en': 'Choose Password',
      'zh_Hans': '选择密码',
    },
    'p5y17yif': {
      'ja': 'Choose Password',
      'en': 'Choose Password',
      'zh_Hans': '选择密码',
    },
    'dq4p83ic': {
      'ja': 'Confirm Password',
      'en': 'Confirm Password',
      'zh_Hans': '确认密码',
    },
    '6wx8vvpb': {
      'ja': 'Confirm Password',
      'en': 'Confirm Password',
      'zh_Hans': '确认密码',
    },
    '1sal3kj9': {
      'ja': 'Create Account',
      'en': 'Create Account',
      'zh_Hans': '创建账户',
    },
    'uw6lr3oj': {
      'ja': 'Already have an account?',
      'en': 'Already have an account?',
      'zh_Hans': '已有帐户？',
    },
    '9qoe7ajl': {
      'ja': 'Login',
      'en': 'Login',
      'zh_Hans': '登录',
    },
    '7rnjylyk': {
      'ja': 'Continue as Guest',
      'en': 'Continue as Guest',
      'zh_Hans': '以访客继续',
    },
    'j3s381wj': {
      'ja': 'Home',
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // MyFriends
  {
    'ynlpmdrv': {
      'ja': 'My Team',
      'en': 'My Team',
      'zh_Hans': '我的团队',
    },
    'hpwnjz10': {
      'ja': 'My Friends',
      'en': 'My Friends',
      'zh_Hans': '我的朋友',
    },
  },
  // completeProfile
  {
    'mjivtdyx': {
      'ja': 'Complete Profile',
      'en': 'Complete Profile',
      'zh_Hans': '完整资料',
    },
    'gdeg4ysm': {
      'ja': 'Image URL',
      'en': 'Image URL',
      'zh_Hans': '图片网址',
    },
    '0dq4qx0m': {
      'ja': 'Copy an avatar here...',
      'en': 'Copy an avatar here...',
      'zh_Hans': '在这里复制头像...',
    },
    'exgfog0p': {
      'ja': 'Your Name',
      'en': 'Your Name',
      'zh_Hans': '你的名字',
    },
    'hz90n37j': {
      'ja': 'What name do you go by?',
      'en': 'What name do you go by?',
      'zh_Hans': '你叫什么名字？',
    },
    'lyvnoeo0': {
      'ja': 'Your Title',
      'en': 'Your Title',
      'zh_Hans': '你的题目',
    },
    'kh8j1y38': {
      'ja': 'What do you do?',
      'en': 'What do you do?',
      'zh_Hans': '你做什么工作？',
    },
    'qklozu0o': {
      'ja': 'Save Profile',
      'en': 'Save Profile',
      'zh_Hans': '保存个人信息',
    },
    '0x42s6fs': {
      'ja': 'Home',
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // forgotPassword
  {
    'ahxrlmpr': {
      'ja': 'Forgot Password',
      'en': 'Forgot Password',
      'zh_Hans': '忘记密码',
    },
    'm9j4bap6': {
      'ja': 'Your Email Address',
      'en': 'Your Email Address',
      'zh_Hans': '您的电子邮件地址',
    },
    '6mjakzne': {
      'ja': 'Please enter a email...',
      'en': 'Please enter an email...',
      'zh_Hans': '请输入电子邮件...',
    },
    'ienxggso': {
      'ja': 'Send Reset Link',
      'en': 'Send Reset Link',
      'zh_Hans': '发送重置链接',
    },
    '3o4mwws4': {
      'ja': 'Home',
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // chatDetails
  {
    'cnv863ii': {
      'ja': 'Job Title',
      'en': 'Job Title',
      'zh_Hans': '职称',
    },
    'w6yinjki': {
      'ja': 'Employed Since',
      'en': 'Employed Since',
      'zh_Hans': '从业时间',
    },
    'c8w488n0': {
      'ja': 'Home',
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // chatMain
  {
    'f4845orx': {
      'ja': 'All Chats',
      'en': 'All Chats',
      'zh_Hans': '所有聊天记录',
    },
  },
  // changePassword
  {
    '0qu9sg5g': {
      'ja': 'Change Password',
      'en': 'Change Password',
      'zh_Hans': '更改密码',
    },
    '9977w5ht': {
      'ja': 'Your Email Address',
      'en': 'Your Email Address',
      'zh_Hans': '您的电子邮件地址',
    },
    '5llfq4gk': {
      'ja': 'Please enter a email...',
      'en': 'Please enter an email...',
      'zh_Hans': '请输入电子邮件...',
    },
    '9wwazr8v': {
      'ja': 'Send Reset Link',
      'en': 'Send Reset Link',
      'zh_Hans': '发送重置链接',
    },
    'zzesuwr7': {
      'ja': 'Home',
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // myProfile
  {
    'f9x3nzd6': {
      'ja': 'Switch to Dark Mode',
      'en': 'Switch to Dark Mode',
      'zh_Hans': '切换到深色模式',
    },
    'i0kc3qgk': {
      'ja': 'Switch to Light Mode',
      'en': 'Switch to Light Mode',
      'zh_Hans': '切换到灯光模式',
    },
    'fqiakyvt': {
      'ja': 'Account Settings',
      'en': 'Account Settings',
      'zh_Hans': '帐号设定',
    },
    'zofgy95y': {
      'ja': 'Edit Profile',
      'en': 'Edit Profile',
      'zh_Hans': '编辑个人资料',
    },
    '9luntnxa': {
      'ja': 'Change Password',
      'en': 'Change Password',
      'zh_Hans': '更改密码',
    },
    '676k3v1a': {
      'ja': 'Log Out',
      'en': 'Log Out',
      'zh_Hans': '登出',
    },
  },
  // editProfile
  {
    '0np90qdu': {
      'ja': 'Edit Profile',
      'en': 'Edit Profile',
      'zh_Hans': '编辑个人资料',
    },
    '0kos0qri': {
      'ja': 'Email Address',
      'en': 'Email address',
      'zh_Hans': '电子邮件地址',
    },
    'wnamd5pu': {
      'ja': 'Full Name',
      'en': 'Full Name',
      'zh_Hans': '全名',
    },
    '5l7tpt8u': {
      'ja': 'Job Title',
      'en': 'Job Title',
      'zh_Hans': '职称',
    },
    '6j3bol0g': {
      'ja': 'Save Changes',
      'en': 'Save Changes',
      'zh_Hans': '保存更改',
    },
    'fynyrnzg': {
      'ja': 'Home',
      'en': 'Home',
      'zh_Hans': '家',
    },
  },
  // SearchBar
  {
    'd4lanyss': {
      'ja': 'Search for friends...',
      'en': 'Search for friends...',
      'zh_Hans': '寻找朋友...',
    },
    'g30k3vgv': {
      'ja': 'Find your friend by na',
      'en': 'Find your friend by na',
      'zh_Hans': '通过na找到你的朋友',
    },
  },
  // friendList
  {
    'vbei0qf4': {
      'ja': 'Alex Edwards',
      'en': 'Alex Edwards',
      'zh_Hans': '亚历克斯·爱德华兹',
    },
    'm3n8urpw': {
      'ja': '[userEmail]',
      'en': '[userEmail]',
      'zh_Hans': '[用户邮箱]',
    },
  },
  // emptyList
  {
    'lcgo7051': {
      'ja': 'No Messages',
      'en': 'No Messages',
      'zh_Hans': '没有消息',
    },
    'jy4g2gep': {
      'ja':
          'Seems you don\'t have any messages here, search your friends list in order to get started.',
      'en':
          'Seems you don\'t have any messages here, search your friends list in order to get started.',
      'zh_Hans': '您似乎没有任何消息，请搜索您的好友列表以开始使用。',
    },
    'n67bfpjf': {
      'ja': 'Find Friends',
      'en': 'Find Friends',
      'zh_Hans': '找朋友',
    },
  },
  // Miscellaneous
  {
    'ro22pvtv': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'vbyjavrz': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    '8f5qk5rh': {
      'ja': 'notification',
      'en': '',
      'zh_Hans': '',
    },
    'yhwa0sg4': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    '1uw24aa4': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'ij7u6d41': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'uiwnrhkh': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'hojm24tv': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'w03fu1v3': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    '0ph0rdky': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    's8l3l8sv': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'eb9w7oo1': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'ptsl2mu5': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'iib9mouw': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'pnvoatnl': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'ys2fgu71': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'c0n2xuho': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    '1u1h82pi': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'mssgle4z': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'nwlhl83n': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    '6fpqwkkn': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'pv7ubznq': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'b12tjyj6': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
    'ccsh1lk1': {
      'ja': '',
      'en': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
