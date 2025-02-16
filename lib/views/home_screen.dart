import 'package:api_testing/models/employee_model.dart';
import 'package:api_testing/services/employee_services.dart';
import 'package:api_testing/views/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'API Testing',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(NewsScreen());
              },
              icon: Icon(
                Icons.navigate_next,
                size: 30,
                color: Colors.white,
              )),
        ],
      ),
      body: FutureBuilder(
          future: EmployeeServices().getEmployeeData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              var data = snapshot.data as List<EmployeeModel>;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data[index].avatar!),
                      ),
                      title: Text(
                          "${data[index].firstName} ${data[index].lastName}"),
                      subtitle: Text(data[index].email!),
                      trailing: Text(data[index].id.toString()),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
          }),
    );
  }
}
