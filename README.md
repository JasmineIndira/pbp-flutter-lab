# Tugas 7
# counter_7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless Widget :  widget yang mendeskripsikan bagian dari interface user dengan membangun konstelasi widget lain yang menggambarkan interface user secara lebih konkret. Berguna ketika bagian dari antarmuka pengguna yang digambarkan tidak bergantung pada apa pun selain informasi konfigurasi di objek itu sendiri dan BuildContext tempat widget digembungkan.

Stateful Widget : widget yang menggambarkan bagian dari user interface dengan membangun konstelasi widget lain yang menggambarkan user interface secara lebih konkret. Berguna ketika bagian dari antarmuka pengguna yang digambarkan dapat berubah secara dinamis, misalnya karena memiliki status clock-driven internal, atau tergantung pada beberapa status sistem.

Perbedaan : 
Stateless Widget : static widgets 
Stateful Widget : dynamic widgets 

Stateless Widget : tidak bergantung pada perubahan data atau perubahan behavior apapun
Stateful Widget : di-update selama runtime berdasarkan action atau perubahan data yang dilakukan oleh user

Stateless Widget : text, icon, raisedbutton
Stateful Widget : checkbox, radio button, slider

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Text : untuk menanmpilkan text
Row : untuk membuat flexible layout seecara horizontal
Column : untuk membuat flexible layout seecara vertikal
Icon : untuk memberi icon pada element
Center : untuk membuat element berada di tengah halaman

## Apa fungsi dari setState()?
`setState()?` berfungsi untuk memberitahukan framework bahwa internal state dari object yang berkaitan telah berubah.
Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`_counter` dimana function `_incrementCounter()` dan `_decrementCounter()` akan memberikan dampak kepada teks yang sudah dibuat sebelumnya, yaitu “ganjil” dan “genap”.

## Jelaskan perbedaan antara const dengan final
const : digunakan untuk deklarasi variabel immutable yang nilainya bersifat konstan dan harus sudah diketahui pada saat waktu kompilasi berjalan.
final : variabel diinialisasi pada saat pertama kali digunakan dan hanya disetel sekali. Dengan kata lain nilai final akan diketahui pada saat run-time.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
1. membuat program Flutter baru menggunakan `flutter create counter_7` 
2. membuat fungsi `_decrementCounter()` untuk decrement counter
```
if (_counter > 0) {
        _counter--;
```
3. membuat `floatingActionButton` baru untuk decrement
```
if(_counter != 0)FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
```
4. mengubah warna untuk tampilan genap dan ganjil
5. menghilangkan tombol decrement saat counter == 0
6. membuat repository baru
7. melakukan `git init - add - commit - push` ke dalam repositori baru

# Tugas 8
## Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`
Navigator.push
Method push yang digunakan untuk menambahkan rute lain ke atas tumpukan screen atau stack saat ini, dimana halaman baru akan ditampilkan di atas halaman sebelumnya.

Navigator.pushReplacement
Method push yang menggantikan page yang ditampilkan saat ini dengan page baru yang akan ditampilkan.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya
Drawer : perpindahan tampilan atau navigator
Row : untuk membuat flexible layout seecara horizontal
Column : untuk membuat flexible layout seecara vertikal
DropDownButton : Membuat drop down buttons untuk memilih input
SizedBox : Mengatur dan membuat kotak dengan ukuran tertentu
ListTile : Membuat row dengan height konstan

## Jenis-jenis event yang ada pada Flutter
- onPressed
- onSaved
- onChanged
- onClick
- onTap

## Cara kerja `Navigator` dalam "mengganti" halaman dari aplikasi Flutter
Navigator menggunakan prinsip stack dimana apa yang berada paling atas lah yang akan muncul. Saat kembali ke halaman sebelumnya, page yang saat ini dilihat akan dihapus dari stack dan tampilan user akan berganti ke halaman sebelumnya. 

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
1. membuat drawer untuk menroute untuk masing masing class
2. membuat file form untuk untuk dimasukkan kedalam List 
3. mebuat class budget dan BudgetForm untuk tempat penyimpanan objek budget
4. menampilkan data dengan card

# Tugas 9
## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. akan tetapi, data akan menjadi kurang efisien karena  kita tidak bisa mengakses data tersebut sebagai sebuah "class”.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
* FutureBuilder : Men-generate array suatu widget berdasarkan suatu snapshot
* Checkbox : Widget untuk menandakan status dan perubahan status
* CircularProgressIndicator: Menunjukkan suatu progress dengan sebuah lingkaran
* Flexible : Mengendalikan ukuran dari widget lain
* Sizedbox: Membuat box dengan ukuran yang bisa dispesifikasikan 
## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
- Menambahkan dependensi http
- Membuat model sesuai dengan respons data
- Membuat http request dengan dependesi http
- Melakukan HTTP Request dengan method GET
- Menampilkan data yang telah dikonversi menggunakan FutureBuilder

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Menambahkan tombol navigasi pada drawer/hamburger untuk ke halaman mywatchlist. 
Menambahkan tombol navigasi pada drawer ke halaman mywatchlist pada budget.dart
2. Membuat satu file dart yang berisi model mywatchlist.
Membuat model myWatchListModel.dart, dan menyalin data mywatchlist berdasarkan yang telah dibuat pada Tugas 3 dengan menggunakan bantuan website quicktype.
3. Menambahkan halaman mywatchlist yang berisi semua watch list yang ada pada endpoint JSON di Django yang telah kamu deploy ke Heroku sebelumnya
Menambahkan dependency http untuk melakukan fetch data dari web Tugas 3. Data yang ditampilkan dengan menggunakan FutureBuilder, hanya menampilkan judul dari tiap watchlist saja.
4. Membuat navigasi dari setiap judul watch list ke halaman detail
Melakukan passing model yang bersesuaian dengan card dan menampilkan judul, release date, rating, review, dan status pada halaman detail.
5. Menambahkan tombol untuk kembali ke daftar mywatchlist
Menambahkan button back untuk kembali.
