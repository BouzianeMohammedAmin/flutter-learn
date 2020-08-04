
import 'dart:async';

class  Shwarma{}

class Order {
  String type ;
  Order(this.type);
}
void main () async {
  print('1 Start');
await Future.delayed(Duration(seconds: 5));
print('2 Start');
  final order = new Order('cheken');

  final controller = new StreamController();

  controller.sink.add(order);

  final worker = StreamTransformer.fromHandlers(
      handleData: (shawarmaType,sink){
        if(shawarmaType == 'cheken'){
          sink.add(new Shwarma());
        }else {
          sink.addError('Invalide shawarma type: $shawarmaType');
        }
      }
  );

  controller.stream.map((order) => order.type)
  .transform(worker)
  .listen((shawarma)=>print('ur sandwich shwarama is ... '),
    onError: (err)=>print('Err')
  );


}
