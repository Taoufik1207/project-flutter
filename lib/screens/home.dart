import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const Padding(
            padding:  EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/3097/3097053.png"),
            ),
          ),
          title: const Text(
            "Maxlook",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
          ),
          actions: const [
            Icon(Icons.loupe_outlined, color: Colors.black),
            SizedBox(width: 10,),
            Icon(Icons.notification_important_rounded,  color: Colors.black),
            SizedBox(width: 10,),
          ],
        ),
        body: SingleChildScrollView(

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width *0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Get your special sale up to 50%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5
                                   
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: InkWell(
                                  onTap: (){},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                    child: const Text(
                                      "Shop Now!",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/3081/3081648.png",
                            ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const TabBar(
                  isScrollable: true,
                  
                  indicatorColor: Colors.black,
                  unselectedLabelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs:  [
                    Text(style: TextStyle(color: Colors.black), "All"),
                    Text(style: TextStyle(color: Colors.black), "Newest"),
                    Text(style: TextStyle(color: Colors.black), "Popular"),
                    Text(style: TextStyle(color: Colors.black), "Man"),
                    Text(style: TextStyle(color: Colors.black), "Woman")
                  ],
                ),
                const SizedBox(height: 20,),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65
                  ),
                  itemCount: productInfos.length,
                  itemBuilder: (context, index) {
                    return Product(info: productInfos[index]);
                  },
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
            ),
            child: Material(
              // elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: BottomNavigationBar(
                elevation: 0,
                selectedItemColor: Colors.orange,
                items: const [
                  BottomNavigationBarItem(label:"",icon: Icon(Icons.home_outlined)),
                  BottomNavigationBarItem(label:"",icon: Icon(Icons.home_mini_sharp)),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.shop_outlined), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  final ProductInfo info;
  const Product({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                    image: DecorationImage(image: NetworkImage(info.image), fit: BoxFit.cover)
                  ),
                
                  // child: ClipRRect(
                  //   borderRadius:BorderRadius.circular(20) ,
                  //   child: Image.network(
                  //     info.image, 
                  //     width: MediaQuery.of(context).size.width * 0.2, 
                  //     fit: BoxFit.cover, 
                  //     alignment: Alignment.center
                  //   ),
                  // ),
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: info.iconSelected ? Colors.orange : Colors.white,
                    child: Icon(
                      info.iconSelected ? Icons.favorite : Icons.favorite_outline,
                      size: 15,
                      color: info.iconSelected ? Colors.white : Colors.orange,
                    ),
                  ),
                ),
              ]
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info.text,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),
                ),
                Text(info.price, style: const TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductInfo {
  String text, image, price;
  bool iconSelected;

  ProductInfo({
    required this.text,
    required this.image,
    required this.iconSelected,
    required this.price
  });
}

List<ProductInfo> productInfos = [
  ProductInfo(
    text: "Jacket Reffle Man",
    image: "https://www.rafelshearling.com/wp-content/uploads/2015/11/justinHfrost.jpg", 
    iconSelected: true, 
    price: "\$72.69"
  ),
  ProductInfo(
    text: "Jacket Boxy Man", 
    image: "https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fd5%2F6b%2Fd56b2d1a34b56e87ea1cadf71286cacaf5e56614.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]", 
    iconSelected: false, 
    price: "\$58.69"
  ),
  ProductInfo(
    text: "Product 1", 
    image: "https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fb8%2F6b%2Fb86bdb65f099929b5b6eaefdae08bac9c2edf186.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]", 
    iconSelected: false, 
    price: "\$27.99"
  ),
  ProductInfo(
    text: "Product 2", 
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRupnpuEs_0yNSFLPOFtB4_FGdUOvd5KyPnyEaitiXM&s", 
    iconSelected: false, 
    price: "\$23.88"
  ),
  ProductInfo(
    text: "Product 3", 
    image: "https://www.realmenrealstyle.com/wp-content/uploads/2019/03/SPRING-Jackets-Every-Man-Should-Own.jpg", 
    iconSelected: false, 
    price: "\$78.66"
  ),
  ProductInfo(
    text: "Product 4", 
    image: "https://cdna.lystit.com/photos/amiparis/acb27643/ami-black-Boxy-Fit-Jacket.jpeg", 
    iconSelected: false, 
    price: "\$34.65"
  ),
];