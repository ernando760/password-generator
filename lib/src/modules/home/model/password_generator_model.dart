import 'dart:math' as math;

typedef TypesGenerateParams = Set<TypesGenerate>;

enum TypesGenerate {
  number,
  upperCase,
  lowerCase,
  symbols,
}

class PasswordGeneratorModel {
  PasswordGeneratorModel(
      {this.typesGenerate = const {TypesGenerate.upperCase}, this.length = 5});

  String _password = "";
  int length;

  String get password => _password;
  final Set<TypesGenerate> typesGenerate;

  final _random = math.Random();

  void setLength(int newLength) {
    length = newLength;
  }

  void generate(TypesGenerateParams params) {
    int index = 0;
    _password = "";
    while (index < length) {
      for (var key in mapGenerateRandom.keys) {
        if (_password.length != length) {
          if (params.contains(key)) {
            _password += mapGenerateRandom[key]!();
          }
        }
      }
      index++;
    }
  }

  late Map<TypesGenerate, String Function()> mapGenerateRandom = {
    TypesGenerate.number: _randomNumber,
    TypesGenerate.upperCase: () => _randomLetter(isLowerCase: false),
    TypesGenerate.lowerCase: _randomLetter,
    TypesGenerate.symbols: _randomSymbol
  };
  String _randomLetter({bool isLowerCase = true}) {
    final letters = [
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "h",
      "i",
      "j",
      "k",
      "l",
      "n",
      "m",
      "o",
      "p",
      "q",
      "r",
      "s",
      "t",
      "u",
      "v",
      "w",
      "x",
      "y",
      "z"
    ];
    final randomLetter = _random.nextInt(letters.length);
    if (isLowerCase) {
      return letters[randomLetter].toLowerCase();
    }
    return letters[randomLetter].toUpperCase();
  }

  String _randomNumber() {
    final numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
    final randomNumber = _random.nextInt(numbers.length);
    return numbers[randomNumber];
  }

  String _randomSymbol() {
    final symbols = [
      "!",
      "@",
      "#",
      "\$",
      "%",
      "¨",
      "&",
      "*",
      "(",
      ")",
      "?",
      "\\",
      "/"
    ];
    final randomSymbol = _random.nextInt(symbols.length);
    return symbols[randomSymbol];
  }

  void addTypeGenerate(TypesGenerate types) {
    if (!typesGenerate.contains(types)) {
      typesGenerate.add(types);
    }
  }

  void removeTypeGenerate(TypesGenerate types) {
    if (typesGenerate.contains(types)) {
      typesGenerate.removeWhere((element) => element.name == types.name);
    }
  }
}
