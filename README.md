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

<details>
<summary>Tugas 9</summary>
<br>

# Tugas 9

## Contents ## 
- [Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?](#tugas-9-1) 
- [Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter](#tugas-9-2)
- [Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter](#tugas-9-3)
- [Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter](#tugas-9-4)
- [Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing](#tugas-9-5)
- [Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)](#tugas-9-6)

## <span id="tugas-9-1">Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Dalam integrasi Flutter dengan Django, memungkinkan untuk melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Hal ini dapat terjadi dalam dua skenario:

1. **Menggunakan Django REST Framework Tanpa Model:** Bisa dibuat sebuah API dengan Django REST Framework yang mengembalikan data JSON yang dikustomisasi tanpa harus bergantung pada model database Django. Ini dapat dilakukan dengan menggunakan `APIView` atau `@api_view` decorator dan kemudian mengembalikan Response dengan data yang diinginkan. Skenario ini umumnya digunakan ketika data yang dikembalikan tidak berasal dari database Django atau ketika struktur data sangat dinamis.

2. **Mengakses Data JSON Langsung di Flutter:** Di sisi Flutter, dapat dikirim permintaan HTTP ke sumber data apapun yang mengembalikan JSON, tidak hanya ke API Django. Dapat digunakan paket seperti `http` untuk mengirim permintaan dan kemudian mem-parsing respons JSON secara manual atau menggunakan paket seperti `json_serializable` untuk memudahkan parsing.

### Perbandingan dengan Membuat Model

- **Kelebihan Tanpa Model:**
  - **Fleksibilitas:** Memberikan fleksibilitas lebih untuk skenario di mana struktur data berubah-ubah atau tidak terikat dengan struktur database.
  - **Simplicity:** Lebih sederhana untuk kasus penggunaan yang tidak memerlukan interaksi dengan database atau ketika data berasal dari sumber eksternal.
  
- **Kekurangan Tanpa Model:**
  - **Kurangnya Struktur:** Tanpa model, hilang keuntungan struktur dan validasi yang diberikan oleh model Django. Ini dapat membuat pengelolaan data lebih rumit, terutama untuk data yang kompleks.
  - **Risiko Kesalahan Parsing:** Lebih rentan terhadap kesalahan parsing JSON, terutama jika struktur JSON berubah.
  - **Kehilangan Fitur ORM:** Tidak bisa memanfaatkan fitur ORM (Object-Relational Mapping) yang kuat dari Django, yang sangat berguna untuk query database yang kompleks.

### Kesimpulan

Pemilihan antara menggunakan model atau tidak bergantung pada kasus penggunaan spesifik. Jika data bersifat dinamis, tidak terstruktur, atau berasal dari sumber eksternal, maka mengambil JSON langsung mungkin lebih masuk akal. Namun, jika berinteraksi dengan data yang lebih terstruktur dan secara konsisten disimpan dalam database, maka menggunakan model Django dan memanfaatkan fitur ORM akan memberikan banyak keuntungan, termasuk kemudahan pemeliharaan, keamanan, dan skalabilitas.

## <span id="tugas-9-2">Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter
`CookieRequest` di Flutter berfungsi untuk mengelola cookie dalam permintaan HTTP. Fungsinya penting untuk memastikan bahwa cookie, yang sering digunakan untuk informasi sesi dan autentikasi pengguna, dikirimkan bersama setiap permintaan ke server.

Alasan utama untuk membagikan instance `CookieRequest` ke seluruh komponen aplikasi adalah:

1. **Konsistensi Sesi Pengguna:** Memungkinkan manajemen sesi pengguna yang seragam di seluruh aplikasi.
2. **Efisiensi Pengembangan:** Mengurangi duplikasi kode dan mempercepat proses pengembangan.
3. **Keamanan:** Menyediakan pengelolaan keamanan cookie yang terpusat dan konsisten.
4. **Pengelolaan State Aplikasi:** Memastikan konsistensi dalam pengelolaan state yang bergantung pada cookie di aplikasi.

`CookieRequest` memastikan pengelolaan cookie yang efisien dan aman, yang krusial untuk autentikasi pengguna dan konsistensi state di seluruh aplikasi Flutter.

## <span id="tugas-9-3">Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter
Mekanisme pengambilan data dari JSON hingga ditampilkan pada Flutter melibatkan beberapa langkah utama:

1. **Melakukan Permintaan HTTP:**
   - Flutter menggunakan paket seperti `http` untuk mengirim permintaan HTTP ke server atau API yang menyediakan data dalam format JSON.
   - Contoh: `http.get('url_api')` digunakan untuk mengirim permintaan GET ke URL yang ditentukan.

2. **Menerima Respons dan Parsing JSON:**
   - Setelah permintaan HTTP terkirim, server/API mengirim balik respons yang biasanya dalam format JSON.
   - Flutter kemudian mem-parsing data JSON tersebut menggunakan fungsi bawaan seperti `jsonDecode()` dari library `dart:convert`.

3. **Konversi Data JSON ke Objek Dart:**
   - Data JSON yang sudah di-parsing kemudian dikonversi menjadi objek Dart. Hal ini bisa dilakukan secara manual dengan menetapkan setiap nilai dari JSON ke properti objek Dart.
   - Alternatif lain, bisa menggunakan paket seperti `json_serializable` untuk mengotomatisasi proses ini.

4. **Menyimpan Data ke State:**
   - Data yang telah dikonversi ke objek Dart kemudian disimpan dalam state aplikasi. Ini bisa dilakukan menggunakan state management seperti `setState`, `Provider`, atau solusi state management lainnya.

5. **Menampilkan Data pada UI:**
   - Terakhir, data yang disimpan di state digunakan untuk membangun widget dan ditampilkan pada UI.
   - Flutter memungkinkan pembuatan berbagai jenis widget yang dapat menampilkan data, seperti `Text`, `ListView`, dan lainnya, yang mengambil data dari state yang telah disimpan.

## <span id="tugas-9-4">Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter
1. **Pengumpulan Data Pengguna di Flutter:**
   - Di Flutter, sebuah form digunakan untuk mengumpulkan informasi pengguna, seperti username dan password.
   - Pengguna mengisi form tersebut dan menekan tombol submit.

2. **Pengiriman Data ke Server Django:**
   - Setelah pengguna menekan tombol submit, Flutter mengirimkan data tersebut ke server Django menggunakan permintaan HTTP (biasanya POST).
   - Flutter menggunakan paket seperti `http` untuk membuat permintaan HTTP.

3. **Penerimaan dan Proses Autentikasi di Django:**
   - Server Django menerima data tersebut di endpoint yang sesuai.
   - Django menggunakan sistem autentikasi bawaan atau framework seperti Django REST framework untuk memproses data tersebut.
   - Django memverifikasi kredensial pengguna (biasanya melalui database) dan menentukan apakah kredensial tersebut valid.

4. **Pengiriman Respons dari Django ke Flutter:**
   - Jika kredensial valid, Django mengirimkan respons sukses ke Flutter, yang mungkin termasuk token (seperti JWT) untuk sesi yang autentikasi.
   - Jika kredensial tidak valid, Django mengirimkan pesan kesalahan.

5. **Pengolahan Respons di Flutter dan Navigasi:**
   - Flutter menerima respons dari Django dan memprosesnya.
   - Jika autentikasi berhasil, Flutter bisa menyimpan token dalam penyimpanan lokal dan menavigasikan pengguna ke menu utama atau dashboard.
   - Jika autentikasi gagal, Flutter menampilkan pesan kesalahan.

6. **Menampilkan Menu atau Dashboard:**
   - Setelah pengguna berhasil diautentikasi, aplikasi Flutter menampilkan menu utama atau dashboard.
   - Menu ini bisa berisi berbagai opsi yang tersedia bagi pengguna, termasuk kemampuan untuk mengakses data yang terproteksi berdasarkan token autentikasi.

7. **Manajemen Sesi:**
   - Flutter menggunakan token yang diterima dari Django untuk setiap permintaan terautentikasi selanjutnya ke server.
   - Token ini digunakan untuk memvalidasi sesi pengguna saat melakukan permintaan ke server Django.

Contoh Alur Kerja Sederhana:

- Flutter:
  - Form login yang mengumpulkan username dan password.
  - Pengiriman data ke API Django menggunakan `http.post`.

- Django:
  - Endpoint API yang menerima data login.
  - Proses verifikasi data dan pengiriman respons, termasuk token jika sukses.

- Flutter:
  - Menerima respons dan parsing token.
  - Menyimpan token dan menampilkan halaman menu jika login berhasil.

Proses ini memastikan bahwa hanya pengguna yang terverifikasi yang dapat mengakses fitur tertentu dari aplikasi, menjaga keamanan dan integritas data aplikasi.

## <span id="tugas-9-5">Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing
### `product_detail_page.dart`
  1. **Scaffold:** Membangun struktur dasar halaman, termasuk AppBar dan area konten.
  2. **AppBar:** Menampilkan bar judul di bagian atas layar.
  3. **Padding:** Memberi padding di sekitar konten untuk menjaga tata letak yang rapi.
  4. **Column:** Mengatur anak-anaknya secara vertikal.
  5. **Text:** Menampilkan teks, seperti nama, harga, dan deskripsi produk.
  6. **SizedBox:** Membuat jarak vertikal antar elemen.
  7. **ElevatedButton:** Menyediakan tombol yang, ketika ditekan, memicu aksi (navigasi kembali).

### list_product.dart
  1. **Scaffold:** Menyediakan struktur dasar untuk halaman aplikasi, termasuk AppBar, Drawer, dan Body.
  2. **AppBar:** Menampilkan bar judul di bagian atas halaman.
  3. **LeftDrawer:** Widget kustom (presumably, sebuah menu drawer) yang ditambahkan ke Scaffold untuk navigasi.
  4. **FutureBuilder:** Mengelola state dari operasi asinkron (fetching produk) dan membangun UI berdasarkan hasilnya.
  5. **Center:** Menengahkan widget anaknya, digunakan di sini untuk CircularProgressIndicator.
  6. **CircularProgressIndicator:** Menampilkan indikator loading saat data sedang di-fetch.
  7. **Column:** Menata widget anak secara vertikal, digunakan di sini untuk menampilkan pesan "Tidak ada data produk."
  8. **Text:** Menampilkan teks pada UI.
  9. **SizedBox:** Menyediakan ruang kosong vertikal antar widget.
  10. **ListView.builder:** Membangun daftar yang dapat di-scroll berisi elemen yang dibangun dinamis.
  11. **InkWell:** Menambahkan efek visual pada ketukan dan mengelola aksi ketika item dalam daftar diketuk.
  12. **Container:** Menyediakan kotak untuk menempatkan widget anak lainnya, dengan margin dan padding.
  13. **Column (dalam Container):** Menata beberapa widget anak secara vertikal, digunakan untuk menampilkan nama, harga, dan deskripsi produk.

### login.dart
1. **MaterialApp:** Widget ini digunakan sebagai root aplikasi Flutter dan menyediakan beberapa fungsi dasar seperti theming dan navigasi.
2. **Scaffold:** Menyediakan kerangka dasar untuk setiap halaman aplikasi, termasuk AppBar, Body, dan elemen-elemen UI lainnya.
3. **AppBar:** Menampilkan judul aplikasi di bagian atas layar.
4. **Container:** Memberikan sebuah box untuk menempatkan berbagai widget anaknya, dengan padding yang diberikan.
5. **Column:** Mengatur widget anaknya secara vertikal.
6. **TextField:** Memungkinkan pengguna memasukkan teks. Digunakan di sini untuk input username dan password.
7. **SizedBox:** Membuat ruang vertikal antara widget untuk tata letak yang lebih baik.
8. **ElevatedButton:** Menyediakan tombol yang, ketika ditekan, menjalankan fungsi tertentu. Di sini, digunakan untuk memproses login.
9. **AlertDialog:** Menampilkan dialog kepada pengguna. Digunakan untuk menunjukkan pesan kesalahan jika login gagal.
10. **TextButton:** Tombol dengan teks, digunakan di dalam AlertDialog.
11. **SnackBar:** Menampilkan pesan singkat di bagian bawah layar. Di sini, digunakan untuk menampilkan pesan sukses login.
12. **Navigator:** Mengelola stack halaman untuk navigasi. Digunakan untuk beralih ke halaman berikutnya setelah login berhasil.
13. **ScaffoldMessenger:** Digunakan untuk menampilkan SnackBar.

## <span id="tugas-9-6">Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
[x] Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
![memastikan-django-berjalan-lancar](URL)

[x] Membuat halaman login pada proyek tugas Flutter
  1. Buat file baru bernama `login.dart` di folder `screens`
  2. Isi file tersebut dengan kode ini:
    ```dart
    
    ```
  3. Modifikasi `main.dart` dengan mengubah `home: MyHomePage()` menjadi `home: LoginPage()`

[x] Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter
  1. Setup autentikasi pada Django untuk flutter dengan membuat `django-app` bernama `authentication` 
    ```bash
    python3 manage.py startapp authentication
    ```
  2. Menambahkan `'authentication',` ke `INSTALLED_APPS` di `settings.py` yang project.
  3. Instal _library_ dengan _prompt_ `pip install django-cors-headers` lalu tambahkan juga `corsheaders` ke `INSTALLED_APPS` di `settings.py` yang project. Setelah itu, tambahkan `corsheaders.middleware.CorsMiddleware` ke `MIDDLEWARE` yang juga ada di `settings.py`
  4. Tambahkan variabel di `settings.py`
    ```bash
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
  5. Setelah itu saya menambahkan _method_ ini di `authentication/views.py` 
    ```python
    from django.shortcuts import render
    from django.contrib.auth import authenticate, login as auth_login
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt

    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)
    ```
  6. Buat file baru bernama `views.py` di `authentication` lalu tambahkan kode berikut
    ```python
    from django.urls import path
    from authentication.views import login

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
    ]
    ```
  7. Tambahkan `path('auth/', include('authentication.urls')),` pada `urls.py` di `medtrack`.
  8. Instal _package_ 
  9. Ubah isi `main.dart` menjadi berikut
    ```dart
    import 'package:flutter/material.dart';
    import 'package:medtrack/screens/menu.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
      runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
      const MyApp({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Provider(
          create: (_) {
            CookieRequest request = CookieRequest();
            return request;
          },
          child: MaterialApp(
            title: 'Flutter App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
              useMaterial3: true,
            ),
            home: MyHomePage(),
          ),
        );
      }
    }
    ```

[x] Membuat model kustom sesuai dengan proyek aplikasi Django
  1. Buka _endpoint_ JSON dengan melalui `http://localhost:8000/json/` setelah itu copy data nya dan buka web __Quicktype__ lalu copy paste data dari JSOn dan juga sesuaikan beberapa hal seperti _source type_, _language_, dan _setup name_.
  2. Buat `lib/models/product.dart` laly copy paste kode yang dihasilkan oleh __Quickpoint__ tadi.

  [x] Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy
  1. Instal _package_ HTTP
  2. Menambahkan potongan kode berikut di `AndroidManifest.xml` pada direktori `android`
    ```xml
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
    ```
  3. Buat file `list_item.dart` pada direktori `lib/screens` untuk menampilkan data dari JSON yang ada di Django.
    ```dart
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:medtrack/models/product.dart';
    import 'package:medtrack/widgets/left_drawer.dart';

    class ProductPage extends StatefulWidget {
      const ProductPage({Key? key}) : super(key: key);

      @override
      _ProductPageState createState() => _ProductPageState();
    }

    class _ProductPageState extends State<ProductPage> {
      Future<List<Product>> fetchProduct() async {
        var url = Uri.parse('http://127.0.0.1:8000/json/');
        var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Product
        List<Product> list_product = [];
        for (var d in data) {
          if (d != null) {
            list_product.add(Product.fromJson(d));
          }
        }
        return list_product;
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Product'),
            ),
            drawer: const LeftDrawer(),
            body: FutureBuilder(
                future: fetchProduct(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return const Column(
                        children: [
                          Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].fields.name}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.price}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                  ],
                                ),
                              ));
                    }
                  }
                }));
      }
    }
    ```
  4. Tambahkan `list_item.dart` ke `widgets/left_drawer.dart` dengan cara import `import 'package:medtrack/screens/list_item.dart';` setelah itu tambahkan kode ini
    ```dart
    ...
    ListTile(
        leading: const Icon(Icons.shopping_basket),
        title: const Text('Daftar Item'),
        onTap: () {
            // Route menu ke halaman produk
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductPage()),
            );
        },
    ),
    ...
    ```
  5. Modifikasi kode ini di `menu.dart` dan juga import `list_item.dart`
    ```dart
    if (item.name == "Lihat Item") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductPage()));
            }
    ```

[x] Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item
  1. Membuat file baru bernama `product_detail_page.dart` di `lib/screens`
  ```dart
  import 'package:flutter/material.dart';
  import 'package:medtrack/models/product.dart';

  class ProductDetailPage extends StatelessWidget {
    final Product product;

    const ProductDetailPage({Key? key, required this.product}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(product.fields.name)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.fields.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('Price: ${product.fields.price}'),
              SizedBox(height: 10),
              Text('Description: ${product.fields.description}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Kembali ke Daftar Produk'),
              ),
            ],
          ),
        ),
      );
    }
  }
  ```
  2. Navigasi ke halaman detail dengan perbarui `ProductPage` untuk menambahkan navigasi
  ```dart
  ...
  return ListView.builder(
    itemCount: snapshot.data!.length,
    itemBuilder: (_, index) {
      final product = snapshot.data![index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailPage(product: product)),
          );
        },
        child: Container(
          // Container yang sudah ada
        ),
      );
    },
  );
  ...
  ```


</details>