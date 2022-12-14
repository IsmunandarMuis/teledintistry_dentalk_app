import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';

import 'package:get/get.dart';
import 'package:teledintistry/app/modules/home/views/widgets/home_program_card.dart';
import 'package:teledintistry/app/routes/app_pages.dart';
import 'package:teledintistry/app/theme.dart';

import '../controllers/home_controller.dart';
import 'widgets/home_header.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: Obx(
            () => (controller.isLoading.isTrue)
                ? Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(defaultMargin),
                    child: ListView(
                      children: [
                        HomeHeader(
                          name: "${controller.dataUser['username']}",
                          avatar: "assets/logo_fkg.png",
                        ),
                        // PROGRAM
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Pilih Jenis Programmu",
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 17, fontWeight: semiBold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.DAFTAR_PROGRAM);
                                    },
                                    child: Text(
                                      "See all",
                                      style: secondaryTextStyle.copyWith(
                                          fontSize: 17, fontWeight: medium),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              // SingleChildScrollView(
                              //   scrollDirection: Axis.horizontal,
                              //   child: Row(
                              //       children:
                              //           controller.dataProgram.map((value) {
                              //     return (controller.dataProgram.isEmpty)
                              //         ? Center(
                              //             child: CircularProgressIndicator(
                              //               color: primaryColor,
                              //             ),
                              //           )
                              //         : GestureDetector(
                              //             onTap: () {
                              //               Get.toNamed(
                              //                 Routes.INFO_PROGRAM,
                              //                 arguments: value['id_program'],
                              //               );
                              //             },
                              //             child: HomeProgramCard(
                              //                 programName:
                              //                     value['nama_program'],
                              //                 programImage:
                              //                     value['image_program']),
                              //           );
                              //   }).toList()),
                              // )
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.DAFTAR_TINDAKAN,
                                            arguments: {
                                              "jenis_program": "Konservasi Gigi"
                                            });
                                      },
                                      child: HomeProgramCard(
                                          namaProgram: "Konservasi Gigi",
                                          jumlahTindakan: 5),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.DAFTAR_TINDAKAN,
                                            arguments: {
                                              "jenis_program":
                                                  "Radiologi Kedokteran Gigi"
                                            });
                                      },
                                      child: HomeProgramCard(
                                          namaProgram:
                                              "Radiologi Kedokteran Gigi",
                                          jumlahTindakan: 2),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.DAFTAR_TINDAKAN,
                                            arguments: {
                                              "jenis_program": "Prostodonsia"
                                            });
                                      },
                                      child: HomeProgramCard(
                                          namaProgram: "Prostodonsia",
                                          jumlahTindakan: 3),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // DOKTER
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Temukan Doktermu",
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 17, fontWeight: semiBold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.LIST_DOCTOR);
                                    },
                                    child: Text(
                                      "See all",
                                      style: secondaryTextStyle.copyWith(
                                          fontSize: 17, fontWeight: medium),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Gallery3D(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300,
                                  autoLoop: false,
                                  isClip: false,
                                  itemConfig: GalleryItemConfig(
                                    width: 220,
                                    height: 300,
                                    radius: 20,
                                    isShowTransformMask: false,
                                  ),
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            Routes.DETAIL_PROFILE_DOKTER,
                                            arguments:
                                                controller.dataDokter[index]
                                                    ['id_dokter']);
                                      },
                                      child: Container(
                                        color: primaryColor,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: RotatedBox(
                                                quarterTurns: 3,
                                                child: Center(
                                                  child: Text(
                                                    "${controller.dataDokter[index]['nama_dokter']}",
                                                    style: primaryTextStyle
                                                        .copyWith(
                                                      fontSize: 12.5,
                                                      fontWeight: semiBold,
                                                      color: backgroundColor,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: defaultMargin,
                                                ),
                                                child: Image.network(
                                                  "${controller.dataDokter[index]['image_dokter']}",
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: backgroundColor,
                                                      ),
                                                    );
                                                  },
                                                  fit: BoxFit.cover,
                                                  width: 500,
                                                  height: 500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                            ],
                          ),
                        ),

                        // ARTIKEL
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tambah Edukasimu",
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 17, fontWeight: semiBold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.DAFTAR_ARTIKEL);
                                    },
                                    child: Text(
                                      "See all",
                                      style: secondaryTextStyle.copyWith(
                                          fontSize: 17, fontWeight: medium),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.ARTIKEL_VIEW,
                                            arguments:
                                                controller.dataArtikel[index]
                                                    ['url_artikel']);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "${controller.dataArtikel[index]['title_artikel']}",
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: medium,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                "${controller.dataArtikel[index]['image_artikel']}",
                                                width: 100,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          )),
    );
  }
}
