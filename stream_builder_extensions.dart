extension StreamExtension<T> on Stream {
  Widget toBuild<U>(
      {required dynamic Function(T data) onSucces, Widget? isEmpty}) {
    return StreamBuilder<dynamic>(
      stream: this,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data is List) {
            if (snapshot.data.isEmpty) return _isEmpty(isEmpty, snapshot);
          }
          return onSucces(snapshot.data);
        } else {
          return _centerLoading;
        }
      },
    );
  }

  Center get _centerLoading => const Center(child: CustomProgresIndicator());

  Widget _isEmpty(Widget? isEmpty, AsyncSnapshot<dynamic> snapshot) {
    if (isEmpty != null) return isEmpty;
    return const Center(child: Text("Veri Yok"));
  }
}
