# 💊 medtrack-mobile 🩺 #


Nama : Wahyu Hidayat <br>
NPM : 2206081894 <br>
Kelas : PBP A 


<details>
<summary>Tugas 7</summary>
<br>

# Tugas 7

## Contents ## 
- [Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?](#tugas-7-1) 
- [Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing](#tugas-7-2)
- [Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step](#tugas-7-3)
- [Bonus: Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Item, Tambah Item, dan Logout)](#tugas-7-4)

## <span id="tugas-7-1">Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
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

## <span id="tugas-7-2">Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
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

## <span id="tugas-7-3">Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
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

## <span id="tugas-7-4">Bonus: Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Item, Tambah Item, dan Logout)
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
</details>

<details>
<summary>Tugas 8</summary>

# Tugas 8

## Contents ## 
- [Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!](#tugas-8-1) 
- [Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!](#tugas-8-2)
- [Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!](#tugas-8-3)
- [Bagaimana penerapan clean architecture pada aplikasi Flutter?](#tugas-8-4)
- [Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)](#tugas-8-5)
- [Bonus](#tugas-8-6)

## <span id="tugas-8-1">Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
### Navigator.push()
Navigator.push() digunakan untuk mendorong (push) halaman baru ke tumpukan navigasi. Hal ini berarti halaman baru ditambahkan ke atas tumpukan, dan pengguna dapat kembali ke halaman sebelumnya dengan menggunakan tombol kembali. Contoh penggunaannya adalah ketika aplikasi membuka detail produk dari daftar produk. Setelah melihat detail, pengguna dapat kembali ke daftar dengan menekan tombol kembali.

Contoh:
```dart
  if (item.name == "Tambah Produk") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ShopFormPage()));
  }
```
### Navigator.pushReplacement()
Navigator.pushReplacement() digunakan untuk menggantikan halaman saat ini dengan halaman baru dalam tumpukan. Halaman saat ini dihapus, dan pengguna tidak akan dapat kembali ke halaman tersebut dengan tombol kembali. Contoh penggunaan metode ini adalah pada layar login yang beralih ke layar beranda setelah login berhasil. Tidak diinginkan bagi pengguna untuk kembali ke layar login dengan menekan tombol kembali setelah mereka sudah masuk.

Contoh:
```dart
  onTap: () {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(),
        ));
    },
```


## <span id="tugas-8-2">Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
1. **Container**: Widget yang digunakan untuk mengatur dekorasi, dimensi, dan posisi child widget-nya. Container dapat digunakan untuk memberi padding, margin, border, atau background color pada sebuah widget, serta untuk melakukan transformasi seperti rotasi atau skala.

2. **Row dan Column**: Widget ini digunakan untuk membuat layout linear secara horizontal (Row) atau vertikal (Column). Keduanya sering digunakan untuk menyusun serangkaian widget secara sejajar, seperti tombol dalam baris atau teks dan gambar dalam kolom.

3. **Stack**: Memungkinkan widget ditumpuk atas satu sama lain. Stack berguna untuk membuat layout di mana widget menumpuk atau menimpa, seperti badge pada ikon atau posisi absolut dalam layar.

4. **GridView**: Digunakan untuk membuat layout dalam bentuk grid. GridView sangat berguna untuk menampilkan data dalam bentuk kotak-kotak atau daftar yang scrollable, seperti galeri foto atau grid menu.

5. **ListView**: Widget yang membuat daftar scrollable. ListView cocok untuk menampilkan daftar item yang panjang dan dapat di-scroll, seperti daftar email, feed berita, atau pengaturan.

6. **Flex dan Expanded**: Flex digunakan untuk membuat layout yang fleksibel, dengan memungkinkan child widget menyesuaikan ukurannya. Expanded digunakan dalam Row atau Column untuk mengontrol bagian ruang yang diambil oleh child widget relatif terhadap widget lain di Row atau Column yang sama.

7. **Wrap**: Mirip dengan Row dan Column, tetapi Wrap akan secara otomatis memindahkan ke baris atau kolom berikutnya jika tidak ada ruang cukup. Ini sangat berguna untuk layout yang responsif, di mana ukuran layar atau orientasi dapat berubah.

8. **Padding**: Widget yang memberikan ruang kosong di sekitar child widget-nya. Padding digunakan untuk memberi jarak antara widget atau antara widget dengan batas layar.

9. **Align dan Center**: Align digunakan untuk mengatur posisi child widget di dalam parent-nya, sedangkan Center, yang merupakan subclass dari Align, digunakan untuk menengahkan widget.

10. **ConstrainedBox dan SizedBox**: Keduanya digunakan untuk memberikan batasan pada dimensi sebuah widget. ConstrainedBox memberikan batas minimum dan maksimum, sedangkan SizedBox memberikan dimensi tetap.

## <span id="tugas-8-3">Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
1. **TextFormField untuk Nama Produk (`_name`)**: Elemen ini digunakan untuk mengumpulkan informasi tentang nama produk. Penggunaan `TextFormField` memungkinkan pengguna untuk memasukkan teks, yang penting untuk mengidentifikasi produk secara unik.

2. **TextFormField untuk Harga Produk (`_price`)**: Ini digunakan untuk memasukkan harga produk. Menggunakan `TextFormField` dengan validasi untuk memastikan input adalah angka, sangat penting untuk informasi harga dalam konteks inventaris atau aplikasi jual beli.

3. **TextFormField untuk Kategori Produk (`_category`)**: Elemen ini memungkinkan pengguna untuk menentukan kategori produk, yang dapat membantu dalam mengklasifikasikan dan menyortir produk. Input teks bebas memberi fleksibilitas kepada pengguna untuk mendefinisikan kategori.

4. **TextFormField untuk Jumlah/Quantity Produk (`_amount`)**: Digunakan untuk memasukkan jumlah atau stok produk. Seperti harga, input ini harus berupa angka, yang menunjukkan jumlah unit produk yang tersedia atau dibutuhkan.

5. **TextFormField untuk Deskripsi Produk (`_description`)**: Ini memberikan ruang bagi pengguna untuk menulis deskripsi lebih lanjut tentang produk. Deskripsi membantu dalam memberikan informasi tambahan tentang produk, seperti spesifikasi, kegunaan, atau informasi lain yang relevan.

Pemilihan `TextFormField` untuk semua input ini didasarkan pada kebutuhan untuk mengumpulkan informasi tekstual dari pengguna, dengan kemampuan untuk menambahkan validasi input yang spesifik (misalnya memastikan harga dan jumlah adalah numerik) dan memudahkan interaksi pengguna dengan form. Penggunaan `TextFormField` juga memudahkan implementasi fitur seperti auto-complete, validasi input, dan manajemen state form.

## <span id="tugas-8-4">Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean architecture pada aplikasi Flutter melibatkan pemisahan kode ke dalam berbagai lapisan dengan tanggung jawab spesifik. Ini meliputi:

- **Presentation Layer**: Menyertakan kode UI dan logic yang mengontrol tampilan layar, termasuk widgets dan screens.
- **Business Logic Layer (BLL) atau Domain Layer**: Berisi business rules dan logic aplikasi, biasanya berupa plain Dart classes.
- **Data Layer**: Mengurus interaksi dengan sumber data eksternal seperti database atau API, termasuk repositories dan data sources.

Penggunaan Dependency Injection (DI) memudahkan manajemen dependencies dan pengujian. Abstraksi dan interfaces digunakan untuk memisahkan komunikasi antar lapisan. Pengujian dilakukan secara terpisah untuk setiap lapisan. Manajemen state yang efektif penting, dengan pilihan seperti `BLoC`, `Redux`, atau `Provider`. Implementasi clean architecture memudahkan dalam pemeliharaan dan pengembangan aplikasi.

## <span id="tugas-8-5">Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

### Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dan divalidasi
1. Buat _file_ baru bernama `medtrack_form.dart` di direktori `lib`.
2. Buat _stateful widget_ bernama `ShopFormPage`
3. Tambahkan variabel untuk input yang dibutuhkan dan variabel baru bernama `_formKey` pada atribut key milik widget `Form`. 
  ```dart
  class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _amount = 0;
    String _description = "";
    int _price = 0;
    String _category = "";
    ...
  ```
4. Buat `Form` di dalam _widget_ dan tambahkan validasi untuk semua elemen input.
  ```dart
              // Name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // Price
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Price cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Price must be a number!";
                    }
                    return null;
                  },
                ),
              ),

              // Category
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Category",
                    labelText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Category cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // Quantity (Amount)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Quantity",
                    labelText: "Quantity",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Quantity cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Quantity must be a number!";
                    }
                    return null;
                  },
                ),
              ),

              // Description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),
  ```
5. Buat tombol `Save`

### Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol `Tambah Item` pada halaman utama.
1. Import `medtrack_form.dart` pada file `menu.dart`
  ```dart
  import 'package:medtrack/medtrack_form.dart'; 
  ```
2. Tambahkan kode berikut pada _widget_ `ShopItem` di bawah kode `ScaffoldMessenger` yang menampilkan _snackbar_
  ```dart
  if (item.name == "Tambah Item") {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const ShopFormPage()));
  }
  ```

### Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
Tambahkan fungsi `showDialog()` pada bagian `onPressed()` dan munculkan _widget_ `AlertDialog` pada fungsi tersebut. Kemudian, tambahkan juga fungsi untuk reset form.
```dart
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Item berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: $_name'),
                                    Text('Price: $_price'),
                                    Text('Category: $_category'),
                                    Text('Amount: $_amount'),
                                    Text('Description: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }
                    },
                  ...
```

### Membuat sebuah drawer pada aplikasi
1. Buat subdirektori baru di dalam direktori `lib` bernama `widgets` lalu buat file bernama `left_drawer.dart` untuk menambahkan kode _drawer_.
2. Import halaman yang ingin dituju untuk navigasi yaitu `MyHomePage` dan `ShopFormPage`.
3. Tambahka _routing_ untuk halaman-halaman yang di-_import_.
4. Hias _drawer_.
4. Masukkan _drawer_ ke `menu.dart` untuk menampilkan _drawer_ di sana.
  ```dart
  import 'package:medtrack/widgets/left_drawer.dart'; // Impor drawer widget

  ...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medtrack',
        ),
      ),
      drawer:
          const LeftDrawer(), // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
  ...
  ```
5. Lakukan _refactoring file_.

## <span id="tugas-8-6">Bonus

### Membuat sebuah halaman baru, yaitu halaman daftar item yang sudah dibuat dengan isi halamannya adalah setiap data item yang sudah pernah dibuat.
1. Membuat halaman baru bernama `medtrack_data.dart`
2. Buat class `Item`
  ```dart
  class Item {
    final String name;
    final int price;
    final String category;
    final int amount;
    final String description;

    Item(
        {required this.name,
        required this.price,
        required this.category,
        required this.amount,
        required this.description});
  }
  ```
3. Buat _widget_ `ItemListPage`
  ```dart
  class ItemListPage extends StatelessWidget {
    final List<Item> items;

    const ItemListPage({Key? key, required this.items}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Item'),
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(
                  'Price: ${item.price}, Category: ${item.category}, Amount: ${item.amount}'),
            );
          },
        ),
      );
    }
  }
  ```
3. Buat global list untuk menyimpan semua item dengan cara berikut:
  ```dart
  List<Item> items = [];
  ```
4. Tambahkan item yang berhasil dibuat ke global list
  ```dart
                      // Buat instance Item baru
                        Item newItem = Item(
                          name: _name,
                          price: _price,
                          category: _category,
                          amount: _amount,
                          description: _description,
                        );

                        // Tambahkan ke global item list
                        items.add(newItem);
  ```
5. Import `medtrack_data.dart` pada file dimana _widget_ `ShopFormPage` berada dan juga di `menu.dart`.
6. Tambahkan kode berikut di `menu.dart` untuk navigasi.
  ```dart
  if (item.name == "Lihat Item") {
    Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => ItemListPage(items: items)));
    }
  ```

### Mengarahkan pengguna ke halaman tersebut jika menekan tombol Lihat Item pada halaman utama atau drawer.
1. Import `medtrack_data.dart` di `left_drawer.dart` dengan cara menambahkan kode `import 'package:medtrack/widgets/medtrack_data.dart';`
2. Tambahkan kode berikut di `left_drawer.dart` untuk routing dan navigasi
  ```dart
  ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Lihat Item'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemListPage(items: items),
                ),
              );
            },
          ),
  ...
  ```
</details>