import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/campaign_viewmodel.dart';

class PreviousCampaignPage extends StatelessWidget {
  const PreviousCampaignPage({super.key});

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<CampaignViewModel>(context);

    return Scaffold(

      appBar: AppBar(
        title: const Text("Previous Campaigns"),
      ),

      body: ListView.builder(

        itemCount: vm.campaigns.length,

        itemBuilder: (context,index){

          final campaign = vm.campaigns[index];

          return Card(

            margin: const EdgeInsets.all(10),

            child: ListTile(

              title: Text(campaign.title ?? ""),

              subtitle: Text(
                campaign.message ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              trailing: Text(campaign.campaignType ?? ""),

            ),
          );

        },
      ),
    );
  }
}