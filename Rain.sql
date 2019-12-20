/*
 Navicat Premium Data Transfer

 Source Server         : 本地公共数据库
 Source Server Type    : MariaDB
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : thinkphp6

 Target Server Type    : MariaDB
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 20/12/2019 14:22:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for rain_config
-- ----------------------------
DROP TABLE IF EXISTS `rain_config`;
CREATE TABLE `rain_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置名',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数内容',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rain_config
-- ----------------------------
INSERT INTO `rain_config` VALUES (1, 'site', '{\"title\":\"\\u96e8\\u70b9\",\"slogan\":\"\\u540e\\u53f0\\u7ba1\\u7406\",\"url\":\"\",\"logo\":\"\\/upload\\/20191116\\/10321300600dc9aedaa133f95a0cdb07.png\",\"file\":\"\",\"favicon\":\"\\/upload\\/20191116\\/87006e4ad63dfad0d185bf1c87ab2a93.png\",\"seo_keywords\":\"\\u96e8\\u70b9,\\u540e\\u53f0\\u7ba1\\u7406\\u7cfb\\u7edf\",\"seo_description\":\"\",\"master_email\":\"\",\"icp\":\"\",\"desc\":\"<script type=\\\"text\\/javascript\\\" src=\\\"http:\\/\\/tajs.qq.com\\/stats?sId=66489488\\\" charset=\\\"UTF-8\\\"><\\/script>\"}', 1573800338, 1573869956);

-- ----------------------------
-- Table structure for rain_file
-- ----------------------------
DROP TABLE IF EXISTS `rain_file`;
CREATE TABLE `rain_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件路径',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件类型',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件大小',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 312 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rain_file
-- ----------------------------
INSERT INTO `rain_file` VALUES (1, '风玲 wlop鬼刀4k壁纸_彼岸图网.jpg', '20191018/8438b781c3289385c9b75f7e11101375.jpg', 'file', '3326902', 1571384457);
INSERT INTO `rain_file` VALUES (2, '风玲 wlop鬼刀4k壁纸_彼岸图网.jpg', '20191018/2ce9e9fdd6e6c8a39163547db29f458f.jpg', 'file', '3326902', 1571384467);
INSERT INTO `rain_file` VALUES (3, '风玲 wlop鬼刀4k壁纸_彼岸图网.jpg', '20191018/3c0bd4d6506593df039837dcc42570a3.jpg', 'file', '3326902', 1571384479);
INSERT INTO `rain_file` VALUES (4, '风玲 wlop鬼刀4k壁纸_彼岸图网.jpg', '20191018/9aa73eda1c225d7b3aa69b17150e5731.jpg', 'file', '3326902', 1571384493);
INSERT INTO `rain_file` VALUES (5, '5364dffc62ad3916.jpg', '20191018/ee280d118f6ace2cdf3a2ac30026de51.jpg', 'file', '2760', 1571384927);
INSERT INTO `rain_file` VALUES (6, '5364dffc62ad3916.jpg', '20191018/819a006bad5c8258f7307f4ec1789862.jpg', 'file', '2760', 1571384961);
INSERT INTO `rain_file` VALUES (7, '5364dffc62ad3916.jpg', '20191018/4888eaf770e509112409bf535b07d0e8.jpg', 'file', '2760', 1571385010);
INSERT INTO `rain_file` VALUES (8, '5364dffc62ad3916.jpg', '20191018/d570f020503a33cb140f5f3526a37061.jpg', 'file', '2760', 1571385273);
INSERT INTO `rain_file` VALUES (9, '5364dffc62ad3916.jpg', '20191018/b73889955413a8298186fdc1c48cdca9.jpg', 'file', '2760', 1571385311);
INSERT INTO `rain_file` VALUES (10, '5364dffc62ad3916.jpg', '20191018/f4ffc581dab65617759e5036fe2e7c99.jpg', 'file', '2760', 1571385716);
INSERT INTO `rain_file` VALUES (11, '5364dffc62ad3916.jpg', '20191018/26d5d52998d01c77c30738ae7e67dfc8.jpg', 'file', '2760', 1571385836);
INSERT INTO `rain_file` VALUES (12, '5364dffc62ad3916.jpg', '20191018/7396f5c2abf852e584bfa44ca51f64a8.jpg', 'file', '2760', 1571385946);
INSERT INTO `rain_file` VALUES (13, '5364dffd6977d666.jpg', '20191018/cbd49d53e69a17ce030b830ef702f57a.jpg', 'file', '5062', 1571385951);
INSERT INTO `rain_file` VALUES (14, '5364dffc62ad3916.jpg', '20191018/98b22750e9cba1bead3138f1da7a0efa.jpg', 'file', '2760', 1571385971);
INSERT INTO `rain_file` VALUES (15, '5364dffc62ad3916.jpg', '20191018/771a45bcb6eaddbf3403910a23add136.jpg', 'file', '2760', 1571386099);
INSERT INTO `rain_file` VALUES (16, '5364dffc62ad3916.jpg', '20191018/d674a1190fce22a317f83c8af9eec4eb.jpg', 'file', '2760', 1571386125);
INSERT INTO `rain_file` VALUES (17, '5364dffc62ad3916.jpg', '20191018/20f835ae5caa3bb7f0fe1701085a30bd.jpg', 'file', '2760', 1571386154);
INSERT INTO `rain_file` VALUES (18, '5364dffc62ad3916.jpg', '20191026/091f57ab99b7a0c00a2837e69a365bfc.jpg', 'file', '2760', 1572069504);
INSERT INTO `rain_file` VALUES (19, '20190910200406.gif', '20191026/257d5d824b15470803718c6355c91a46.gif', 'file', '238392', 1572069800);
INSERT INTO `rain_file` VALUES (20, '20190910200406.gif', '20191026/10b7bac6d0f6c974627059f405ac71ff.gif', 'file', '238392', 1572069813);
INSERT INTO `rain_file` VALUES (21, '20190910200406.gif', '20191026/56c5b2dc600ce374495cbcdfd2629cef.gif', 'file', '238392', 1572069916);
INSERT INTO `rain_file` VALUES (22, '风玲 wlop鬼刀4k壁纸_彼岸图网.jpg', '20191026/dfbfbfe8e8ecbef02a0a7db93aac3d86.jpg', 'file', '3326902', 1572069923);
INSERT INTO `rain_file` VALUES (23, '20190910200406.gif', '20191026/0937b1238cbc8533fb941683734f3d77.gif', 'file', '238392', 1572070245);
INSERT INTO `rain_file` VALUES (24, '2.png', '20191113/de19c76db3096b3801631cc10e885d44.png', 'file', '5948', 1573636207);
INSERT INTO `rain_file` VALUES (25, '3.jpg', '20191113/2f15fcdbee8a5d3fe6d5cc5ae14b274c.jpg', 'file', '4096', 1573636444);
INSERT INTO `rain_file` VALUES (26, '3.jpg', '20191113/e47c274939fda0fe5356783408df9bc1.jpg', 'file', '4096', 1573637913);
INSERT INTO `rain_file` VALUES (27, '3.jpg', '20191113/34dfbfea64adf0263aa643eaf26cf693.jpg', 'file', '4096', 1573639748);
INSERT INTO `rain_file` VALUES (28, '2.png', '20191113/ae8b245bda656fad2fa1cbce7f993e94.png', 'file', '5948', 1573639959);
INSERT INTO `rain_file` VALUES (29, '3.jpg', '20191113/bd61bfd31e155eb25622e0dde0844490.jpg', 'file', '4096', 1573640081);
INSERT INTO `rain_file` VALUES (30, '3.jpg', '20191113/cca38b6b62de20ff8da377368f80ef8c.jpg', 'file', '4096', 1573640089);
INSERT INTO `rain_file` VALUES (31, '2.png', '20191113/6970e25aecfa17d1681e6fd50c2ea999.png', 'file', '5948', 1573640521);
INSERT INTO `rain_file` VALUES (32, '3.jpg', '20191113/f0134a6a3404f7d23234563fa83e2c58.jpg', 'file', '4096', 1573640574);
INSERT INTO `rain_file` VALUES (33, '2.png', '20191113/602aa736a25870da26558d117d406ae5.png', 'file', '5948', 1573640728);
INSERT INTO `rain_file` VALUES (34, '2.png', '20191113/d9edfb13adc17fce68b486977065766e.png', 'file', '5948', 1573640743);
INSERT INTO `rain_file` VALUES (35, '3.jpg', '20191113/1e4a47ce9e11b391b7a29e9e10a0551a.jpg', 'file', '4096', 1573640755);
INSERT INTO `rain_file` VALUES (36, '2.png', '20191113/7fa6712bb3b07d3d5c733d41706dd09f.png', 'file', '5948', 1573640908);
INSERT INTO `rain_file` VALUES (37, '3.jpg', '20191113/499505c78d8551eec83c6cf29e3acf3c.jpg', 'file', '4096', 1573641059);
INSERT INTO `rain_file` VALUES (38, '2.png', '20191113/2b388a28e8ae52e12b07f755828e9215.png', 'file', '5948', 1573641064);
INSERT INTO `rain_file` VALUES (39, '2.png', '20191113/bbc8a6246a4dc642947038873c94f4f3.png', 'file', '5948', 1573641133);
INSERT INTO `rain_file` VALUES (40, 'BF4wallpaper_ultra.png', '20191113/9ad2f8bc0ce2fb6fa36a8009c114e7c4.png', 'file', '166964896', 1573641351);
INSERT INTO `rain_file` VALUES (41, 'BF4.png', '20191113/ad647120624ab7bb5027349f53a80cb4.png', 'file', '72856938', 1573641469);
INSERT INTO `rain_file` VALUES (42, 'BF4.png', '20191113/e5231b03e8aa91cfb951c0af351e4cb2.png', 'file', '72856938', 1573641515);
INSERT INTO `rain_file` VALUES (43, '04_gettyimages_578830122_super_resized.jpg', '20191113/f7e3651b4bd9ce2661d256bc14fc365a.jpg', 'file', '779585', 1573641527);
INSERT INTO `rain_file` VALUES (44, 'BF4wallpaper_ultra.png', '20191113/4dd562a7ccb9761933d48616ea8bbcc5.png', 'file', '166964896', 1573641533);
INSERT INTO `rain_file` VALUES (45, 'BF4.png', '20191113/74e18c420d663b43f6e570b5414e7452.png', 'file', '72856938', 1573641567);
INSERT INTO `rain_file` VALUES (46, 'BF4wallpaper_ultra.png', '20191113/4cd5e642eb77e4729a78d5131653c70d.png', 'file', '166964896', 1573641584);
INSERT INTO `rain_file` VALUES (47, '16_gettyimages_838017098_high_resized.jpg', '20191113/b9d76184f63d4b57b380bd45b8dc5af8.jpg', 'file', '971118', 1573641622);
INSERT INTO `rain_file` VALUES (48, '18_gettyimages_896000124_super_resized.jpg', '20191113/fe413eb0e13c3a1aad196a5e34f073ff.jpg', 'file', '1153168', 1573641628);
INSERT INTO `rain_file` VALUES (49, '109f11444815d69bd16073c6f4635d7b.jpg', '20191113/c850dacd999fe34b6384a52ad5f297bc.jpg', 'file', '651872', 1573641631);
INSERT INTO `rain_file` VALUES (50, '13_gettyimages_589911335_super_resized.jpg', '20191113/9264651485f1faa7f27e7350f3e3e680.jpg', 'file', '996506', 1573641668);
INSERT INTO `rain_file` VALUES (51, '17_gettyimages_841813840_super_resized.jpg', '20191113/af0e9af1f6016047f0a327d96593d636.jpg', 'file', '759016', 1573641685);
INSERT INTO `rain_file` VALUES (52, '109f11444815d69bd16073c6f4635d7b.jpg', '20191114/5671335f2e11e9482f8c481fe3647516.jpg', 'file', '651872', 1573691754);
INSERT INTO `rain_file` VALUES (53, '18_gettyimages_896000124_super_resized.jpg', '20191114/4cb64fb69bd202532d67e5c70c0b1ef7.jpg', 'file', '1153168', 1573691960);
INSERT INTO `rain_file` VALUES (54, '109f11444815d69bd16073c6f4635d7b.jpg', '20191114/a475364ad3ef747860049938aafd1da5.jpg', 'file', '651872', 1573691990);
INSERT INTO `rain_file` VALUES (55, '17_gettyimages_841813840_super_resized.jpg', '20191114/f72617a093a550a5b10de4da204d9890.jpg', 'file', '759016', 1573692228);
INSERT INTO `rain_file` VALUES (56, '18_gettyimages_896000124_super_resized.jpg', '20191114/bf295507faf52f4cde3f4127e1ec87e6.jpg', 'file', '1153168', 1573692307);
INSERT INTO `rain_file` VALUES (57, '17_gettyimages_841813840_super_resized.jpg', '20191114/414fc8efdead51f50684cbe9a3f5e6ef.jpg', 'file', '759016', 1573692322);
INSERT INTO `rain_file` VALUES (58, '109f11444815d69bd16073c6f4635d7b.jpg', '20191114/dfa65bff878b42923362846eb5a7daad.jpg', 'file', '651872', 1573692347);
INSERT INTO `rain_file` VALUES (59, '109f11444815d69bd16073c6f4635d7b.jpg', '20191114/4027995af9de58a305bfd45a4858f868.jpg', 'file', '651872', 1573692444);
INSERT INTO `rain_file` VALUES (60, '17_gettyimages_841813840_super_resized.jpg', '20191114/4c0f8b2cf2c54a50989b41ba3edfa294.jpg', 'file', '759016', 1573692635);
INSERT INTO `rain_file` VALUES (61, '18_gettyimages_896000124_super_resized.jpg', '20191114/ef0475417b9182f7169647a642e5c78a.jpg', 'file', '1153168', 1573692776);
INSERT INTO `rain_file` VALUES (62, '109f11444815d69bd16073c6f4635d7b.jpg', '20191114/2828f8535865a396ba4cf00d3ff96324.jpg', 'file', '651872', 1573693375);
INSERT INTO `rain_file` VALUES (63, '18_gettyimages_896000124_super_resized.jpg', '20191114/16a5ec7da236dc77074960492756109a.jpg', 'file', '1153168', 1573695881);
INSERT INTO `rain_file` VALUES (64, '16_gettyimages_838017098_high_resized.jpg', '20191114/81a95e0dc0bd144edc09e54db81c57ce.jpg', 'file', '971118', 1573696001);
INSERT INTO `rain_file` VALUES (65, '18_gettyimages_896000124_super_resized.jpg', '20191114/1cbe132b007eac9d59f259cf97976907.jpg', 'file', '1153168', 1573696001);
INSERT INTO `rain_file` VALUES (66, '17_gettyimages_841813840_super_resized.jpg', '20191114/8a3294797f8f49537ed30b51e172249e.jpg', 'file', '759016', 1573696001);
INSERT INTO `rain_file` VALUES (67, '18_gettyimages_896000124_super_resized.jpg', '20191114/86395b9820cd030dba6c7d6b1c103cd7.jpg', 'file', '1153168', 1573696225);
INSERT INTO `rain_file` VALUES (68, '17_gettyimages_841813840_super_resized.jpg', '20191114/a25e72035f9418379c263a2a26abde44.jpg', 'file', '759016', 1573696225);
INSERT INTO `rain_file` VALUES (69, '16_gettyimages_838017098_high_resized.jpg', '20191114/8e81cba129d8c3e972bbc43b12d5a64e.jpg', 'file', '971118', 1573696225);
INSERT INTO `rain_file` VALUES (70, '15_gettyimages_695482741_super_resized.jpg', '20191114/931385d4973f5170c8a0449502a3e34c.jpg', 'file', '843244', 1573697155);
INSERT INTO `rain_file` VALUES (71, '17_gettyimages_841813840_super_resized.jpg', '20191114/6c4863809bddfe125dcbeb27c7247c07.jpg', 'file', '759016', 1573697155);
INSERT INTO `rain_file` VALUES (72, '16_gettyimages_838017098_high_resized.jpg', '20191114/b14bc893bbe8bbd7c2f75a7f5ba853d9.jpg', 'file', '971118', 1573697155);
INSERT INTO `rain_file` VALUES (73, '18_gettyimages_896000124_super_resized.jpg', '20191114/3c5e1feac06400fa45f3b4e600967ff0.jpg', 'file', '1153168', 1573697155);
INSERT INTO `rain_file` VALUES (74, '13_gettyimages_589911335_super_resized.jpg', '20191114/2ea1a69a89fe5b8e8b4f7957c476b609.jpg', 'file', '996506', 1573697155);
INSERT INTO `rain_file` VALUES (75, '04_gettyimages_578830122_super_resized.jpg', '20191114/1d6b537c529eb8ea5701da6cfe628fad.jpg', 'file', '779585', 1573697326);
INSERT INTO `rain_file` VALUES (76, '06_gettyimages_159063292_super_resized.jpg', '20191114/8371df9d579437dfb75927faf3df6799.jpg', 'file', '914565', 1573697326);
INSERT INTO `rain_file` VALUES (77, '03_gettyimages_641740218_super_resized.jpg', '20191114/b5fea07f7a0e97d6dddff330ad8c95bd.jpg', 'file', '912558', 1573697326);
INSERT INTO `rain_file` VALUES (78, '09_gettyimages_513037171_super_resized.jpg', '20191114/ef60628511e523b23a1a82f9442189dc.jpg', 'file', '1084256', 1573697326);
INSERT INTO `rain_file` VALUES (79, '05_gettyimages_477920536_high_resized.jpg', '20191114/957a907e229e48ed1abe682831bcc110.jpg', 'file', '1019804', 1573697326);
INSERT INTO `rain_file` VALUES (80, '07_gettyimages_471782677_super_resized.jpg', '20191114/7fb5488903b9e336fed1b86032aed5b3.jpg', 'file', '992735', 1573697326);
INSERT INTO `rain_file` VALUES (81, '10_gettyimages_559549785_small_resized.jpg', '20191114/cba5c22c28e3c42c88f159c407d436f6.jpg', 'file', '922960', 1573697326);
INSERT INTO `rain_file` VALUES (82, '06_gettyimages_159063292_super_resized.jpg', '20191114/e6158486e0aeb5b262ae77f0ec8358d3.jpg', 'file', '914565', 1573697380);
INSERT INTO `rain_file` VALUES (83, '04_gettyimages_578830122_super_resized.jpg', '20191114/466ce145403e09f674e4d6bf3f40c8d7.jpg', 'file', '779585', 1573697380);
INSERT INTO `rain_file` VALUES (84, '07_gettyimages_471782677_super_resized.jpg', '20191114/635c670e0b321aee050c003fd041c36f.jpg', 'file', '992735', 1573697380);
INSERT INTO `rain_file` VALUES (85, '03_gettyimages_641740218_super_resized.jpg', '20191114/cbf12bbdc0cd802937b22585f785cca4.jpg', 'file', '912558', 1573697380);
INSERT INTO `rain_file` VALUES (86, '05_gettyimages_477920536_high_resized.jpg', '20191114/38630c6e66c41e407551b07df10b09cc.jpg', 'file', '1019804', 1573697380);
INSERT INTO `rain_file` VALUES (87, '09_gettyimages_513037171_super_resized.jpg', '20191114/11e2a468ed6fbd1d4c9f2d309eaf099f.jpg', 'file', '1084256', 1573697380);
INSERT INTO `rain_file` VALUES (88, '10_gettyimages_559549785_small_resized.jpg', '20191114/887d79786c76c08abfdf3b4b8908f69d.jpg', 'file', '922960', 1573697380);
INSERT INTO `rain_file` VALUES (89, '06_gettyimages_159063292_super_resized.jpg', '20191114/36fdbd051474b136ebecbb6c994da4ef.jpg', 'file', '914565', 1573697476);
INSERT INTO `rain_file` VALUES (90, '03_gettyimages_641740218_super_resized.jpg', '20191114/88a15db47b0ce9a82d22ab505cba54a3.jpg', 'file', '912558', 1573697477);
INSERT INTO `rain_file` VALUES (91, '04_gettyimages_578830122_super_resized.jpg', '20191114/cdafe4941cb82665b4ee1540dd828507.jpg', 'file', '779585', 1573697477);
INSERT INTO `rain_file` VALUES (92, '09_gettyimages_513037171_super_resized.jpg', '20191114/cf7e35d7fd6f0e8f892426bb44b0f7a2.jpg', 'file', '1084256', 1573697477);
INSERT INTO `rain_file` VALUES (93, '05_gettyimages_477920536_high_resized.jpg', '20191114/2e34063034705ffb77ba5079fbb99f7f.jpg', 'file', '1019804', 1573697477);
INSERT INTO `rain_file` VALUES (94, '07_gettyimages_471782677_super_resized.jpg', '20191114/6ddbf5fa4a80030c73ab8fe224ae6fac.jpg', 'file', '992735', 1573697477);
INSERT INTO `rain_file` VALUES (95, '10_gettyimages_559549785_small_resized.jpg', '20191114/0cf7d012332298091d8583a214579045.jpg', 'file', '922960', 1573697477);
INSERT INTO `rain_file` VALUES (96, '18_gettyimages_896000124_super_resized.jpg', '20191114/95b923e2ab1b07bc15c34f3aac4ff5e8.jpg', 'file', '1153168', 1573697599);
INSERT INTO `rain_file` VALUES (97, '16_gettyimages_838017098_high_resized.jpg', '20191114/7a0605a016a735a966db714e649c37f0.jpg', 'file', '971118', 1573697604);
INSERT INTO `rain_file` VALUES (98, '17_gettyimages_841813840_super_resized.jpg', '20191114/55ce4c9a55b205165ee187f1e8c91894.jpg', 'file', '759016', 1573697610);
INSERT INTO `rain_file` VALUES (99, '16_gettyimages_838017098_high_resized.jpg', '20191114/c2cafb64a077f86de69d0f1b48a150d9.jpg', 'file', '971118', 1573697610);
INSERT INTO `rain_file` VALUES (100, '18_gettyimages_896000124_super_resized.jpg', '20191114/1d44f71606984a4269b979de12c770fe.jpg', 'file', '1153168', 1573697610);
INSERT INTO `rain_file` VALUES (101, '15_gettyimages_695482741_super_resized.jpg', '20191114/a32594d43fbb1d05d062750872b86b37.jpg', 'file', '843244', 1573697610);
INSERT INTO `rain_file` VALUES (102, 'BF4wallpaper_ultra.png', '20191114/434c72a6911399eb1a4ea257de2e0862.png', 'file', '166964896', 1573697689);
INSERT INTO `rain_file` VALUES (103, 'BF4wallpaper_ultra.png', '20191114/8e6e134f052bd9ff9bf4106074c391f4.png', 'file', '166964896', 1573697991);
INSERT INTO `rain_file` VALUES (104, '13_gettyimages_589911335_super_resized.jpg', '20191114/ecb84629ccec41dd9c491e334ce3950a.jpg', 'file', '996506', 1573698012);
INSERT INTO `rain_file` VALUES (105, '16_gettyimages_838017098_high_resized.jpg', '20191114/52eaf37772a82f804cacbb0fc0d77a4a.jpg', 'file', '971118', 1573698018);
INSERT INTO `rain_file` VALUES (106, '03_gettyimages_641740218_super_resized.jpg', '20191114/3b456c4768bbe5c27702eeef842b3d10.jpg', 'file', '912558', 1573698027);
INSERT INTO `rain_file` VALUES (107, '05_gettyimages_477920536_high_resized.jpg', '20191114/d69ac9fc17eb0ac506e3e7db702f54d8.jpg', 'file', '1019804', 1573698027);
INSERT INTO `rain_file` VALUES (108, '06_gettyimages_159063292_super_resized.jpg', '20191114/3ac026e3229536cdb740bc00e9008fa1.jpg', 'file', '914565', 1573698027);
INSERT INTO `rain_file` VALUES (109, '04_gettyimages_578830122_super_resized.jpg', '20191114/2134c4287ef88d75a2ac567d8fa6cc05.jpg', 'file', '779585', 1573698027);
INSERT INTO `rain_file` VALUES (110, '07_gettyimages_471782677_super_resized.jpg', '20191114/54a86e54eed8e5b11b3a5b8e64559abb.jpg', 'file', '992735', 1573698027);
INSERT INTO `rain_file` VALUES (111, '09_gettyimages_513037171_super_resized.jpg', '20191114/53e873fd5f4b2114ecae75cbc6cc4883.jpg', 'file', '1084256', 1573698027);
INSERT INTO `rain_file` VALUES (112, '15_gettyimages_695482741_super_resized.jpg', '20191114/da5c28770272d46c94f4a0998aaf0883.jpg', 'file', '843244', 1573698028);
INSERT INTO `rain_file` VALUES (113, '16_gettyimages_838017098_high_resized.jpg', '20191114/fa2a792038ebe8be8de448cf2707696a.jpg', 'file', '971118', 1573698028);
INSERT INTO `rain_file` VALUES (114, '10_gettyimages_559549785_small_resized.jpg', '20191114/060bf438c77b37f1b348a523754809bc.jpg', 'file', '922960', 1573698028);
INSERT INTO `rain_file` VALUES (115, '12_gettyimages_609979986_high_resized.jpg', '20191114/6f2781b18933db91ce906abcf670e448.jpg', 'file', '881579', 1573698028);
INSERT INTO `rain_file` VALUES (116, '13_gettyimages_589911335_super_resized.jpg', '20191114/07d8d06c244281b7d1edc82099d4e15b.jpg', 'file', '996506', 1573698028);
INSERT INTO `rain_file` VALUES (117, '17_gettyimages_841813840_super_resized.jpg', '20191114/c312c25a58c139c63f70b3984dd6280a.jpg', 'file', '759016', 1573698028);
INSERT INTO `rain_file` VALUES (118, '18_gettyimages_896000124_super_resized.jpg', '20191114/02444a3021de7c1b25adeea6cf98cd77.jpg', 'file', '1153168', 1573698028);
INSERT INTO `rain_file` VALUES (119, '09_gettyimages_513037171_super_resized.jpg', '20191114/e373211fb3f3dd36b671fd84d62c8606.jpg', 'file', '1084256', 1573698132);
INSERT INTO `rain_file` VALUES (120, '03_gettyimages_641740218_super_resized.jpg', '20191114/6897e3762d694555311388cfd5341fe1.jpg', 'file', '912558', 1573698132);
INSERT INTO `rain_file` VALUES (121, '07_gettyimages_471782677_super_resized.jpg', '20191114/e70ca77df69651dd7230e1a76222a492.jpg', 'file', '992735', 1573698132);
INSERT INTO `rain_file` VALUES (122, '04_gettyimages_578830122_super_resized.jpg', '20191114/5541d405c901108d393319abd6a13eb1.jpg', 'file', '779585', 1573698132);
INSERT INTO `rain_file` VALUES (123, '05_gettyimages_477920536_high_resized.jpg', '20191114/3dcbbb4459b589d2a22167299995d048.jpg', 'file', '1019804', 1573698132);
INSERT INTO `rain_file` VALUES (124, '06_gettyimages_159063292_super_resized.jpg', '20191114/48cf3a21afe59b7e38facc251b46d9cb.jpg', 'file', '914565', 1573698132);
INSERT INTO `rain_file` VALUES (125, '10_gettyimages_559549785_small_resized.jpg', '20191114/cf4ef062da12bce86bd9fda698572e90.jpg', 'file', '922960', 1573698133);
INSERT INTO `rain_file` VALUES (126, '13_gettyimages_589911335_super_resized.jpg', '20191114/60d00dea452eae0c15b27ee303202a07.jpg', 'file', '996506', 1573698133);
INSERT INTO `rain_file` VALUES (127, '15_gettyimages_695482741_super_resized.jpg', '20191114/152a36fa0f22985e716ff42dbf56b134.jpg', 'file', '843244', 1573698133);
INSERT INTO `rain_file` VALUES (128, '17_gettyimages_841813840_super_resized.jpg', '20191114/b502d08f975be0e46d6d2a772c8d09bd.jpg', 'file', '759016', 1573698133);
INSERT INTO `rain_file` VALUES (129, '16_gettyimages_838017098_high_resized.jpg', '20191114/6ea9103548c80aa6c627f82ee364e4d4.jpg', 'file', '971118', 1573698133);
INSERT INTO `rain_file` VALUES (130, '12_gettyimages_609979986_high_resized.jpg', '20191114/fc520cf871329dd56bd302a779fae7b9.jpg', 'file', '881579', 1573698133);
INSERT INTO `rain_file` VALUES (131, '07_gettyimages_471782677_super_resized.jpg', '20191114/83e640b00730938e7ba65a52a9134ce0.jpg', 'file', '992735', 1573698180);
INSERT INTO `rain_file` VALUES (132, '06_gettyimages_159063292_super_resized.jpg', '20191114/89686eebf2beea0b2a4f11d507ffbdf4.jpg', 'file', '914565', 1573698180);
INSERT INTO `rain_file` VALUES (133, '10_gettyimages_559549785_small_resized.jpg', '20191114/f6da8e571b3fd935ea9d1f3f5ce997b8.jpg', 'file', '922960', 1573698180);
INSERT INTO `rain_file` VALUES (134, '05_gettyimages_477920536_high_resized.jpg', '20191114/ae112cd10c86b14f10ffa15afb4fac5c.jpg', 'file', '1019804', 1573698180);
INSERT INTO `rain_file` VALUES (135, '04_gettyimages_578830122_super_resized.jpg', '20191114/18d563ef9e8d13ecf4cee20fd4aebc92.jpg', 'file', '779585', 1573698180);
INSERT INTO `rain_file` VALUES (136, '09_gettyimages_513037171_super_resized.jpg', '20191114/a5a7f7d6c24e0e335f60913efa6f3522.jpg', 'file', '1084256', 1573698180);
INSERT INTO `rain_file` VALUES (137, '12_gettyimages_609979986_high_resized.jpg', '20191114/4cfec2aa0d2972b7414ea3bdd952164e.jpg', 'file', '881579', 1573698181);
INSERT INTO `rain_file` VALUES (138, '16_gettyimages_838017098_high_resized.jpg', '20191114/858364f37991058121b1d7a76e09b479.jpg', 'file', '971118', 1573698181);
INSERT INTO `rain_file` VALUES (139, '17_gettyimages_841813840_super_resized.jpg', '20191114/cb4f061313848da70953aa00cd687842.jpg', 'file', '759016', 1573698181);
INSERT INTO `rain_file` VALUES (140, '15_gettyimages_695482741_super_resized.jpg', '20191114/53706bb7af5f46ddd2fc2f93819fec71.jpg', 'file', '843244', 1573698181);
INSERT INTO `rain_file` VALUES (141, '13_gettyimages_589911335_super_resized.jpg', '20191114/b8c4bbd360a6cf529bc0c6f89489a8d5.jpg', 'file', '996506', 1573698181);
INSERT INTO `rain_file` VALUES (142, '04_gettyimages_578830122_super_resized.jpg', '20191114/6d4e43fbd8d07f46282753878d7dff48.jpg', 'file', '779585', 1573698231);
INSERT INTO `rain_file` VALUES (143, '06_gettyimages_159063292_super_resized.jpg', '20191114/1b9e3e4179c7c6f1a5a88f2ff57d0050.jpg', 'file', '914565', 1573698231);
INSERT INTO `rain_file` VALUES (144, '05_gettyimages_477920536_high_resized.jpg', '20191114/79b6aff77e6fa8cc072ceb00f8c7d723.jpg', 'file', '1019804', 1573698231);
INSERT INTO `rain_file` VALUES (145, '07_gettyimages_471782677_super_resized.jpg', '20191114/f578163c8104a410a46fad7efdda7641.jpg', 'file', '992735', 1573698231);
INSERT INTO `rain_file` VALUES (146, '03_gettyimages_641740218_super_resized.jpg', '20191114/b41072a7cc6a5da450375e6504c4d7b8.jpg', 'file', '912558', 1573698240);
INSERT INTO `rain_file` VALUES (147, '04_gettyimages_578830122_super_resized.jpg', '20191114/274f21c4e9f40d8472a0956c9a05127c.jpg', 'file', '779585', 1573698240);
INSERT INTO `rain_file` VALUES (148, '07_gettyimages_471782677_super_resized.jpg', '20191114/b42d88aafb8fa685cc4884a004e749f7.jpg', 'file', '992735', 1573698240);
INSERT INTO `rain_file` VALUES (149, '06_gettyimages_159063292_super_resized.jpg', '20191114/559242f9117d0c5a2386b2b95108ad67.jpg', 'file', '914565', 1573698240);
INSERT INTO `rain_file` VALUES (150, '09_gettyimages_513037171_super_resized.jpg', '20191114/86eeb8cab9ba39d7f372aa811b77faf8.jpg', 'file', '1084256', 1573698240);
INSERT INTO `rain_file` VALUES (151, '05_gettyimages_477920536_high_resized.jpg', '20191114/4540c2f804857e830fb88b22a23a47aa.jpg', 'file', '1019804', 1573698240);
INSERT INTO `rain_file` VALUES (152, '12_gettyimages_609979986_high_resized.jpg', '20191114/f34cb7981090c94b9645a6f9c5ded7a2.jpg', 'file', '881579', 1573698241);
INSERT INTO `rain_file` VALUES (153, '15_gettyimages_695482741_super_resized.jpg', '20191114/a2b27f70762a231be64a7ad791e8f8c7.jpg', 'file', '843244', 1573698241);
INSERT INTO `rain_file` VALUES (154, '10_gettyimages_559549785_small_resized.jpg', '20191114/e0c5a4fb29aa64c01c48c28fa738584b.jpg', 'file', '922960', 1573698241);
INSERT INTO `rain_file` VALUES (155, '13_gettyimages_589911335_super_resized.jpg', '20191114/ded25c36e84ee4825674c2ce21a0eacb.jpg', 'file', '996506', 1573698241);
INSERT INTO `rain_file` VALUES (156, '17_gettyimages_841813840_super_resized.jpg', '20191114/6537ba942fe7f1880ca9e5839cd93b05.jpg', 'file', '759016', 1573698241);
INSERT INTO `rain_file` VALUES (157, '16_gettyimages_838017098_high_resized.jpg', '20191114/72841cf7acb0abf49992cea052619894.jpg', 'file', '971118', 1573698241);
INSERT INTO `rain_file` VALUES (158, '18_gettyimages_896000124_super_resized.jpg', '20191114/7819ae93eac3668ac8a287abba27e5db.jpg', 'file', '1153168', 1573698241);
INSERT INTO `rain_file` VALUES (159, 'BF4.png', '20191114/dfc91985a470c109679a9439334e82a3.png', 'file', '72856938', 1573698267);
INSERT INTO `rain_file` VALUES (160, '15_gettyimages_695482741_super_resized.jpg', '20191114/6630103b1f0b273abc672f285067064c.jpg', 'file', '843244', 1573698500);
INSERT INTO `rain_file` VALUES (161, '04_gettyimages_578830122_super_resized.jpg', '20191114/69f7a73022e82da5fea6985c2e5f6eb0.jpg', 'file', '779585', 1573700675);
INSERT INTO `rain_file` VALUES (162, '06_gettyimages_159063292_super_resized.jpg', '20191114/68e4a02fc5f115c204f03abef9469a0e.jpg', 'file', '914565', 1573700675);
INSERT INTO `rain_file` VALUES (163, '05_gettyimages_477920536_high_resized.jpg', '20191114/9e7605adfc52c26d9672f50bb46db742.jpg', 'file', '1019804', 1573700675);
INSERT INTO `rain_file` VALUES (164, '07_gettyimages_471782677_super_resized.jpg', '20191114/4f50d9f111f471e8d98235b7c9b92403.jpg', 'file', '992735', 1573709506);
INSERT INTO `rain_file` VALUES (165, '06_gettyimages_159063292_super_resized.jpg', '20191114/2fe4a4be96b7578ace6b6e453df7972a.jpg', 'file', '914565', 1573709506);
INSERT INTO `rain_file` VALUES (166, '09_gettyimages_513037171_super_resized.jpg', '20191114/dab08ff94b05f7d409bf15005a19bff0.jpg', 'file', '1084256', 1573709506);
INSERT INTO `rain_file` VALUES (167, '05_gettyimages_477920536_high_resized.jpg', '20191114/2caa92058526a7455cc5cdae2c8232b7.jpg', 'file', '1019804', 1573709506);
INSERT INTO `rain_file` VALUES (168, '18_gettyimages_896000124_super_resized.jpg', '20191114/0e97f026ee7525f502702904820bd37c.jpg', 'file', '1153168', 1573722309);
INSERT INTO `rain_file` VALUES (169, '17_gettyimages_841813840_super_resized.jpg', '20191114/a3928fb322a6ce8807f18d88902c46c5.jpg', 'file', '759016', 1573722309);
INSERT INTO `rain_file` VALUES (170, '16_gettyimages_838017098_high_resized.jpg', '20191114/b22e6330b56db4dfead773014be64077.jpg', 'file', '971118', 1573722309);
INSERT INTO `rain_file` VALUES (171, '06_gettyimages_159063292_super_resized.jpg', '20191114/9530900798d3daee058b668406c31a95.jpg', 'file', '914565', 1573722319);
INSERT INTO `rain_file` VALUES (172, '07_gettyimages_471782677_super_resized.jpg', '20191114/614c4954bb9ed469ea1154de9be4b3a6.jpg', 'file', '992735', 1573722319);
INSERT INTO `rain_file` VALUES (173, '09_gettyimages_513037171_super_resized.jpg', '20191114/2ee822b9b8d95532bd76e9a89916448b.jpg', 'file', '1084256', 1573722319);
INSERT INTO `rain_file` VALUES (174, '05_gettyimages_477920536_high_resized.jpg', '20191114/d3c4f6f091bad4f14fc6435a97fe6807.jpg', 'file', '1019804', 1573722368);
INSERT INTO `rain_file` VALUES (175, '06_gettyimages_159063292_super_resized.jpg', '20191114/398fd4e5dcf17fd6cb7937d312a98572.jpg', 'file', '914565', 1573722368);
INSERT INTO `rain_file` VALUES (176, '07_gettyimages_471782677_super_resized.jpg', '20191114/9a58165557403dc85964c9e52222c87c.jpg', 'file', '992735', 1573722368);
INSERT INTO `rain_file` VALUES (177, '09_gettyimages_513037171_super_resized.jpg', '20191114/fa1a9b8575ed5fcd165fdea4629e6872.jpg', 'file', '1084256', 1573722368);
INSERT INTO `rain_file` VALUES (178, '06_gettyimages_159063292_super_resized.jpg', '20191114/e2ae7f200d0724d78c04f83940f6fcab.jpg', 'file', '914565', 1573722414);
INSERT INTO `rain_file` VALUES (179, '07_gettyimages_471782677_super_resized.jpg', '20191114/8aa88f530fee8e89350a1f7c4ef92b5e.jpg', 'file', '992735', 1573722414);
INSERT INTO `rain_file` VALUES (180, '04_gettyimages_578830122_super_resized.jpg', '20191114/59a8b6c570da4be62696ae793ff30c5f.jpg', 'file', '779585', 1573722414);
INSERT INTO `rain_file` VALUES (181, '05_gettyimages_477920536_high_resized.jpg', '20191114/95eaf7fb2586b0d4b7dfddd71d8ec84a.jpg', 'file', '1019804', 1573722414);
INSERT INTO `rain_file` VALUES (182, '09_gettyimages_513037171_super_resized.jpg', '20191114/4a8463c3bcfe2fb6c0883ce4e3a78d07.jpg', 'file', '1084256', 1573722414);
INSERT INTO `rain_file` VALUES (183, '04_gettyimages_578830122_super_resized.jpg', '20191114/b73a71df730ff61b4defc7ac57cfb846.jpg', 'file', '779585', 1573722437);
INSERT INTO `rain_file` VALUES (184, '05_gettyimages_477920536_high_resized.jpg', '20191114/be079c410adcfce34af7f9d019e53fdc.jpg', 'file', '1019804', 1573722437);
INSERT INTO `rain_file` VALUES (185, '06_gettyimages_159063292_super_resized.jpg', '20191114/dd76c9f5938e7e54c47455fea605deab.jpg', 'file', '914565', 1573722437);
INSERT INTO `rain_file` VALUES (186, '07_gettyimages_471782677_super_resized.jpg', '20191114/7a0fc8a911c39b8098ac32fe89d8016f.jpg', 'file', '992735', 1573722437);
INSERT INTO `rain_file` VALUES (187, '09_gettyimages_513037171_super_resized.jpg', '20191114/f3ddd0b2716bad7e044e0a5559dd2aff.jpg', 'file', '1084256', 1573722437);
INSERT INTO `rain_file` VALUES (188, '03_gettyimages_641740218_super_resized.jpg', '20191114/6e58748792ccec506d32659f5722a660.jpg', 'file', '912558', 1573722437);
INSERT INTO `rain_file` VALUES (189, '12_gettyimages_609979986_high_resized.jpg', '20191114/1bde3490bef80cb7cf9b96d04817c6d1.jpg', 'file', '881579', 1573722437);
INSERT INTO `rain_file` VALUES (190, '10_gettyimages_559549785_small_resized.jpg', '20191114/c40139aa9800c34fe59a538cf5727985.jpg', 'file', '922960', 1573722437);
INSERT INTO `rain_file` VALUES (191, '15_gettyimages_695482741_super_resized.jpg', '20191114/179ae92bd522b6e0c0bf3e85c8befa9d.jpg', 'file', '843244', 1573722437);
INSERT INTO `rain_file` VALUES (192, '17_gettyimages_841813840_super_resized.jpg', '20191114/2395728a0d2e624c0cd67dd9e7a77135.jpg', 'file', '759016', 1573722437);
INSERT INTO `rain_file` VALUES (193, '13_gettyimages_589911335_super_resized.jpg', '20191114/4c9a91c2246a63e9b2ea0c30367b788b.jpg', 'file', '996506', 1573722437);
INSERT INTO `rain_file` VALUES (194, '16_gettyimages_838017098_high_resized.jpg', '20191114/1c14fcc8e6118e8db059810a675050f0.jpg', 'file', '971118', 1573722437);
INSERT INTO `rain_file` VALUES (195, '18_gettyimages_896000124_super_resized.jpg', '20191114/08271d08816548c084c837f74661892c.jpg', 'file', '1153168', 1573722438);
INSERT INTO `rain_file` VALUES (196, '03_gettyimages_641740218_super_resized.jpg', '20191114/863ecfc12ab7d77ea824630a05cb9313.jpg', 'file', '912558', 1573722478);
INSERT INTO `rain_file` VALUES (197, '04_gettyimages_578830122_super_resized.jpg', '20191114/0386a722d4665e76436041774ede6dd3.jpg', 'file', '779585', 1573722478);
INSERT INTO `rain_file` VALUES (198, '05_gettyimages_477920536_high_resized.jpg', '20191114/93a1926c8a9838e8d67c903f44df581c.jpg', 'file', '1019804', 1573722478);
INSERT INTO `rain_file` VALUES (199, '07_gettyimages_471782677_super_resized.jpg', '20191114/05131a279757153746a979abc9ade520.jpg', 'file', '992735', 1573722478);
INSERT INTO `rain_file` VALUES (200, '09_gettyimages_513037171_super_resized.jpg', '20191114/f0432e43b07d97d42cfd2c2a30765f06.jpg', 'file', '1084256', 1573722478);
INSERT INTO `rain_file` VALUES (201, '06_gettyimages_159063292_super_resized.jpg', '20191114/1b3ce9757313ef59e059ef6c5347b525.jpg', 'file', '914565', 1573722478);
INSERT INTO `rain_file` VALUES (202, '12_gettyimages_609979986_high_resized.jpg', '20191114/a35c5ad32e368a04e6d8b6285e2631ac.jpg', 'file', '881579', 1573722478);
INSERT INTO `rain_file` VALUES (203, '10_gettyimages_559549785_small_resized.jpg', '20191114/c14c82bab1035c1be8603baaf0f5f7b7.jpg', 'file', '922960', 1573722478);
INSERT INTO `rain_file` VALUES (204, '15_gettyimages_695482741_super_resized.jpg', '20191114/589f276b63c462b626cea1c726bc579b.jpg', 'file', '843244', 1573722478);
INSERT INTO `rain_file` VALUES (205, '13_gettyimages_589911335_super_resized.jpg', '20191114/8571f17c018a045249a763a71ec55b54.jpg', 'file', '996506', 1573722478);
INSERT INTO `rain_file` VALUES (206, '17_gettyimages_841813840_super_resized.jpg', '20191114/12af6fbb2ee44fdd197f498ab10e5829.jpg', 'file', '759016', 1573722478);
INSERT INTO `rain_file` VALUES (207, '16_gettyimages_838017098_high_resized.jpg', '20191114/d89614a3de4070b395932a886de062dc.jpg', 'file', '971118', 1573722478);
INSERT INTO `rain_file` VALUES (208, '18_gettyimages_896000124_super_resized.jpg', '20191114/cad9c8409a7786cf5339330b7981cc63.jpg', 'file', '1153168', 1573722479);
INSERT INTO `rain_file` VALUES (209, '03_gettyimages_641740218_super_resized.jpg', '20191114/698d296c763a758db3121e586fe3ae1e.jpg', 'file', '912558', 1573722498);
INSERT INTO `rain_file` VALUES (210, '05_gettyimages_477920536_high_resized.jpg', '20191114/e787fdbabadfaa6bd3d5923e2c0526fe.jpg', 'file', '1019804', 1573722498);
INSERT INTO `rain_file` VALUES (211, '04_gettyimages_578830122_super_resized.jpg', '20191114/2e39f72bee353cfd2bc51eec062f4eda.jpg', 'file', '779585', 1573722498);
INSERT INTO `rain_file` VALUES (212, '06_gettyimages_159063292_super_resized.jpg', '20191114/c0f4a73da5b9e69a237e4015ea1cfd94.jpg', 'file', '914565', 1573722498);
INSERT INTO `rain_file` VALUES (213, '07_gettyimages_471782677_super_resized.jpg', '20191114/f34f257efc48c4aed3204d36abe7c05e.jpg', 'file', '992735', 1573722498);
INSERT INTO `rain_file` VALUES (214, '07_gettyimages_471782677_super_resized.jpg', '20191114/725eb9f3a8ecab0cae2fd47580a42710.jpg', 'file', '992735', 1573722513);
INSERT INTO `rain_file` VALUES (215, '05_gettyimages_477920536_high_resized.jpg', '20191114/1da3066f96ae0d177deb8cc627e0fa71.jpg', 'file', '1019804', 1573722513);
INSERT INTO `rain_file` VALUES (216, '04_gettyimages_578830122_super_resized.jpg', '20191114/b40188dd3742289c0d2ec929c961a589.jpg', 'file', '779585', 1573722513);
INSERT INTO `rain_file` VALUES (217, '06_gettyimages_159063292_super_resized.jpg', '20191114/91ea955fdc8b99e36be4a5b4066c9852.jpg', 'file', '914565', 1573722513);
INSERT INTO `rain_file` VALUES (218, '03_gettyimages_641740218_super_resized.jpg', '20191114/bb6a8eb01ac70b9e594856195c479339.jpg', 'file', '912558', 1573722514);
INSERT INTO `rain_file` VALUES (219, '03_gettyimages_641740218_super_resized.jpg', '20191114/4335301fbee0519425b623717ff1ec4f.jpg', 'file', '912558', 1573722547);
INSERT INTO `rain_file` VALUES (220, '04_gettyimages_578830122_super_resized.jpg', '20191114/95ec4a4fcb1bc2b97bb42ade64f24eaa.jpg', 'file', '779585', 1573722547);
INSERT INTO `rain_file` VALUES (221, '07_gettyimages_471782677_super_resized.jpg', '20191114/2774f1533dd9acb6f92e93b3a4743bcc.jpg', 'file', '992735', 1573722547);
INSERT INTO `rain_file` VALUES (222, '06_gettyimages_159063292_super_resized.jpg', '20191114/2aa36d1653605dc7391153dcc2c1a8c0.jpg', 'file', '914565', 1573722547);
INSERT INTO `rain_file` VALUES (223, '05_gettyimages_477920536_high_resized.jpg', '20191114/d21a3f1c3ae152944c156e252166773e.jpg', 'file', '1019804', 1573722547);
INSERT INTO `rain_file` VALUES (224, '09_gettyimages_513037171_super_resized.jpg', '20191114/2dae4dfdb923c8d6abea7087737216ec.jpg', 'file', '1084256', 1573722547);
INSERT INTO `rain_file` VALUES (225, '12_gettyimages_609979986_high_resized.jpg', '20191114/91122618f622f9c6254dc914722725c0.jpg', 'file', '881579', 1573722547);
INSERT INTO `rain_file` VALUES (226, '10_gettyimages_559549785_small_resized.jpg', '20191114/42cfcc33e53a4103cf2ace5bd89a04e6.jpg', 'file', '922960', 1573722547);
INSERT INTO `rain_file` VALUES (227, '13_gettyimages_589911335_super_resized.jpg', '20191114/02059e80f89c93778c0c10812bad31de.jpg', 'file', '996506', 1573722547);
INSERT INTO `rain_file` VALUES (228, '15_gettyimages_695482741_super_resized.jpg', '20191114/0b25244808dc59bf74d49af2a2b536e4.jpg', 'file', '843244', 1573722547);
INSERT INTO `rain_file` VALUES (229, '16_gettyimages_838017098_high_resized.jpg', '20191114/06e863ac18f784b35f9f73fc77a74656.jpg', 'file', '971118', 1573722547);
INSERT INTO `rain_file` VALUES (230, '17_gettyimages_841813840_super_resized.jpg', '20191114/21e1247886a1f230bd0ab7dd136c4f4d.jpg', 'file', '759016', 1573722547);
INSERT INTO `rain_file` VALUES (231, '18_gettyimages_896000124_super_resized.jpg', '20191114/b4da0ae19d941278e988ebba9ebae38b.jpg', 'file', '1153168', 1573722548);
INSERT INTO `rain_file` VALUES (232, 'BF4.png', '20191114/a3c2e60a84af6afd2198b6f1a0ea5ba9.png', 'file', '72856938', 1573722568);
INSERT INTO `rain_file` VALUES (233, '风玲 wlop鬼刀4k壁纸_彼岸图网.jpg', '20191114/d92e8dd94a503c6dc1e2c0a196b38fbe.jpg', 'file', '3326902', 1573722926);
INSERT INTO `rain_file` VALUES (234, '风玲 wlop鬼刀4k壁纸_彼岸图网.jpg', '20191114/ad19ea0ae1acf891cf222ca9c4667f0f.jpg', 'file', '3326902', 1573722948);
INSERT INTO `rain_file` VALUES (235, '05_gettyimages_477920536_high_resized.jpg', '20191114/b4ac0406087713a5ff3a330877d687b2.jpg', 'file', '1019804', 1573722969);
INSERT INTO `rain_file` VALUES (236, '03_gettyimages_641740218_super_resized.jpg', '20191114/17c6d4042d91b32c874e5bc565219050.jpg', 'file', '912558', 1573722969);
INSERT INTO `rain_file` VALUES (237, '06_gettyimages_159063292_super_resized.jpg', '20191114/575714d71278c405baada91c504ef678.jpg', 'file', '914565', 1573722969);
INSERT INTO `rain_file` VALUES (238, '04_gettyimages_578830122_super_resized.jpg', '20191114/575714d71278c405baada91c504ef678.jpg', 'file', '779585', 1573722969);
INSERT INTO `rain_file` VALUES (239, '04_gettyimages_578830122_super_resized.jpg', '20191114/3906dc7ff0bcaa08ab5713bdf5fc42bb.jpg', 'file', '779585', 1573723104);
INSERT INTO `rain_file` VALUES (240, '06_gettyimages_159063292_super_resized.jpg', '20191114/a1403e3549ab4ac57e027505699d15d7.jpg', 'file', '914565', 1573723104);
INSERT INTO `rain_file` VALUES (241, '05_gettyimages_477920536_high_resized.jpg', '20191114/659fbb59735c8c2064e29b7872177703.jpg', 'file', '1019804', 1573723105);
INSERT INTO `rain_file` VALUES (242, '06_gettyimages_159063292_super_resized.jpg', '20191114/ff74ac56e0230ffe8aabc020046d3067.jpg', 'file', '914565', 1573723174);
INSERT INTO `rain_file` VALUES (243, '07_gettyimages_471782677_super_resized.jpg', '20191114/2575eb494d2bebf2b13d6318c3403cc0.jpg', 'file', '992735', 1573723174);
INSERT INTO `rain_file` VALUES (244, '05_gettyimages_477920536_high_resized.jpg', '20191114/92196ec9566831f79560d123144e5bbc.jpg', 'file', '1019804', 1573723174);
INSERT INTO `rain_file` VALUES (245, '09_gettyimages_513037171_super_resized.jpg', '20191114/d62d64ffaf002a7a5fb6efd7ba0ad34c.jpg', 'file', '1084256', 1573723174);
INSERT INTO `rain_file` VALUES (246, '04_gettyimages_578830122_super_resized.jpg', '20191114/7476ddc9a5d5db96904d8681de5d1cf7.jpg', 'file', '779585', 1573723241);
INSERT INTO `rain_file` VALUES (247, '05_gettyimages_477920536_high_resized.jpg', '20191114/d537561a2f12f0eaffa07edbc5c55cec.jpg', 'file', '1019804', 1573723242);
INSERT INTO `rain_file` VALUES (248, '06_gettyimages_159063292_super_resized.jpg', '20191114/c5ff9c0bd0588b3261ca9c5fcc1e7cf8.jpg', 'file', '914565', 1573723242);
INSERT INTO `rain_file` VALUES (249, '07_gettyimages_471782677_super_resized.jpg', '20191114/891455bd0616585a0e50875ab980a73f.jpg', 'file', '992735', 1573723242);
INSERT INTO `rain_file` VALUES (250, '06_gettyimages_159063292_super_resized.jpg', '20191114/2cc42be925f81a2572d94ad3ea3e9417.jpg', 'file', '914565', 1573724048);
INSERT INTO `rain_file` VALUES (251, '04_gettyimages_578830122_super_resized.jpg', '20191114/1e6e0db4c06e975d51768adab8885aef.jpg', 'file', '779585', 1573724048);
INSERT INTO `rain_file` VALUES (252, '05_gettyimages_477920536_high_resized.jpg', '20191114/4fc0a03444da05ae6a7e04852fbce585.jpg', 'file', '1019804', 1573724048);
INSERT INTO `rain_file` VALUES (253, '07_gettyimages_471782677_super_resized.jpg', '20191114/cf547f65ba70290384376d7855d197e7.jpg', 'file', '992735', 1573724078);
INSERT INTO `rain_file` VALUES (254, '04_gettyimages_578830122_super_resized.jpg', '20191114/50055919c1697ae0cd48d6237862dbfd.jpg', 'file', '779585', 1573724078);
INSERT INTO `rain_file` VALUES (255, '06_gettyimages_159063292_super_resized.jpg', '20191114/8cc5a17e71e9efefb192c7ca93a20ab7.jpg', 'file', '914565', 1573724078);
INSERT INTO `rain_file` VALUES (256, '05_gettyimages_477920536_high_resized.jpg', '20191114/26d944f7a90cfe57ba503a5ae56d4b65.jpg', 'file', '1019804', 1573724078);
INSERT INTO `rain_file` VALUES (257, '04_gettyimages_578830122_super_resized.jpg', '20191114/1af6cc155e99474878d6dcff355ed5be.jpg', 'file', '779585', 1573724110);
INSERT INTO `rain_file` VALUES (258, '06_gettyimages_159063292_super_resized.jpg', '20191114/8514b4f20446401914fc6286e2c39c29.jpg', 'file', '914565', 1573724110);
INSERT INTO `rain_file` VALUES (259, '05_gettyimages_477920536_high_resized.jpg', '20191114/9ae5b61b258e3d817953bcd644a0868a.jpg', 'file', '1019804', 1573724110);
INSERT INTO `rain_file` VALUES (260, '07_gettyimages_471782677_super_resized.jpg', '20191114/640ffb7ce6b21db193a371507f4fdc33.jpg', 'file', '992735', 1573724110);
INSERT INTO `rain_file` VALUES (261, '05_gettyimages_477920536_high_resized.jpg', '20191114/d9cbf3e389d2c9cec671d04cc638482a.jpg', 'file', '1019804', 1573724522);
INSERT INTO `rain_file` VALUES (262, '06_gettyimages_159063292_super_resized.jpg', '20191114/6b654e42279c1e20d7dc7a68b7a1cffc.jpg', 'file', '914565', 1573724522);
INSERT INTO `rain_file` VALUES (263, '07_gettyimages_471782677_super_resized.jpg', '20191114/5e898f3acc7a4dfe0b385646ddf2e9e8.jpg', 'file', '992735', 1573724522);
INSERT INTO `rain_file` VALUES (264, '07_gettyimages_471782677_super_resized.jpg', '20191114/9488ba522e456d66468fde563e10d361.jpg', 'file', '992735', 1573724629);
INSERT INTO `rain_file` VALUES (265, '06_gettyimages_159063292_super_resized.jpg', '20191114/acb30fed8397b2e222ba0402d53f5ea7.jpg', 'file', '914565', 1573724629);
INSERT INTO `rain_file` VALUES (266, '05_gettyimages_477920536_high_resized.jpg', '20191114/b9f6a76b1797e4d12ef2688b7f9d9a74.jpg', 'file', '1019804', 1573724629);
INSERT INTO `rain_file` VALUES (267, '09_gettyimages_513037171_super_resized.jpg', '20191114/5f6f61eed2d2d117caee4b803c87f0f2.jpg', 'file', '1084256', 1573724724);
INSERT INTO `rain_file` VALUES (268, '05_gettyimages_477920536_high_resized.jpg', '20191114/ca028842d7c629ec6096a544728ab3db.jpg', 'file', '1019804', 1573724724);
INSERT INTO `rain_file` VALUES (269, '04_gettyimages_578830122_super_resized.jpg', '20191114/4664922940b3e90e41464f2aebc2d989.jpg', 'file', '779585', 1573724724);
INSERT INTO `rain_file` VALUES (270, '07_gettyimages_471782677_super_resized.jpg', '20191114/d791516c1625142d7df2e5f6acb2cfc1.jpg', 'file', '992735', 1573724724);
INSERT INTO `rain_file` VALUES (271, '06_gettyimages_159063292_super_resized.jpg', '20191114/1cc173729c062cb025739c51f33f43f2.jpg', 'file', '914565', 1573724724);
INSERT INTO `rain_file` VALUES (272, '10_gettyimages_559549785_small_resized.jpg', '20191114/83ee6cc176f3948016109538452e7875.jpg', 'file', '922960', 1573724724);
INSERT INTO `rain_file` VALUES (273, '12_gettyimages_609979986_high_resized.jpg', '20191114/35beeb2aed0b0f346c5b05d4565f5f53.jpg', 'file', '881579', 1573724724);
INSERT INTO `rain_file` VALUES (274, '13_gettyimages_589911335_super_resized.jpg', '20191114/ed18101c5e4a86482a81117c99bd6177.jpg', 'file', '996506', 1573724724);
INSERT INTO `rain_file` VALUES (275, '16_gettyimages_838017098_high_resized.jpg', '20191114/96c325520bf43790d7fe7a1f04de432a.jpg', 'file', '971118', 1573724724);
INSERT INTO `rain_file` VALUES (276, '15_gettyimages_695482741_super_resized.jpg', '20191114/b82955e78dc93b024a58613dfea5ebad.jpg', 'file', '843244', 1573724724);
INSERT INTO `rain_file` VALUES (277, '18_gettyimages_896000124_super_resized.jpg', '20191114/b7f90d458dc7a475d18a7cb617353012.jpg', 'file', '1153168', 1573724725);
INSERT INTO `rain_file` VALUES (278, '17_gettyimages_841813840_super_resized.jpg', '20191114/716fc39d42cbb561d81f731cabcb65c2.jpg', 'file', '759016', 1573724725);
INSERT INTO `rain_file` VALUES (279, '04_gettyimages_578830122_super_resized.jpg', '20191114/e840d5f20d7586b8cffd30f5a4a6094d.jpg', 'file', '779585', 1573725251);
INSERT INTO `rain_file` VALUES (280, '16_gettyimages_838017098_high_resized.jpg', '20191114/21618bb54d733f70c87e0737bc32cc5a.jpg', 'file', '971118', 1573725283);
INSERT INTO `rain_file` VALUES (281, '06_gettyimages_159063292_super_resized.jpg', '20191114/ea54f376b2cad86e4b917b0bb67cc8a5.jpg', 'file', '914565', 1573725470);
INSERT INTO `rain_file` VALUES (282, '05_gettyimages_477920536_high_resized.jpg', '20191114/e343254bfa3e603cf456af0e81f3b105.jpg', 'file', '1019804', 1573725602);
INSERT INTO `rain_file` VALUES (283, '06_gettyimages_159063292_super_resized.jpg', '20191114/bb892bdb54803c4b7324a957f0e242ea.jpg', 'file', '914565', 1573725639);
INSERT INTO `rain_file` VALUES (284, '05_gettyimages_477920536_high_resized.jpg', '20191114/38ee1dd83c068ea0e69d8d6993b73055.jpg', 'file', '1019804', 1573725661);
INSERT INTO `rain_file` VALUES (285, '15_gettyimages_695482741_super_resized.jpg', '20191114/2b8248f8cf3e9af859483607f69d4e22.jpg', 'file', '843244', 1573725699);
INSERT INTO `rain_file` VALUES (286, '15_gettyimages_695482741_super_resized.jpg', '20191114/594bf9c6ed9afea15063fd1b31ee23c6.jpg', 'file', '843244', 1573725787);
INSERT INTO `rain_file` VALUES (287, '15_gettyimages_695482741_super_resized.jpg', '20191114/e93644abc5c99058037651ff3e028062.jpg', 'file', '843244', 1573725866);
INSERT INTO `rain_file` VALUES (288, '05_gettyimages_477920536_high_resized.jpg', '20191114/08d1085c4722ab11a94827a66a803499.jpg', 'file', '1019804', 1573725982);
INSERT INTO `rain_file` VALUES (289, '15_gettyimages_695482741_super_resized.jpg', '20191114/4c9abcb214f70a8c567f6449cb4f5798.jpg', 'file', '843244', 1573726014);
INSERT INTO `rain_file` VALUES (290, '16_gettyimages_838017098_high_resized.jpg', '20191114/ca76cc759b8846213c9b18f8e5bf55ec.jpg', 'file', '971118', 1573726079);
INSERT INTO `rain_file` VALUES (291, '17_gettyimages_841813840_super_resized.jpg', '20191114/e936b211acd57fcf157686ac27cf1a73.jpg', 'file', '759016', 1573726111);
INSERT INTO `rain_file` VALUES (292, '13_gettyimages_589911335_super_resized.jpg', '20191114/5dcf634212ddc418932b83ae0146eee0.jpg', 'file', '996506', 1573726150);
INSERT INTO `rain_file` VALUES (293, '109f11444815d69bd16073c6f4635d7b.jpg', '20191114/936c378792273cfb9b34a0c74fbdb52d.jpg', 'file', '651872', 1573726156);
INSERT INTO `rain_file` VALUES (294, '109f11444815d69bd16073c6f4635d7b.jpg', '20191114/c93eb647ce7d514ae85d354ff4156bfc.jpg', 'file', '651872', 1573727890);
INSERT INTO `rain_file` VALUES (295, 'uugai.com_1573805698604.png', '20191115/1dcddf770cb2720a6eef17cf2bc3f1de.png', 'file', '17028', 1573805750);
INSERT INTO `rain_file` VALUES (296, 'uugai.com-1573805711404.png', '20191115/0e1dc13675a9b0bfe3de34f872d75fbe.png', 'file', '20233', 1573805756);
INSERT INTO `rain_file` VALUES (297, '雨点1.png', '20191115/b0424747e4896c3ccdb19044b95709e9.png', 'file', '4780', 1573813003);
INSERT INTO `rain_file` VALUES (298, '雨点2.png', '20191115/9dcf4de01154725a664d6824f49aa9fe.png', 'file', '2787', 1573813007);
INSERT INTO `rain_file` VALUES (299, '后台管理系统1.png', '20191115/294f1c330d1ef21b7720023bbdcd70c9.png', 'file', '6108', 1573813850);
INSERT INTO `rain_file` VALUES (300, '后台管理系统1.png', '20191115/1044063a3ae50e42dc6cf513dbac012b.png', 'file', '6108', 1573813858);
INSERT INTO `rain_file` VALUES (301, 'Rain-icon.png', '20191116/5fbe039adcbdbdec72e9a58753095972.png', 'file', '9966', 1573869932);
INSERT INTO `rain_file` VALUES (302, 'Rain-icon.png', '20191116/c25a9f1b3b11c9616c020d070049fab0.png', 'file', '9966', 1573869934);
INSERT INTO `rain_file` VALUES (303, 'Rain-icon.png', '20191116/4b0f23e8c27f64a1ce779e879b4e0f3c.png', 'file', '9966', 1573869934);
INSERT INTO `rain_file` VALUES (304, 'Rain-icon.png', '20191116/957afeb7cfb1672e312877daeba22beb.png', 'file', '9966', 1573869934);
INSERT INTO `rain_file` VALUES (305, 'Rain-icon.png', '20191116/8cb97725524e48cb026ad340c3ddb685.png', 'file', '9966', 1573869934);
INSERT INTO `rain_file` VALUES (306, 'Rain-icon.png', '20191116/fb3571a8b05177f0c71ef8f7ce1da8ff.png', 'file', '9966', 1573869934);
INSERT INTO `rain_file` VALUES (307, 'Rain-icon.png', '20191116/1006caf1dc96de2d4c12ce223addd81f.png', 'file', '9966', 1573869934);
INSERT INTO `rain_file` VALUES (308, 'Rain-icon.png', '20191116/576a4fe9c2ec3776ec0c16ddcd41082f.png', 'file', '9966', 1573869934);
INSERT INTO `rain_file` VALUES (309, 'Rain-icon.png', '20191116/7134b959b6d2592de02d5cee5c8adafc.png', 'file', '9966', 1573869934);
INSERT INTO `rain_file` VALUES (310, 'Rain-icon.png', '20191116/87006e4ad63dfad0d185bf1c87ab2a93.png', 'file', '9966', 1573869934);
INSERT INTO `rain_file` VALUES (311, 'Rain-logo.png', '20191116/10321300600dc9aedaa133f95a0cdb07.png', 'file', '9142', 1573869954);

-- ----------------------------
-- Table structure for rain_menu
-- ----------------------------
DROP TABLE IF EXISTS `rain_menu`;
CREATE TABLE `rain_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单路径',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '菜单排序 (递增)',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '菜单父级id',
  `is_del` int(1) NOT NULL DEFAULT 0 COMMENT '不可删除(0否/1是)',
  `is_hide` int(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏(0否/1是)',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rain_menu
-- ----------------------------
INSERT INTO `rain_menu` VALUES (1, '控制台', '', '/admin', 0, 0, 1, 1, 1573873262, 1573889511);
INSERT INTO `rain_menu` VALUES (2, '站点管理', '', '', 0, 5, 1, 0, 1573538583, 1573538583);
INSERT INTO `rain_menu` VALUES (3, '菜单管理', '', 'setting/menu', 1, 2, 1, 0, 1573537733, 1573537733);
INSERT INTO `rain_menu` VALUES (4, '用户', '&#xe770;', '', 0, 0, 1, 0, 1573538583, 1573538583);
INSERT INTO `rain_menu` VALUES (5, '系统', '&#xe620;', '', 0, 0, 1, 0, 1573537592, 1573537592);
INSERT INTO `rain_menu` VALUES (6, '网站信息', '', 'setting/site', 0, 2, 0, 0, 1573537628, 1573537628);
INSERT INTO `rain_menu` VALUES (7, '用户管理', '', 'user/list', 0, 4, 0, 0, 1573545863, 1573545863);
INSERT INTO `rain_menu` VALUES (8, '角色管理', '', 'role/list', 1, 4, 0, 0, 1573545888, 1573545888);
INSERT INTO `rain_menu` VALUES (9, '系统优化', '', 'setting/clear', 2, 5, 1, 0, 1573545888, 1573545888);

-- ----------------------------
-- Table structure for rain_notice
-- ----------------------------
DROP TABLE IF EXISTS `rain_notice`;
CREATE TABLE `rain_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rain_notice
-- ----------------------------
INSERT INTO `rain_notice` VALUES (1, '123', '12313', 1571391525, 0);
INSERT INTO `rain_notice` VALUES (2, '发公告了', '这是一条可爱的公告!!!', 1571395217, 0);
INSERT INTO `rain_notice` VALUES (3, '12312', '312312312', 1571395227, 0);
INSERT INTO `rain_notice` VALUES (4, '蔷薇蔷薇蔷薇', '蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇', 1571395234, 0);
INSERT INTO `rain_notice` VALUES (5, '123123 ', '额蔷薇蔷薇蔷薇', 1571395241, 0);
INSERT INTO `rain_notice` VALUES (6, '213123123', '12312312312', 1571395248, 0);
INSERT INTO `rain_notice` VALUES (7, '123', '12313', 1571391525, 0);
INSERT INTO `rain_notice` VALUES (8, '发公告了', '这是一条可爱的公告!!!', 1571395217, 0);
INSERT INTO `rain_notice` VALUES (9, '12312', '312312312', 1571395227, 0);
INSERT INTO `rain_notice` VALUES (10, '蔷薇蔷薇蔷薇', '蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇', 1571395234, 0);
INSERT INTO `rain_notice` VALUES (11, '123123 ', '额蔷薇蔷薇蔷薇', 1571395241, 0);
INSERT INTO `rain_notice` VALUES (12, '213123123', '12312312312', 1571395248, 0);
INSERT INTO `rain_notice` VALUES (13, '123', '12313', 1571391525, 0);
INSERT INTO `rain_notice` VALUES (14, '发公告了', '这是一条可爱的公告!!!', 1571395217, 0);
INSERT INTO `rain_notice` VALUES (15, '12312', '312312312', 1571395227, 0);
INSERT INTO `rain_notice` VALUES (16, '蔷薇蔷薇蔷薇', '蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇', 1571395234, 0);
INSERT INTO `rain_notice` VALUES (17, '123123 ', '额蔷薇蔷薇蔷薇', 1571395241, 0);
INSERT INTO `rain_notice` VALUES (18, '213123123', '12312312312', 1571395248, 0);
INSERT INTO `rain_notice` VALUES (19, '123', '12313', 1571391525, 0);
INSERT INTO `rain_notice` VALUES (20, '发公告了', '这是一条可爱的公告!!!', 1571395217, 0);
INSERT INTO `rain_notice` VALUES (21, '12312', '312312312', 1571395227, 0);
INSERT INTO `rain_notice` VALUES (22, '蔷薇蔷薇蔷薇', '蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇蔷薇', 1571395234, 0);
INSERT INTO `rain_notice` VALUES (23, '123123 ', '额蔷薇蔷薇蔷薇', 1571395241, 0);
INSERT INTO `rain_notice` VALUES (24, '213123123', '12312312312', 1571395248, 0);

-- ----------------------------
-- Table structure for rain_role
-- ----------------------------
DROP TABLE IF EXISTS `rain_role`;
CREATE TABLE `rain_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色代码',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rain_role
-- ----------------------------
INSERT INTO `rain_role` VALUES (1, '超级管理员', 'ROLE_ROOT', 1573288899, 1573288899);
INSERT INTO `rain_role` VALUES (2, '管理员', 'ROLE_ADMIN', 1573288899, 1573288899);
INSERT INTO `rain_role` VALUES (4, '用户', 'ROLE_USER', 1573288899, 1573288899);

-- ----------------------------
-- Table structure for rain_rule
-- ----------------------------
DROP TABLE IF EXISTS `rain_rule`;
CREATE TABLE `rain_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限路径',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rain_user
-- ----------------------------
DROP TABLE IF EXISTS `rain_user`;
CREATE TABLE `rain_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户性别 0 未知 1 男 2女',
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出生日期',
  `summary` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '常用IP地址',
  `token` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户token',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 启用 1禁止',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rain_user
-- ----------------------------
INSERT INTO `rain_user` VALUES (1, '20191026/0937b1238cbc8533fb941683734f3d77.gif', '梧桐', 'admin', '$2y$10$reljdy3onTs8fhFxlho26u2S3AbH.zoz1c2JHYL8sRjVsGnL8luhW', '', '1', '', '', '127.0.0.1', 'af7664f13980d3537529c095828e8848', 0, '1570523775', '1576822695');
INSERT INTO `rain_user` VALUES (2, '', '洛秋', 'luoqiu', '$2y$10$fj3gjxnYBGVSSL7gguN4dOXgQBacKFjRLcz.HpyIY72MSnmaTMsvW', '17660342401', '2', '19951024', '叶落知秋~', '', '', 0, '1571052776', '1572068041');

SET FOREIGN_KEY_CHECKS = 1;
