// import 'package:flutter/material.dart';

// class AdminHome extends StatelessWidget {
//   const AdminHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFEAEAFB),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "Home Admin",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
//         child: Column(
//           children: [
//             _AdminHomeCard(
//               image: "images/approval.png", // Replace with your asset path
//               title: "Admin\nApproval",
//               onTap: () {
//                 // Navigate to Admin Approval page
//               },
//             ),
//             SizedBox(height: 20),
//             _AdminHomeCard(
//               image: "images/reedem.png", // Replace with your asset path
//               title: "Reedem\nRequest",
//               onTap: () {
//                 // Navigate to Reedem Request page
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _AdminHomeCard extends StatelessWidget {
//   final String image;
//   final String title;
//   final VoidCallback onTap;

//   const _AdminHomeCard({
//     required this.image,
//     required this.title,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 4,
//       borderRadius: BorderRadius.circular(16),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: onTap,
//         child: Container(
//           height: 110,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Image.asset(
//                   image,
//                   height: 50,
//                   width: 50,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               SizedBox(width: 10),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color: Colors.black,
//                   height: 1.2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:recycle_app/Admin/admin_approval.dart';
import 'package:recycle_app/Admin/admin_reedem.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Home Admin",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
        child: Column(
          children: [
            _AdminHomeCard(
              image: "images/approval.png", // Replace with your asset path
              title: "Admin\nApproval",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminApproval()),
                );
              },
            ),
            SizedBox(height: 20),
            _AdminHomeCard(
              image: "images/reedem.png", // Replace with your asset path
              title: "Reedem\nRequest",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminReedem()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminHomeCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const _AdminHomeCard({
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  image,
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 20),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
