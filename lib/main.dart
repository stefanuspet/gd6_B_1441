import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gd6_b_1441/entity/employee.dart';
import 'package:gd6_b_1441/input_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(
        title: 'Firebase',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('EMPLOYEE'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InputPage(
                            title: 'INPUT EMPLOYEE',
                            id: null,
                            name: null,
                            email: null)),
                  );
                }),
            IconButton(onPressed: () async {}, icon: const Icon(Icons.clear))
          ],
        ),
        body: StreamBuilder(
            stream: getEmployee(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                const Center(
                  child: Text('Something went wrong'),
                );
              }

              if (snapshot.hasData) {
                final employee = snapshot.data!;
                return ListView(
                  children: employee.map(buildEmployee).toList(),
                );
              } else {
                return const Center(
                  child: Text('No Data'),
                );
              }
            }));
  }

  Widget buildEmployee(Employee employee) => Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
                onPressed: (context) async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InputPage(
                            title: 'UPDATE EMPLOYEE',
                            id: employee.id,
                            name: employee.name,
                            email: employee.email)),
                  );
                },
                backgroundColor: Colors.blue,
                icon: Icons.update,
                label: 'Update'),
            SlidableAction(
                onPressed: (context) async {
                  final docEmployee = FirebaseFirestore.instance
                      .collection('employee')
                      .doc(employee.id);
                  docEmployee.delete();
                },
                backgroundColor: Colors.red,
                icon: Icons.delete,
                label: 'Delete')
          ],
        ),
        child: ListTile(
          title: Text(employee.name),
          subtitle: Text(employee.email),
        ),
      );
  Stream<List<Employee>> getEmployee() => FirebaseFirestore.instance
      .collection('employee')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Employee.fromJson(doc.data())).toList());
}
