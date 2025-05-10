class Node<T> {
  T? nodeValue;     
  Node<T>? next;    

  Node() {
    nodeValue = null;
    next = null;
  }

  Node.withValue(T item) {
    nodeValue = item;
    next = null;
  }
}

class SingleLinkedList<T> {
  Node<T>? head;

  bool isEmpty() => head == null;

  void insertFront(T data) {
    Node<T> newNode = Node.withValue(data);
    newNode.next = head;
    head = newNode;
  }

void insertAfterValue(T target, T newData) {
  if (isEmpty()) {
    print("List kosong. Tidak bisa sisipkan di tengah.");
    return;
  }

  Node<T>? current = head;

  while (current != null && current.nodeValue != target) {
    current = current.next;
  }

  if (current == null) {
    print("Data $target tidak ditemukan dalam list.");
  } else {
    Node<T> newNode = Node.withValue(newData);
    newNode.next = current.next;
    current.next = newNode;
  }
}


  void insertBack(T data) {
    Node<T> newNode = Node.withValue(data);
    if (isEmpty()) {
      head = newNode;
    } else {
      Node<T>? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
    }
  }


  void printList() {
    if (isEmpty()) {
      print('Linked List kosong');
    } else {
      Node<T>? current = head;
      while (current != null) {
        print(current.nodeValue);
        current = current.next;
      }
    }
  }
}

void main() {
  SingleLinkedList<int> list = SingleLinkedList<int>();

  list.insertFront(10);
  list.insertFront(20);
  list.insertBack(5);
  list.insertAfterValue(10, 15);

  print('Data List: ');
  list.printList();
}
