//MÉTODO QUE CALCULA LAS FECHAS EXISTENTES ENTRE DOS FECHAS Y DEVUELVE LOS DATOS DE LAS ESTACIONES EXISTENTES ENTRE ESE RANGO DE FECHAS
String calcularFechas(String fInicial, String fFinal) {
  String diaInicio, mesInicio, anioInicio, diaFinal, mesFinal, anioFinal;
  int diaIni, mesIni, anioIni, diaF, mesF, anioF;

  //Fecha inicial separada en String
  diaInicio = fInicial.substring(0, 2);
  mesInicio = fInicial.substring(3, 5);
  anioInicio = fInicial.substring(6, 10);
  //Fecha inicial separada en Int
  diaIni = int.parse(diaInicio);
  mesIni = int.parse(mesInicio);
  anioIni = int.parse(anioInicio);
  //Fecha final separada en String
  diaFinal = fFinal.substring(0, 2);
  mesFinal = fFinal.substring(3, 5);
  anioFinal = fFinal.substring(6, 10);
  //Fecha final separada en Int
  diaF = int.parse(diaFinal);
  mesF = int.parse(mesFinal);
  anioF = int.parse(anioFinal);

  String dataStations;

// CALCULA LAS FECHAS ENTRE EL RANGO CUANDO EL MES Y EL AÑO SON IGUALES
  if (mesInicio == mesFinal && anioInicio == anioFinal && diaIni < diaF) {
    String f;
    while (diaIni <= diaF) {
      f = diaIni.toString() + "-" + mesInicio + "-" + anioInicio;
      f = convertirFecha(f);
      obtenerEstacionFecha(f);
      diaIni++;
    }
  } // FIN DE CALCULA LAS FECHAS ENTRE EL RANGO CUANDO EL MES Y EL AÑO SON IGUALES
  else {
    //CALCULA LAS FECHAS ENTRE EL RANGO CUANDO LOS MESES SON DISTINTOS PERO EL AÑO ES IGUAL
    if (mesF > mesIni && anioInicio == anioFinal) {
      while (mesIni < mesF) {
        if (mesIni == 1 ||
            mesIni == 3 ||
            mesIni == 5 ||
            mesIni == 7 ||
            mesIni == 8 ||
            mesIni == 10 ||
            mesIni == 12) {
          String f;

          while (diaIni <= 31) {
            f = diaIni.toString() + "-" + mesIni.toString() + "-" + anioInicio;
            f = convertirFecha(f);
            obtenerEstacionFecha(f);
            diaIni++;
          }

          mesIni++;
          diaIni = 1;
        } else {
          if (mesIni == 4 || mesIni == 6 || mesIni == 9 || mesIni == 11) {
            String f;

            while (diaIni <= 30) {
              f = diaIni.toString() +
                  "-" +
                  mesIni.toString() +
                  "-" +
                  anioInicio;
              f = convertirFecha(f);
              obtenerEstacionFecha(f);
              diaIni++;
            }

            mesIni++;
            diaIni = 1;
          } else {
            String f;
            while (diaIni <= 29) {
              f = diaIni.toString() +
                  "-" +
                  mesIni.toString() +
                  "-" +
                  anioInicio;
              f = convertirFecha(f);
              obtenerEstacionFecha(f);
              diaIni++;
            }

            mesIni++;
            diaIni = 1;
          }
        }
      }
      if (mesIni == mesF) {
        String f;
        while (diaIni <= diaF) {
          f = diaIni.toString() + "-" + mesIni.toString() + "-" + anioInicio;
          f = convertirFecha(f);
          obtenerEstacionFecha(f);
          diaIni++;
        }
      }
    } //FIN DE CALCULA LAS FECHAS ENTRE EL RANGO CUANDO LOS MESES SON DISTINTOS PERO EL AÑO ES IGUAL
    else {
      // CALCULA LAS FECHAS ENTRE EL RANGO CUANDO EL DIA, MES Y AÑO CON DISTINTOS
      while (anioIni < anioF) {
        if (mesIni == 1 ||
            mesIni == 3 ||
            mesIni == 5 ||
            mesIni == 7 ||
            mesIni == 8 ||
            mesIni == 10) {
          String f;

          while (diaIni <= 31) {
            f = diaIni.toString() +
                "-" +
                mesIni.toString() +
                "-" +
                anioIni.toString();
            f = convertirFecha(f);
            obtenerEstacionFecha(f);
            diaIni++;
          }

          mesIni++;
          diaIni = 1;
        } else {
          if (mesIni == 4 || mesIni == 6 || mesIni == 9 || mesIni == 11) {
            String f;

            while (diaIni <= 30) {
              f = diaIni.toString() +
                  "-" +
                  mesIni.toString() +
                  "-" +
                  anioIni.toString();
              f = convertirFecha(f);
              obtenerEstacionFecha(f);
              diaIni++;
            }

            mesIni++;
            diaIni = 1;
          } else {
            if (mesIni == 2) {
              String f;
              while (diaIni <= 29) {
                f = diaIni.toString() +
                    "-" +
                    mesIni.toString() +
                    "-" +
                    anioIni.toString();
                f = convertirFecha(f);
                obtenerEstacionFecha(f);
                diaIni++;
              }

              mesIni++;
              diaIni = 1;
            } else {
              String f;
              while (diaIni <= 31) {
                f = diaIni.toString() +
                    "-" +
                    mesIni.toString() +
                    "-" +
                    anioIni.toString();
                f = convertirFecha(f);
                obtenerEstacionFecha(f);
                diaIni++;
              }

              anioIni++;
              mesIni = 1;
              diaIni = 1;
            }
          }
        }
      }
      while (mesIni < mesF) {
        if (mesIni == 1 ||
            mesIni == 3 ||
            mesIni == 5 ||
            mesIni == 7 ||
            mesIni == 8 ||
            mesIni == 10 ||
            mesIni == 12) {
          String f;

          while (diaIni <= 31) {
            f = diaIni.toString() +
                "-" +
                mesIni.toString() +
                "-" +
                anioIni.toString();
            f = convertirFecha(f);
            obtenerEstacionFecha(f);
            diaIni++;
          }

          mesIni++;
          diaIni = 1;
        } else {
          if (mesIni == 4 || mesIni == 6 || mesIni == 9 || mesIni == 11) {
            String f;

            while (diaIni <= 30) {
              f = diaIni.toString() +
                  "-" +
                  mesIni.toString() +
                  "-" +
                  anioIni.toString();
              f = convertirFecha(f);
              obtenerEstacionFecha(f);
              diaIni++;
            }

            mesIni++;
            diaIni = 1;
          } else {
            String f;
            while (diaIni <= 29) {
              f = diaIni.toString() +
                  "-" +
                  mesIni.toString() +
                  "-" +
                  anioIni.toString();
              f = convertirFecha(f);
              obtenerEstacionFecha(f);
              diaIni++;
            }

            mesIni++;
            diaIni = 1;
          }
        }
      }
      if (mesIni == mesF) {
        String f;
        while (diaIni <= diaF) {
          f = diaIni.toString() +
              "-" +
              mesIni.toString() +
              "-" +
              anioIni.toString();
          f = convertirFecha(f);
          obtenerEstacionFecha(f);
          diaIni++;
        }
      }
    } //FIN CALCULA LAS FECHAS ENTRE EL RANGO CUANDO EL DIA, MES Y AÑO CON DISTINTOS
  }

  return dataStations;
}

//MÉTODO QUE PASA UNA FECHA DE FORMATO 01-01-2021 A FORMATO 01-Jan-2021
String convertirFecha(String fecha) {
  String mes;
  if (fecha.length == 10) {
    mes = fecha.substring(3, 5);
  } else {
    if (fecha.length == 9) {
      if (fecha.substring(1, 2) == '-') {
        mes = fecha.substring(2, 4);
      } else {
        if (fecha.substring(2, 3) == '-') {
          mes = fecha.substring(3, 4);
        }
      }
    } else {
      if (fecha.length == 8) {
        mes = fecha.substring(2, 3);
      }
    }
  }

  String subFecha;

  switch (mes) {
    case '01':
      mes = 'Jan';
      break;
    case '02':
      mes = 'Feb';
      break;
    case '03':
      mes = 'Mar';
      break;
    case '04':
      mes = 'Apr';
      break;
    case '05':
      mes = 'May';
      break;
    case '06':
      mes = 'Jun';
      break;
    case '07':
      mes = 'Jul';
      break;
    case '08':
      mes = 'Aug';
      break;
    case '09':
      mes = 'Sep';
      break;
    case '1':
      mes = 'Jan';
      break;
    case '2':
      mes = 'Feb';
      break;
    case '3':
      mes = 'Mar';
      break;
    case '4':
      mes = 'Apr';
      break;
    case '5':
      mes = 'May';
      break;
    case '6':
      mes = 'Jun';
      break;
    case '7':
      mes = 'Jul';
      break;
    case '8':
      mes = 'Aug';
      break;
    case '9':
      mes = 'Sep';
      break;
    case '10':
      mes = 'Oct';
      break;
    case '11':
      mes = 'Nov';
      break;
    case '12':
      mes = 'Dec';
      break;
  }

  if (fecha.length == 10) {
    subFecha = fecha.substring(0, 3) + mes + fecha.substring(5, 10);
  } else {
    if (fecha.length == 9) {
      if (fecha.substring(1, 2) == '-') {
        subFecha = fecha.substring(0, 2) + mes + fecha.substring(4, 9);
      } else {
        if (fecha.substring(2, 3) == '-') {
          subFecha = fecha.substring(0, 3) + mes + fecha.substring(4, 9);
        }
      }
    } else {
      if (fecha.length == 8) {
        subFecha = fecha.substring(0, 2) + mes + fecha.substring(3, 8);
      }
    }
  }

  return subFecha;
}

void obtenerEstacionFecha(String fecha) {
  print(fecha);
}
