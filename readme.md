# Gettings started

Surfa in på https://guide.elm-lang.org/install/elm.html

Klicka på **Windows - installer** och kör programmet

(inga speciella val under installationen)

Om du har VS Code uppe så starta om det (annars funkar inte **elm**-kommandot senare)

Skapa en mapp **GettingStarted** någonstans på disk

Öppna terminalen och hoppa in i mappen och kör

    elm init

då skapas elm.json

Kör

    elm reactor

...där du har elm.json-filen. Det startar servern http://localhost:8000
(acceptera firewall)

Skapa en ny fil **Main.elm** i **src** mappen och kopiera in denna exempelkod https://elm-lang.org/examples/buttons 

Surfa in till http://localhost:8000/src/

Klicka på Main.elm och programmet körs

(elm-stuff mapp skapas)

# Syntax highlight

Installerade denna extension i VS Code för syntax highlighting

    Name: Elm
    Id: elmTooling.elm-ls-vscode
    Description: Improving your Elm experience since 2019
    Version: 2.5.2
    Publisher: Elm tooling
    VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=Elmtooling.elm-ls-vscode

Öppna **Main.elm** Nu i fyrfärg!

# Liten ändring

Ändra startvärdet till 123 i **Main.elm**

    init : Model
    init =
        132

...och ladda om sidan (alltså http://localhost:8000/src/Main.elm) och verifiera att den börjar på 123.

Nu är du Elm-programmerare! 🙂

# Bygg

Kör

    elm make src/Main.elm

...och du får en fungerande **index.html**

Kör

    elm make src/Main.elm --optimize --output=elm.js

...och du får (bara) en javascript-fil som är optimerad (ej minimerad, 107kb)

# Kopiera filer

Klona (eller zip'a) detta repo:

https://github.com/happy-bits/spinit

Kopiera över elm-filerna till din **src**-mapp

# Övningar

Gör övningarna  

- Button05_Exercise.elm
- Quote05_Exercise.elm
- Textfield06_Exercise.elm

No worries om du inte hinner klart under den korta tiden, jag lägger upp lösningar senare 😉





