class DNode<T> {
  T? nodeValue;
  DNode<T>? prev;
  DNode<T>? next;

  DNode([this.nodeValue]) {
    prev = null;
    next = null;
  }

  @override
  String toString() => nodeValue.toString();
}

class DoubleLinkedList<T> {
  DNode<T>? head;
  DNode<T>? tail;

  bool isEmpty() => head == null;

  // menambah node di depan list
  void tambahNodeDepan(DNode<T> newNode) {
    if (isEmpty()) {
      head = tail = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

  // menambah node di akhir list
  void tambahNodeAkhir(DNode<T> newNode) {
    if (isEmpty()) {
      head = tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  // menambah node sebelum node tertentu (baca maju)
  void tambahNodeSebelum(DNode<T> target, DNode<T> newNode) {
    if (target.prev == null) {
      tambahNodeDepan(newNode);
    } else {
      DNode<T>? prevNode = target.prev;
      newNode.next = target;
      newNode.prev = prevNode;
      prevNode!.next = newNode;
      target.prev = newNode;
    }
  }

  // menambah node setelah target, pencarian dari belakang (baca mundur)
  void tambahNodeSetelahBacaMundur(DNode<T> newNode, DNode<T> target) {
    DNode<T>? current = tail;

    while (current != null && current != target) {
      current = current.prev;
    }

    if (current == null) {
      print("Target tidak ditemukan saat baca mundur.");
    } else {
      if (current.next == null) {
        tambahNodeAkhir(newNode);
      } else {
        DNode<T>? after = current.next;
        newNode.next = after;
        newNode.prev = current;
        current.next = newNode;
        after!.prev = newNode;
      }
    }
  }

  @override
  String toString() {
    List<T?> hasil = [];
    DNode<T>? current = head;

    while (current != null) {
      hasil.add(current.nodeValue);
      current = current.next;
    }

    return hasil.toString();
  }
}

void main() {
  var Dlist = DoubleLinkedList<String>();

  var merah = DNode<String>("merah");
  Dlist.tambahNodeDepan(merah);
  print("Tambah Node di Depan: ${Dlist}");

  var ungu = DNode<String>("ungu");
  Dlist.tambahNodeDepan(ungu);
  print("Tambah Node di Depan: ${Dlist}");

  var kuning = DNode<String>("kuning");
  Dlist.tambahNodeAkhir(kuning);
  print("Tambah Node di Akhir(Baca Maju): ${Dlist}");

  var coklat = DNode<String>("coklat");
  Dlist.tambahNodeDepan(coklat);
  print("Tambah Node di Depan (Baca Mundur): ${Dlist}");

  var pink = DNode<String>("pink");
  // Target = kuning
  Dlist.tambahNodeSebelum(kuning, pink);
  print("Tambah Node Sebelum Target (Target di tengah List): ${Dlist}");

  var biru = DNode<String>("biru");
  // Target = kuning (akhir list)
  Dlist.tambahNodeSetelahBacaMundur(biru, kuning);
  print("Tambah Node Sebelum Target (Target di akhir List): ${Dlist}");

  var oranye = DNode<String>("oranye");
  // Target = kuning lagi (akhir list karena sudah tambah biru setelahnya)
  Dlist.tambahNodeSebelum(kuning, oranye);
  print("Tambah Node Sebelum Target (Target di akhir List): ${Dlist}");
}
