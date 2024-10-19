import 'package:flutter/material.dart';
import 'package:food_app/specialSalad.dart';
import 'package:food_app/widgets/TextApp.dart';

class Track extends StatefulWidget {
  const Track({super.key});

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  final List<DeliveryStep> _deliverySteps = [
    DeliveryStep(
      icon: Icons.document_scanner,
      title: 'Order Taken',
      status: 'completed',
    ),
    DeliveryStep(
      icon: Icons.bookmark_add,
      title: 'Order Is Being Prepared',
      status: 'completed',
    ),
    DeliveryStep(
      icon: Icons.person,
      title: 'Order Is Being Delivered',
      status: 'ongoing',
      description: 'Your delivery agent is coming',
    ),
    DeliveryStep(
      icon: Icons.check_circle,
      title: 'Order Received',
      status: 'completed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFA451),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: TextApp(
            text: 'Track Order',
            color1: Colors.white,
            size: 20,
            weight: FontWeight.w500),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDeliverySteps(),
              SizedBox(height: 20),
              backtomain(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliverySteps() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _deliverySteps.length,
      itemBuilder: (context, index) {
        final step = _deliverySteps[index];
        return ListTile(
          leading: Icon(step.icon),
          title: Text(step.title),
          trailing: _buildStatusIndicator(step.status),
          subtitle: step.description != null ? Text(step.description!) : null,
        );
      },
    );
  }

  Widget _buildStatusIndicator(String status) {
    switch (status) {
      case 'completed':
        return Icon(Icons.check_circle, color: Colors.green);
      case 'ongoing':
        return CircularProgressIndicator(strokeWidth: 2.0);
      default:
        return Container();
    }
  }

  Widget backtomain() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Center(
        child: Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xffFFA451),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: TextApp(
                text: 'End',
                color1: Colors.white,
                size: 18,
                weight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class DeliveryStep {
  final IconData icon;
  final String title;
  final String? description;
  final String status;

  DeliveryStep(
      {required this.icon,
      required this.title,
      this.description,
      required this.status});
}
