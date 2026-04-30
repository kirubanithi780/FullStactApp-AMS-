import 'dart:convert';

import 'package:asset_mng_sys/screens/requestassetpage.dart';
import 'package:asset_mng_sys/services/homeservice.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';



class Home extends StatefulWidget {
  final String mail;
  const Home({ required String this.mail, super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   String displayName="Loading....";
     @override
    void initState() {
    super.initState();
    loadUserName();
  }
    Homeservice homeService=Homeservice();
  void loadUserName() async{
    String name= await homeService.fetchUser(this.widget.mail);
    print("from the name"+name);
    setState(() {
      this.displayName=name;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : MyNavigationHome(userName:this.displayName),
      
    );
  }
}

class MyNavigationHome extends StatefulWidget {
  final String userName;
  const MyNavigationHome({super.key, required this.userName});

  @override
  State<MyNavigationHome> createState() => _MyNavigationHomeState();
}

class _MyNavigationHomeState extends State<MyNavigationHome> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pushNamed(context, '/login');
        }, icon:Icon(Icons.arrow_back)),
        title: Text.rich(
  TextSpan(
    text: 'Welcome  ', 
    style: TextStyle(color: Colors.black, fontSize: 16),
    children: <TextSpan>[
      TextSpan(
        text: this.widget.userName, 
        style: TextStyle(
          color: Colors.blue, 
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ],
  ),
)
      
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 21, 27, 195),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(

            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon:  Icon(Icons.inventory),
            label: 'Assets',
          ),
          NavigationDestination(
            icon:  Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        const Center(child:HomePage()),
        const Center(child: AssetsPage()),
        const Center(child: ProfilePage()),
      ][currentPageIndex],
    );
  }
}

class HomePage extends StatefulWidget {

  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int userId;
  Homeservice homeService=Homeservice();

  @override
  void initState() {
    super.initState();
    userId=homeService.userId!;

  }

  @override
  Widget build(BuildContext context) {
    
  return Column(
    children: [
      SizedBox(height: 20,),
     Text("Asset Management System",style: TextStyle(color: const Color.fromARGB(255, 30, 18, 172),fontSize: 20,fontWeight: FontWeight.bold),),
     SizedBox(height: 30,),
      ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.add_shopping_cart, color: Colors.blue.shade800),
        ),
        title: const Text("Request New Asset"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>RequestAssetPage(userId: userId),)),
      ),
      const Divider(indent: 70), 
      ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.bug_report_outlined, color: Colors.orange.shade800),
        ),
        title: const Text("Report Issue"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => Navigator.pushNamed(context, "/issuereportpage")
        ,
      ),
      const Divider(indent: 70),

    
      const Divider(indent: 70),

    
      ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.purple.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.headset_mic_outlined, color: Colors.purple.shade800),
        ),
        title: const Text("Contact IT Support"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => print("Navigate to Support"),
      ),
    ],
  );

  }
}
class AssetsPage extends StatefulWidget {
  const AssetsPage({super.key});

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  List<dynamic> _assignments = [];
  bool _isLoading = true;
  String _errorMessage = "";
  Homeservice homeService=Homeservice();
  @override
  void initState() {
    super.initState();
    loadUserAssets();
  }
  
  loadUserAssets() async{
    int? userId=homeService.userId;
     print("from the try $userId");
    if (userId==null) {
      return;
    }
    try{
     
    final response=await homeService.getAllProductsById(userId);
   
     setState(() {
     _assignments=json.decode(response);
   });
   print("from assign"+response);
  }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
    appBar: AppBar(title: const Text("My Assigned Assets"),  automaticallyImplyLeading: false, ),
    body: _assignments.isEmpty
        ? const Center(child:Text("Not assigned"))
        : ListView.builder(
            itemCount: _assignments.length,
            itemBuilder: (context, index) {
              final asset = _assignments[index]['asset'];

              return Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.devices, color: Colors.blue),
                  title: Text(
                    asset['itemName'] ?? 'No Name',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Tag: ${asset['tagNumber']} | Status: ${asset['status']}"),
                  trailing: Text(
                    "Assigned: ${_assignments[index]['assignedDate']}",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              );
            },
          ),
  );
}
  }

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<dynamic> _assignments = [];
  bool _isLoading = true;
  String _errorMessage = "";
  Homeservice homeService = Homeservice();

  @override
  void initState() {
    super.initState();
    loadUserAssets();
  }

  loadUserAssets() async {
    int? userId = homeService.userId;
    print("from the try $userId");
    if (userId == null) {
      _isLoading = false;
      return;
    }
    try {
      final response = await homeService.getAllProductsById(userId);
      _isLoading = false;
      setState(() {
        _assignments = json.decode(response);
      });
      print("from assign" + response);
    } catch (e) {
      _isLoading = false;
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_assignments.isEmpty) {
      return const Center(child: Text("No Data Found"));
    }

    final userDatas = _assignments[0]['user'];

    return Center(
      child: Container(
        width: 400,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  radius: 40,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf1fiSQO7JfDw0uv1Ae_Ye-Bo9nhGNg27dwg&s"),
                ),
                const SizedBox(height: 30),

                Row(
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Text("User Id",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold))),
                    const Text(": "),
                    Expanded(child: Text(userDatas['userId'].toString())),
                  ],
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Text("User Name",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold))),
                    const Text(": "),
                    Expanded(child: Text(userDatas['userName'])),
                  ],
                ),
                const SizedBox(height: 15),


                Row(
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Text("Email Id",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold))),
                    const Text(": "),
                    Expanded(child: Text(userDatas['email'])),
                  ],
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Text("Role",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold))),
                    const Text(": "),
                    Expanded(child: Text(userDatas['role'])),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}