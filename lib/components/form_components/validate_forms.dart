class ValidateForms {
  static validarNome(String value, {String? title}) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return "Este campo é obrigatório, informe um $title";
    } else if (!regExp.hasMatch(value)) {
      return "O $title deve conter caracteres de a-z ou A-Z";
    } else if (value.length <= 3) {
      return "Deve ser maior 3 digitos";
    }
  }

  static validarEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Este campo é obrigatório, informe um E-mail";
    } else if (!regExp.hasMatch(value)) {
      return "Email inválido";
    }
  }

  static validarSenha(String value) {
    if (value.isEmpty) {
      return "Este campo é obrigatório, informe uma senha";
    } else if (value.length < 8) {
      return "Deve ter no mínimo 8 digitos";
    }
  }
}
