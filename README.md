# GERADOR DE SENHAS

<p>O Aplicativo foi desenvolvido com intuito de aprimorar meu aprendizado em desenvolvimento de aplicativos móveis feito em flutter.</p>

<p>Para desenvolver este aplicativo utilizei três  Gerenciadores de estados,e eles são:</p>

- Provider
- ChangeNotifier
- ValueNotifier

E para armazenamento local utilizei o <b>SharedPreferences.</b>


## Padrão de design (design pattern)

<p>Este Aplicativo foi feito usando um padrão de design <b> MVVM (Model View ViewModel).</b></p>


## Tipos de opções para a geração de senha

<p>No aplicativo de gerar senha existe quatro opções para gerar senhas, e elas são:</p>

<ul>
    <li><b>Maiúsculas (ABC)</b></li>
    <li><b>Minúsculas (abc)</b></li>
    <li><b>Numeros (123)</b></li>
    <li><b>Símbolos (#$%)</b></li>
</ul>

<p>Por padrão a opção <b>Maiúsculas</b> é selecionada, se nenhuma dessas opções estiver selecionada, não vai ser possivel gerar a senha.</
p>


## Limites de caracteres

<p>O valor inicial para gerar a senha é <b>16</b>, mas, Não é possivel alterar o valor inicial.</p>

| LIMITES |  QUANTIDADES |
| ------- | ------------ |
| Máx     |  32          | 
| Mix     |  5           |

<p>Os limites máximo e minimo tambem não é possivel fazer alterações dos seus valores.</p>

## Estilos de textos e de cores

<p>O Estilo da fonte usada no aplicativo é a <b>Inter</b> esta fonte foi obtida pelo pacote <a href="https://pub.dev/packages/google_fonts">google_fonts</a>.</p>

|   Nome das cores            |                Hexdercimal             |
| ------------------------------------------------------ | ----------- |
| <b><span style="color:#011C27">Rich black</span></b> | #011C27   |
| <b><span style="color:#E1E1E2">White</span></b>      | #E1E1E2   |
| <b><span style="color:#DB222A">Red</span></b>        | #DB222A   |
| <b><span style="color:#00CC66">Green</span></b>      | #00CC66   |
| <b><span style="color:#FFA400">Orange</span></b>     | #FFA400   |
| <b><span style="color:#7C7C7C">Gray</span></b>       | #7C7C7C   |


<br>
<p>
<img src="assets/images/md/password_generator.gif" alt="gif gerador de senhas" width="360", height="720"/>
</p>


