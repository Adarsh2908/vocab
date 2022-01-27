class Users{

  // Declarations
  final String _email , _password , _firstName, _lastName;

  String get email => _email;
  final DateTime _dateOfBirth;
  final int _streak  , _missedDays ;

  // Constructor
  Users(this._email, this._password, this._dateOfBirth, this._streak, this._missedDays, this._firstName, this._lastName);

  // User Functions - Getters
  get password => _password;

  get firstName => _firstName;

  get lastName => _lastName;

  DateTime get dateOfBirth => _dateOfBirth;

  int get streak => _streak;

  get missedDays => _missedDays;


}

