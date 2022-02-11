import 'dart:convert';

class Users{

  // Declarations
  final String _email , _password , _firstName, _lastName,_dateOfBirth,_streak  , _missedDays;

  // Constructor
  Users(this._email, this._password, this._dateOfBirth, this._streak, this._missedDays, this._firstName, this._lastName);

  // User Functions - Getters

  userData()
  {
    return ({
      "email":_email,
      "password":_password,
      "dateofBirth":_dateOfBirth,
      "firstName":_firstName,
      "lastName":_lastName,
      "streak":_streak,
      "missedDays":_missedDays
    });
  }

}

