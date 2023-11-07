# medtrack-mobile

```
Wahyu Hidayat
2206081894
PBP A
```


# Tugas 7
## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Dalam Flutter, widget adalah elemen dasar antarmuka pengguna. Setiap widget adalah bagian dari deklaratif UI dan bisa jadi merupakan sebuah tombol, teks, layout, dan lain-lain. Flutter memiliki dua jenis widget utama yang menangani state: Stateless dan Stateful.

### Stateless Widget
Sebuah `StatelessWidget` adalah widget yang tidak memerlukan state. Artinya, tidak ada data yang diharapkan untuk berubah selama siklus hidup widget. Stateless widget tidak dapat di-rebuild dengan data baru karena tidak memiliki kemampuan untuk mengubah internal state mereka. Mereka di-render sekali berdasarkan informasi yang mereka terima dari konstruktor mereka dan tidak berubah sepanjang waktu.

Contoh Stateless Widget:
- Icon
- Text
- FlatButton

Karakteristik utama dari StatelessWidget:
- Tidak memiliki state internal yang bisa berubah.
- Tidak memiliki metode `setState()`.
- Dibangun sekali dan tidak di-update kecuali parent widget-nya membuat ulang widget tersebut dengan data baru.
- Lebih sederhana dan membutuhkan lebih sedikit resource dibandingkan dengan Stateful Widget.

### Stateful Widget
Sebuah `StatefulWidget` adalah widget yang bisa mengelola state. Stateful widget bisa berubah selama waktu berjalan, biasanya diakibatkan oleh event yang dilakukan oleh pengguna atau data yang berubah dari sumber eksternal. Mereka bisa di-rebuild ketika data mereka berubah menggunakan metode `setState()`, yang memicu proses build pada widget tersebut sehingga UI bisa di-update.

Contoh Stateful Widget:
- Checkbox
- Slider
- Form

Karakteristik utama dari StatefulWidget:
- Mempunyai state yang bisa berubah selama waktu aplikasi berjalan.
- Mempunyai metode `setState()` yang digunakan untuk mengubah state dan memicu proses build ulang untuk widget.
- Dapat mempertahankan state ketika di-build ulang, misalnya, selama animasi atau ketika pengguna memasukkan data ke dalam form.
- Lebih kompleks karena harus mengelola state dan siklus hidup dari state tersebut.

`StatelessWidget` sering digunakan untuk layout dan komponen statis dalam aplikasi, sementara `StatefulWidget` digunakan untuk UI yang harus merespons terhadap perubahan data atau interaksi pengguna, seperti pemasukan teks, pengguliran halaman, atau animasi.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
### `main.dart`:
1. **MaterialApp**: Menyediakan kerangka dasar aplikasi yang menggunakan Material Design termasuk navigasi dan styling.

2. **Scaffold**: Struktur dasar layar yang memiliki app bar, body, dan elemen antarmuka lainnya untuk desain Material.

3. **AppBar**: Bar di bagian atas layar yang bisa berisi judul dan aksi.

4. **Text**: Menampilkan teks dengan gaya tertentu.

5. **ThemeData**: Mengatur tema visual untuk aplikasi, termasuk warna dan typography.

6. **ColorScheme**: Menetapkan skema warna untuk tema.

7. **MyHomePage**: Halaman utama yang ditampilkan ketika aplikasi dijalankan.

### `menu.dart`:

1. **MyHomePage**: Halaman awal yang menyajikan konten utama.

3. **ShopCard**: Menampilkan kartu untuk tiap item toko.

4. **GridView**: Mengatur widget dalam format grid yang dapat di-scroll.

5. **InkWell**: Membuat area di sekitar widget yang bereaksi saat disentuh.

6. **Column**: Mengatur widget dalam susunan vertikal.

7. **Padding**: Menambahkan ruang di sekeliling widget.

8. **Icon**: Menampilkan ikon.

9. **SnackBar**: Menunjukkan pesan singkat di bawah layar.

10. **ScaffoldMessenger**: Untuk menampilkan SnackBar.

11. **Material**: Widget yang mengikuti Material Design, sering digunakan bersama InkWell untuk efek visual.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
1. Saya membuat _repository_ di GitHub dan direktori lokal baru bernama `medtrack-mobile`, setelah itu saya melakukan `git init` untuk menghubungkan _repository_ di GitHub dengan direktori lokal.
2. Pada direktori lokal, saya menjalankan instruksi `flutter create medtrack` untuk membentuk file flutter.
3. Buat file baru bernama `menu.dart` di direktori `lib`.
4. Pindahkan class `MyHomePage` dan `_MyHomePageState` dari `main.dart` ke `menu.dart` dan tambahkan import `import 'package:medtrack/menu.dart';` pada `main.dart`.
5. Pada `main.dart` modifikasi kode `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`.
6. Ubah sifat widget halaman dari stateful menjadi stateless dengan memodifikasi semua kode di `menu.dart` sehingga isi dari `menu.dart` hanya seperti berikut:
    ```dash
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
            );
        }
    }
    ```
6. Tambahkan kode berikut pada `menu.dart` untuk _define_ tipe list
    ```dart
    class ShopItem {
        final String name;
        final IconData icon;

        ShopItem(this.name, this.icon);
    }
    ```
7. Tambahkan kode berikut di bawah kode `MyHomePage({Key? key}) : super(key: key);`
    ```dart
    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist),
        ShopItem("Tambah Item", Icons.add_shopping_cart),
        ShopItem("Logout", Icons.logout),
    ];
    ```
8. Tambahkan kode berikut di dalam __Widget__ build
    ```dart
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medtrack',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Medtrack', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
    ```
9. Buat _widget stateless_ baru untuk menampilkan _card_
    ```dart
    class ShopCard extends StatelessWidget {
        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            return Material(
            color: Colors.indigo,
            child: InkWell(
                // Area responsive terhadap sentuhan
                onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
                child: Container(
                // Container untuk menyimpan Icon dan Text
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        ),
                    ],
                    ),
                ),
                ),
            ),
            );
        }
    }
    ```

## Bonus: Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Item, Tambah Item, dan Logout)
1. Modifikasi _class_ `ShopItem` untuk menambahkan properti `color`
    ```dart
    class ShopItem {
        final String name;
        final IconData icon;
        final Color color; 

        ShopItem(this.name, this.icon, this.color); 
    }
    ```
2. Perbarui list item di `MyHomePage` untuk menambahkan warna untuk setiap item menjadi berikut
    ```dart
    final List<ShopItem> items = [
      ShopItem("Lihat Item", Icons.checklist, Colors.blueGrey),
      ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.amber),
      ShopItem("Logout", Icons.logout, Colors.red),
    ];
    ```
    Sehingga tampilannya menjadi seperti ini:

    ![bonus-screenshot](https://github.com/wahyuhiddayat/medtrack-mobile/blob/main/images/bonus-7-screenshot.png)

3. Ganti kode `color: Colors.indigo,` pada widget _build_ di _class_ `ShopCard` menjadi `color: item.color,` agar menggunakan warna dari tiap item. 
