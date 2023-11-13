import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gis_axiom_flutter_task/features/home/controller/home_controller.dart';
import 'package:social_media_buttons/social_media_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : controller.homeDataModel.response != 'success'
                        ? const Center(
                            child: Icon(Icons.warning_amber_rounded),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.all(10.0).copyWith(bottom: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(
                                      controller.homeDataModel.website!.image
                                          .toString(),
                                      height: 50,
                                    ),
                                    Text(
                                      controller.homeDataModel.pageTitle
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          controller.homeDataModel.website!
                                              .sliderTitle
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 16, color: Colors.teal),
                                        ),
                                        Text(
                                          controller
                                              .homeDataModel.website!.sliderDesc
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 26,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Column(
                                          children: controller
                                              .homeDataModel.menuItems!
                                              .map((item) => Card(
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 35,
                                                                vertical: 20),
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                colorFilter: const ColorFilter
                                                                    .mode(
                                                                    Colors
                                                                        .black87,
                                                                    BlendMode
                                                                        .softLight),
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: NetworkImage(item
                                                                    .sliderImage
                                                                    .toString()))),
                                                        child: Text(
                                                          item.name.toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: const TextStyle(
                                                              fontFamily:
                                                                  'Times New Roman',
                                                              fontSize: 24,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      ListView.builder(
                                                        shrinkWrap: true,
                                                        controller:
                                                            ScrollController(),
                                                        itemCount: item
                                                            .products!.length,
                                                        itemBuilder:
                                                            (context, index) =>
                                                                ListTile(
                                                          leading: CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(item
                                                                    .products![
                                                                        index]
                                                                    .image
                                                                    .toString()),
                                                          ),
                                                          title: Text(
                                                            item
                                                                .products![
                                                                    index]
                                                                .name
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                          subtitle: Text(
                                                            item
                                                                .products![
                                                                    index]
                                                                .desc
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          trailing: Text(
                                                            '${item.products![index].currency} ${item.products![index].amount}',
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )))
                                              .toList(),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'About Us',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.teal),
                                            ),
                                            Text(
                                              controller.homeDataModel.website!
                                                  .aboutUs
                                                  .toString()
                                                  .trim(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey[900]),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Contact Info',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.teal),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Call:',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey[900]),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '${controller.homeDataModel.website!.phone}, ${controller.homeDataModel.website!.mobile}',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey[900]),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Write:',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey[900]),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  controller.homeDataModel
                                                      .website!.email
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey[900]),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              controller.homeDataModel.website!
                                                  .address
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey[900]),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          controller
                                              .homeDataModel.website!.copyright
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[900]),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SocialMediaButton.facebook(
                                              url: controller.homeDataModel
                                                  .website!.facebookLink
                                                  .toString(),
                                              size: 16,
                                            ),
                                            SocialMediaButton.instagram(
                                              url: controller.homeDataModel
                                                  .website!.instagramLink
                                                  .toString(),
                                              size: 16,
                                            ),
                                            SocialMediaButton.linkedin(
                                              url: controller.homeDataModel
                                                  .website!.linkedinLink
                                                  .toString(),
                                              size: 16,
                                            ),
                                            SocialMediaButton.twitter(
                                              url: controller.homeDataModel
                                                  .website!.twitterLink
                                                  .toString(),
                                              size: 16,
                                            ),
                                            SocialMediaButton.pinterest(
                                              url: controller.homeDataModel
                                                  .website!.pinterestLink
                                                  .toString(),
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
              }),
        ));
  }
}
