class CartItem {

  final String name;
  final String imageUrl;
  final double price;
   int qty;
  CartItem( {required this.imageUrl, required this.price,required this.name,this.qty = 0,});
}