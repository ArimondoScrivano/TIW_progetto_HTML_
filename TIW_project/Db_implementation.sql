CREATE DATABASE  IF NOT EXISTS `tiw_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tiw_db`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tiw_db
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articolo`
--

DROP TABLE IF EXISTS `articolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articolo` (
  `idArticolo` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  `image` longblob NOT NULL,
  `price` double NOT NULL,
  `state` varchar(45) NOT NULL DEFAULT 'available',
  `id_utente` int NOT NULL,
  PRIMARY KEY (`idArticolo`),
  KEY `id_utente_idx` (`id_utente`),
  CONSTRAINT `id_utente` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`idUtente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articolo`
--

LOCK TABLES `articolo` WRITE;
/*!40000 ALTER TABLE `articolo` DISABLE KEYS */;
INSERT INTO `articolo` VALUES (1,'Palla','Una palla',_binary 'ciao',26,'unavailable',1),(2,'stop','Cartello di Stop',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0\n\Z!!\Z$!\Z\Z!#!.%!#+&8&+/1555$;@;4?.4514+%+44444444444444444444444444444444444444444444444444ÿÀ\0\0\Â\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0B\0\0\0\0!1AQa\"q2B‘¡±ÁR#b\Ñðcr‚¢\Â3’²\áñs\ÒCS³ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\00\0\0\0\0\0\0\0!1A\"Q2aqÁ‘¡\áB#$3C±ÿ\Ú\0\0\0?\0ÏŠBž˜\Z\ë˜\ß#ŠzaJjY(z\Úi1¡š‚šbiLZƒy \ãNÆ™M\Å‰@½¡ô\à\ÑLF‚Œ\ZŒ\Z!LF\ZÑŠˆQ+T€\â\Ôô4U )R¤hŠ*yµ5*±´Ò¢¦\"€*ji¥G`\ÙXŠ@ÿ\0\êœSM\0Ž´˜Ú•T\"\Z*ŒÒŽ=4\Ðê§šF\Â=2›Ši\ÔÞ‰	VˆP©§Š`4\ÓJŠdi\ÃTjh‹Q±h\Z j h\ÅK 4‰¦žhŠŠ„\ZsP¦4qCPƒh\éJŸ\çJ¥H¨)\ZDP\Ô @\Ð\Zrh(0¡ cLæ˜šF\ÇHy¤‚\"—s²>ƒ­>S*ø\Ï\ìð–Z.Oºƒ›\Æõ¿\ì®\ÌÁ\É\á³3\r[»¶\ìyœ”U\rn‘ˆ\Ä\ìœ\Ò\ï—\'È©û\Z®pñPø°1ùMkß¾dŸÝ¼s‘µO‡Þœ¹\ßXó_\äj¯;\æhz\\\ËüY…l\Ð«54K›O\Õ^‚½¹•oÌ§ò)\ÈÉ¿\ÉN³²¹`È¹‹ýŒ\0\ÇS³H¬9\Ö\é»*\â\Øh|£ñQ?t²\Çd\"i¼÷\ìW\ÒÑ‹ŠkVý\Ð\ËðÖ¾Nß“P?s\Ó\á\Å\ÄeHú­wBô™µ4jk­\Ý,oƒOø–>¢¨cv&s\rK5u\è2c\ËsN³D$`Ñš¯Œ650«“+h0h–iÖˆ¡MO4\Ä\ÔWõ©\çÎ•@Ú˜š#@jÁ j}ªzI:(rj\Çevn&eôa\ÙG¾\ç\ÝNƒ›t«\Þ\ìÍ´\Ý0A†~-\ÍSù\ì+Ÿ\Î\å»?Qj\r\É\æO.d\ïXò\æQ/Å\ä—Jä¨˜X7v\æyŸ ¬Wlv\Ã\æ\ZXÂu\ÃÏ™\ëPvh>;—v“ÀpQ\ÈV±\Ë#–\ÇwM¢Ž/S\Ýÿ\0\à…*Tõ[fä‡¦¥ôcP\èH\Ú\Õ(\Î\â.\Î\ãÉš¢‡jkt+„_(¶»™]±_\Ö\ÜU”\ïFd|a¼\Ô~\"¸dS\ZU9.\â\ËOŠ\\\Å~Æ£½ø\ß!ô#ó]\î\ïw˜b¹GP¸ƒ!¹ú×žaš=eX2˜ \È#«#’]\Ì\Ù4dšŠ§\îi»\Ù\Ù^Áýº\Ês\ã_\Ð\ç\â\ï\\•z\ÕdñS´2\í†\çKˆ\Ô1³bxVc´;-ò®¨\çR0ð<@<\Ôò\"·\á\Éj;›¡\'-\ÐH\Õ-UF«3\"¶E™š §Š`i\èŠšTt©¬”Q4-R\Õl\Æ(E“\ä)¢\Ê€W[»}\Û|\Ìbb‚¸<Í‰ü—\ïW;¹\ÝR\åq³+ºa£?ÿ\0_Ÿ*¹\Þ.ôhœ,5l\\l½™\ëÂ°\æÌ˜0K+¨¯\è¿\Û}\âLª{, ¥À€£\ÝA\Âc\í^˜Ì¾#—v,\ÌnOõô¨KI7\'ryó§‚sr=›K1Ûž\ìpjAQ¨¢Z®\Ít©\nqFÁB4¢œR& hKMˆ-H\Zv½%\Í	©\r	£S½:\ÒÄ¦\\5¹/g\ç_	\Õ\Ð\Üp\àG|\ë\Ñ\Ù0³\Ùh;7‰qó\æ<\ëË«±\Ý\î\Ø9w“toy#¨«1O¥˜u\ÚO6=Q\å$o‚øn\ØX‚>L82ô5c\r«Y\Þ\Ê\\\Î|2=¢H\Üo ô?CX¬I\àCÁ \×S\ïfy¹Ä¹R\nŒ5­<\n•/AJ »•\rvûŸ\Ù\èøˆ\ë¨\á\éÀ™%£‰\Ú9^¸mZ>\â8\è‡ÿ\0\éüªœÿ\0~=\ÙO¼ý\æg-…„J¨$3lZ,@\ä>õ”®ö¾œ|Qý\ãÿ\0\ÜMUL2H\0M€I=+)6\Ï]§\Åx\Õ/˜ SZ<§ss.%´ \ä\ÄÏ¨\0ý\éf»™A*\Ç%7ù¡\Ó/b~«WOR3”B‰ðÊ’¬#plG˜¡¦„Òš\'\Ãe\ÝXy‚>ô É¦Òšjz¡¦›U<P\Å%MQM\Z	)šhZˆnF\ÔiLi%H\Ô÷O¶ý›{\'>>~\å\ä~õs½Ýs™\ÂY ~ñGÄ£\ãõ¿1\åX°ks\ÝN\ÜÖ£	ÏŒ	?òóQ\åZp\ä§G_¤ÿ\0²s9—\ÄH‹Õ•©»\Ã\Ù³?´Aû—m¿Cž\á<>\\ªº5u1\ÉIYÂš¦I¨\'¥*²Ð–Uc]þ\â7\ïñšòhÿ\0up\Z»=\ËÄŒ\Üs\Ãaõ\Ã5No–\ã~£›\ÞL(\Íc\ï\ÔZ\ìû±Ô‡\Ì0’„\éi\'\Îñó\ç\\>ø\Í\âõ\ÒÐµ­þ\ÌóŠ\Øo‚cR¶¡\ÕH\0üˆú\×\êG«\ÔIþ8û+ú¬\î*a¡w`ª7&¨\ä;[‘†áˆ¼\\\ç…\\\ï_dþÑ‚\Øja¤2ò\Ô8‡jò\'\\L^)ˆ\ê\ä}\æ®y\Zú\Ý6’\â\êU%\ØôNñö\æ•\0b¨ð·?\ánŸjó|#Tˆ!À#‘\Ô®§iw›1‹\á/¡c\ÝKO™Þ¸´“”[´t´˜2ãƒŒ\ß\Ó\ä{N€w¢\Ä\ì\ì&÷°°Ïš/ò¯8\î\Îo\æp—\Ú>’÷\Zš‚n&½F*ø5%tqu8g¦š]\\«98\ÛÊ¶ø	\é#\ìkÍ»gB«\ÎÖ­?m÷§3ˆ‰ ¢\0eþ&\àŽ$\ÖK3Ž]\Ý\Ú%Ø±¤™ªr8½‘\Ö\Ðb\ÍTÝ¦•o|‘]\ì‡t3‹¨€€\í®u|€·¬WS¸ýˆþ\Ð\âÀ\Â±a»úl:\É\å[|\Æ2\"–vUQÅˆ\ëR8\ÓW!5~!(\Ë\Ë\Å\Ê\åþ\æ\Ù\Þ\æ\æº\\!¾Gz\Î2b\"\ÄÁ\ë^Ó—\ÇG]H\ê\êx©V7¿\0„d+\Ç÷[\çoQRX’V¥\×\ÊSòò­\ß~70\àPµI§\î&[V3±\îz±€j¸\Æ\Ýù(9>\ÆHE(¯c\Å\Èá·¼ˆ|\ÕOâ¹¹ž\í\åœG²U<\Ó\Â\Óo[\ä¾\Ç9x¬ÄšþO.‹©d¸5\Þ\íþ\í>\0.‡^?‰|\ã‡Z\Ï\Ò8¸½Í°\É±¸»G¡öFy3x,Žh\Ò\ë\ÌsÕfŸ(\ØøLui>\âP\ÜO^•\Õ\î&WÃˆ\ç˜Q\és÷*¡\Úúññ†¢£\É|?‰®†•¶\Ï5­„a‘¨ðC¨ÿ\0SJ–£J·Ñ‚Ê¦º=\Ôx\Î\'P\ãý$þ+šj\ßwš3x?\â#\æŽ*¬›Å–Ç”X\ïÅ³m\Õý#ñ\\ž\Ï\íÁu|6\Ò\Êl~\àó•v;ú#2<5ûµfA®&E\êg¯\Òz´ñOŠ£\×;¼\éšX0˜ x“ŸU<GÚƒ¼}‚™”Ÿw}\×ü71ö¯+Á\Åd`\Ê\ÅYL‚7½ºý\äý£÷ol@&x8‘×¥Y¤ºY\Í\Õig‚^nðy\æw(øNQÔ«‘\Ìu¨k\Ô;\Õ\Ù„\Ä\ZTñ1r¾G\ï^^*¹Ç¥\Ñ\Ñ\ÒjVx_u\É\Ø\î’NoÌŸôµzÂŠò\Þ\æ,\æðúk?\èjõ!WaøNWŠÿ\0Ì¾‡’÷•\ç5Œ¼#\åñT2øE\ÝQwf\n<ÉŠ³\Ú\í«ÿ\0xÿ\0÷5Z\îª\Í\àŽ\Z§\ä	QTs#´ŸFö_ƒÔ²YU\ÃDEP£Ò¼\ï¿=¢_0pÁða\Ú8k ~ z\Zô±^3\Ú8šñqž#Ÿõ\Z»+¨\Ò9¼²œ»/\åš\àfH\ÇdŸ¡1üK~D\ÖÏ·2¾\Ó/Šœ\ÐÇ˜ñ¨‡\î&\æ\å†\Ç\ì?5\èÙ›#¶“ö4q\ïuõ\rJq\çg÷<P\Öß¸81‡ˆü\Ü/\ÈOû«6\é}\Ï\Ë\é\Ê!ýe›\æ\Ä ^%r6ø”«{\Ñ?šÑ„\ïúQ\ÈY>\îw™\Ý\×U•¢ò1¼\×s½a†Y\Õ˜´,($Á\"l:Mg{¯\ÝüOh¸¸ŠQR\ê¼Í°1À\r\ïW7.¥G7q~žR_osg‹†J‘ ˆ#˜5\äÝ£–öx®œ\Èô›}\"½kQY˜Â¨$ž@W”f\\\ã\ã3ÿ\0#\Ûü\Æ\0¡š¶-ðÞ¥\Ôû~M\Çba‘\ÖEô3ù“%G\ØVS.¾ü\ëWÞ¬@™eAñ2¯¢ø¿\Ú­e°\ì+vš4¬\ä\ê\'\Õ6ý\Ûa\ê¥OjU««\äf(±©»)ô\æp÷‹õ1ù¨ZŸ(Àb\á¶\ÚqúZI¯K,\'kûA¾\Ã<ðþ\ÌW\îg\åñ—K‹ª\ê…a\Çk’9Mt?´L»NÁ+¥†À\È Sz\Æ\áb`\ÊJ°2\Ü•Æ“Jm³\Ôi“É¤Q‹§\\£\Ô;_»8X¸aW§¸UDu\r\Åsû½\Ý7Á\Æ®\êtN³rAY3°‚mT»+¿\0¸\è[ø\Ò\'\ÕL}>U\Ù=ô\Ê\Ä\ês\ÓAŸ­©\î\rÙ…\ÃYŽ/6Ÿß“½Œ\áU™¬\0$“À&¼`›Ú´]\à\ïS\æ¢)D;þ¦\èbÀt¬\à5Vi©=Ž‡‡\ée†-Ë—[\Z.\ã$æ—¢9úù¯M¯6\îœ\Ñÿ\0\ãoº\ÍzC´yU¸¾‰¯÷±\ãY§—s\Í\ØüÉ«\Ý\Ý\Æ	™Ác¶°¯‡ó\\\Å3~t@ñ¬\É\ïgyÃ«º£Û€¯\Í!\à\îô$W¬w{´Fc\âˆq\ÉÅóõ\Ç\íŽ\å®6)\ÄLM\ZÌ²•›ñ+qZ&œÒ£…¡\Í6IG&\ß\ÑCû:\Ê\Í\Å;Yý\Íþ\Ú\Ðw¯7\ìòØ‡‹\r\æ\Þ “\éWû7³\Ó\rp\Ó\Ý^\'rw$õ&¼÷¾²1±\ZL2oÁŸb|†\Ã×G\èz½_Z[]ý‘˜c^Á\ÙY}8iúQG¨~µ\å\rxˆŸ©\Õ}	\í^\ÅC¹w‹½£¹W3šD€\îªNÚ˜	òš\å\ç;Á–A\'XŽu§\æ²ýý\ÇÕ™ú0Àõ$·ØŠË‘FYZt&Œ\à¥&÷\ìvû¼O˜ð(Ñ‡úx·V·Þ¢\î®[^e9,¿\È[\ë\Ç°\îV[” õ¹û-$[”·5\çŒp`j*‚\ï–4\âa§\éB\ÇÍŒ}—\ë\\d57k\æ=¦g…Æ­#\É|?éš„u®\ÆQ<¶NGƒJŠzÒ«w+¤P\ÕB\çú\éN\æ¡f\åBM%ld¬\Ðv\'y‚\ÙóP\Ø-\á\×\Ò6‡\éü\\>µxû¸py‡\ãÁ7\ÊN\Ó\Ìu¬\îa…ÁƒÓ—u{±Þ†\Ë~\ëÇ–c\â)<¹§ðü¹W72Œß¤\è\éuÀ\ï·tr¦ˆV£¼\Üh\ËøL5B\ßH<V7^œ+,µŠQqt\ÏMƒ4sF\âÃ§ŠaEHhA#eI˜$¥[\Ã\íLu°\Å\Ä6\Ö\Ñõ5LSŠ–Àñ\Æ\\¡\Å¡Š–\Ë(\éö\'mbeœ²][\ÞC³u\èz\Ö\Ë¿¸%|xn§\ÒG¡‘^uJ)£9Gƒ.mÏªKtk;w¾OŠ…0”¢µ‹\ã#w\ïYFh\r\'.K1`†\Ôž\éa†\ÍaÍ‚’\Æz)¬W©\ZñB(ðó¾\ë²ÿ\0…ˆûS\Ã\'J0\ë4/<Ô“­«‚\ïx1õ\æqZ~2’ø\ÌaDLÐš[¶j„:\"¢»l0\è]\ÚOc‘8œHwó\à¿0\çX<2\ÌA,L\07&·ý\çqƒ”\\1\ÇJ!sÿ\0lzÖŒ¹¯\ÉPP÷wû\Ì»ñó«Qa%ª_¥u\ãÁ\ç$÷WõzT¤súR¦²ƒˆ8›u¨11‰=Ùƒš®	0O§`E/i\Çoùü«Ÿ9\Ê\\šQ\àl\\#\ÐØ½¨\Þ~\ßKÐ©c`7\é\çü\ê\Ö\nÏX\ï\êgúÚªrK’²\ïv{Ç‰’b ¾]›Ä—”\æ\É6žccõ­?lv\"c§\íY2Z\ì‹õ*8\Å£“\Å\Ã@\Ð\0€L\ê&	1¿¯¥Z\ì\Ò\ÅÊ¾¼2\Ë\á\ê\ZYv~–\ëÇˆ¥iIS/ÁžX%\Õý•€§Š\Ùöe\ágpÿ\0iÊ‘¯\ãM‰n …þÿ\0Z\È2`ˆ\"\Äq—J\É88³\Ò\éµ0\Ï\\÷@\Å8€¢ŠSbbœŠqO£ b¢¥@\ZFi+\ØL\Ô\í].\Ê\ì<\\Áð,/k(õ\âz\nh«\à§&HB7\'H\å\Z\ïvGuñq¡œ{4\æ\Ã\ÄÂ¿“µ\Ú\Ä\Â\Évp\rŠ\Úñ¢BÀ-æ©²\âoeûk½YŒ\È![\Ùa‘\î¡ñ·w\ßn=kD1{œMG‰ß§û¿Á¥\Ä\í,¦JS}¦6\Æ$\ã}—ü#\å\\,ÿ\0h\âc°lB-0ª<+<¾W&³yq H½6\á]Ç¨­¸\\8\îq²¹\Éõ7eõµ¯ÿ\0š1{Ð«È·ÎœˆõÚ¶X¤R¦“J˜_7:B‹ƒ&DùT\Øyr\Â÷ž°\ä:ùQd2²À,ms\"c§X\á]¶\0P\ÊC\0…ÀG¦\Âk”\Ûf\ÊH¯•Áö`·\ßú½Mƒ•%u±{\rB\Ö´\à¢kh1\î\ê$A  \îfj=m\á\Ò\r\îmR/}·\ãQD–Z|0\ã\Ä=\Û$ƒ#3&õS\r´‡Bˆ`\Ø\é\Ó`›M\ê|\'wDøU=\à6‘3ü¨‘\0.\ìImV\rñaò›EJ%ƒ’\Ïbeœc\àÜ±ñ\è\Ä^ ‰\ØpmÁõ°\Æ\É`v‚ŒDoc`\ê\Âó0´ôa¸údó\à\èƒ­§\Â\Zó\çkÉ½\êE@n$/> H´E$ýRJ6©–c\É(Kª™\Ý~\âcÄ£á·«\ÅS\Ç\î†i~\0\ÞL?1K4”f\Ã1¨ƒ¸\ä […\Zö¾6˜\Ç\Å:!K’¨7ŸNµ[Ä\Ññ<\ëšb†\'`\æW|ôöš«‰”u÷‘\×\ÍX}\Åhò½\æÌ‘©0˜*Ê„¨Ü±€	|\ê\Ö}3!´”\Ë\â@™Qˆ£È’H\Ð\nW„\Ñš\æ(\ÆS[\ì>ó«’1ò(:‡W›MO\Í>AÄ¶Q×ª¨óø\Zm\åK\ä³D|b?\åy\ìTù“â¶Œ4,\Ý6I\Ø:Ù§föcJØˆ\'c\íù\ÊH§\Íw…0T`\ä°\Ô\Ö\Âz\âf\ê\Ñ\Ãz1\Ä\ïpfñhtÿ\0¦›2¶w2ùTö¹\ÜE¶\Ë}3\Èy\ÏAò®Wmw\Ç<ªŒ8\0;¬‹û‹²Xu>U\Ë\í \Ï\'\ÙñŒ€^ö<\0P\n£”_–X\Ú@@\îvŠº1\é[#‹›<ò\Ê\ä\ì \ÙB%\Ë3—7bImCy›“\çB\ØdE\í\çý~+¯† \0\àbbv\Þä‘¶ü\n­™\Â$«$X…½ù\Ú\Æ\Ôm®J¨§ˆ\ÌX\ê\0ŸÓ´\r¿óV4‚€†-·\r oUñ„ƒ&\Û±\ç4À¢\Û	6\Æ./o\Í:v/G3 p\'„ÿ\0W«i‰j\ä\âcP B\É\æ8\Ï\âœf\Z\Úxn1¿•_’\ÐIEH\ì\ëþ¢•s?nnŸ3J­ó¢\'•ó,&Y€\r\nX©ˆ¼I\ÓÀo¾ôpT?»ay$E\ÄÆ™`°Ci¹ž›SQ\âæ‹¾•H\ß`¼\Æ\Âõ™\"\àqsJŒÄ¬¬‘¨\Ì9ƒ\09™±£\Êf“(¥‘„&v \\G*˜\å\ÔÎ¤¬–\ßks¿Î©»¤)(\Îö$¬\0\0\ç=c\éA¢\0Ö¦|&\00\ÒIðŽ•.Y\Ü\êgbª•¶ &\Û\éV³9©t\Ò\à…g„˜ˆ\ä`¥F˜\ìõ!p£\ÄI\äóúT \ç\Ñ\ì|@n\ä@S n<Ç \çM–dð\Ä\ÉFÜ¸<\ïc\Ô\Æ\Ó\0 ›É°Þ›*\êÎ¥Q•Ž\'/Z\Ña6\ëµ@££„\Êu7ˆc<?/•A™Et]zÁ\çoO•N1]C5‚%‰´\Ï\ÇsU±±\Ãøœ11\ä6Ë¥\éZ¹…ˆ}š˜D›\ËI\Æ$^¡\Å]\Z\É_\áQp¤Á\Ò}¿3S¦4\ê5\ê\0\\\ì~#\Êb\Ð?OI†Q°\á`xLi\ÞLû\ÑÐ\'­ô:\0P„-¸-cko·\ÂÃ…M‡˜b…T\ì tŽq<j<¾8\Ð\ÂA¸“d°g\åV10\nO…ö¿‡ˆp3µ\n%•W4Ú™µh…X˜´|\"\Ó}þU#\É.À6£h”\0o\'{F\Õ>+kñ0 N’\Ð\01 Dû»ýjt\ÄRª©\ÒlL	a\'©D*;«C±Ae‚$L^$pµ\èiP\ï%¢Ú€&6A©S\r@i\Zxe”CZ	[mm¶ª®¬i+\0\ÜÁ\0Àrú€EH±q€Utp¸N÷\ë…G‡Š5\èP¢\Ò›á¯¼qµFÀP\Û\\1<Oh\0Š—	aƒ\rl°|16õ\ãz‰•s,°\Ê®f\Ò\"&ü\çóT\Î\Óx\Üu p­.\\”b\ê2¦HDFÜ¢¨ÿ\0Ã\rñr÷ð‘Ã§N–K9\n°­r\ç\ëõ¥„\à\'…\àp¼\íV³*\ÙH;\Ã\äf\Û^–_+¨D¨[\ÜFüºOZ‰¢¯üEú\Ó\Ô\ç²\Ï!òjz;€<7 ´°oü0-±«™<=KÀ$\Èfw\Ú\Ý\'•A‘Í¦‡.¡€\0h2wˆ¡—\Â%I\Å:¤‘<ŒñŠr‹‹ªF¹	¹\Õv5‹“`9U\ÖÊ \ê8˜›¬\ßO9\ÞöÚ©&ateQÀò\ákm\'Ò¤Ê‚\ÆH´ƒc\Ça17¦H[%\ÂE@WZÆ¡,A0\Ñ\á‰\åZ1%\Ì\0\ä“°\Úówô¨°\Õõj3¢.¢L\ìñ¸\ãQB\\BI‘¥~›\îbô(c¢š\Ø\ÜxD[¥@\ÅÑw:z	˜M‰\ëÎ¥\ÆÀL6\01Õ¨[Œ\Ú\Êz|¯R\à r¬K—,\Äi¶ö\"\ä\ÌMF€€\Ëã±–pþ4‚>\ä\É˜Võ«X*\Å\ÕC6Ë»xƒaª÷*›\Z\Ë\ëm+:”\Þ8l\0[T\È“ˆ¤4Q>¼ž£Ê•¡¬l3& \ÒYFˆAg\Ïi)ðQ€u&A\"\03ü\àˆù\ÔxþX´3Y‰*F’7\'–\ÛÖ¢p<AAhMø‰¤\Ì\ÛÂ¦ih%‡\ÆuTj\à¥¹\0môÚ¬`!h ÀÀû·µ£c\0Þ¹ÉšhF  f\á±;7U\ØÁtn$\0Ðª`\Äñ¨Ab\å–B\ë˜C&!L’.<­\'¨2ùfMi\ï¡K°ho„½-;\nlò\0Ja8¼ƒy2¤.˜¿-\Ïj®\n\Æx$\0[\ÞLƒ\0ƒÒ¡,a‰ x¡7‚Àƒ\áˆ¬žð¨ñŸS\ÐD‘\ï¾\çŸÖƒ=™B`H\Är¹H©Ÿ\ÙB6 R\ÐAh‚-e\ã@€\â\Ã6 oµ\ãk\È\Ú\âGM\ÅYÈ¢´¬x‚\ê%¦6’ \ÇHò¨02¥Š ñH“x\Ó\"\Û\r*¹Ž\Þ5\ÖúUt	\î´Í¥nv˜þF™ 6W\Æ[AˆXŸÔ \Þ:\ÍsóX*U‘Ì²2\Z\âTƒ0 ™\áj¶¸v\Ö[R\é€\\_m¯;	¾Â©\Ã.6¨\ÒÄ¨…\0€²u	\æ8õ¢4\ÂU*\Z\åÁñ“\00\é[ê¨°2ª\0–h\'M\à‘3· \ç]\Æ!|M:POŠò¢\ë?\â“Ë6c8m\0˜>(,dZ¥^\Çø\Û\æ£\é6¥Aû[›\éß þt©iÏºÀGfD«´\r¤ú@a\Ýd.™\\\Þ#m\Ç¡Ë†$‚t\Ø\\@\ãÿ\0š||ª$\ê\Ö\æ&\Ö\0\Ìø¹“ø«¨[#\ÄË®¢VJ~«’±¸•úÕ¤\Æe.…\âGv\Ñ\ÂõS\rH0G‹L\Ç8ó\ëV38E@“iº‹Oñ/+pR Ym3¨*±-\ã\ØOJZ\ê`\îL$¯$ô:§©\é\"M®\Ãxúp\çSa©F\rc¼EÄD“n>T^)¡\Ê.™R\Ó\â‘x\å°§\\Ú–’‡Á\"\ìI\Ò` \ïaó®k–f!XªÇŽÛ“z\ë¦kB\ê0TÎ£{“k\0ˆ¨\ÐQ\\$ia\"H‹ˆöd\áK\Õ\ì<\Ë\é\nƒD«\\{Å¹Áƒh½R\Îbª¤£\0‰\Ò7ß §À	rH†\"K\0¼ù\Ò0 ò 2v˜r rI%S\çSåo¨ÄRñb6\êEG4:Ÿy$\Þò}n	¸Z–O-­µ\ët¸\0nnƒ\ÂJ}\ï4`EIÄ£Ny\Ø_V\×ò©Ž%€}!Ã! ´‰{\ÏR)a\á FD\ZœI‰h7Ÿ¤•&7±‡A¬ˆÛ‘kýhˆ\Éf,u¼r9-\é°X®¥\nÁI&H;L\\o~žt\á\ÜN•\ÒL	¤À\é\ãýoN¹·x\Zd%H†‚8\ÛP`A,\Êiø…¯\'©W\nÀ3\ZMˆ\Ð-±\Û;\×A0Ô»†mJT$“I°\0O;Ú­œ°´\"ðºu6&H`ŸX¢Cœ©\ì\Ã&%	aÅ…\Æ\Ð/Dq\ÑÂ«	‹†&\nF›D½t2ú\Ñ\Ý‘¦F2ZoÀ±5K ™Ô³¨]FÀkk˜€c…\â¡\Ä,øfI\Ó`0\0Lp\'q\å\Ö\ÑeÝ’K–e\Þ@¹;m\Ës;^ºJ\ê .¡T\Îý`1M©P³\Ë:´›\\\Ä\ß\Êõ\Ê8¹À\éi6ht¯ñmTò\Z\Ñ\Ø\0\ê±$\ÞÁ\Ö\Õ\Ø|t%¦IXc0 ‘\á\Þ tªy„e{\êY\ÒÜ„Ì‹l6¨B¶“ÁV?\ÍJ ÿ\0‚?ÿ\0¹\ê4õQ|BLÈ…\á#…¸\rªR¡XD³LA‘%§žÂ«ª;8g0”•<ºTø˜#\rQ‚û\àñ’Œ‰ójƒƒŽ\Ä0%B	›¼Q¾kZ¹ƒ\Ò&m¤L\ßi\ØUGñ±ƒ{oñn-h§\Æµ6\ç·J ,&ZŠ\ê™\ÒA¾£cx\äxùT˜‘£F“1x“¤™rþuGö\é\0\ÔÄ\ÅùE·«8BÅ¦\Z\0v\ékGJ;v x\ÙV\Ô	\Ö…:c\Â\Ð}IÞ¥,®¡¤X¶\ã[n¢o=j\\®u‹\ËÅ€\ÔEˆþUW3™„\ÉDƒvq\Ã`\r¶°§E³\Ùï¬…{‘,9…ˆ\Ë{\Ú\Õ[	ôÊ–ñ2\Îç—¥§mª\\7pŒ­A6\ÒI#€û\ÔùUF!‰f\Ú€j\äIjF†Lc‰…¥u<¶’\ÅHb7\áƒiŠÁ\Ä,P‚Œ¶t«pY½\ÌŸ*Ú“uñðÀ °$ˆ6Ù€\ãP\æsP¶—f“©ˆ\Ø\n9Ì€})h%üžg\nW~#&w\è½k¥‰Ž4°\Ä:\ÚIÒ¶›\ÈRTDƒn±Y\ì-*ŠuC\ÙIrD5Èˆk\\õ«øÙ«£¤\ÛsÁ Cp\è=|¨—1˜Wð’È ˆr	†›¨#kp\ëVqó\Z.N•ñHƒ²‚>#\â\Ør5_+š\Ãi\Ô`n\ØÂ¹Rv\'\â\0ò\áSb\ç5©P#@\ÒM¶<Ä’J„±af\Æe\Äˆi,…N’w9^o\Î*\Î|:ø0á¶’ºA$¶\Û	ª¸\ÆQÿ\0w­ÀýxXI‹N\Õ.a\ÈönGe÷B©ÙµAx±ò\áBˆW\Æ\íRŠ\Øk\"J\ê\ÐÞ¶\"ˆf™C(yR„¬–¾\Þ…¿\áPf²\nÊ¡”ª$“\âô\âg•F\à\ê¹++x€@	Œ~(€²3®’\ÞeP¬‹&\0aÀZOŸÐº5p€J©W\Ã\r\0ž3ôª\ç\Z\áˆvQ+¤m1\Æ\Óú\Z|\áM\0P˜ 	Ü‰P\"\Ö<jQ9\Ì\ÂI]j\â\Ðñ\í\nc‡RF\Ä_­I\ìÁi\ÙxZ~W\ëPf\ÝQ™‚†\Ø8®ñ\èh\×q,º†›)6:w\0‘¼À¨ˆM\ì²\ÝGHÚ•A‰’Æ“\Z\"z*z\"œ¬‚’oû¿É¨1q˜œ5&E\Ätµ©R«;\0°GŒy7óªY›D[\ÄiR§ˆƒ7\ïŸJµ–»_‘\éö¥J«_Ý‚\Ìl§¯\àWW\ÄAkþ\àŸY¥JrNÁ\â :-»(=DyWC³ò\ë\Â,š‡F“zT©Y#Éž\Ç\Ã\0\Èqµ‡\ÃÀZ®v˜\ÐP•\Ò@&þ¥J«,9©ÿ\09ù\Ò\"´ù\Ì1\ìq­\î?‡¦\æÔ©Pd+ep•¥H.`:ø¯\×Ö–\n®(*\"@üšzT@nÌ€ZHžµ˜\í‰¸ûV\Ðp¦¥JÂ‹9‹6“\ë\í\'\ì>U_\ÉLRnu/\ÜR¥Q“¹\Ï\Ì\Ù-o\àUœ¹‚À\r¤\ÓR£Ü„x8‡Ø½øG¤\íB§N’	m\ÌE„F\ÜOÎž•@\"ð\Ê/ñ\Ôÿ\0Î•*Tÿ\Ù',71,'unavailable',1),(3,'pungiball','pungiball a forma di elefante',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	( \Z%!1!%)+...383-7(-.+\n\n\n\r-& %------------/----/-----/--------------------------ÿÀ\0\0³\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0@\0\0\0\0\0!1AQaq\"‘±2¡Á\ÑBRbr²#3‚’¢\áð\ÂC³\Òñcsÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\06\0\0\0\0\0\0!1AQqa‘¡\Ñð\"2Á\á±ñ#3Rb‚’ÿ\Ú\0\0\0?\0÷ˆ€ˆ€ˆ€ˆ€š\êT\n.H‰ 9WO\áWmP(v`Zu\Ê_Jo¡Ì§}M.¤¬Hd\í.\å\ím\Õ_\é$pøªn.Œ­Ðƒn¼!(N?Rk¸ò#?¥§Ñ˜\ãqT\é!zŒF\Öcaž@u&\Â\Û\å3Lv’µ[--z4\Í\î\ÃS]¸fo\ìÅ¸gž\Ñ4ö‡I½z¶\nT\ÏtZú\Ì.\Þüò\Ëu÷\Èç°¸(\Å)TW|¹~z\ß\ÄKŒ\Ú“p¤\ì¹ó\é\Ù\Ð\Þúf½\Íê¿ºÁ\ÜX;x¶\Ó\ÆJhn\Ô2*\Ó{\Õ\ï[Y\Ú\Î…\í\ß#ñ\Ì\ï•z³I\Üð”§5\àQ¥­	^÷\ê{µ:\ÞÇˆ ð\Ù7\Ï?ìžœ4\ÛÙ¾hÇˆ\îž9\î\ã.x½#B–U*\"º¤c\ÑvŸ(Žµ	Sžî¼\Z\Ô÷\×y\Ûÿ\0–`¯oj¢¯\Òt\áôþý\Ú\Ëü\Ú\Éú€¼\áÑ¨•\Ü_ƒ;zRvRMõ^¤¬O“ìŒ”DD\0DD\0DD\0DD\0J\æœ\í-: „*Í¼ƒ–^ñ\ä?Ä‚\ígi\Ø;\ÑL•I\ì,FD\Â÷\Èmã¥\'ˆf9Ü\Ã€\ß\Z\á¶z\Ýø•–¶\ì\í|<„˜­§\'\'G¯-/¯‚÷\ØJ\é]?R©»1</°t!\"\ß\Ç\í	•-Q¶\Ù1ùœ\È\èƒ÷‡ôü¡=¿²\è|Ÿ\ÕJK\Æ)¯2¼vÑ¯ó\Ê?÷5\à\ÝüQ\Î1\'\ïMôqõ\ÝXƒ\ÅI\á4b4U@;¦™ð+õœø:.n\Z\Ê~\íÁ6\â3\é\ç,av\Î%N”\î\ß?º!\Äl\\n¬\ãd¸\Ýe\à\îNè†º“\Ïo‘\Ï\ÎwÉ¢\ìªTl<\ÇY\ÖD¿/©”i\Ù\Ç#ƒm4\Óy³g*µŒ‘/”­)\Úge6±¼Ž\Ò5\\Ul\Îg[­÷ó\×\Ù9±\Ô\íªsžcl­R¬h\ÆUg¢W}A*R¯(ÒŽ²yuüœ‚»\ró4Æ‘¼L©\è\áö‰ð\ç:FŠB\r›g§\é?\Õ9;7.»¯ûò\Zÿ\0ó\ë]nÿ\0\ëño2GCvžµen\ï\Ül\×üxZz6…\ÓT±u6k]œ\Ç1÷‡>cdñ\Ú\ØL\í¬8\Ó\â¿K\ÌôvzlZ\Ö7yp2\Ìi´`ç†šoµ\ïZ¯Bªc6t·11{¾]\Í]w_¸÷h•ý\r¦ž¥r…‰ì €lH\Ù\Ç,ù\Þ\"\ÙQšm5\æ9Ž&›WOÈ°DDˆœDD\0DD\0 v\ÏCQöŠ\ãX3Ýš\Ç#Ó\'>\ZŽTYVÞ§©\ÚeÇ¶t	\Ün$\èeX™’Û˜¼EJÿ\0\n¤›‚¶\ê\á¢\á\Ç;«»öd7Ù¸z4\é\ïÓŠRw»Z·\ï\Ô\Ôö^­\æÒ¼fH3DL†\'*ƒlr&\Þ\Ö\Ïy\ëÿ\0¿Œ—\Å\ÝIñÿ\0\ÔQ§‡ûi¸ý%B\Õ*Uk\éVOµ\ë\ä¼i”ýSVôiÑ¿\Ô\îúGò\Ó\ê¬k\Ã\áÂŒöñ\ß>\×k	%…)|Aµ5’u¬\âus´ò®\Ú\á+\àñ^Ö›8§Zõh9r\Å\és}\ë“n\"ù\Þkkc9Y«™\Ü>Î•X|­.Ž}¼º\æ[±s4†¾½:u-mtG·\rp\r¾3#\Z+[#=\ÝÎº&\â*l\Öá·§\r³#Nšct¯<˜Â–q\ËS%9L¤Gf;ƒI½\å\ÅgY…\Ç7Œ¹3\å;k	6\'üjÑ–ir\Î\Íwe\Ñ;Q\Ùø‰V¢œ\Ý\äµ|øß¼ú“»ChšU±4õ—\"Ia•˜\0N~_\ÅLKGbh“QŸr¥¼X‹|ó•vsŸ\î\é\î6õ\\–o\É\â\Ô]	o$Õ¸\æ[\èPTP¨¡T\0\0\0\'Ù¶&\Ô\ÏYˆèˆˆ\0ˆˆÉ¤p‚­6M—fœó\ìEF*\Â\Ä=2D\éµ…\Çu\Æ\Æ\Üy7/H£j\ìç‰Šœ>¥\æ¹u\å\Þ]\Âb~Ý–È¡-£¬\î\Ä\è\\J\Ze¹ ,>9§‚«F™ª\é` k\ì\Ý3t6~&­UN4\å{ñVño$4©‰£Nr’·_CŸš\ÕB†c\È2‘›0Ù¹œú=\\)j€l\Øð6Z9s3\ê;;\á¬Þ­óoì•’\ìG\ÏñøÇ‹\Ä)ð\Ñ.\Å\ë{ù\ì8(U…Õ„b\'™\ã{$­S½Z«S\\•\Z\å•A¸@\ä\ä»r\0mñž·¥)YGIGÅ¸\×\Õ\ÞTŸ\0@ù‰n…*u•\æ¯\ï\ßaS^¶Ú”­}tû§n«4i\Â\Ã+L\È\Ì*-\Æ\Ò:Zþq˜Ž&\ÊÌÔ;)0½Ä‰¥€¥|\Ô76,\çÌ™\ßG\nŠn£Tò&Ç¨\Ù ¨³/\Ðp\ÝÉ¿É¸\è\Ô8…­±Š\Ýbm•ù\Ûý\Êt”&\ÊF\Ðrñ\Ë\ç-:/³tk ªYÀlõF¨±¾\Ë\ç1ÿ\0¨ö|«Æœ©¥t\Ýøký#c°qª›œ*7l­\é\à\Êþõ\\\"-\Éòy\'pž‹£0B˜E\êNö;É™`04¨®­5\n7\ï\'™\'3:\åÎŽ97y><»\ß\Ó!Ž+\ë;,ˆˆÈ¨\"\"\0\"\"\0\"\"\0\"\"\0%G·5E•+uco)n”N\ÔTÖ®\'úWWþR\æ7¬Ÿ\"ŽÑž\íÛ‘Rth‘ŸŒ\å«$4\Zw—¬qQ\ÚCE^²${GWUl˜\Û`\Û>ñ\Êy\â‚I¨v¸7(õ3\Ô;@¤€Ó\ëºQ{I¡_\nÄ€[I!\Æ~\Êù”©m‹{Ù¶lC€­óe­‡œÓ”\íkôö³\"LÁ¦w¾c0w\Ìlg\Ïûjƒ\î\Ô=)\Õõ´\ï\Ãci¾A³\àA\ã9„\ëöj\×·˜\èwHj\"\îQ½š~?bJºË·bj^‹\Æ\ÇÍˆ\Ëúe#2µüO\Î];*5V—\ã¤/\×\ßÿ\0“yE8\ï¢Æƒg_zý–,\ÑŽ„D@D@D@D@D@]¬	\à\'œ\ãŸZ³õ\Ò%÷H\ÔÕ¤ç—¬ó\ëÝœþ/@\Ö2\Ùñú¤(Ú²\Ê1\ï5\Õ2k³\é\ÞYVY;8½ñ\Ò^Ä»Rb\ì½dNb(k8\'b\ç\Ô\îú\Ì*Í¸\Ìm4fµ¹1ô›§»O¬\nQ_\"\ç#nCwùŠ\èQ©Y¤— \ë‹£‡NSyò\âÊ®ž ‚½FÃ…EÖ¾¦\ÊMab@\å\ìM\Æ\\§\Z\á…óv©Aq^Õ¿=;ž´\Èò„\ÓF;±Q\äceU\Ör”µ\Íþ=8ð\ÐûQªý”C\Õ\Èÿ\0›¨\ãO~‘µ†hEA\Ô\Û`Ÿ\ê¤}\ß)\Ìô:£4¥§ó\êuÒª5¸\Ôb\èeóA\â;Ô…<ˆøƒñ”\0 +\Û+«y\Ø\É\Í‰d¨\n›_o8·K}[ˆ÷YS\èzLLQ®\â&Q	¡\0\0\0\0\0\"ûCRÔ­\Ä\Ê-?vün|\Íþr\Û\Ú\êÚ¨9o!þ%QV\Ê\0Žp\nÔ¯Íˆ6œ¯VÜ‘¥†c¬³ö|w¼%exK‰ªUû\'ºy°ô\Ý\â$¸¿¢\Ä?ý[™öò2…\\\æe\ÇMb5‘²¹˜_–ùL­¶O€VSl\ÊõQ¨\Î\'Î¸ü4÷¸·ý³%h`\ê?º¤Ž;œ¤–©T›>¦[-Kºmü\Ú\Ò\îò½¸‹¡	(¹5—¿µ\Ìª\îZ~.\ßøL©\âœ¯Ly¸ñ\Ê\âl\"g~\ïŒòJç°šZ¯\ä\ìw\î±\ÝM¹\Üe%Ø‰£\í\\(\ÉT†r8\íT\ïbyrf®¨¾\Ñ\Ç\ë)NKzÃŠQ–\åû\ÏBÑµ5©!ü#\á”\ê‘=š{\Ð‰ó’\Ó;5i5\Úi \ïûDNN\ÄD@D@D@D@\nŸl_;rú¾r¿RJö¥\ïVß~ü¾&¤}…©D\Íc\ëHÂ¼%‡G(*A\ØD¯\áý\é=€9Oq:`r‘¤\Ü\æ[=_\Æ9s\Ä\Ã	¡U{\Õ;\Í\Ãpÿ\0|¦}¢PËò7O#0y\Èz\ZzºeQ}²ý\áaTc\Ý\í\Â5?“¿\ß\Øæ´¨|{\Ô×…ôôñ\'ª0û€ô”L	&š“µ—Xõ~ñõ—>:•tof\×È‚\r\Ã)\"\Öe9‰NÀ\r\Ú)\äWºG˜2\\\"³•ý\êA´[Ü_·öoŸˆ¦žó§b\ï9\éñ$3¿³´\îõ[€D².\Þw_\é“Ö–\ì[E,%%R¥žš“x2\ÓP‹°o;I\Þ\Ä\ï&w¤\åI†7@\n¦\Ì\×\Ï\î¨\Ú\Ýs\0s<¢¦œ]‹OdœjT`|¿Oª™`•NÄ°\Z\Ê6j·\ÎZ\â\ÜJµV4\ÃKz’b\"$\â\" \" \" \"aSa\è`N5\ë3…¿\å\"ES®\êwj²þR-\ã\ÞVóGIò\âG\ÒEi\"\Õ]’ù\r¬‡\Þ^¹9¨š:*\ÑH\Ê\×w©.§Vfd\Þ²˜kplA\â–¤\ÙNkfw„vDvœl¥i¤ö™l¤K˜uh\n±\îõN¤0tmJ‹±\Ç\éaö—‘š=¸5[W\ÚYw%`p?‹8?›„\ê’=µ\Ð\ËGöw¤,=ª\Ó~,sebx\ÛÚ\ç´*N1©o\"\\$\'VDþ˜«ô}žCNþ\ÏÕµJˆ~\ØW^e{¬<µ‰œ5MÁSfSu<>D\\FuVñh‡US©w¦Œ·¬\á¦ú\Î\ìx\êÊ„Õ®|fz7µZ\Ö+“/\Ý#;sÁ\Þ\'UDµ0û^\È_\ÅTú–‹Ý™ jðr\é\æJv=\íTŽ ú_\å.’‡Ù¶µu\æm\ç—\Î_\"\ìjÿ\0\'p\Ç\ïJÝ¢\"%B\àˆˆ\0ˆˆ\0ˆˆ\0šqF\È\Ý&\éË¤\r©™\ìuG’Ñ”,[^«ô_Vœõ&\Ç7zŸš\ßÚ¿Y¦¤\ÒAZ\ÆF«»oµÿ\0&Œ\'\îš\ßôÝ²üw~V\ÝÀßˆ“*ùH\åPWT‹ƒ´B; Usp\×\Ô½mªøŒø\Ï&®\ÉiJÑ¹£K4ˆ3¿H=\ç—)+DO‰–õF\ÌÓX\à|…JT¡ªÄ‹·\ïPf/–D\í™v>Š5Vc™QuM‹x|\çGokŸgN’©fzÊ¨»{:D3\Äi)\â*Þ´i\ÛFüò\î\â7\Ù\Øg\Z­½ªjË¹÷ðVëŠ¡ŸVcF•Z™S¤\àý\êŠÈ‹\Ì\ë\0O@”nÏ Q\ìÜ«\Þsv8—RvôµºK3­»)`ªI6ò\ë\Ä\æ\ÑDûk¶Ž‡…\Ôø\æ–C†f£J°keK+[Tjœs?¢ôg²%‹k¹½µB‹\Þ\Ê9\Ø\\\ßp“Z!‰ ôG½L²³º\Ù\Ó=5Mº£Eõ\ê|ûñ\á(Ú—Ãž½žüz!\íY1\ë=\ny\Õ:MN¨\r¶\ã\âmqþîž‹\ãs’k\Çu\'\ÌDD¤^\0\0\0ƒKµ©øýg|Œ\Ó\Ç÷c¯\ÊII^hŽ«ùF]®x³ü\r¾SMI²‰\îõ¹ó$ü\æ·3Fµ2Sw^ú€\Ò[E+Qjn./ÐŒ\â\ró‘whZör¿x|F~—‘×\à\Ú\á™.j5|r!t¦½\ë)¨›ª %€ÿ\0\ìA˜<\Å\ÇI³²É…ª\ìjU§dµ—]\ä\ßm\Í\ì-³˜–·3ƒ„¤\æ\íMñdFõ\Ü\ÊPqzó^ý	¿eJ5•Kwp2\Ä\éœ3jA*\Õ²P\nÇ‡y×ºƒ‰c\ç#\è\Òr\íZ©«€,·Õ¦ƒ5¦—\Ú3$\äß„\íÂ‹(\0p\0\ä&\r!ŒTz–\êTr\ËDi0fFbgDGÁ\ZŒ=6\Ôp-r5•—n«®W\Ï\"Ý¾\á7Sœ\È\î.Ù£mQ\ê\n•J]E•P0Q¶\ìK“™¯¾^è›¨<‡¤¤\Ò2\çƒþ\Z~Uô”1\\XW{›\â\"T-ˆˆ€ˆ€ˆ€	\r\ÚV²”™¯kR¿sð“a\Õ\ê\"Cµ&S¨Ý­¾\êúLH™\á\Ïq?*ú	’‰¡¹”q\Ð\Ö\É0RT†A¼\Þ\Í49ž ’H°\n”°‹\ÍM#ô^*\ÝÃ¿5\ë¼¿9\ÞÒ”¢\ã+©\Ôø‘\Þ5´\Ô\ÓcMfõš\Ì\ÄÌš`g§‚gNa6$ñ# 6_\îü¥\Ûü4ü£\ÒP\ê?º9\Þ_p_\ÃOÊ¾’Ž/H÷—°n\î]\Æøˆ”‹\â\" \" \" W;lr9\Üy\Ø[\ÇgŒ±\È.\×\Ñ-†b>Á\Û2\09‘\Óo„Ÿ\íZ=Jø´\Ý	¥É”œ%4±û\è&\ÒfŒ!²\ê\Ú\Å	[p\0\ÝGôó™šv\ì}fšXÌ˜\ÍlgHŽR0c&08\Ýqc\ïˆ\â$+ME\È7°\Ât\ÔÕŽi\×t¥~K+\Ífq`ôª¶O‘\ã¸ý\ìiNPqvcHUEx³˜“Lð\ìMˆw\ÍsŠ¾(ªW\ÛÇ\å=Qry\Êj+3»w¨9\Êz:-€\0—\Ù&µMmËŸŽ\éw‹ñ\ÒNj+€\Ï©\ï>\"\"%\"ðˆˆ\0ˆˆ\0ˆˆ\0š\ê  ‚. ƒ°ƒ´² ™\é\Ô*•±+‰¹,—\Z¬ò—\nF\Û_nS”\â_ûA£jD{\È\Û\Ô\ï\ê\r³\çŸ=6*¹‚CS¸É·\êœ\ìr7,\î÷	ˆø±\ÏU¯¯òg1¸_…<´zzwy®óIªEMS°¥\ÇU6a\ä\Ë\äfm8ñø´\06a‘ƒX«‚F\Æ,\î¤\ì\Êö†^Z¤²54\ÓRoi¦¤\ê%i\èqW¨G\Ù,?\r¯\ävÿ\0¹Lpº|.B¦­¾ËR<öxM¯9\ë\ÑF÷”£\ç$”T•™9¨»\æ»S$Ó´”÷š~\Ð\Ìjö–ˆ\ØUº8oK\Ê\æ\'GRlÖ©ªlwj±\ß\Ò}­£éª±\0\Þ\Æ\×;\ÎB@\èG‚óC{\'7ŸüUý÷5´\íJ§Vš“\×$\êwŸ„’Ñ´ÍŽ³§p\ä£põœ8D \0²“\Ú+]\ÕF\Ò@óœM(#º3ø²ùV¼\Ý\Ûô\è¬^û/„Ô£¬v¾~!óó“S]*aT(\Ø\0 \Êl™©\ËzN\\\Í\\ ¡ÀDD\ä\ìDD\0DD\0DD\0DD\0J›Ã„¬ßˆ\Û\Ä…ü„¿\Êl\éX\ëþS\ä{\ß\Û9s+U·2ŽÐ…\èß‘]q#ðcT5?¸l?!\Í<³_\å’5$v/º\Êû½\Æ\èÇº|\Z\ÞcØ™\É.Æš*N‡œõdˆ©3•æ–›X\ÍM&*œ¸Ñ?ÿ\0Qú|\ç\ÜNzƒ‹¯öw\Ï\èŸ1\Ûð©OõóŸv¿\åO‹Ÿ¢9\Ë&ŽJü¯øó±!…\çØ¼6µmm\È	ñ\Ø=~¡ƒY\èÝ‹\Ã¤\ÎG¼@\0\Ûñ‹v…M\Úo·!\ÖÉ§y®\Ìý÷–Hˆˆ\r0ˆˆ\0ˆˆ\0ˆˆ\0ˆˆ\0ˆˆ\0]¬¡­LÙ©\è\ÃüI\Ë\Î=)G^“¨6¸fF`g”’”·f¤EZ;\Ðq\ì<\âõEö\ÚÇ¨\Èüo4W¦JœÁ†nz\â\r\Å\Î@\åžõ\ëpOŒ\Ö\æiQ’žZh\\5J\Ä\Ó\Ë];®N\Ën\æ=o\ÂJc»5QP²\Ô\rar¶ \å¶Ù›™„Æ½\n¢ª\rlµ]2\Z\é{\å|µ”\æ/Ä÷,•¡\\^“†\â»y2\×\ÄJ¸šµ©\Êñú}\ëÈ½ƒ\Ãa\ë\Ój_W[[•—y\Üój†ki\é´(%5\ÕE\n™\ÚOY_\ÒzjW;¨A/kmwn<ŒšøI»«/~ø•jljŠq•\ÞYZ\Úö\ß\ìŠF;\ÜñC\åQû…\×?y\Û\Èw¥üe›µ\Ø\Z°•P\ZM\Ú÷\×[\í9\åy3‚Ñ´ÖŠ\Ò-¨\È\\[\\ž<\ç”’ö¿²H\ì™\Ù\Å\É_^<xpâˆ­\r¢\Z¢k_Tn\Ê÷¶Þ‚z^Ž¦š\Âþ{>”¼)\é\áè›‹€jn\0°CöšÀ\æ2\ë/ EÚ’›Wê‡˜\Z¥G]\í>\ÄD¤^\01‰•¦3\ÓÁ>\0Ÿ	ƒ1\"z‘\ã`´ÁždD\Ö\Ë:H\ä¯\éý•.\Ë`\Çh9«ue;E’\ã\àO¡\Þ\'£Ö£y\Ñj\Ã1x\Ç\r‰\ÜVzqX8\Õ\Ídû<j\Ç,§>!Qˆ$-\Æ`\ï\Ñ,øþ\Ìn„ƒ\ÎBb4,lP\Ý\ÔF\Ð\ÄS|D56~\"\é_µ´´d÷15W‘©®<Ma;\èv§¹0¥W™-I¼J\ë\à¢G¶‹\Æúz\ZX]Ž;0\í\âS\êg3ŽZ\Û\ÉÔž:\Zow\çüŸt¾”|M…@¨‚öEb\Ý\â\n\ë \\Ø…®v\î\ßO‰­jE‹\åkX a²\îgÓ”Ýƒ\ì–1\ÏxjŽ\0ü\å¿BöP\Ó\Ü¯‰•ª×¡M%´.\Ñ\Ã\âªIÊ¤šO[VF\Þ\Éh‘G¾[Z¡$dª2:ª<g>›%¹S›ƒ\n\'P%ZŽ¤œ˜ò5N\n1VFQ\"%\0\0\0Ÿ->\Ä\0\Æ\Ñi”\Ä\ÏOJ\Ìuf\Éô\Ïn4šq\ìf\á>\Â\ç–4~\Ì#öe\à&øžo3\Ý\Ôhý•8	 ¼&Ø…\ØY{12´û\Ã\Ñÿ\Ù',0.19,'unavailable',1),(4,'iuser','Si, sono un oggetto nel db, ma come l\'hai capito',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0\n\Z\Z\Z\Z\Z\Z\Z\Z!.%+!&8&+/1555\Z$;@;4?.4511!\Z!14414444444444441144414444414444444??444??44??4?11ÿÀ\0\0\á\0\á\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\06\0\0\0\0\0!1AQq\"a¡2‘±Á\ÑðR\áBrñ#b‚²ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0!\0\0\0\0\0\0\0\0\0!1AQa\"2ÿ\Ú\0\0\0?\0\êS0Áou$Ç‘ó…Ò‹³÷N\ÆLs¾\Ã\îR©°$þ‘À`“2`¤C|\ÏsÁ\"\íYˆòc’8	©\ØS\ÉH¦\rOoý¿)\ÉQ‘¸\äF}Rr\ÉO* \'!\0\Î\ßÐ¨\ë\Êý\çS5g±e{Å‹h\×\ÈuNN†•ý\ãX\ÒIXì¹¦ãª«\å\çfKˆh\ä4·òV7\Z¿€\\ƒ¹?ÀE\Û]1”Ã˜À\Ù“.q\ìªg\ÒZ\×<Z•‚\ß;5¼ý\ÈOýMP™ù\'O\Ú\çk]<¹\ÆIß·DI\â> c\0\Ðý§ñu\\y:\\4“¶Apµ›Zs+†72\È,pÏ‡´mkF—™Ž{)¹>º\á	ð²m/þ—\ÈG\Ðs{©³‚uQô¢\×ôiLj‚0®#T\ã\Ð%òº’¥«\ÍD½\0\â›B\0(j=w\í\æ˜KRJ­¯ºd,Q<»\ÊrT]·¨H$JD¤B@ tôgòEœû $wN£\ê\Ä\Â\Øú\')±U×¸k.0„\âÍ¤\Ò\ç k|AI Ÿžƒu\É|E\Æ\ÍÆ–´igNgºy\ÏSj\Þ)ñ\êCZ[¾\âO¯%Žxƒ‰™>¦Pµ‰ä…¨â¶’D\Ú0]fOTU\nó¹0°\Úõk«˜€Ÿ£\êU’ceU;ƒ¨IÄ \ÛU#T#…\×MZ¸s	\Ø,\æÜ¿Lw\äV}+—D…3œ”¸}t|+‰C\ÄCdx§z®Ž\Ö\í\î%Úš\Ûý®Þ¾’\n\Ô}\ëœ0\âQƒ÷KYT®ÕœI \és›\Ü~\Ö\ÕKz¯, \âó¤“\ÞWwðå«˜\É\Ö\\\Í;ž³\Åu®ñ„\ê$\å6£\ÑIõ1\Ô\íùL÷¦y)‹ˆ\î€Z¼Št\Ò\ä\è´sIû}¿*J/û$O\á9M0­óL\n{«@P#t\äSú)5\Ø\Ù\Ç\Ó\é\Ú\îgð€¬\ìP7–\ã\ÄL¢\à#$žÀ\Æ\ï\Z\æ3\Z[©\Î\ä\Ñ\ÈØ§>\Ò\æþ\"ªÆ.n$“\î¹\Â\èVT­2rs•W\Ì3\rl’V\Òq\ÚOª!	S\Å\ÖWWÂ¸Ï¨$›\ÈwZ­\á\ìñ\ÑF¼³7s\áÕyû,^viT×¦öa\Í#ð½ Ù·¢®­ƒ]¸e3\Íý.ø?·œ1¤\ì\È\î»z¼	™-Áö\\\íÿ\0,y$cª\Ó>I¦Zñ\\³i¾\n0“J\r,\è¥ó‡%l\ÒcU\íz\æª¼ 4T‚»¯ƒ¸Ž°X\ã¶\ËÎ…H[¿^Ui\äp}TjzT¯M.RùBªÖ…‹D\É\ä~\Éü]©VJ1”£¥\ÞI)\ê\î’¨†\Æ\ê/#`R\Ð:Ot\ït%L€N”$J`¥3w>ŠP˜\ì?hq=R	BhBN½3ñC\ÛN\Ý\â@uC\ÜõE\Ó\Ç\Ùy\ïÅµµÜ–\Î\0\ÎO\ç\ÙVg³®~%\Ðð.\'[†9*8e–·\Èd®ž­[¡§H\æI\ï\\õ\ã\Ç}\ÐW\ÜM”ü#\Äî“…WŒ\Õ&C\0‰[ô­XÍ›\'©Ê›\Ú:œøÏ¹Ö¶jþñ\Íˆ\Ü‰£\Ýkñ\'q\Ó\ßem\×c¦Z5}\ÂK	#-W3\"\Ý\çûvƒK„´‚:Œ /\ì\ÃÁ.o…_¾‹£%§—ðºúu\Ú\n››š\×:›ž\Ü-ÿ\0{	-\Ë}\ÖUV8d‚ô\Ç\ÐusÁ\Úf!^|¿\Ë-x‡\0š¶šÞº\àe›w\Ãô6G-Ö“R°\Ö,RÀµx5\"\ç\éõ\èOe™L.·\á\Û)!\æ06&%=}v\\-\î,\Z‰‘\âó\Ý	f©”`+\n´C\ÇB¤*Ž¾\É\Û\éIFùƒ¨I?\ËI*Lý•Š\'b¤l¤ Ó…0€`›Ÿ¢r‘ú½?hI\Ú\ßtŠI\Â*´¸\ìŸE\æµó*=ÿ\0\ä\â~\åv]R\Ò\Ó\ây\Ó\é\ÍsV6¢CGª©x|\íkp‹m,žerò!Œ€N¥+®ÞºsžN2™rÆ˜/h>d7_\Ò\Û\æ²za]uh\Ç}lk½e{Àm\Þ0\Ý¨ð”\ç/\Ùß—\àªÕ£\"\ê\Å\á\Û\åb¿†W¢|/oCü«­ŸPœ±Àö¯\ãÏªž÷\îkò•b\Ð·‡\Ð8%hTk_Š\Î?†I©wWM`’ª\âOÑ•ƒQ\ÏUœôµ«\ZOâ´‚\à; x“‚[G%\Ï\Ü[;¡J\Îù\Ô\Ì·˜+i‰=\Ç5ò[\êÂ¶i˜]oeXÿ\0\Û,ó\åsÎ®V½»Ÿºî¬¬\Ù2\nz¾‘#r\É\Î\0j/\Ò-TRxŒ™Vš€ˆ\0ýŠ\ÍI5\Ý\'ð™\ä¢\Ò\î@ú§\rRÇšJ¿–\î£\ì’\åÁS%6!\nV\Å,ù*\Ø|‰\ì¬òsü\"„\Îú‡e \Ô\ÃùL@\ÉBKJ\Î\ã% 1¿S½‚\ÒXÌª_\È`z)\Õô\ÛÃŸ–½ýE¡\Í\Z²FeW\Â-÷qôE\Ü<0³n‘\n;x\×R|º=­R-QkÓ½øR¨¡\áUJ\â\ä7r²kq0IW\è[­šy}V€Ø—nV˜{[¹G³\ä :*\ê4©¶\í“\Ã\î\Õ|‰G	\Ïñºs	#+¶¬6+±{\Æerœ_‡9¯\×MÑ«:H\Äù-1y3ú)”ÁT\Ýp\æ<lƒgs1V™ü›´rkƒšyÚ»\Ø\Çýk‰\Z\Ã\ÔezM•\0À06\\½µ¶ºŒ=ŸE×¶˜€Bw]Œþ<¢©\×’¸WYä©‡(6€¬Ÿ\æ,ó\'š›Gšƒu”±\ä™“þª\'t\Z,t#\çöPaÂ“˜g|\"!dž\Ø!8\Ú\Û÷*.õA\Z±ð»±\\á©£À7ý•·\Ä^t@\æ²_JHtx–z®¯\ä´\ï`k=\Ï\å=´ÇºbIu667\Ç4¹\è\íö#Rˆ^\é7W¹ø\\\Ï®Cˆ)\ç=§u\É\Õ.œ÷A;”eú ­]0µ©\Û8‰\ë´¼Œ¦­\\+H\ÄH\èVw¡ó{›\Ù,\Ü6B× ñ¸žÈœ\ê\í\×´>Sk¸;q\Ë\Ü.–•W2›Z÷ð ž«­R\ÜLT]\Ý?’».‘52:\ã‰0%\ÂO)D2\Ø+‹4†½N;®žÂ¦%¬\É=uò«\ëYžš‡C¿ûY\á\Ú¦Kz´Œöº:O•ej@‰Q5bµˆ‡£\r.;’¶ƒ¡	m`\Õ^×ƒ\Õ[š­\'	5\é”Z%¹¥MR	N@]¤$ª\ÒS 5\ãûº`”À\åHA›$“6R3´\"<¨»ö§\æ óQù@Ux\Â[ŽK\"µX\Ãr\ã€\Ü{ÀÜ€<\È\nŠ•\Z\â\Ò\ÍD‹u{)¹\êñ\äø\Î1i•k¼B,lsDj~TÖ±[Z¹ž7K\Ç+¤a#\'\Ídq*a\ÎO>¨×¸\ÃmÐ \ï$‘²Ú°\âO~\Ì0§[†6­88púOB¶ø.†3K LÀ“\Õ_e\\û\ë‚>¦‘\Ü(|\àv]=w\Ó/c	n¨$7@\ÜÇ¨B\\p–<¸\Äv\ÆQ\"§–~¹›»Tú¨\ÂÉ­bF\Zð\áç‚·\îl*¶C<@,Zµ4˜p‚ªv\rLk\ÛµÓ‘›[­0\È\ÇC‡U—yOK±±U÷ö\ÇYøû\ëk€V¥7\È\\u¥Á%t¶¯³\Öx\Òo±³L`)¡\Ó\ÕZ)ª‘\Í~\Ä5\éƒÀÁPm0¥ #„±µGô$j5´)€ŽK\æ÷I:HmODÿ\0\ÙóQ/	ôQuC\Ó\îT™˜pœÀ8\ë*šµ\Ã$Œ./|B\ç\ËA†ôüÊ¼b\é\Z\Ô\Ë{Š|D\ÆHgŒõÙ¿\É\\µÿ\0\Å5~¸\Â\æno‰\Ê½t\çÇœ²»µ³q\Å\Ü\ì’O™*\ï‡nJ\ã£\Z\çÀ÷+œ}@ºƒ-\â›\êù»H>M÷>\Éo“4ñ\ïN²\Þ\àl¥_P™\ë\"…\ÔÞ˜\ä9£Zc\ÕqÜºæ‡‡„=FI\Ù&9;¹\ÌtS\ÅôE¸\Æ\ÜZ5\ã yT€­ým/¦k\ì\Z5´\áÁ\Ä\ä\n!—õXL;X?ñ¨v#ü\\\ä+j\×iÏº\n£;«–‹œ\Ù\ìMˆ\ÒEF=“\Î54ú„\×?*«K„\ìO÷š°\ä²\ï-\Ô\Çit‚:c¨W4\Ç^;=\Å_\Û9°IÕ°ç…šû½mOŒš—H#\ÝF®‘Ê¿\\gn¯ÚªRv®Ž\Ã`\ÞxY\Öô@\É›K¶2£u˜ºJW\Ú\å\Õ1LK*\ÐSBa8*\0©’–5H(4©’t’I\nmiT\ÜVk¸\Âÿ\0Šµƒ\'{.jþñ\Î\ã“\ì:-3\â·\ïéŽ¼“*x÷/\'0Ñ°\\U\å\ÉqZ\\F¬\ÈõXNz\é’I\ÈÇ¶\Þ\Ò%T÷ôS&RùhPR\nôŽkò\í©7ÿ\0Œž\î\É÷+·`s\Ú\ß1\ì½2\à‚\Æò\éöÿ\0K-ú<s\î°\ï¼/p\íû\è+F\ÕÀ¶û*kP\Ö\Ó#\ÂyópBÈ¹„°\äõ\åF¹­P·c\å\ÙYH’%\Ûò\ä†cÁÁÿ\0.h–Hä³±¤¢i¶FwQ5·\nM¬9”=p\ÙóþTñ¬ ®¦!e:»;\álBF\åf\ÞY;%§Ð«\Ï® \Ë\è\Ýk5\Ë	\ÏsL8B½Wr‰«\ZUD.Ÿ¤j\áAÎ*x-U\ãa²\å8Öº†6‹Oˆ\Ý\èd\Î]ü®h9o\â\Ç\ë&¿#¨\à:”1ò\æ{ŽË»µ¹k\Ú\Ó \ä\ä-ºo„¸“˜ý>±\äUo÷s\Õz*ARÇ«X5L)«M)IE$‡X¡\Å\Î$\ìo¸„{Î–G\Ýr\ÜR\ë8^ƒˆ5\Íy+>©—aF­C\Ëu:,Ô®,cu\Ìqt!+ºp•83ƒ7Ç¨òþ•\Þ\Ät\Ò\n\âxc GSÿ\0•\ØPt±­ø`³?¹÷\î·Ï¨“H\ï\Ë~^Êš\Ì\È1 \ïUkª€ o\ÏÓŸ–É™STs·(Œ¨ª¤ùd)ºûfó*\ÇS\ÒLs\åÈ¬kö8x›\Ô\È\æ?”¤\è\ï3QcúQ´\ßËš\ähñ€\îX[V÷\à\æ{k+Îšµk·ª»Â¢½\\\È\æui*&Z|–\Ü\Ó,ê” \"\Íl \ëWªJX‹ŸBV¹Œ*®+\Â¯\ÔV¹\ÏX\ëA¯\ê9Î“è†…ºö3•›shF[·E¼œaò\í\n\×‹¶«±R´·\ÔÓ«e]µ1)›\Òx%÷Ì¦\Ó\Ì`÷Ö«\\¹…³\ËðWT\×.mgšm›\Ø$ UM*`¨\â–$¡)#\ÍñZð\ÒE\Ä]U:’\ê¸\ÝM\×v\ï.\ê\ã‹\èÊ¼¡\í\Ñ.)+ªž\åS\É*.t•i0#ª\Õ\â\áüsØ­\Þò\âZ—D›…‡bp;µ¬_ ‡wûý¬+h\Øùmf\\Aÿ\0y‚>É˜ö´\ï?Çº\n°\ÖK\ÜL-`ú£\'\Ð%IÀ˜kq ‚gi”®}+£MAya\rY\È\Ç3H\ÙI\'\Ïb‡¹¦‘Ž~Ge\ì\ìd×³œ+)\Ì})#!o¼‘Ÿ\Â\Äº¹Qc:œNë¡¼§©f\×v@>Çº®AÚ¸ßˆ\"Pu.\å8²ó*‹\Êm`\Æ\éÈ›ª©õ	*ú:eMm˜\ÇTm7¦xPaV:¨\æ™Dk8ÀÁ8\n»ft¸v*Šò÷6\æ:@(\r‡GÐ®­®\\*ºHu¹Â¸±y\Òý\æ\Ùe\äÍ¾\Ú\ãRzt\Í*ÀPŒr¹ŽXµ_)*\ç\Í$’esW”üRºkÑºÆ©Mwi\Å(*A=W\á  ª©º•$Æ©½R¤§S±y\×Ú¾-\nn‘o\ÒË }‘ö\î\Ø…£VŒaúÀ#§\ê˜\"’2\Ê\Ù\Â7\r$ˆsdI\ËùAÙ¾C¤O\"?a\Z\×\ÎO‰\Æ0	\0\Çr¢Ú®,¸ªÇ¶úG‹¾\0\n—Ú¸ó\ÈÛ´\"!Œ†‰>\ÌA\ë\Ö|%\Îñ?l@\é\É)\Ð÷44´»\Óô³\ë0œ\îE\ÐT¶`d«\Ï)…‡YŽq§—UY¥`bðUU\Zw•mp#PB\\U˜Tž£SiYWN%h\\Ô†4Ç…iŒþ³\Õ\rEÀƒ·\Ö-c:µ;\éÊ€r±ŽA!Fž—wD´B­ÁFµ]-% ®MUl0Š²©ùùY\Ö\Ê.\Ñ\Ù=\Êa\Ü\Ø\Ýkh?\"Žc\×gtXd\Ó\Ù\Ü´8}¼\×>óñ÷ø\ß\Zùz«\É:§ZK>´s7;•œöJÓ¸vµw\×\åP¥lq\n2,€¥qer¦š!*:v3˜E\ÛIä„ \èw’Ú²x\\ûô\è\ÇûD\í_¡Àƒƒ‚ŒN¨1&<§?ˆB_ˆ\0Žª\êW±\Í\0\0’y`úQ=®úA\çCZgC	ñ\r\æõBµ†<#Pc§Ÿlú\'e},~£$ø›3´*YXË›«D¿3Ju\ë@\Ðd\rˆ‚Oùeqt`\Ê<Õ—œðLµØ‰Ø€<\Öq\ëNB¨¹ûùòLN\ÊN`\ÝB»´…I \î_©\Ð6\n‹•º \åW_e¶~™k\íEº(!©„KUDÔš\Ì\n-l)™&\\»©#\É]R§$-}’lö§\'¹T\Øì­´@£˜V¿»\r$\0\ÄOUŒÒ“Ý„µž\Îë—®\×\æ\éIpÿ\09\ÝJK/ñFŸ\å¿\Ãv²¡›$’\éaU]l¹÷ýE$”\ÕO¥”•©$HnµlÓ¤°ó:<+\ïþ\Ü)X}/\ì\ßÿ\0I$²\Ë]%q³?\ê(;Í›ÿ\0\Ûô’J¯\Ùg4G ’I’º|»þ\Ô\ïÿ\0\ã\Ü~RI¥Y\Ü÷(zû$’\è\Ë\n¡¨ª’I4¯I$“yª«\ì’Iö;+­RIŠ	?d’BU¤’H7ÿ\Ù',45,'unavailable',1),(5,'RPSLS','rock paper scissors lizard spock',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\á\0\0\0\á\0\0\0	m\"H\0\0\ÅPLTEÿÿÿ\×ô\×ö\Õÿÿ\Õ\Õÿö\Õ\Õ\åÿÿ\Ù\Ùö\×ÿ\Ø\çÿÿ\Ú\Ú÷\Ùÿ\Úõ\Úÿ÷\Ù\Ø\éÿ\Ûù\Ûÿ÷\Úÿû\Ùt­ÿýõÿÿ€€ÿööÿ\Þ[‚Ý‚|\Ü|ò\ÃÿÿòÃ€³ÿÿyyÿššðûð\Ñò\Ñûþûÿ\ÌÌ‰ß‰\ë ÿ\ãsÿ\é•ÿ\æ„ÿ\äyÿ\Í\àÿ´\Ñÿ–\â–ÿ††ð¹ÿÿüð‡·ÿ”””¶¶¶\îôÿ«««¡\Æÿÿ³³ÿ\Â\Â\Â\îÂµ\êµÿô\Íÿ   ðððÿ\çÿ\àeÿ\Û@\Ã\Úÿÿ\ç\ç©\ç©ÿ¦¦ù\åÿòÀÿüñÿ\íªÿÿ\ä|\Û\ÛÛ†††ÿ\í­\èÿÿ\ë ø\àÿ›\Âÿÿooÿ®®\å÷\å¼\ì¼\î¯ÿ~ˆ—\Æ\Æ\Æÿ\ãuÿð¹ž\äžÓ®®‹„ŒÍ°Õ”€™\ä\ã\â²Á\Ù\ÒÊ¬š¥¸\áØ¹´­’—“†—~~¼×¼¨Á¨Î©©‚”‚Ô¶Ý·¾¡‘’ˆxŒ¥¬¥–©IMHo_tÖ°ÿÏ…\âñ¢\ã\ê‡\îøœÁ»\Ê\ã[_fûÔ‰ü\æÔˆ†|ojV¢¯ÃŸ½\ßÿºvÿ”oy‡Zds¦ ‰£\àƒ‡œ¾²·ÿ\î†wx\Ã\Êÿ©uÿ\Òj\Ð\ÊÚŒzz\í²¿î„œ¦œ0;0otogzgtccÄ®\Újj¬Å¬¹6_¤\0\0uIDATxœ\í]û_\Z\ÛvADTPy¨ ¨€(ˆ>P£øˆ‰\Z\Ô$‡¼\ÔÄ“cÒ´½mÎ½ö´M\Ó÷M›\æ´÷ô\ï\í\Þób\Ï\Ì\Ú{ A\rýøýAa^™¯\ë½öš	\Ç\Ý\â·¸\Å-nq‹[\Ü\â\nV\ç\'G\ÆÆ¶\Ç\ÆF\ïö\Þô\Ý4«kÛ£Ñ±õÉµÁÁÁµÉƒ‘\íXôÀ~\Ó7\Õ<ôF£#k&«\ÝjµšL&ô\Ój7\r®G£wnúÖšƒƒ\Ø\Ø bg\" µÏ¯\ÇFVoú\î¾k£#ójz&»\éG‰¨õ 6\Ò\âr\\Ž\Í\ÛMj\Ø_gÊa®\Çoú&¿“±5-?“ýq…\ãBo\å\íöù\í±\Öu¬\Û\Û&«– \É\Ä\ã]ok\Ì\íë±»7}§_‡;\Ñu€ŸýM\í«üHì²¯\ÅL7}³_ƒ;±†b#,ãT»¬ó±ù›¾\Ý\Æqgt (\éhù±Zº­H±7\nIé¨°÷‘v¢\Øj¶86u´òXg \ÖÁ\Ñ\Ö\nŒÛ ŠšR\Â\ÞG:ˆ\Þð=7„»1Ÿý\ìG¹\êk€¡\É>vpÓ·\Ý\0¢“\ëia\ï…Z¾8g¶Œ¶N’:	\ë¨\äf\noÉ½v\Ó\ëŸøô\Ìtrû†\ï»nô\Æ\æ!‚\Ö+\Â\î¹\Íô–¯¢m¬¸öh«þIÐš\ì?‰»RöZ\í¯/\n\âF?¬k­\âlFAšLa¯\âg¬\ÖÇ\Ê\Ò)a£=\Ú\Zuÿü,\Â\Ä\ÝY~5~¡\Ôc\á\ë\äØ\Ýu#\Ø^ƒ©,BII\í?¾©\È\'T~0\É“X+RwbŠ\'(©\Ýô&-/P8h¤\Ê\áÁ8J\"\ä1Á×¼r8!@\ìkZAM\Ç`%}$\í¾@ñýMY9:õZ]G¶€šFAO*\äRö\ÇÊ±\å7&µJÛ·¿oº\Z\ëÞª¼¿Pó0\\å­®ŠZ_»‘»np¬¸€\å\ëµNŽ\\÷\r7ŒI 9#ûQ\Êo~þƒ\ßZ³~ ch[\ÖV½xm…<\Òü÷\ÏpDW8\Ù_W´…Ro¡>#Fô»w¦º`a}œ\ÖSþÁ·\00\Ãï¾™±½¦!(u.Hd~ú	²Á–a¨‘\á#ð°\Ìk\n\Å\ïŸ\á˜\ÚA7Š‘\Ö÷\ÛZ\ÄÕ¾TjBø3aøRU<Tòm\0?j\ÚñP\ÓÀFÈ•«PW\Ø\Ô\Z\Å™—JýQ\0|¡u}òZ\ïök\Ð­\Ç¹\ìh\ìc-\Ðn\Û¬\Ã‘!‚&{+´1j®†b„\"ª [¡),\"5Š\Ð.!¶ŒrR‘o…\n\n –Z£-±t19b·š?ª²Ž©¤`%ýþ£!F\ï¨\éõ#¶\0\ßý9˜y\Û\ÇZ¡™ˆ°þ†)?Ž{c²ƒ±¢EDˆ|AL\Ë\Ì\ÃI·}\ìûoCI`/\æ\Ò\n\'\ë`\ìš\î\ï\Ûq‡\åó/hÅ¯µe–©N?ôˆÖ ±¯×™tO™·Š‡gá°¸ežj\Ö=7ˆu\Êö\Â\ZA\ë`]\Ëø\æ¢gñ°¸st\äóùŽ¶vŠ‹ž¢ù\Û\ï×¹4“rH\Î,9§\rO˜Nþ¸½òµeŠMŽ\Z9š©\â\âÂŽ\Ï\å\ê\ê2wa Ÿ.—±\ÜùIN/\í%g\âK\ã\ãKqDvw‰I\Ò6ãŽ¯BwKm\Î D×¸\Þ1fJ\ã\ÚX,ú0/5\Ð_Ñ³ñµ»\î\Ýx‡\Ói³uˆ°!Œ/¡­6\Ê\ÓKI·{—\ãLºAµ\Â#jƒ\Íd\Ýô\Ú4Ju\ÃH~;f—†Ë¼³X¤Õ¢,t%\ãˆQÇ³g\ïÐ¶xrh:m\ZJ\âOó\ZŠ™·p˜%(\îH^|:Z,ê¤§’¤¹¸\èk”\ßônr	\ËÎ¹Y\àR\ãj8mK\É$¤«\Ó\Èb\Â\'™‚UÀU\nI€óÑš\è\îFGô%bhcÁG“Ÿ\"GŸg£11\Æ\ÝqA7OPŽYx¦b\Ç\Ä¡;«\Ã=ž”·Þ•ï»š~ô˜.@û`Le´ºy\Ú)O\Ñ\Å lEO\Ö8\Ü\íÀülN\ç3\\\ç]¨Ž§Ê©÷ˆÿ®VŒñ¡i.©|\ë]\Ç\í\ÝÊ›×”<T U7½\ZC\ç\Õ6š·˜\ì\é\é‘Ä¸µXw\äp\"\n\Êø\ä\â\âÎ£3*}9\Û\âC\äi\É]ü\Ç!6¬Í—Y\â\Ã„´r-6\È\r\ÊJ\î[ô±\Øc~úñ£ð\Û\Ü\ã:ª—\â¸{Itž\ã<\Çmâ¥£òÁ/E¤±iÚ–\Ü5‡\ãt/é®´ú—\Ñ5*C«}~ñ¾³½m}ŽÙ€\à\ÓKdE—fóI†\Ñ\Óu´\ØUÁ¥¡q‘ ¡Ì‡4DÁ2%©\Ú:ZK’‡\Ñ\à\îvô\0\ÔR»um›þ°\Å|,\Z\Ã\Ñ\Ñ\Å$\Øc>–\î\ÊO/ñý¹Qt—	Š9añˆ0D\çbƒm|H¤8ºV\ãHll\Òd%VD…Ÿ~÷W\Û\Ô\á\îÞƒ\íX,½\ÃM-n±>—¶øMü³ð¢Ù¢\ÇÐ£:\Ý2A\Äoš‚<\áj„i˜gN™¢Eÿ\é¡\Æ%\ïnÇ¢#“ƒó&»\Ýnœ\\G\ßÿ:Àº‹\Õ\É\í\ÑX”;,2œL\ÏSi.\'-.QVžcwS\Ü0 8-Û \"\Ã4þQ~\"S´½ÇŠQý™¢Pœ\îpw°¯:f¿;82Ž¢û\Þ™´ör\Ë÷:\Ù\çôÎŒþž%ÁRC6#.2NŸ\Ú\å9b_7¯ù‘aY¸€bˆ\â\ÆLË¼D•ª¡òÍŽ\ÊzÏ¹\ì\ïcŸ„\á\ïÿÀp2\'R3ˆ—~¿{!l\îò-2\Ãb<I:\Í_„“x 0t?ExÛ®>ô«1‘ô÷ùWN\Û(2Dx)õc7¥®\Ðf¡*\n\ÑU,2®9\í&Ÿ\í}YbƒþR²÷y\"Du¢\ã6!´\Ñ\ß\×\ç3\Ïr-R°\Ç|\É\É\Ä\Ä\ß|A2DÃŸ\î:Š ˜œ\èj2\ã¤\'UG[|—y«½\à\Ê\î„Â¿\Ì:\íô£8…\éy.,\ÈS,\ìL±ž\îÐsHEPb˜\ÆzPyOzRLºü‹\"C\Û­š`—#&\î–\ï3\Îry\0‚=\æ\'\'fÙ‰6¥c+Â¦\ä£è–˜Œk\n&Xœ§\ÈG¡š3\Îm’´Kb¬ƒ=À\Ý\ëgU\Ü\Ñ0D\Ò{þic\áo\Ò\Z‚eaCù©œ w(×œÖˆ°c\\PÐ‚ðSñ\â\Ñ2I‹M‚	ø‰Ÿen%\Ëb¸¨•ß‹^/ )*Z\Ã\ÆIr(-\ì\ÏhD(©¤hˆi,22~< ’\0[œñWi½\ì\Î	Aß¡\Æ\Ï(\ÎSú­HPbšy®\êZ d\àn\r¿§\ÈP¸‚\àXDò\Ê÷\Z\Üô{¤öOûž¦¨ö3=’o)Ë‚«?T_\ÔDØµŒŽ]­E«eˆ\ÕTú.ü#iU\Ýo\Û»\Z\è\r¦Y†šz\Ô6øB{²†\ÖTTþpù\â©B±\Ë\ç¯©WR‰QE‹<J\Ð2µ¯)u\ÙOW\Ó;£´=(¯¡\îšòJ\Úó\\ø—Ë²†\ÖD\ÉI¢Ü¼,¤kjj†\Ëý!m7F*”¤¬!BN­¤5¤õ‡&¨j\ê\ÛP™¡\èÛ”!À²üI\Ö\Õ\Ì\Ï\è\ÇGEˆ®C¨/¥ó¤i‚SyS\ä+þ9Ÿ¨Ú†hy\rkv{v–¶g‡Œ‚–Súuóª$\Êò;N	ø‚š·€kŽ\ë\ÌPNB9ž<NTÒŒ\æHª!ö²\æ+\èjºA8šžˆ[J7¦Šˆ\É7†	r„–Â®&>Ce¨‚¸\éB£¤¶8%ý61G·\'h%\ÔB­¶\ïùXæª›À\àCE\ÖUQU‰x\Øu´\0\\S\ïh\ä\ZX\rñ²Z3´-Qr\Ó\æc\ÚYZ}\áñ)ŸV¸\n4›S%(ª/O˜-\ìL“Kz3#<€\ê/\Z†r\â\æ\ÚR\ç\ì‡DúiE\"ÁðD®q)	–‰xh6ûWjs:\r¦u~w1™‹Ÿ&³\î\Â	—Ë•£\Â=a!la\ì\Ôš3\æ\àƒ¨¿…’ J¾#\Ý\âM;;ž<û\å½\Í\Éf\ÈkE\Ø1þ·;‡žEg£ˆ°pxx¸€\áa\â\ïþ~ayˆ\ÏÀgw0¶¶†‚›1$ˆŠ$@Šm\ïS\åB5}ñ\Ìic1|\01,.\"}\"„°\ärý\î.—JnSX’µõßƒÿ\Z\Ã&A)„lš5!;JQ9/ð\Za8„6»Ž6\Ôk@«†\ã0¸Yñ¥\Ïu³þ$Ò¢ó\Ï\Õ:\nûR\Ñ¥\Þ>9“FJž&¤Z[Ÿ4|Ê¾\î*\Ê~\Ï–’Š…Wyª&h\îÚ‚\âaRl#:ŸÉž¹ò\Ì\Ù\0C¸\Þ6~\ß\\\Ëõ/[I¥dë…† \Êi \ZXŽ‡\Î÷rtEŸ\Ô\Ë\î\ÕÜ©c\Ì	®ƒ¤¼ô93PGá£– %/Ur\Zg\Ç™\â/O(\\z†3PNµµ\è\ÌC[]bma\äI\n—:‚\æ.°¶ \ÊC\çi[ú\ê–!˜—\Ö5\Õ\ÖÁ!±‰\Ñ¤\Z\\\êøQ\\©º¶ø m¤ýõÁÚ‚^\Z¸ª©˜z³•#¤\Õø\ÉZž‚¢\"ûº:†B°\Ð\ÂT×œ\Ó2˜¹	b\Ï£“un”n†\È\É%‹\'\Ì0¤c\×øpQºšö|4:÷ ˆr6¸\×\æT­Y\Ð\â„\Ã$\Ô®sô®ƒ7vº”\Þ6<Ä¦¤\Ú6SOµÇ¡&\Æ\Ý:Gba55{\Ì\'lEB:ª‹„¨ª\Z\ØùŒ5\ê«)a%=¨wô\î*n°\ØP\ÖGB,\Â-(e ^y\ê\0ŸÀ– -€AOZ÷\è=\\ûzN£H°\ËCŸ\ÈP-=\Õ2T=´#D`BC\íu\ë\0«)\ÇZDH\Ã];‡ôs¦‡\Èû–\Ë\0eu‰o\ç0\Ö\ê·Ul×¸˜\ë\Õ(NŽ”µ<£\îF} W!\çkP\Æ¶ƒ£õ¿e.·kXƒ£<…`\×\ÔHT0\íVw\'P¼MZ\ãH!+\ì­+¡A©ƒ÷þ‘::²ù&\èÚ¡º\ãI•\Ïxð0UKß–[¥õd\Ý\n\íúm{¥9Š<\n—fŠ\Øs\n»j=u¾ÿ\0ù²[Šg‚¡+42{¯«ƒCÁ\ÈÀÀ\çÓ¯2œ\Éƒ\Æc_Cš¶©ó½\É^¢->4\rD5 ¤œ¶\ÍE¼^o}:<?Å‰\në˜£%G†$1\ê(¦\Énl„\äŸxñž\nm»f/ñ\î\á[:Š)šE\r¦…D8µ;t¹E­—h“ö¦“ÚˆXg\Ö-Ã¢®ƒm9ñ\ã‘Z,eš	š]GõNBk):u3D\åŒ;®™\Çhô\í}¤š\æ¼{¡„ü\ÅGºž¦¡È‹\Ö7z‰!\Ð\Z2´Å‰P\ïT9œú\Z	d»¦	q{\Ã\ÊWWQöüGš\0»Ì‡A\ÍØˆZQg‡ò\è\åŒ:%¿\Ò\ï)¨en\Ã\Þ9\í\Î¬~e¿®Ef \×c&9n3`hOjS™ñÚ˜p\ã¼\Ê†c ¨\ß\ÙU|~ò´‹\Êo\ËsX\Ç\ä¬\Z\î™ƒ¡\r…A} WÎ\Æµ“\ê\à}Ñ…\ê\àóx¶\ÌÀ\Ì~—«k\ÇÃ¨&ˆ»\ã\"G=C”\Ò\Ä\ÝðhÂ’8j\ÊZ¼§@P\Ó\Ðq‚š¨™77I‚e—\Ëe\ÞB[¿ö\á®é™¡™qd\0C´‡¶l/Ž}Å‹×šGt&Hbjk\Ñ\ã)\î‰«6¾£\r\çðè›ž\ëŠO«i|i(·g[b‡\ÓXB#\";\Û\r™ 	\ßFÈµU<\\\à9,¹¾ýDg<\éþ§\Ú\×i\çx|i`˜~¼pŽûŸ¿\æ½k\Ë}ƒs\r?\ÜT¦KqK6$½’\Ñ)†s\Ñ\0B‰1˜ü\æB”.a\Óh38\"\Z-\Ã\Þ}\êØ‚³A\í\×4$\"^ö\ße\ÝúD• ú«\ÑÖƒ\ëJ¬›€„\×[bp€ŸF‹±fN5˜LªƒI4òp\Ú7\áØ›`;=qd\Ö	W\Æ\0B‰c\áw˜ù”	\ç‚\'¯\0\Ç9/—cè©’u\ÏP‡\ÝTØ“%ƒ¹\è\Úps\Ó1\Ç%\à\ÌJBmñ~xžM‡\à€CþH[ÀzÊ ¹\ær\ÌÔƒX¼¯\Ãá”ˆ(\Ø®K˜‚fd®\n\Ã^\ÆNõ\ÈlœýL\Ôp¤D~\íc¨\é‘A¼¹ˆ0\ÔT\ÓFt²žk\Ûó\æT\ßY\ãû‡Mx{Bý`©©nñž\îpÁß¿V%\Å\ÊE\ÝŒ\ÌvP\îVh@P\Ègô`a“AWSpñ~wW/F	Š€\Ç06®+¡‘°¿O\Û·—t§I,\Ãj:å»¾„F\ÂÕ›RFfµ\Ò\æ(\Ý\nXM§<®\îZ=\rRS°–»»ºJ\íu«\ÕR‚R\Âc¡EO‘2Bre˜ƒtŒ»;2¹\Ök¥œRKTA¯#†‹\×\ìi¸½´õn,¶Î˜1\Ù\ã\Ø0”Ž\ï#†\×m‡¨Ò‡\Ô\ìn,:\ÊZUÇ•1\ÍE€uð\Ôb\ãogùf€jj\Å\Ø-\Z”¨–\è\rC°]»Žr5ENûW7ó‘ZŽ\Ë[\Í\å\ìýÀDŸ\ß\ß7˜\r/÷O.\í^BŠ7\rÕ†\ÓM£ÿ\Ï_\Û@\Ð9Ä®ŒÃl»ŸÍ†²\Õû÷›xwk)È…û¥D\Ä;00\à$J9G\È\è«û\Ø™•q8\ï_É¶wZ,–v\èCg8»\âÏ‡›yóu!‰x¥ý\\Ð\Ð\Ì!²¯ÿ\Èjy†Ž%Í¦V\ÆýY>\Û)“«\Ñ\Ì\æý\Ìç†›Ž`\"RÊµan2ð\çÜ±÷\ØA;…X6›†U$¿¾@XOO&ô´ªšˆœ7‘#\È\Õ\àh›‹D`Žmª6«>Q\åúó\áN˜žD2;`vrš‡7ù‰¢\ÌE >ÎœW­ÀB¢J¾Á/\ìŸeò\Ã;\ïû¯AŒ¡R$G£\'qœójƒe(q¬‹‚3C\Î\é\ÚS\Z÷\'\ÂýTq÷QŸ;mö¼¥6&AAW\ê°¬\\#\Ø\ÜKJ\Å\È\×ÁSlÏ³»ªßŒœ—-@™\ã\Ü\0¡©A\ÊJ~\èU\'†ZpÌ°h|%À\ê\È}3ö#Áz\"Š9¯\ÂjŽ²lOº‡\Äwô\åW 	Zžž>?DPyXK\à\n¥8©‹ž@1\è+\Èe8\ãn7\nÿH‚–ð§\n~Ø·Œþô¤˜7Z¥º‚˜¢ ›p·¢\Û\Ì\Ð@6\ØùJ5KŸQQœ¸¢\àl„ @qz©€Œ?þ\'¨¡šAý\Õnö\Ë{¾{Á†\"[Œ\ÐL@¿?‰P~³—\æùtªÀ•UB\Ì\Z¾G\ë+ªÏ‹ª(\Î\r_we0\Â\ÎSõ-›\å\nÉ°½3Àz?\ÑW\â¸\Ô(AD1Á6B7f\0\í|¥\Üý²ùP-\é\æ\ë©\Ã\Ë&\Ó-@»5h4¸Á\ågõ:jy¥ÿŸ¾8^•óX\î7=d0R5\Ì\ì\ì\å\çÏŸ_žµ©Y:J%öe;û\0‚ÁñòMõA\Íb0A!\Ø\Ý}öò\×/ï¾¤øtºRI§\Ï_žI–Ì¶\Ê\Ö\0¶\ë×©ò\ér\è”4X\Ëý&\ÅHŽB\ïü¿Þ¥\Òe\ì\n\Õr:\ÃW*\åôù™\Â\Ñ1wÌºl¿_O°ótd¡œ*¿R\ÌZll‹ów´Oy*©4W¹üM\á\èeY\â¬>]³è¼Œ„j%¥²\Ä@S\Ã~Bk…\ÈòÎ¿|b­ò®œz\Ù\Ö-Z\"kI|\"¬!õ‘²/?«\âJ–õ®°F1¬s¤\ç_RúC˜žG(\ék(T\Ô/B|Uµšú›¨¦9m,ü?LC€Os¢K\âÙ€ž!h…Rª#Ù£!¡ñ3g\ïô\ÇT‘/­¤\ï\é\Âg‘\á]MWôž4\Ìzp´@\n\Ñ2\Û<o\Z\ZÐˆð\ìg\Í\Èôø¢˜F^\é´y.¥±9pG€_g†%E(|!-1Ü¼RØ¡õ¤g_\È¶’I¥2øeqe”%ó©Lý\Ê\\œ+A‘š}÷ûu~\ÆrÊ¼“Ÿ\É\Ä\Æ\Ò<CÔša÷Ù‡\ÚN>“\á…÷‡VeýÄŒSŸ•£\Ñß‡r\Ý\å	½²\ÎECRM;›—Ö”ö5_*µ\rWþ\"¾\ì3uŽó¶ÏŸS\ÕJ&]I½¬¥5Ž-ý¶\èK_¦\"}!ó\ZõUa\rC\ëhº\Ïk÷±Y-ð™\Ï8‹‘ð«`†—Cª«	\ë\\©\åû‹*ü7\É0ß´\æiDSúvÿZ…|á¼H·»\ÏDò\ç\Ã}1q\ë\ÔM<O\ryUK*\Ü$‚!\Ãó\Ú\Î\ÊU1\Ñ-\êoå¬¶ÉiûJ\ß=‘`?\Â2Fg\ç}]\ÎFOh$¤\ÃWÃ°MÃlU“S¸Ÿ“´sÿ\ã¿\ç÷÷õõÝ»‡~£ù|>˜\Ð2´˜!ú×®„á°†a÷KUÌªœ:*>œÁ«Ž\Ï%–\Ã÷\'üþYN\ã\ÝõZ\ÊJhl^‰jeH*)F\á2ˆ9\âZCzúD%Â¶œ™.‡\Ú%/µ´2z\Ü@\Õq³À\Ïñtv¨KJù—Á\à\Ù\Ësy{\å7’¡ƒšÔ¨â¡¥ó\á&\å8iU\'£‰ñP\ÃðL_4pRª|S+©c¿D¹®’\ÓX:\ÛÃ¯>¾P¨pª–yór\Zu<\ìþlpxU­¤Ž9ê˜Ÿ˜—\"\éòŒZL¹\î\'µÑ†›W –\æÈœ¦\Û\àK5Á6\Ç1u\nwi,\í¯.Œ<¨€ô©º±\Ú\Ì\ÚB—JJ šúM\ÓSdˆÙ•\Îð)oðŸ^JH=\ÔtŽ›Y\îE†ÝŸYú\ÄK\ÍúQ`\Ëú”®\ïi­\Â\'ýq[Q!²‰ÁR\ÒÊ¹ž«>\ä\ê]²®œ\ê[ÿM\í\Ó\×\ZQ\Ý\çtò/õü¥B¶>1¤_\é	Z\Ø\ï\åoÁc‡Bj5R\à\×1dµ—\ë\ÊJx­	6[IqÃ˜ Ö…Ö£¤W\Ïÿ\è‹[f›»pq,Æ‹\î\Ï\Ô.ŠÎ…\Ê\"<f.?µ\'^ Á¦¯[8o\Úý’(Ê‹`;KC!j—Õ®F„(­\Ùw´uÿF‹\Ì\È\ÅH~†ùª‹-\ÌÝ•O\íð M\Ó\×‘»\Ïhm\à\Í3\ZÁ¶ s\Ùƒ%\Äò(@\í›?Ž‘˜;£\Â*UC±RsRýÔ˜Xùôª“B0\ÛÌŽ¾„\á\nÁ4Å‡\nsŒEaXO›)ü°Ž6­\ËF`T·2CC\Û\×GE\ÌBòÈœR‹05\ã{%Ý–J\ê3†\"L¸	:›*ð§ŒQ\ÓÎ«\Zû\Z\Ö\Ü./4It”˜Á¾†~5\Å\Ê\Å+ºü0Á+\Ýs¨b÷%S=1Á}zQ¡AÍ¡2§i“Ð¢Š®\\\álb(e\á$TE\ÐpÒ¤†þ\Éù\Óvº^\íðe\â%›\î]FB\î\ãŽ\â;{\Úî»‚a(m’¢\Z,O´©‘\r\ãøÀ\ä‡r5ƒÿR°	\ØÜA\Ýt=XþSž=\êm	\ç\éÿRóš\Û\ã6æ¼†©„¬?@\ç\Ø\\½\0Eÿ—=\Ë\î³ž\×g¡\Ö\ÈBž\Ôb\Éü`fp%.y\ç\è\Ï[K_%@ýÙ¾‰•l\'1¾Ž\ÇÙ³+}}u6<š„\á\Ò@	x¨\Ä\ápäŽ½s\ßø®£\åÙ¼?¿2+<ºggWò÷ò³\×`\Z\ÏE¤Ÿ¢\â\ï\\)a½×¥nô#©\å\'\äW²–k•½¹\È@\âxn?‡±_:F\ßr_i\ß/B{Á¹\Òq\"‘8.\íÿß±»\Å-nq‹[\Ü\â·¸Åµ\áÿ\0•c\"[±ñˆˆ\0\0\0\0IEND®B`‚',1,'available',3);
/*!40000 ALTER TABLE `articolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asta`
--

DROP TABLE IF EXISTS `asta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asta` (
  `idAsta` int NOT NULL AUTO_INCREMENT,
  `Date_start` datetime NOT NULL,
  `Date_expiration` datetime NOT NULL,
  `id_creator` int NOT NULL,
  `state` varchar(45) NOT NULL DEFAULT 'open',
  `Current_price` double NOT NULL,
  `Minimum_increase` double NOT NULL,
  PRIMARY KEY (`idAsta`),
  KEY `id_creator_idx` (`id_creator`),
  CONSTRAINT `id_creator` FOREIGN KEY (`id_creator`) REFERENCES `utente` (`idUtente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asta`
--

LOCK TABLES `asta` WRITE;
/*!40000 ALTER TABLE `asta` DISABLE KEYS */;
INSERT INTO `asta` VALUES (1,'2023-05-21 16:14:19','2023-05-21 16:20:00',1,'closed',100,0.2),(2,'2023-05-21 16:14:51','2023-06-01 16:26:00',1,'open',45.19,0.1);
/*!40000 ALTER TABLE `asta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_articoli`
--

DROP TABLE IF EXISTS `lista_articoli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_articoli` (
  `id_asta` int NOT NULL,
  `id_articolo` int NOT NULL,
  PRIMARY KEY (`id_asta`,`id_articolo`),
  KEY `id_articolo_idx` (`id_articolo`),
  CONSTRAINT `id_articolo` FOREIGN KEY (`id_articolo`) REFERENCES `articolo` (`idArticolo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_articoli`
--

LOCK TABLES `lista_articoli` WRITE;
/*!40000 ALTER TABLE `lista_articoli` DISABLE KEYS */;
INSERT INTO `lista_articoli` VALUES (1,1),(1,2),(2,3),(2,4);
/*!40000 ALTER TABLE `lista_articoli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offerta`
--

DROP TABLE IF EXISTS `offerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offerta` (
  `idOfferta` int NOT NULL AUTO_INCREMENT,
  `idUtente` int NOT NULL,
  `offer_price` double NOT NULL,
  `date_hour_offer` datetime NOT NULL,
  `id_asta` int NOT NULL,
  PRIMARY KEY (`idOfferta`),
  KEY `idUtente_idx` (`idUtente`),
  KEY `id_asta_idx` (`id_asta`),
  CONSTRAINT `id_asta` FOREIGN KEY (`id_asta`) REFERENCES `asta` (`idAsta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUtente` FOREIGN KEY (`idUtente`) REFERENCES `utente` (`idUtente`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offerta`
--

LOCK TABLES `offerta` WRITE;
/*!40000 ALTER TABLE `offerta` DISABLE KEYS */;
INSERT INTO `offerta` VALUES (12,3,100,'2023-05-21 16:56:57',1);
/*!40000 ALTER TABLE `offerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `idUtente` int NOT NULL AUTO_INCREMENT,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `shippingAddress` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`idUtente`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'admin','admin','admin','admin','admin'),(2,'ciao','ciao','sono','Milano','ciao'),(3,'damiani','Andrea','Damiani','Via Socket','BestDeveloper');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-21 19:07:58
