import 'dart:convert';

import 'package:api_testing/models/employee_model.dart';
import 'package:http/http.dart' as http;

class EmployeeServices {
  var baseUrl = 'https://reqres.in/api/';

  getEmployeeData() async {
    List<EmployeeModel> employeeList = [];
    try {
      var response = await http.get(Uri.parse(baseUrl + 'users?page=2'));
      if (response.statusCode == 200) {
        var data = response.body;
        var decodeData = jsonDecode(data);
        var employees = decodeData['data'];
        for (var employee in employees) {
          EmployeeModel newEmployee = EmployeeModel.fromJson(employee);
          employeeList.add(newEmployee);
        }
        print(employeeList);
        return employeeList;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
