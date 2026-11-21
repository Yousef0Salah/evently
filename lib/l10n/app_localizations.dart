import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// Label for the language setting
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Label for the theme setting
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Name of the English language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Name of the Arabic language
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// Heading for the experience personalization screen
  ///
  /// In en, this message translates to:
  /// **'Personalize Your Experience'**
  String get personalizeExperience;

  /// Description explaining how to personalize the experience
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.'**
  String get personalizeExperienceDescription;

  /// Button label to begin personalization
  ///
  /// In en, this message translates to:
  /// **'Let’s start'**
  String get letsStart;

  /// Title of the first onboarding page
  ///
  /// In en, this message translates to:
  /// **'Find Events That Inspire You'**
  String get findEvents;

  /// Description of the first onboarding page
  ///
  /// In en, this message translates to:
  /// **'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.'**
  String get findEventsDescription;

  /// Title of the second onboarding page
  ///
  /// In en, this message translates to:
  /// **'Effortless Event Planning'**
  String get effortlessPlanning;

  /// Description of the second onboarding page
  ///
  /// In en, this message translates to:
  /// **'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.'**
  String get effortlessPlanningDescription;

  /// Title of the third onboarding page
  ///
  /// In en, this message translates to:
  /// **'Connect with Friends & Share Moments'**
  String get connectFriends;

  /// Description of the third onboarding page
  ///
  /// In en, this message translates to:
  /// **'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.'**
  String get connectFriendsDescription;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// Title of the signup screen
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get createYourAccount;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterYourName;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// No description provided for @confirmYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get confirmYourPassword;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @signUpWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get signUpWithGoogle;

  /// Title of the login screen
  ///
  /// In en, this message translates to:
  /// **'Login to your account'**
  String get loginToYourAccount;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get signup;

  /// No description provided for @loginWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get loginWithGoogle;

  /// AppBar title of the forget password screen
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forgetPasswordTitle;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @resetPasswordImageAlt.
  ///
  /// In en, this message translates to:
  /// **'Reset password illustration'**
  String get resetPasswordImageAlt;

  /// Category name for sport events
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get categorySport;

  /// Category name for birthday events
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get categoryBirthday;

  /// Category name for book club events
  ///
  /// In en, this message translates to:
  /// **'Book Club'**
  String get categoryBookClub;

  /// Category name for exhibition events
  ///
  /// In en, this message translates to:
  /// **'Exhibition'**
  String get categoryExhibition;

  /// Category name for meeting events
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get categoryMeeting;

  /// Tab meaning all events
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Greeting on the home screen
  ///
  /// In en, this message translates to:
  /// **'Welcome Back ✨'**
  String get welcomeBack;

  /// Fallback name when the user has no display name
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// Hint text of the event search field
  ///
  /// In en, this message translates to:
  /// **'Search for event'**
  String get searchForEvent;

  /// Toggle label for dark mode
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// Logout button label
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// AppBar title and button label for the add event screen
  ///
  /// In en, this message translates to:
  /// **'Add event'**
  String get addEvent;

  /// Label for the event title field
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// Hint text for the event title field
  ///
  /// In en, this message translates to:
  /// **'Event Title'**
  String get eventTitle;

  /// Label for the event description field
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Hint text for the event description field
  ///
  /// In en, this message translates to:
  /// **'Event Description...'**
  String get eventDescription;

  /// Label for the event date picker
  ///
  /// In en, this message translates to:
  /// **'Event Date'**
  String get eventDate;

  /// Placeholder before a date is selected
  ///
  /// In en, this message translates to:
  /// **'Choose date'**
  String get chooseDate;

  /// Label for the event time picker
  ///
  /// In en, this message translates to:
  /// **'Event Time'**
  String get eventTime;

  /// Placeholder before a time is selected
  ///
  /// In en, this message translates to:
  /// **'Choose time'**
  String get chooseTime;

  /// AppBar title of the event details screen
  ///
  /// In en, this message translates to:
  /// **'Event details'**
  String get eventDetails;

  /// AppBar title of the edit event screen
  ///
  /// In en, this message translates to:
  /// **'Edit event'**
  String get editEvent;

  /// Button label to save event edits
  ///
  /// In en, this message translates to:
  /// **'Update event'**
  String get updateEvent;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
