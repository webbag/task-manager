SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `task-manager`
--
CREATE DATABASE IF NOT EXISTS `task-manager` DEFAULT CHARACTER SET latin1 COLLATE utf8mb4_unicode_ci;
USE `task-manager`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customer`
--

CREATE TABLE `customer` (
  `cu_id` int(11) NOT NULL,
  `cu_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `customer`
--

INSERT INTO `customer` (`cu_id`, `cu_name`) VALUES
(11, 'Nobis'),
(12, 'Maxime'),
(13, 'Nobis'),
(14, 'Prolox'),
(15, 'Maxime'),
(16, 'Prolox');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `project`
--

CREATE TABLE `project` (
  `pr_id` int(11) NOT NULL,
  `customer_cu_id` int(11) DEFAULT NULL,
  `pr_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `project`
--

INSERT INTO `project` (`pr_id`, `customer_cu_id`, `pr_name`) VALUES
(11, 11, 'Projekt ECB'),
(12, 12, 'Projekt AEA'),
(13, 13, 'Projekt BEE'),
(14, 14, 'Projekt EEB'),
(15, 15, 'Projekt ACE'),
(16, 16, 'Projekt AEA');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `task`
--

CREATE TABLE `task` (
  `ta_id` int(11) NOT NULL,
  `project_pr_id` int(11) DEFAULT NULL,
  `worker_wo_id` int(11) DEFAULT NULL,
  `ta_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ta_description` text COLLATE utf8mb4_unicode_ci,
  `ta_date_create` datetime NOT NULL,
  `ta_priority` smallint(6) NOT NULL,
  `ta_status` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `task`
--

INSERT INTO `task` (`ta_id`, `project_pr_id`, `worker_wo_id`, `ta_name`, `ta_description`, `ta_date_create`, `ta_priority`, `ta_status`) VALUES
(104, 11, 19, 'Zadanie [XQYXZY]', 'aut id, et Qua repudiandae placeat, maxime quod aut saepe temporibus hic repellendus. est delectus, minus doloribus eveniet, officiis necessitatibus facere cum consequatur earum tempore, impedit, voluptates pondere perferendis sint rerum reiciendis et autem tenetur assumenda rerum voluptas sapiente molestiae quo voluptatibus cumque soluta debitis ut recusandae quibusdam dolor nobis aut Itaque maiores et non omnis optio, a aut lineam. omnis am ad libero possimus, asperiores ut est, eligendi nihil repellat alias', '2018-08-12 16:23:13', 2, 1),
(105, 11, 19, 'Zadanie [YZXYZZ]', 'perferendis soluta tempore, id, ut eligendi ut hic maiores molestiae tenetur am voluptates sapiente reiciendis debitis non doloribus dolor quibusdam cum delectus, officiis quod maxime Qua placeat, asperiores lineam. et et impedit, aut a rerum aut autem aut assumenda sint possimus, voluptatibus facere necessitatibus Itaque repudiandae et quo rerum voluptas pondere optio, nihil nobis repellat temporibus repellendus. minus eveniet, omnis consequatur ad libero aut saepe recusandae cumque omnis alias est earum est,', '2018-08-30 05:16:53', 2, 2),
(106, 11, 19, 'Zadanie [QZYXQY]', 'libero alias impedit, pondere hic eveniet, Qua voluptates debitis optio, est, nobis recusandae nihil maiores perferendis officiis aut Itaque doloribus quibusdam ut aut delectus, non cumque maxime est quod lineam. aut saepe molestiae eligendi id, consequatur et sapiente voluptatibus et a soluta reiciendis repudiandae asperiores autem aut facere placeat, omnis quo voluptas rerum tempore, am sint tenetur necessitatibus omnis repellendus. dolor cum rerum temporibus ut ad assumenda repellat earum minus possimus, et', '2018-08-08 12:45:21', 3, 2),
(107, 11, 19, 'Zadanie [YQXZXY]', 'saepe delectus, non assumenda molestiae ut possimus, reiciendis sapiente am consequatur et officiis cumque Itaque dolor quo aut voluptas repudiandae aut minus alias temporibus eligendi pondere a facere id, libero tempore, necessitatibus omnis eveniet, debitis perferendis omnis doloribus cum nihil optio, ut hic aut voluptates et placeat, et voluptatibus soluta autem quod est, maxime quibusdam sint est aut nobis earum repellat rerum maiores ad asperiores impedit, tenetur Qua recusandae repellendus. lineam. rerum', '2018-08-25 11:57:31', 1, 2),
(108, 11, 15, 'Zadanie [ZYQYZQ]', 'ut voluptatibus est ad omnis pondere am eligendi aut repudiandae doloribus repellendus. quod sint aut et delectus, temporibus eveniet, minus rerum Itaque perferendis maiores maxime nihil cumque possimus, asperiores placeat, autem recusandae non assumenda sapiente rerum et soluta quibusdam lineam. alias ut quo est, voluptates tempore, cum necessitatibus saepe Qua impedit, facere officiis reiciendis debitis a hic molestiae tenetur nobis earum et libero repellat aut dolor id, aut omnis consequatur optio, voluptas', '2018-08-06 14:47:28', 4, 1),
(109, 11, 16, 'Zadanie [YXZXZQ]', 'consequatur non aut reiciendis cum officiis maxime Itaque possimus, repellendus. delectus, doloribus et pondere debitis alias repudiandae nihil lineam. eveniet, saepe molestiae sint et dolor id, rerum quod impedit, rerum earum placeat, recusandae aut sapiente ut aut hic omnis a tenetur assumenda cumque voluptatibus eligendi autem quo necessitatibus ut facere tempore, omnis est libero et soluta minus aut ad am Qua voluptas maiores repellat nobis quibusdam perferendis optio, voluptates asperiores temporibus est,', '2018-06-22 08:16:54', 2, 2),
(110, 11, 17, 'Zadanie [QZZYXY]', 'repellat cum facere hic autem et tempore, molestiae est, officiis placeat, repellendus. lineam. voluptates recusandae alias ut a ut est rerum voluptatibus libero am debitis dolor et asperiores nihil sapiente impedit, temporibus eveniet, maiores aut quibusdam eligendi minus aut tenetur ad Qua possimus, rerum reiciendis omnis quo consequatur maxime sint et earum aut pondere Itaque nobis optio, perferendis omnis delectus, quod necessitatibus aut saepe id, repudiandae voluptas doloribus non cumque soluta assumenda', '2018-09-17 10:50:58', 4, 2),
(111, 11, 15, 'Zadanie [QZYXYZ]', 'pondere quibusdam facere autem repellat aut temporibus et eveniet, et alias sapiente est aut debitis cumque optio, voluptas ad dolor aut molestiae am assumenda ut eligendi soluta voluptates id, maiores nobis consequatur quo tenetur necessitatibus cum Itaque officiis libero possimus, lineam. asperiores nihil rerum aut et omnis tempore, reiciendis maxime est, rerum placeat, a repellendus. Qua repudiandae hic minus recusandae voluptatibus sint doloribus earum omnis delectus, saepe ut non impedit, perferendis quod', '2018-07-13 03:45:52', 4, 2),
(112, 11, 15, 'Zadanie [YXXXZZ]', 'molestiae nobis perferendis est quod necessitatibus voluptates am facere libero Qua temporibus impedit, doloribus nihil pondere quibusdam repudiandae repellat saepe asperiores eveniet, Itaque sapiente earum ut rerum assumenda omnis id, recusandae maxime ad cum et minus repellendus. maiores placeat, autem et eligendi aut alias hic optio, ut cumque et est, aut dolor rerum possimus, officiis a soluta lineam. tempore, aut aut omnis reiciendis quo debitis sint voluptatibus non delectus, voluptas consequatur tenetur', '2018-09-07 14:54:24', 2, 2),
(113, 11, 17, 'Zadanie [ZXYZQY]', 'voluptatibus soluta tempore, et dolor et ut repudiandae eveniet, impedit, eligendi molestiae facere maxime voluptas asperiores cum rerum repellendus. aut temporibus alias assumenda Qua est placeat, recusandae est, minus sint sapiente earum ut et officiis Itaque rerum consequatur necessitatibus am ad optio, aut quibusdam saepe voluptates quod reiciendis tenetur non debitis delectus, quo libero doloribus nihil omnis pondere lineam. aut possimus, omnis autem cumque maiores perferendis repellat hic a nobis id, aut', '2018-06-16 14:52:46', 1, 2),
(114, 11, 18, 'Zadanie [XYZXYY]', 'am ut non aut nihil repellendus. debitis asperiores aut minus earum consequatur repellat autem ut omnis voluptas placeat, tenetur recusandae quibusdam maxime Itaque sapiente saepe aut pondere nobis et est et voluptates rerum perferendis et officiis eveniet, temporibus doloribus id, hic reiciendis repudiandae cumque necessitatibus cum tempore, assumenda aut molestiae maiores libero impedit, quod a optio, facere quo possimus, dolor voluptatibus ad Qua alias eligendi soluta rerum sint delectus, est, omnis lineam.', '2018-09-19 10:12:55', 1, 2),
(115, 11, 15, 'Zadanie [QQZQXY]', 'molestiae omnis assumenda non dolor lineam. pondere quibusdam doloribus eveniet, et Itaque recusandae quo nobis aut cumque asperiores a minus id, alias libero voluptates hic reiciendis saepe maiores ut repudiandae maxime aut rerum sint omnis est, repellendus. tenetur Qua aut ut rerum possimus, officiis autem voluptatibus soluta impedit, quod et consequatur et aut sapiente temporibus ad debitis necessitatibus repellat nihil eligendi tempore, cum am optio, delectus, perferendis placeat, facere earum est voluptas', '2018-08-20 07:46:46', 3, 1),
(116, 11, 16, 'Zadanie [YZZQZQ]', 'non et saepe tempore, perferendis debitis reiciendis aut nobis maiores a autem eveniet, omnis consequatur est id, repellendus. placeat, assumenda asperiores omnis et sint ut est, et ad soluta ut quod molestiae officiis cum aut temporibus lineam. alias pondere cumque quibusdam aut Itaque facere recusandae quo repudiandae Qua possimus, libero impedit, voluptas maxime tenetur hic voluptates earum dolor voluptatibus eligendi minus rerum repellat sapiente doloribus am optio, rerum delectus, aut necessitatibus nihil', '2018-08-18 03:53:28', 3, 2),
(117, 12, 15, 'Zadanie [ZZXYXQ]', 'cumque nihil assumenda impedit, rerum eligendi Itaque recusandae et ut et aut temporibus soluta delectus, omnis optio, consequatur possimus, repellendus. tempore, cum eveniet, pondere non nobis asperiores libero repudiandae voluptatibus earum aut placeat, maxime ad aut am autem ut quibusdam reiciendis officiis sapiente dolor sint est tenetur maiores alias facere id, voluptates Qua repellat lineam. a aut voluptas est, debitis quo molestiae hic omnis saepe rerum perferendis et minus doloribus quod necessitatibus', '2018-09-07 03:16:52', 1, 1),
(118, 12, 16, 'Zadanie [YXZZZX]', 'voluptatibus nobis sapiente recusandae autem ut voluptates earum facere est placeat, lineam. optio, consequatur perferendis libero aut nihil repellat saepe omnis minus officiis alias asperiores ut quibusdam ad id, temporibus a voluptas aut non eligendi cumque assumenda est, cum maxime rerum debitis quo necessitatibus omnis quod rerum possimus, repellendus. Qua aut Itaque molestiae soluta eveniet, am maiores dolor reiciendis et tempore, impedit, pondere hic delectus, doloribus sint et repudiandae aut tenetur et', '2018-07-23 18:25:40', 2, 1),
(119, 12, 19, 'Zadanie [YXXQZX]', 'ut est aut ut saepe optio, asperiores tenetur possimus, doloribus sint repellendus. quod reiciendis eveniet, molestiae quibusdam tempore, nobis omnis voluptates non temporibus assumenda perferendis et maxime et repellat aut et quo cum autem aut minus rerum voluptas maiores nihil impedit, earum pondere am a delectus, libero officiis rerum necessitatibus alias Itaque soluta hic cumque dolor voluptatibus aut id, placeat, ad lineam. sapiente est, facere eligendi recusandae repudiandae consequatur Qua debitis omnis', '2018-06-05 15:23:38', 1, 2),
(120, 12, 16, 'Zadanie [YXZZQZ]', 'nobis sint asperiores nihil repellat et dolor tenetur soluta ut autem quod aut cum alias repellendus. et debitis sapiente quo ut facere consequatur possimus, rerum am officiis aut optio, omnis delectus, Qua repudiandae et aut recusandae assumenda omnis necessitatibus pondere ad quibusdam placeat, tempore, minus est lineam. est, impedit, cumque rerum voluptates perferendis aut earum a reiciendis non doloribus molestiae temporibus id, hic maiores saepe voluptas eligendi libero maxime voluptatibus Itaque eveniet,', '2018-07-15 10:20:13', 3, 2),
(121, 12, 18, 'Zadanie [QZXYXQ]', 'officiis temporibus alias voluptatibus consequatur a optio, necessitatibus earum tenetur maiores eveniet, repellat hic sint rerum placeat, Itaque asperiores aut et repellendus. non assumenda pondere repudiandae ad delectus, quo quibusdam id, est, cum nobis reiciendis impedit, nihil voluptas debitis voluptates autem recusandae ut saepe lineam. doloribus soluta aut et facere maxime omnis perferendis aut tempore, molestiae dolor ut libero rerum possimus, am cumque et eligendi est omnis Qua minus aut sapiente quod', '2018-09-27 01:15:26', 3, 1),
(122, 12, 17, 'Zadanie [QYQXXQ]', 'earum et repudiandae temporibus eligendi lineam. alias recusandae voluptates quod et a aut tempore, impedit, tenetur maxime repellendus. omnis voluptatibus am aut dolor officiis maiores Itaque autem minus repellat perferendis optio, possimus, hic nobis delectus, ut ut libero soluta Qua placeat, est, quo reiciendis rerum cum quibusdam consequatur facere assumenda non rerum aut eveniet, ad et pondere debitis molestiae sint omnis nihil id, necessitatibus aut voluptas saepe sapiente est cumque doloribus asperiores', '2018-06-03 17:30:49', 2, 1),
(123, 12, 18, 'Zadanie [ZZQQXQ]', 'non sapiente et soluta minus et temporibus maiores nobis doloribus eveniet, a quo assumenda ut ut asperiores repellendus. aut eligendi debitis facere id, aut ad placeat, est, rerum repellat necessitatibus hic et cum quibusdam delectus, maxime consequatur cumque voluptates optio, saepe Qua reiciendis recusandae repudiandae quod dolor omnis est voluptatibus impedit, autem nihil Itaque molestiae tempore, voluptas lineam. alias pondere earum omnis officiis aut aut perferendis possimus, libero rerum sint tenetur am', '2018-08-29 01:11:39', 1, 2),
(124, 12, 15, 'Zadanie [YXYZXQ]', 'hic et aut cumque non et perferendis quibusdam pondere sint nihil voluptates est, ut quod necessitatibus maxime omnis repellendus. placeat, rerum impedit, voluptatibus soluta id, est aut asperiores quo alias Itaque tempore, nobis doloribus a libero autem lineam. ad ut eligendi voluptas delectus, saepe minus temporibus consequatur aut reiciendis sapiente Qua maiores dolor recusandae earum omnis aut assumenda cum am repellat officiis facere eveniet, et debitis possimus, molestiae optio, tenetur rerum repudiandae', '2018-08-20 02:49:17', 3, 1),
(125, 13, 17, 'Zadanie [YZZXXX]', 'Qua repudiandae cumque rerum officiis temporibus autem et eligendi ut asperiores aut impedit, maxime et lineam. eveniet, am optio, saepe dolor minus quibusdam repellendus. necessitatibus pondere sint facere assumenda tenetur omnis aut reiciendis perferendis quod quo soluta voluptas possimus, delectus, ut voluptatibus maiores est ad rerum est, non voluptates aut hic omnis nihil molestiae sapiente nobis debitis recusandae et placeat, Itaque aut a id, repellat tempore, alias earum cum doloribus consequatur libero', '2018-07-18 14:45:34', 1, 2),
(126, 13, 15, 'Zadanie [YXYYYX]', 'omnis assumenda recusandae ut doloribus ut maiores nihil soluta earum delectus, Qua maxime am alias a tempore, quo debitis asperiores cumque minus aut tenetur et reiciendis et nobis est consequatur impedit, ad sapiente eligendi repellat repudiandae quibusdam repellendus. saepe Itaque cum voluptates perferendis facere rerum est, quod officiis temporibus placeat, omnis non necessitatibus sint molestiae dolor id, aut hic libero voluptas et pondere lineam. aut optio, voluptatibus rerum aut possimus, autem eveniet,', '2018-08-09 05:17:39', 3, 1),
(127, 13, 15, 'Zadanie [XQXQYQ]', 'nihil facere quo pondere quod voluptates ut tenetur dolor am assumenda saepe debitis reiciendis maiores tempore, et recusandae repellendus. temporibus minus officiis impedit, eveniet, delectus, a eligendi hic aut voluptatibus alias ad nobis est, consequatur et voluptas molestiae repudiandae asperiores omnis aut perferendis libero non soluta aut et omnis cum sint sapiente possimus, Itaque lineam. repellat quibusdam est earum necessitatibus placeat, ut aut rerum cumque autem id, rerum Qua optio, maxime doloribus', '2018-09-02 14:11:58', 4, 2),
(128, 13, 18, 'Zadanie [ZQZQXX]', 'id, lineam. cum libero et placeat, officiis delectus, eveniet, possimus, soluta et aut Qua voluptatibus voluptas impedit, am eligendi rerum repudiandae sapiente nobis sint consequatur est, minus repellat asperiores earum maiores ut hic aut aut tempore, recusandae dolor quod voluptates repellendus. maxime nihil aut cumque saepe est temporibus debitis ad facere alias reiciendis omnis Itaque a doloribus omnis optio, quibusdam perferendis quo autem molestiae necessitatibus pondere rerum et tenetur assumenda ut non', '2018-09-13 14:54:14', 4, 1),
(129, 13, 18, 'Zadanie [XQYXQX]', 'cum officiis sapiente maiores id, a voluptas consequatur reiciendis tenetur ad eveniet, hic impedit, repellat pondere earum aut soluta eligendi omnis aut assumenda quibusdam est, minus doloribus recusandae et voluptates autem saepe aut asperiores repellendus. non perferendis libero et maxime repudiandae placeat, ut nihil dolor necessitatibus Itaque am omnis temporibus est sint rerum alias rerum quod optio, lineam. nobis facere aut Qua et cumque voluptatibus possimus, quo delectus, molestiae tempore, ut debitis', '2018-07-13 12:59:36', 1, 1),
(130, 13, 16, 'Zadanie [XQZXZQ]', 'molestiae eligendi rerum asperiores cum debitis temporibus perferendis sint quo aut hic alias dolor ut officiis non eveniet, et delectus, pondere sapiente assumenda voluptates repellat maiores tempore, earum soluta aut voluptatibus facere recusandae est, omnis aut et ad consequatur saepe et id, cumque tenetur necessitatibus doloribus aut voluptas minus Itaque repellendus. autem rerum a quibusdam maxime reiciendis placeat, optio, omnis am impedit, quod nihil est nobis Qua ut libero repudiandae lineam. possimus,', '2018-07-04 09:29:38', 3, 1),
(131, 13, 18, 'Zadanie [QYYQXZ]', 'est ut rerum nobis perferendis Qua ut tenetur dolor Itaque maiores molestiae optio, non recusandae rerum facere aut maxime id, placeat, aut quod sapiente sint repellat quibusdam eligendi quo reiciendis minus assumenda voluptatibus delectus, temporibus et aut earum repudiandae necessitatibus libero alias cum consequatur est, et impedit, asperiores omnis am ad nihil voluptas debitis cumque possimus, saepe officiis a omnis eveniet, pondere aut repellendus. et hic voluptates autem soluta doloribus tempore, lineam.', '2018-07-11 04:59:38', 4, 2),
(132, 13, 15, 'Zadanie [ZXZQZX]', 'et autem alias consequatur voluptates eveniet, quod a est saepe placeat, recusandae doloribus minus maiores nobis perferendis dolor am est, repellendus. omnis cumque aut aut soluta repellat rerum ad voluptas sapiente assumenda hic ut asperiores cum maxime omnis et id, possimus, Itaque impedit, quo Qua delectus, nihil et sint non temporibus facere reiciendis eligendi libero aut aut officiis earum molestiae tenetur repudiandae pondere ut optio, voluptatibus debitis tempore, necessitatibus lineam. quibusdam rerum', '2018-06-20 10:32:32', 1, 1),
(133, 13, 17, 'Zadanie [ZYXQXZ]', 'est tempore, cumque perferendis Itaque et optio, possimus, repellendus. aut Qua maiores eveniet, minus non necessitatibus repudiandae debitis placeat, a quod cum tenetur omnis soluta reiciendis alias nobis earum omnis consequatur maxime quo officiis sint ad facere voluptates id, pondere ut libero rerum lineam. saepe sapiente est, delectus, assumenda ut voluptatibus repellat eligendi et am rerum hic impedit, quibusdam et aut autem temporibus aut molestiae doloribus nihil dolor asperiores aut voluptas recusandae', '2018-07-10 09:56:33', 3, 2),
(134, 13, 18, 'Zadanie [ZQZYYY]', 'officiis temporibus pondere rerum am maxime assumenda cum non rerum soluta ad est hic nobis sint tenetur voluptatibus perferendis et voluptas quibusdam necessitatibus quod minus omnis a cumque eligendi delectus, placeat, recusandae debitis aut saepe autem Itaque ut facere dolor sapiente et impedit, aut repudiandae tempore, molestiae reiciendis earum omnis eveniet, aut maiores repellat aut alias consequatur optio, possimus, ut doloribus et lineam. asperiores Qua est, id, quo voluptates libero nihil repellendus.', '2018-09-13 06:58:55', 2, 1),
(135, 13, 15, 'Zadanie [XYYYQQ]', 'ut lineam. debitis quod maxime aut nihil maiores ut omnis aut minus perferendis quibusdam temporibus a hic impedit, sapiente assumenda non voluptates asperiores et ad et cum autem tenetur rerum omnis necessitatibus id, repudiandae earum saepe cumque tempore, quo consequatur eligendi eveniet, recusandae delectus, placeat, doloribus optio, sint voluptatibus dolor voluptas libero facere reiciendis officiis Itaque est et nobis pondere repellat alias possimus, rerum repellendus. est, soluta Qua molestiae am aut aut', '2018-08-22 13:59:22', 4, 1),
(136, 13, 14, 'Zadanie [YXQQZX]', 'consequatur soluta sint aut reiciendis alias ut assumenda repudiandae tenetur maiores autem est, rerum omnis aut rerum hic nihil facere am dolor maxime a cum minus tempore, nobis molestiae earum quibusdam doloribus non et libero perferendis quod ut aut placeat, lineam. ad recusandae optio, impedit, pondere et officiis necessitatibus sapiente delectus, debitis voluptates repellat voluptas est possimus, quo asperiores saepe eveniet, et eligendi cumque temporibus Qua id, aut repellendus. omnis Itaque voluptatibus', '2018-08-15 11:36:47', 2, 2),
(137, 13, 17, 'Zadanie [QXQZXY]', 'voluptas molestiae pondere soluta libero eveniet, am maxime tenetur alias ad nihil et sint lineam. voluptatibus quo voluptates hic aut temporibus quod omnis eligendi id, et optio, facere delectus, aut rerum tempore, Itaque recusandae ut Qua est a placeat, consequatur ut cum est, nobis aut sapiente reiciendis repellendus. autem aut officiis repellat cumque dolor repudiandae et debitis rerum non perferendis quibusdam earum minus omnis saepe asperiores assumenda necessitatibus doloribus impedit, maiores possimus,', '2018-08-25 18:38:27', 1, 2),
(138, 13, 17, 'Zadanie [XZYYZX]', 'nobis minus omnis est, temporibus rerum et voluptas quod officiis sint maiores necessitatibus Itaque tenetur repellat rerum sapiente ut perferendis aut est asperiores earum dolor libero non saepe lineam. quo optio, ut possimus, reiciendis molestiae aut nihil impedit, tempore, hic ad placeat, soluta cum maxime pondere voluptatibus eligendi aut id, et voluptates eveniet, a facere delectus, am Qua recusandae assumenda et debitis cumque consequatur omnis repudiandae quibusdam doloribus repellendus. alias aut autem', '2018-09-01 03:52:59', 3, 2),
(139, 14, 16, 'Zadanie [QYYQZZ]', 'nihil optio, saepe delectus, necessitatibus tenetur repudiandae ut aut id, perferendis non aut aut cumque et alias libero sint est, ut eligendi possimus, minus aut eveniet, a hic quod recusandae tempore, assumenda Itaque repellendus. debitis impedit, rerum et nobis am omnis officiis reiciendis maxime asperiores placeat, sapiente maiores dolor rerum molestiae quibusdam quo repellat temporibus doloribus pondere soluta ad autem earum consequatur voluptas et voluptates Qua omnis est voluptatibus lineam. cum facere', '2018-08-01 17:31:39', 2, 1),
(140, 14, 19, 'Zadanie [ZYQQZX]', 'voluptatibus soluta lineam. et aut cumque pondere aut ut quo Qua et perferendis rerum ut repellat a temporibus alias est eligendi eveniet, molestiae debitis dolor consequatur omnis delectus, reiciendis earum cum repellendus. et possimus, libero nobis tenetur maiores quod asperiores rerum non sapiente nihil quibusdam recusandae doloribus Itaque impedit, voluptas assumenda facere tempore, optio, id, aut placeat, aut saepe necessitatibus ad hic minus repudiandae maxime voluptates officiis omnis sint autem am est,', '2018-06-30 13:55:53', 4, 1),
(141, 14, 14, 'Zadanie [QQYYXZ]', 'et eligendi optio, est, repellat non cumque voluptas et am rerum necessitatibus minus voluptates rerum Qua quibusdam ad cum maxime a eveniet, debitis omnis temporibus nihil aut dolor omnis maiores voluptatibus Itaque delectus, alias molestiae pondere repudiandae possimus, impedit, facere quod assumenda perferendis recusandae sint quo doloribus nobis tenetur aut ut tempore, placeat, asperiores consequatur sapiente libero ut earum est hic id, aut lineam. officiis et aut saepe soluta reiciendis autem repellendus.', '2018-07-22 13:51:41', 2, 2),
(142, 14, 18, 'Zadanie [XXQYYZ]', 'ut rerum assumenda repellendus. voluptates impedit, ut aut id, aut autem nihil cumque ad Qua molestiae omnis non et alias libero quod voluptatibus quo rerum doloribus et minus asperiores recusandae pondere quibusdam hic perferendis tenetur aut cum aut eligendi eveniet, reiciendis consequatur soluta omnis est, est delectus, dolor facere maiores optio, voluptas necessitatibus sint am sapiente nobis debitis placeat, earum possimus, repudiandae maxime et lineam. a temporibus Itaque tempore, repellat officiis saepe', '2018-07-30 04:33:17', 1, 2),
(143, 14, 18, 'Zadanie [QXQYZQ]', 'consequatur recusandae dolor maiores voluptatibus earum est, omnis autem libero asperiores reiciendis et cum hic possimus, temporibus alias ut est ut pondere officiis a repellendus. impedit, assumenda rerum nobis voluptas debitis quibusdam omnis voluptates aut soluta et aut tempore, perferendis am et sapiente quo nihil optio, maxime eligendi repudiandae sint cumque rerum delectus, Itaque lineam. repellat ad aut minus placeat, quod tenetur Qua saepe necessitatibus eveniet, molestiae doloribus id, non facere aut', '2018-08-04 14:34:56', 1, 1),
(144, 14, 19, 'Zadanie [XYZXQY]', 'alias et debitis repudiandae rerum a nihil quo id, placeat, Itaque eveniet, officiis non libero voluptates tempore, et quibusdam sapiente am minus hic eligendi asperiores repellendus. recusandae aut impedit, soluta reiciendis est, molestiae doloribus voluptatibus facere perferendis maiores autem repellat sint earum ad nobis possimus, necessitatibus omnis est optio, saepe consequatur ut tenetur delectus, cum temporibus et aut omnis dolor assumenda lineam. cumque voluptas rerum ut quod aut pondere aut maxime Qua', '2018-09-24 03:57:35', 4, 1),
(145, 14, 17, 'Zadanie [XXQYXY]', 'alias Itaque necessitatibus non placeat, omnis recusandae molestiae aut delectus, asperiores nobis a maiores quibusdam cumque ad assumenda consequatur rerum eligendi repellat autem omnis libero ut ut soluta aut repudiandae quo hic facere sint am earum et temporibus et voluptates dolor perferendis eveniet, voluptatibus saepe reiciendis pondere cum sapiente maxime lineam. optio, debitis tempore, et possimus, repellendus. voluptas Qua quod id, aut aut est, est tenetur doloribus impedit, rerum officiis minus nihil', '2018-09-04 12:30:10', 2, 1),
(146, 14, 17, 'Zadanie [YZXYZY]', 'ad aut sint temporibus earum asperiores id, soluta omnis voluptates tempore, molestiae possimus, quibusdam nihil tenetur sapiente hic repudiandae debitis autem et pondere aut aut repellendus. reiciendis est maiores et libero non et consequatur omnis impedit, facere ut voluptatibus rerum repellat cum est, necessitatibus rerum nobis lineam. maxime voluptas minus dolor doloribus delectus, a aut optio, eveniet, eligendi am Itaque saepe recusandae cumque placeat, ut assumenda Qua officiis perferendis quod alias quo', '2018-08-26 03:35:52', 2, 1),
(147, 14, 16, 'Zadanie [YXXQZZ]', 'Qua a assumenda maxime impedit, non pondere aut doloribus delectus, et autem soluta et temporibus ut aut aut officiis repellat am minus repudiandae tenetur quod sint consequatur facere sapiente reiciendis hic voluptas nihil est libero cumque earum ad nobis est, ut rerum molestiae quo perferendis placeat, maiores alias possimus, asperiores quibusdam eveniet, tempore, voluptates saepe omnis dolor optio, rerum lineam. necessitatibus eligendi omnis cum voluptatibus debitis Itaque repellendus. recusandae aut et id,', '2018-09-09 08:45:44', 4, 1),
(148, 14, 15, 'Zadanie [ZYYQXX]', 'saepe voluptatibus assumenda voluptas nihil officiis minus soluta am est omnis lineam. rerum reiciendis perferendis eligendi optio, aut recusandae aut hic rerum est, maxime quo ad ut impedit, cumque earum nobis quod molestiae cum possimus, repellendus. tempore, omnis voluptates autem quibusdam tenetur a ut sapiente eveniet, dolor consequatur necessitatibus aut debitis repellat maiores repudiandae et facere aut doloribus pondere non Itaque alias sint temporibus asperiores id, et delectus, Qua placeat, et libero', '2018-08-10 04:55:52', 4, 1),
(149, 14, 19, 'Zadanie [QZQXYX]', 'impedit, doloribus maxime reiciendis lineam. et autem molestiae omnis officiis id, pondere voluptas ut dolor hic quo optio, rerum Itaque repellendus. tempore, libero asperiores voluptatibus facere maiores saepe ut rerum et recusandae aut temporibus est sapiente repellat sint nobis nihil assumenda Qua earum aut quibusdam possimus, delectus, perferendis necessitatibus debitis aut consequatur am aut est, a et cum soluta eligendi minus ad non repudiandae tenetur cumque eveniet, placeat, omnis voluptates quod alias', '2018-06-13 17:20:32', 2, 1),
(150, 14, 14, 'Zadanie [YXQYZY]', 'facere reiciendis repudiandae perferendis soluta omnis saepe autem pondere doloribus dolor non quibusdam aut voluptates minus tempore, impedit, lineam. et et eligendi tenetur placeat, quod Qua sint alias est nobis ad am officiis temporibus delectus, voluptas Itaque quo rerum assumenda sapiente repellendus. cumque est, hic et possimus, ut voluptatibus asperiores earum consequatur ut necessitatibus maiores debitis cum id, aut aut maxime aut optio, rerum eveniet, a nihil libero omnis recusandae molestiae repellat', '2018-08-30 02:15:39', 3, 2),
(151, 14, 17, 'Zadanie [QXYXZQ]', 'necessitatibus possimus, pondere omnis recusandae voluptates lineam. placeat, optio, est, voluptatibus reiciendis perferendis cum aut id, omnis tenetur minus hic saepe dolor impedit, tempore, Qua cumque non asperiores rerum ut molestiae et voluptas nobis sapiente am sint soluta aut aut aut rerum autem Itaque et temporibus doloribus quibusdam alias nihil consequatur est quod quo eligendi ad delectus, assumenda libero repellat eveniet, officiis ut maiores earum debitis repellendus. et facere a maxime repudiandae', '2018-06-27 07:10:56', 2, 1),
(152, 14, 15, 'Zadanie [ZYQQXX]', 'necessitatibus earum libero voluptates facere Qua eveniet, alias debitis voluptas cum sint repudiandae ut cumque delectus, temporibus doloribus impedit, repellendus. et id, saepe tempore, eligendi assumenda am officiis maiores nihil autem repellat quibusdam consequatur aut minus recusandae aut et ut dolor omnis optio, quod Itaque asperiores voluptatibus omnis nobis quo ad et rerum aut a molestiae possimus, sapiente est est, tenetur pondere soluta perferendis hic rerum non placeat, maxime aut lineam. reiciendis', '2018-08-19 09:14:47', 1, 1),
(153, 14, 19, 'Zadanie [YYXQZZ]', 'libero repellat placeat, soluta earum molestiae asperiores necessitatibus aut debitis voluptates repellendus. voluptatibus ad perferendis quod possimus, alias et hic non aut maiores lineam. cum Qua pondere sapiente quo am nihil voluptas maxime assumenda Itaque rerum dolor optio, autem minus officiis omnis sint consequatur quibusdam et est et repudiandae aut doloribus a saepe ut tenetur eligendi aut impedit, temporibus rerum eveniet, id, facere ut tempore, nobis est, cumque omnis delectus, recusandae reiciendis', '2018-08-23 18:32:14', 3, 1),
(154, 15, 14, 'Zadanie [XZYYYX]', 'repellat repudiandae eveniet, tempore, cumque maiores doloribus Itaque necessitatibus reiciendis asperiores quo aut tenetur omnis perferendis ut id, voluptas temporibus nobis aut recusandae voluptatibus et a nihil hic saepe rerum possimus, sint am et autem maxime optio, omnis pondere debitis ut est, aut facere ad impedit, soluta placeat, cum molestiae eligendi aut earum est et lineam. dolor assumenda voluptates alias libero rerum Qua consequatur delectus, non quod sapiente officiis minus quibusdam repellendus.', '2018-09-02 05:54:57', 2, 2),
(155, 15, 18, 'Zadanie [XZZXXQ]', 'repellat temporibus voluptatibus cum alias assumenda officiis repellendus. minus molestiae omnis eligendi sapiente ut reiciendis aut repudiandae et rerum omnis saepe lineam. rerum tempore, nobis quibusdam aut cumque sint consequatur perferendis asperiores quod est, quo dolor maiores libero possimus, Qua id, placeat, a hic am debitis optio, eveniet, est voluptas nihil et facere maxime non aut ad tenetur recusandae soluta et earum aut Itaque ut necessitatibus impedit, pondere delectus, voluptates doloribus autem', '2018-08-23 05:13:31', 1, 2),
(156, 15, 18, 'Zadanie [ZQYYXZ]', 'ad dolor non Qua rerum omnis eligendi consequatur ut sint earum doloribus est recusandae nihil pondere soluta aut tempore, Itaque nobis alias minus maiores molestiae debitis voluptatibus officiis repellendus. repellat quibusdam autem cum perferendis optio, aut maxime temporibus et assumenda omnis et rerum id, et placeat, hic saepe ut voluptates repudiandae sapiente tenetur possimus, quo lineam. eveniet, impedit, est, delectus, facere necessitatibus aut cumque asperiores a am libero aut quod reiciendis voluptas', '2018-08-07 10:48:33', 2, 2),
(157, 15, 19, 'Zadanie [ZYYQZX]', 'eveniet, tenetur perferendis nobis ut et recusandae molestiae asperiores minus aut omnis et ut et Qua quod necessitatibus lineam. debitis omnis libero impedit, delectus, aut aut doloribus id, Itaque am autem ad alias repudiandae rerum pondere repellendus. sint saepe aut cumque rerum cum assumenda facere repellat consequatur sapiente voluptas eligendi quibusdam hic voluptatibus optio, maxime soluta maiores tempore, earum temporibus officiis est, nihil non reiciendis est a placeat, dolor voluptates possimus, quo', '2018-07-03 16:26:20', 1, 2),
(158, 15, 16, 'Zadanie [QZXYZZ]', 'temporibus maiores soluta pondere lineam. aut voluptates Qua repellendus. cum minus officiis repellat necessitatibus libero et a quod maxime tempore, quibusdam assumenda voluptas voluptatibus sapiente sint am doloribus consequatur aut debitis facere cumque dolor autem eveniet, nihil recusandae non ad tenetur ut reiciendis ut rerum molestiae omnis est, et asperiores est nobis possimus, aut impedit, Itaque aut placeat, omnis hic eligendi alias optio, et saepe delectus, perferendis rerum id, earum quo repudiandae', '2018-09-04 12:21:55', 1, 1),
(159, 15, 18, 'Zadanie [XQYZYY]', 'lineam. dolor repellat eligendi necessitatibus repellendus. possimus, placeat, et saepe voluptas delectus, voluptatibus omnis omnis rerum sapiente non id, maxime maiores ut earum facere nobis asperiores minus ad et reiciendis sint quo tempore, et rerum molestiae est impedit, quod debitis aut a pondere consequatur voluptates Qua aut assumenda libero hic temporibus perferendis aut am cum recusandae nihil tenetur doloribus est, autem quibusdam aut repudiandae officiis optio, Itaque alias cumque ut soluta eveniet,', '2018-08-30 18:33:29', 4, 1),
(160, 15, 14, 'Zadanie [XYQZZX]', 'est, et voluptas doloribus tempore, omnis eveniet, nobis tenetur quibusdam aut optio, cum recusandae aut quo soluta earum non ut nihil Qua omnis et ut a necessitatibus repellat autem sint aut rerum molestiae repellendus. id, eligendi impedit, officiis voluptates facere rerum libero maiores alias asperiores repudiandae delectus, est quod saepe assumenda maxime hic aut reiciendis possimus, perferendis consequatur debitis Itaque placeat, lineam. et sapiente dolor pondere minus temporibus am cumque voluptatibus ad', '2018-07-02 16:43:12', 4, 1),
(161, 15, 19, 'Zadanie [YQXZZX]', 'voluptates minus omnis nihil sapiente id, lineam. maxime ad am rerum aut maiores et tempore, temporibus aut pondere doloribus omnis earum repellendus. impedit, repellat et aut quibusdam asperiores ut placeat, facere necessitatibus repudiandae reiciendis saepe rerum Qua recusandae quod cum libero voluptatibus officiis optio, Itaque non consequatur debitis nobis autem dolor hic delectus, voluptas sint possimus, eveniet, assumenda eligendi alias a cumque est, perferendis aut ut soluta quo tenetur molestiae est et', '2018-06-20 16:16:34', 2, 1),
(162, 15, 14, 'Zadanie [XZXQQY]', 'necessitatibus eligendi voluptatibus Qua non alias rerum hic dolor perferendis tenetur est et impedit, recusandae placeat, am et id, consequatur asperiores possimus, ad quo repellendus. maiores Itaque temporibus earum delectus, et sapiente reiciendis cumque aut aut repellat molestiae aut minus maxime a nihil cum lineam. doloribus omnis facere eveniet, assumenda voluptates pondere rerum nobis saepe omnis est, quod ut voluptas officiis repudiandae tempore, soluta debitis ut optio, sint autem aut libero quibusdam', '2018-06-21 03:49:34', 3, 1),
(163, 16, 17, 'Zadanie [ZYQQXZ]', 'ut placeat, perferendis am possimus, necessitatibus aut quod impedit, sapiente non tenetur lineam. repudiandae delectus, et minus est, ad voluptas maxime soluta eligendi reiciendis omnis cum repellendus. earum maiores quibusdam sint omnis dolor est a consequatur id, autem rerum cumque aut voluptatibus Itaque saepe libero nobis rerum alias Qua molestiae repellat voluptates quo officiis asperiores recusandae ut eveniet, debitis doloribus temporibus optio, et facere pondere nihil aut et assumenda tempore, hic aut', '2018-06-27 12:30:48', 2, 2),
(164, 16, 16, 'Zadanie [QQYQXX]', 'nihil repellat libero ad saepe asperiores minus maiores est, Qua assumenda earum dolor quibusdam possimus, a delectus, recusandae alias hic repudiandae et aut tenetur cumque sint am soluta omnis placeat, omnis voluptas perferendis molestiae temporibus maxime cum debitis doloribus quo optio, et aut aut eveniet, quod sapiente consequatur non reiciendis lineam. nobis necessitatibus voluptates officiis id, aut et repellendus. facere autem rerum eligendi pondere tempore, rerum impedit, ut Itaque est voluptatibus ut', '2018-09-03 03:21:40', 2, 2),
(165, 16, 18, 'Zadanie [QZYQZX]', 'et alias aut eligendi sint eveniet, molestiae a aut soluta assumenda earum impedit, optio, maiores aut dolor ut asperiores aut delectus, perferendis repellendus. cumque voluptatibus officiis voluptas doloribus non recusandae consequatur maxime minus rerum hic lineam. temporibus placeat, sapiente voluptates et Itaque reiciendis nobis libero omnis necessitatibus est, cum est nihil ad omnis et tempore, ut id, facere tenetur repudiandae saepe repellat autem Qua rerum quibusdam debitis possimus, pondere quod am quo', '2018-06-28 18:50:54', 4, 2),
(166, 16, 14, 'Zadanie [ZZXXZZ]', 'debitis et temporibus sapiente cum libero rerum aut a tenetur aut optio, cumque alias molestiae necessitatibus officiis maiores delectus, quod consequatur est, repellendus. perferendis ut eligendi eveniet, Qua repudiandae minus lineam. assumenda Itaque am earum aut saepe est omnis ut ad hic et rerum autem dolor non et reiciendis repellat impedit, aut possimus, sint soluta id, voluptatibus nobis tempore, omnis placeat, doloribus recusandae pondere nihil voluptates quibusdam voluptas quo facere maxime asperiores', '2018-07-08 12:55:36', 3, 2),
(167, 16, 19, 'Zadanie [ZQXQQZ]', 'voluptas est et asperiores autem tenetur omnis facere consequatur earum maiores et molestiae alias maxime ut hic Qua impedit, reiciendis repellendus. minus eligendi saepe sint aut temporibus debitis quibusdam dolor aut tempore, quod voluptates pondere et doloribus delectus, nihil lineam. nobis omnis eveniet, rerum cum libero rerum perferendis recusandae voluptatibus aut repudiandae id, Itaque a optio, ut aut assumenda placeat, cumque quo possimus, sapiente ad officiis est, repellat soluta necessitatibus non am', '2018-06-20 01:49:56', 3, 2),
(168, 16, 19, 'Zadanie [XZQXZY]', 'hic voluptatibus asperiores pondere quo sapiente eligendi ut maxime temporibus sint rerum est, voluptas repellat doloribus dolor libero id, et placeat, autem Itaque saepe alias ut optio, omnis perferendis impedit, a omnis est rerum officiis aut nobis maiores am minus non et quibusdam eveniet, delectus, tenetur voluptates aut necessitatibus ad aut cum repudiandae earum assumenda cumque molestiae aut quod lineam. consequatur facere debitis repellendus. Qua reiciendis nihil tempore, soluta recusandae et possimus,', '2018-08-13 01:44:44', 4, 2),
(169, 16, 16, 'Zadanie [XYQXXY]', 'dolor Itaque rerum quo id, delectus, debitis sint voluptates ut pondere omnis eligendi doloribus aut voluptas lineam. est, temporibus eveniet, officiis asperiores maiores voluptatibus Qua necessitatibus et aut tempore, assumenda optio, est reiciendis consequatur soluta earum repellat molestiae aut maxime omnis hic autem facere tenetur nihil non recusandae cum nobis libero ut sapiente minus impedit, placeat, et et am saepe cumque a repellendus. aut alias rerum perferendis possimus, quibusdam repudiandae ad quod', '2018-06-10 02:37:15', 1, 2),
(170, 16, 15, 'Zadanie [ZYYZZZ]', 'temporibus tenetur quod ut voluptatibus Itaque impedit, maxime sapiente delectus, ad perferendis reiciendis tempore, molestiae repudiandae a recusandae repellendus. omnis eveniet, optio, sint pondere quibusdam cumque assumenda minus non et hic possimus, aut cum voluptas autem consequatur asperiores quo debitis id, rerum earum nihil alias aut est dolor nobis et aut soluta am lineam. officiis est, facere placeat, voluptates et libero doloribus omnis necessitatibus eligendi saepe ut rerum maiores repellat aut Qua', '2018-09-04 00:32:44', 4, 1),
(171, 16, 15, 'Zadanie [ZYYYZY]', 'tenetur eligendi repudiandae possimus, autem voluptatibus minus consequatur sint a aut non necessitatibus rerum libero eveniet, debitis quo aut est, sapiente officiis maxime Itaque delectus, repellat voluptates ut facere est lineam. optio, et hic Qua assumenda perferendis ad omnis soluta tempore, maiores earum asperiores repellendus. voluptas et aut recusandae cum pondere rerum impedit, nihil saepe placeat, temporibus nobis ut et aut molestiae quod dolor omnis doloribus cumque reiciendis id, alias am quibusdam', '2018-07-05 10:15:13', 1, 1),
(172, 16, 14, 'Zadanie [QZQXQY]', 'libero voluptas lineam. asperiores aut aut saepe impedit, am repudiandae alias a delectus, et repellat voluptatibus maxime earum recusandae sapiente nobis optio, ad sint Itaque omnis voluptates perferendis soluta pondere ut reiciendis ut placeat, repellendus. consequatur est, quibusdam Qua rerum officiis est maiores non doloribus et aut necessitatibus nihil dolor eveniet, rerum autem aut quod et cumque tenetur minus id, tempore, omnis cum facere eligendi possimus, temporibus quo molestiae assumenda hic debitis', '2018-06-23 02:49:19', 4, 1),
(173, 16, 19, 'Zadanie [YYZXZX]', 'molestiae dolor hic voluptates delectus, doloribus autem possimus, omnis et saepe maxime ut voluptatibus aut cumque nihil sapiente perferendis quod facere eveniet, aut tempore, tenetur reiciendis necessitatibus recusandae omnis voluptas repudiandae asperiores cum ad aut a est officiis libero am eligendi non optio, repellendus. quibusdam nobis lineam. et impedit, minus placeat, consequatur aut alias earum pondere assumenda Qua ut temporibus soluta Itaque sint debitis repellat rerum quo maiores rerum id, est, et', '2018-07-29 16:42:50', 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `worker`
--

CREATE TABLE `worker` (
  `wo_id` int(11) NOT NULL,
  `wo_first_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wo_last_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wo_email` varchar(126) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `worker`
--

INSERT INTO `worker` (`wo_id`, `wo_first_name`, `wo_last_name`, `wo_email`) VALUES
(13, 'Agnieszka', 'Wasilek', 'agnieszka.wasilek@wasilek.pl'),
(14, 'Krzysztof', 'Bielawka', 'krzysztof.bielawka@bielawka.pl'),
(15, 'Krzysztof', 'Zduńsk', 'krzysztof.zduńsk@zdunsk.pl'),
(16, 'Marika', 'Sobiszyn', 'marika.sobiszyn@sobiszyn.pl'),
(17, 'Dariusz', 'Sobiszyn', 'dariusz.sobiszyn@sobiszyn.pl'),
(18, 'Dariusz', 'Bielawka', 'dariusz.bielawka@bielawka.pl'),
(19, 'Krzysztof', 'Zduńsk', 'krzysztof.zduńsk@zdunsk.pl');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cu_id`);

--
-- Indeksy dla tabeli `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pr_id`),
  ADD KEY `project_customer_cu_id_fk` (`customer_cu_id`);

--
-- Indeksy dla tabeli `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`ta_id`),
  ADD KEY `task_project_pr_id_fk` (`project_pr_id`),
  ADD KEY `task_worker_wo_id_fk` (`worker_wo_id`);

--
-- Indeksy dla tabeli `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`wo_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `customer`
--
ALTER TABLE `customer`
  MODIFY `cu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `project`
--
ALTER TABLE `project`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `task`
--
ALTER TABLE `task`
  MODIFY `ta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT dla tabeli `worker`
--
ALTER TABLE `worker`
  MODIFY `wo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `FK_2FB3D0EE1364C337` FOREIGN KEY (`customer_cu_id`) REFERENCES `customer` (`cu_id`);

--
-- Ograniczenia dla tabeli `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FK_527EDB256B329461` FOREIGN KEY (`worker_wo_id`) REFERENCES `worker` (`wo_id`),
  ADD CONSTRAINT `FK_527EDB2574936A79` FOREIGN KEY (`project_pr_id`) REFERENCES `project` (`pr_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
