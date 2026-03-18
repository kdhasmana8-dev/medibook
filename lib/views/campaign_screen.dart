import 'package:flutter/material.dart';
import 'package:medibook/views/previous_campaign_screen.dart';
import 'package:provider/provider.dart';
import '../viewmodels/campaign_viewmodel.dart';


class CampaignPage extends StatelessWidget {
  const CampaignPage({super.key});

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<CampaignViewModel>(context);

    return Scaffold(

      appBar: AppBar(
        title: const Text("Create Campaign"),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// Campaign Type
            const Text("Campaign Type",style: TextStyle(fontWeight: FontWeight.bold)),

            Row(
              children: [

                Radio(
                  value: "SMS",
                  groupValue: vm.campaignType,
                  onChanged: (v)=> vm.changeCampaignType(v!),
                ),
                const Text("SMS"),

                Radio(
                  value: "Email",
                  groupValue: vm.campaignType,
                  onChanged: (v)=> vm.changeCampaignType(v!),
                ),
                const Text("Email"),

              ],
            ),

            const SizedBox(height:10),

            /// Send To
            DropdownButtonFormField(
              value: vm.sendTo,
              items: const [

                DropdownMenuItem(value: "All Patients",child: Text("All Patients")),
                DropdownMenuItem(value: "Selected Patients",child: Text("Selected Patients")),
                DropdownMenuItem(value: "Groups",child: Text("Groups")),

              ],
              onChanged: (v)=>vm.changeSendTo(v!),
              decoration: const InputDecoration(
                labelText: "Send To",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height:15),

            TextField(
              controller: vm.titleController,
              decoration: const InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height:10),

            TextField(
              controller: vm.emailSubjectController,
              decoration: const InputDecoration(
                labelText: "Email Subject",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height:10),

            TextField(
              controller: vm.headerController,
              decoration: const InputDecoration(
                labelText: "Header",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height:10),

            TextField(
              controller: vm.subHeaderController,
              decoration: const InputDecoration(
                labelText: "Sub Header",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height:15),

            /// Image
            ElevatedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.image),
              label: const Text("Select Image/Icon"),
            ),

            const SizedBox(height:10),

            /// Patient Name Checkbox
            CheckboxListTile(
              value: vm.patientName,
              title: const Text("Dear Patient Name"),
              onChanged: (v)=>vm.togglePatientName(v!),
            ),

            /// Message
            TextField(
              controller: vm.messageController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "Message",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height:10),

            /// Signature
            const Text("Signature"),

            CheckboxListTile(
              value: vm.doctorName,
              title: const Text("Dr Karishma Dhasmana"),
              onChanged: (v)=>vm.toggleDoctorName(v!),
            ),

            CheckboxListTile(
              value: vm.phone,
              title: const Text("91xxxxxxxx"),
              onChanged: (v)=>vm.togglePhone(v!),
            ),

            CheckboxListTile(
              value: vm.clinicName,
              title: const Text("Karishma Clinic"),
              onChanged: (v)=>vm.toggleClinicName(v!),
            ),

            const SizedBox(height:20),

            /// Submit
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(

                onPressed: (){
                  vm.submitCampaign();
                },

                child: const Text("Submit Campaign"),
              ),
            ),

            const SizedBox(height:30),

            /// Previous Campaign
            ListTile(
              title: const Text(
                "Previous Campaigns",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                ),
              ),

              trailing: const Icon(Icons.arrow_forward),

              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=> const PreviousCampaignPage(),
                  ),
                );
              },
            )

          ],
        ),
      ),
    );
  }
}