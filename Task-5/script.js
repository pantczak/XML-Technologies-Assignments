
class Model {
    

    constructor() {
        this.songs = JSON.parse(localStorage.getItem('songs')) || [{id: 1,text: "Sample song 1"}, //tworzymy listę piosenek z wartosciami domuślnymi
        {id: 2, text: "Sample song 2"},
        {id: 3, text: "Sample song 3"}];
        
    }

    bindSongsListChanged(callback) {        //kiedy cos się zmieni w liście
        this.onSongListChanged = callback
    }

    _commit(songs) {        //zaktualizowanie pamieci w przegladarce
        this.bindSongsListChanged(this.onSongListChanged(songs));
        localStorage.setItem('songs', JSON.stringify(songs))
    }

    //dodawnie usuwanie piosenek itp

    addSong(songText) {
        const song = {
            id: this.songs.length > 0 ? this.songs[this.songs.length - 1].id + 1 : 1,
            text: songText
        };

        this.songs.push(song);

        this._commit(this.songs)
    }

    deleteSong(id) {
        this.songs = this.songs.filter(song => song.id !== id);

        this._commit(this.songs)
    }
}


class View {
    constructor() {
        this.app = this.getElement('#root');
        this.form = this.createElement('form');
        this.input = this.createElement('input');
        this.input.type = 'text';
        this.input.name = 'song';
        this.submitButton = this.createElement('button');
        this.submitButton.textContent = 'Add Song';
        this.form.append(this.input, this.submitButton);
        this.songList = this.createElement('ul', 'song-list');
        this.app.append(this.form, this.songList);

    }
        //pobranie tekstu w polu wprowadzaina
    get _songText() {
        return this.input.value
    }
        //po dodaniu zeby znikneło wprowadzenie
    _resetInput() {
        this.input.value = ''
    }
        // do dodwania elementow w html
    createElement(tag, className) {
        const element = document.createElement(tag)

        if (className) element.classList.add(className)

        return element
    }
        //pobieranie elementow w html
    getElement(selector) {
        return document.querySelector(selector)
    }


        //wyswietlnie listy
    displaySongs(songs) {
        // Delete all nodes
        while (this.songList.firstChild) {
            this.songList.removeChild(this.songList.firstChild)
        }

        // Show default message
        if (songs.length === 0) {
            const p = this.createElement('p');
            p.innerHTML = '<span>No Songs to listen to :( Add a song?</span>';
            this.songList.append(p);
        } else {
            // Create nodes
            songs.forEach(song => {
                const li = this.createElement('li');
                li.id = song.id;


                const span = this.createElement('span');
                span.textContent = song.text;

                const deleteButton = this.createElement('button', 'delete');
                deleteButton.textContent = 'Delete';
                li.append( span, deleteButton);

                // Append nodes
                this.songList.append(li)
            })
        }
    }
    //Dodanie tzw evenListener - nasłuchiwanie akcjii użytkownika i reagowanie na nie

    bindAddSong(handler) {
        this.form.addEventListener('submit', event => {   //jest tu submit ponieważ używamy form ale click też by działało

            if (this._songText) {
                handler(this._songText);
                this._resetInput()
            }
        })
    }

    bindDeleteSong(handler) {
        this.songList.addEventListener('click', event => {
            if (event.target.className === 'delete') {
                const id = parseInt(event.target.parentElement.id); //id piosenko jest takie samo jak id elemenu lsity

                handler(id)
            }
        })
    }
}


class Controller {
    constructor(model, view) {
        this.model = model;
        this.view = view;

//Podłączenie eventListenerów do obsługiwanych akcjii np. klikniecie przycisku ADD zostanie wyładpane i zostanie  wywołana obsługa tego zdarznenia

        this.model.bindSongsListChanged(this.onSongListChanged);
        this.view.bindAddSong(this.handleAddSong);      //polaczenie dodania z obsługa
        this.view.bindDeleteSong(this.handleDeleteSong);    // polaczenie usuniecia z obsługą
        this.onSongListChanged(this.model.songs)        // wyswietlenie listy jezleli w panieci były jakieś dane już (ew. przywrocenie sesji)
    }

//Obsluga akcji użytkonika

    onSongListChanged = songs => {  //jakakowliek zmianana w liście
        this.view.displaySongs(songs)
    };

    handleAddSong = songText => {  // dodoanie
        this.model.addSong(songText)
    };

    handleDeleteSong = id => {  //usuniecie
        this.model.deleteSong(id)
    };

}

const app = new Controller(new Model(), new View())

window.addEventListener("scroll", e => {
    let scrollTop = document.body.scrollTop ? document.body.scrollTop : document.documentElement.scrollTop;
    let newPos = scrollTop + "px";
    document.documentElement.style.setProperty('--scrollPos', newPos);
  });