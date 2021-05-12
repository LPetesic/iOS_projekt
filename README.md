# iOS_projekt

## opis

Aplikacija prati aktivnosti kroz dane poput dnevnika. Omogućava intuitivan prikaz ukupnog zbroja/prosjeka/omjera kroz dane u kojima se neka aktivnost ili obaveza izvršila.

Aplikacija nudi mogućnosti unosa podataka u obliku bulleta sa ocjenama 1-5 zvjezdica ili nekom drugom metrikom.
Pri pokretanju, traži login putem maila i šifre ili registraciju.
Pri prvom pokretanju/registraciji prikazuje tutorial - slideshow nekoliko slika kako koristiti aplikaciju.
Svaki screen nakon tog trenutka ima navigacijsku traku sa 5 itema (više o tome dolje).
Nakon tutoriala ili pokretanja, otvara se Home screen: unos podataka o današnjem danu.
Na kraju svakog dana/pri pokretanju isti dan, lokalno spremljeni podatci se prikazuju ispunjeni u Home screenu.

Navigacija kroz aplikaciju događa se preko navigacijske trake koja sadrži:
1. Motivation screen
- Popis motivacijskih poruka (moguće sa interneta npr. https://www.brainyquote.com/quote_of_the_day)
2. Overview screen
- Razni načini prikazivanja podataka, (grid view, numerical, opcija visualise by: [aktivnost])
- opcije prikazivanja po tjednima/mjesecima/godinama
3. Home screen
- unos podataka za danas
- inputi su sortirani po kategorijama i poredani jedni ispod drugih
4. Edit activities screen
- Dodavanje/brisanje aktivnosti i kategorija aktivnosti (potencijalno ne koristiti zaseban screen nego nekakav Edit gumb)
5. Settings screen
- Log out
- Redo tutorial
- Change background
- Language ?
- About
- Push notifications
- Privacy policy (kad bi je imali hehe)
