-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: market_place
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~focal-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `TB_ALGORITHM`
--

DROP TABLE IF EXISTS `TB_ALGORITHM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_ALGORITHM` (
                                `ALGORITHM_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '알고리즘 아이디',
                                `TITLE` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '알고리즘 이름',
                                `CONTENTS` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '알고리즘 설명 ',
                                `DEFAULT_TRAIN_PARAM` longtext CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '기본 학습 파라미터 정보 ',
                                `DEFAULT_INFERENCE_PARAM` longtext CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '기본 추론 파라미터 정보',
                                `BASE_IMAGE_NAME` varchar(300) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '도커 이미지명 ',
                                `LABEL_TYPE` char(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '라벨타입 (B, G, V)',
                                `USE_STATUS` char(1) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '사용중:U 삭제:D 홀딩:H 불용:N ',
                                `FIRST_INS_ACCOUNT` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '최초입력사용자계정',
                                `FIRST_INS_DTM` datetime DEFAULT NULL COMMENT '최초입력일시',
                                `LAST_UPD_ACCOUNT` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '마지막수정사용자계정',
                                `LAST_UPD_DTM` datetime DEFAULT NULL COMMENT '마지막수정일시',
                                PRIMARY KEY (`ALGORITHM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_ALGORITHM`
--

LOCK TABLES `TB_ALGORITHM` WRITE;
/*!40000 ALTER TABLE `TB_ALGORITHM` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_ALGORITHM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_AUTO_LABEL`
--

DROP TABLE IF EXISTS `TB_AUTO_LABEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_AUTO_LABEL` (
                                 `AUTO_LABEL_ID` int(11) NOT NULL AUTO_INCREMENT,
                                 `DATASET_ID` int(11) DEFAULT NULL,
                                 `DATA_ID` int(11) DEFAULT NULL,
                                 `AUTO_LABEL_STATUS` varchar(10) NOT NULL COMMENT '오토 라벨링 상태 (start, end, error)',
                                 `FIRST_INS_DTM` varchar(20) DEFAULT NULL,
                                 PRIMARY KEY (`AUTO_LABEL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_AUTO_LABEL`
--

LOCK TABLES `TB_AUTO_LABEL` WRITE;
/*!40000 ALTER TABLE `TB_AUTO_LABEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_AUTO_LABEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_AUTO_LABEL_LOG`
--

DROP TABLE IF EXISTS `TB_AUTO_LABEL_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_AUTO_LABEL_LOG` (
                                     `AUTO_LABEL_LOG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '테이블 pk',
                                     `DATASET_ID` int(11) DEFAULT NULL,
                                     `DATA_ID` int(11) DEFAULT NULL COMMENT 'auto labeling 대상 데이터셋 아이디',
                                     `AUTO_LABEL_LOG_MSG` varchar(4000) DEFAULT NULL COMMENT 'auto labeling 로그 내용',
                                     `AUTO_LABEL_LOG_TIME` varchar(100) DEFAULT NULL,
                                     `FIRST_INS_DTM` varchar(20) DEFAULT NULL,
                                     PRIMARY KEY (`AUTO_LABEL_LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_AUTO_LABEL_LOG`
--

LOCK TABLES `TB_AUTO_LABEL_LOG` WRITE;
/*!40000 ALTER TABLE `TB_AUTO_LABEL_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_AUTO_LABEL_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_AUTO_LABEL_META`
--

DROP TABLE IF EXISTS `TB_AUTO_LABEL_META`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_AUTO_LABEL_META` (
                                      `AUTO_LABEL_META_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '오토 라벨링 메타 아이디',
                                      `AUTO_LABEL_DATA_ID` int(11) NOT NULL COMMENT '데이터 아이디',
                                      `ANNOTATION` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '좌표값',
                                      `LABEL_TYPE` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '라벨타입 BBOX:B    POLYGON:G   POLYLINE:L',
                                      `ALGORITHM_ID` int(11) NOT NULL,
                                      `ALGORITHM_LABEL_DETECT_ID` int(11) DEFAULT NULL COMMENT '알고리즘 라벨 아이디',
                                      `AUTO_LABEL_CONFIRM` char(1) NOT NULL DEFAULT 'N' COMMENT '오토 라벨링 데이터 수정 유무',
                                      `USE_STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'U',
                                      `FIRST_INS_ACCOUNT` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                      `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                      `LAST_UPD_ACCOUNT` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                      `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                      PRIMARY KEY (`AUTO_LABEL_META_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_AUTO_LABEL_META`
--

LOCK TABLES `TB_AUTO_LABEL_META` WRITE;
/*!40000 ALTER TABLE `TB_AUTO_LABEL_META` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_AUTO_LABEL_META` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_BATCH`
--

DROP TABLE IF EXISTS `TB_BATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_BATCH` (
                            `BATCH_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '배치ID',
                            `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트 ID',
                            `FUNCTION_TYPE` varchar(10) NOT NULL COMMENT '배분(DISTRIBUTION), 회수(RECOVERY), 검수(INSPECTION), 반려(REJECTION)',
                            `WORK_TYPE` varchar(20) NOT NULL COMMENT '작업자(WORKER), 1차검수자(INSPECTOR1), 2차검수자(INSPECTOR2)',
                            `DISTRIB_QUANTITY` int(11) NOT NULL COMMENT '배분수량',
                            `RUN_TIME` int(2) NOT NULL COMMENT '실행 시간 ',
                            `USE_YN` char(1) NOT NULL COMMENT '사용 유무',
                            `ETC` varchar(2000) DEFAULT NULL COMMENT '기타 설명',
                            `FIRST_INS_ACCOUNT` varchar(20) NOT NULL,
                            `LAST_UPD_ACCOUNT` varchar(20) NOT NULL,
                            `LAST_UPD_DTM` datetime DEFAULT NULL,
                            `FIRST_INS_DTM` datetime DEFAULT NULL,
                            PRIMARY KEY (`BATCH_ID`),
                            KEY `TB_BATCH_USE_YN_IDX` (`USE_YN`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_BATCH`
--

LOCK TABLES `TB_BATCH` WRITE;
/*!40000 ALTER TABLE `TB_BATCH` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_BATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_BATCH_LOG`
--

DROP TABLE IF EXISTS `TB_BATCH_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_BATCH_LOG` (
                                `BATCH_LOG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '배치 로그 ID',
                                `BATCH_ID` int(11) DEFAULT NULL COMMENT '배치 ID',
                                `MSG` varchar(4000) NOT NULL COMMENT '배치 로그 메시지',
                                `FIRST_INS_DTM` varchar(20) NOT NULL COMMENT '등록일자',
                                PRIMARY KEY (`BATCH_LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26929 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_BATCH_LOG`
--

LOCK TABLES `TB_BATCH_LOG` WRITE;
/*!40000 ALTER TABLE `TB_BATCH_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_BATCH_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_BLUR_META`
--

DROP TABLE IF EXISTS `TB_BLUR_META`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_BLUR_META` (
                                `BLUR_META_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '메타 아이디',
                                `DATA_ID` int(11) NOT NULL COMMENT '데이터 아이디',
                                `ANNOTATION` longtext COLLATE utf8_bin NOT NULL COMMENT '좌표값',
                                `BLUR_TYPE` char(1) COLLATE utf8_bin NOT NULL COMMENT '블러 유형 F : face, L : license plate',
                                `SHAPE_TYPE` char(1) COLLATE utf8_bin NOT NULL COMMENT '라벨 유형 C : circle R : rectangle',
                                `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U',
                                `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                PRIMARY KEY (`BLUR_META_ID`),
                                KEY `TB_META_IDX1` (`DATA_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8961 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_BLUR_META`
--

LOCK TABLES `TB_BLUR_META` WRITE;
/*!40000 ALTER TABLE `TB_BLUR_META` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_BLUR_META` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_BOARD`
--

DROP TABLE IF EXISTS `TB_BOARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_BOARD` (
                            `BOARD_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시판 아이디',
                            `BOARD_TYPE` varchar(30) CHARACTER SET utf8mb4 NOT NULL COMMENT '게시판 종류 자주묻는질문 : FAQ  / 문의사항 : QUESTION / 공지사항 NOTICE',
                            `TITLE` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT '게시글 제목',
                            `CONTENTS` text CHARACTER SET utf8mb4 NOT NULL COMMENT '게시글 내용',
                            `READ_COUNT` int(11) NOT NULL DEFAULT 0 COMMENT '게시글 읽은 건수',
                            `TAG` varchar(30) CHARACTER SET utf8mb4 NOT NULL COMMENT '태그 종류 저작도구 : AUTHORING / 가이드라인 : GUIDELINE /  정산 : CALCULATE / 기타 : ETC',
                            `PROJECT_ID` int(11) DEFAULT NULL COMMENT '프로젝트 아이디 / 대상이 전체일 경우 0',
                            `WRITER_ACCOUNT` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '작성자 계정',
                            `WRITE_DTM` datetime NOT NULL DEFAULT current_timestamp() COMMENT '작성 일자',
                            `POPUP_YN` char(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'N' COMMENT '팝업 사용 유무 사용 : Y 미 사용 : N',
                            `POPUP_START_DTM` datetime DEFAULT NULL COMMENT '팝업 시작 일자',
                            `POPUP_END_DTM` datetime DEFAULT NULL COMMENT '팝업 종료 일자',
                            `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                            `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                            `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                            `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                            `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                            PRIMARY KEY (`BOARD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_BOARD`
--

LOCK TABLES `TB_BOARD` WRITE;
/*!40000 ALTER TABLE `TB_BOARD` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_BOARD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_BOARD_ATTACH_FILE`
--

DROP TABLE IF EXISTS `TB_BOARD_ATTACH_FILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_BOARD_ATTACH_FILE` (
                                        `ATTACH_FILE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '첨부파일 아이디',
                                        `BOARD_ID` int(11) NOT NULL COMMENT '게시판 아이디',
                                        `ORIGIN_FILENAME` varchar(200) NOT NULL COMMENT '원본 파일 이름',
                                        `SAVE_FILENAME` varchar(200) NOT NULL COMMENT '저장된 파일 이름',
                                        `SAVE_PATH` varchar(300) NOT NULL COMMENT '파일 저장 위치',
                                        `DATA_SIZE` int(11) NOT NULL COMMENT '파일 용량(바이트)',
                                        `FILE_EXTENSION` varchar(50) DEFAULT NULL COMMENT '파일 확장자',
                                        `USE_STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                                        `FIRST_INS_ACCOUNT` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                        `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                        `LAST_UPD_ACCOUNT` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                        `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                        PRIMARY KEY (`ATTACH_FILE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_BOARD_ATTACH_FILE`
--

LOCK TABLES `TB_BOARD_ATTACH_FILE` WRITE;
/*!40000 ALTER TABLE `TB_BOARD_ATTACH_FILE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_BOARD_ATTACH_FILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_BOARD_READ`
--

DROP TABLE IF EXISTS `TB_BOARD_READ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_BOARD_READ` (
                                 `USER_ACCOUNT` varchar(50) NOT NULL COMMENT '사용자 계정',
                                 `BOARD_ID` int(11) NOT NULL COMMENT '게시판 아이디',
                                 `USE_STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                                 `FIRST_INS_ACCOUNT` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                 `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                 `LAST_UPD_ACCOUNT` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                 `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_BOARD_READ`
--

LOCK TABLES `TB_BOARD_READ` WRITE;
/*!40000 ALTER TABLE `TB_BOARD_READ` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_BOARD_READ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_BUSINESS_INCOME`
--

DROP TABLE IF EXISTS `TB_BUSINESS_INCOME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_BUSINESS_INCOME` (
                                      `PROJECT_ID` int(11) NOT NULL COMMENT '사업소득ID',
                                      `PAYMENTS_STANDARD` char(1) NOT NULL COMMENT '지급기준 (이미지 : I, 라벨 : L)',
                                      `IMAGE_AMOUNT` varchar(50) DEFAULT NULL COMMENT '이미지 단가',
                                      `BBOX_AMOUNT` varchar(50) DEFAULT NULL COMMENT '바운딩 박스 단가',
                                      `POLYGON_AMOUNT` varchar(50) DEFAULT NULL COMMENT '폴리곤 단가',
                                      `POLYLINE_AMOUNT` varchar(50) DEFAULT NULL COMMENT '폴리라인 단가',
                                      `PAYMENT_DATE` int(11) NOT NULL COMMENT '급여지급일',
                                      `FIRST_INS_ACCOUNT` varchar(50) DEFAULT NULL COMMENT '최초입력사용자계정',
                                      `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                      `LAST_UPD_ACCOUNT` varchar(50) DEFAULT NULL COMMENT '마지막수정사용자계정',
                                      `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                      PRIMARY KEY (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='(급여)사업소득 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_BUSINESS_INCOME`
--

LOCK TABLES `TB_BUSINESS_INCOME` WRITE;
/*!40000 ALTER TABLE `TB_BUSINESS_INCOME` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_BUSINESS_INCOME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_COMMON_CODE`
--

DROP TABLE IF EXISTS `TB_COMMON_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_COMMON_CODE` (
                                  `FIELD_NAME` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '필드명',
                                  `COMMON_CODE` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '필드에 속한 코드 ',
                                  `CODE_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '코드명 ',
                                  `USE_YN` char(1) COLLATE utf8_bin DEFAULT 'Y' COMMENT '사용유무 ',
                                  `DISPLAY_ORDER` int(3) DEFAULT NULL,
                                  `CODE_DESC` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '코드 설명',
                                  `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                  `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                  `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                  `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                  PRIMARY KEY (`FIELD_NAME`,`COMMON_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_COMMON_CODE`
--

LOCK TABLES `TB_COMMON_CODE` WRITE;
/*!40000 ALTER TABLE `TB_COMMON_CODE` DISABLE KEYS */;
INSERT INTO `TB_COMMON_CODE` VALUES ('DATA_TYPE','I','IMAGE','Y',1,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('DATA_TYPE','V','VIDEO','Y',2,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('LABEL_TYPE','B','BBOX','Y',1,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('LABEL_TYPE','G','POLYGON','Y',2,NULL,'ADMIN','2022-05-11 18:43:01','ADMIN','2022-05-11 18:43:01'),('LABEL_TYPE','L','POLYLINE','Y',3,NULL,'ADMIN','2022-05-11 18:43:01','ADMIN','2022-05-11 18:43:01'),('LABEL_TYPE','M','MASK','Y',4,'mask segmentation type','ADMIN','2023-04-13 14:00:00','ADMIN','2023-04-13 14:00:00'),('LABEL_TYPE','S','SKELETON','Y',5,'skeleton','ADMIN','2023-07-06 16:00:00','ADMIN','2023-04-13 14:00:00'),('PAYMENTS_STANDARD','I','IMAGE','Y',1,'급여테이블 지급기준','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('PAYMENTS_STANDARD','L','LABEL','Y',2,'급여테이블 지급기준','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('REJECT_CODE','001','위치가 불명확함','Y',1,NULL,'ADMIN','2022-05-11 18:43:01','ADMIN','2022-05-11 18:43:01'),('REJECT_CODE','002','라벨명이 잘못됨','Y',2,NULL,'ADMIN','2022-05-11 18:43:01','ADMIN','2022-05-11 18:43:01'),('REJECT_CODE','003','세그멘테이션 오태깅','Y',3,NULL,'ADMIN','2022-05-11 18:43:01','ADMIN','2022-05-11 18:43:01'),('REJECT_CODE','004','추가 라벨명 처리 필요 ','Y',4,NULL,'ADMIN','2022-05-11 18:43:01','ADMIN','2022-05-11 18:43:01'),('REJECT_CODE','005','시스템 반려','Y',5,'시스템 반려(일괄 반려처리 시 활용)','ADMIN','2022-05-11 18:43:01','ADMIN','2022-05-11 18:43:01'),('REQUEST_TYPE','A','(검수)요청','Y',2,'REQUEST PARAMETER 검수요청','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('REQUEST_TYPE','C','(검수요청)취소','Y',5,'REQUEST PARAMETER 작업자의 검수요청 취소','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('REQUEST_TYPE','D','배분','Y',7,'REQUEST PARAMETER 배분(데이터관리페이지)','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('REQUEST_TYPE','I','(완료)검수','Y',3,'REQUEST PARAMETER 검수완료','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('REQUEST_TYPE','R','반려','Y',4,'REQUEST PARAMETER 반려','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('REQUEST_TYPE','RC','회수','Y',8,'REQUEST PARAMETER 회수(데이터관리페이지)','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('REQUEST_TYPE','S','(임시)저장','Y',1,'REQUEST PARAMETER 임시저장','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('REQUEST_TYPE','U','데이터 업로드','Y',6,'REQUEST PARAMETER 데이터 업로드','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('UPLOAD_STATUS','F','실패','Y',3,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('UPLOAD_STATUS','S','성공','Y',1,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('UPLOAD_STATUS','W','진행중','Y',2,'파일업로드 진행 시 \'진행중\'이라는 단계가 필요','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('USE_STATUS','D','삭제','Y',2,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('USE_STATUS','H','홀딩','Y',3,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('USE_STATUS','N','불용','Y',4,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('USE_STATUS','U','사용','Y',1,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_ROLE','I1','INSPECTOR 1','Y',3,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_ROLE','I2','INSPECTOR 2','Y',4,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_ROLE','M','MANAGER','Y',1,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_ROLE','V','VIEWER','Y',5,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_ROLE','W','WORKER','Y',2,NULL,'ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_STATUS','A1','1차검수자할당','Y',4,'1차검수자할당시','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_STATUS','A2','2차검수자할당','Y',5,'2차검수자할당시','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_STATUS','AW','작업중','Y',2,'작업자 할당시','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_STATUS','C1','1차검수완료','Y',6,'1차검수완료시','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_STATUS','C2','2차검수완료','Y',7,'2차검수완료시','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_STATUS','IR','검수요청','Y',3,'검수요청시','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_STATUS','R1','1차반려','Y',11,'1차검수반려시','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_STATUS','R2','2차반려','Y',12,'2차검수반려시','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_STATUS','RE','대기','Y',1,'데이터 업로드시','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_STATUS','S','저장','Y',13,'저장 시','ADMIN','2023-03-16 09:58:36','ADMIN','2023-03-16 09:58:36'),('WORK_STATUS','W1','1차검수자회수','Y',10,'1차검수자회수시','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_STATUS','W2','2차검수자회수','Y',9,'2차검수자회수시','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00'),('WORK_STATUS','WD','작업자회수','Y',8,'작업자대상 회수시','ADMIN','2022-05-11 18:43:00','ADMIN','2022-05-11 18:43:00');
/*!40000 ALTER TABLE `TB_COMMON_CODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_DAILY_PROGRESS_STATISTICS`
--

DROP TABLE IF EXISTS `TB_DAILY_PROGRESS_STATISTICS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_DAILY_PROGRESS_STATISTICS` (
                                                `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트 아이디',
                                                `USER_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '사용자계정',
                                                `WORK_ROLE` char(2) COLLATE utf8_bin NOT NULL,
                                                `ACT_DT` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '기준일자',
                                                `REQUEST_INSPECT_CNT` int(11) DEFAULT 0 COMMENT '검수요청 수량',
                                                `1ST_INSPECT_CNT` int(11) DEFAULT 0 COMMENT '1차검수된 수량',
                                                `2ND_INSPECT_CNT` int(11) DEFAULT 0 COMMENT '2차검수된 수량',
                                                `1ST_REJECT_CNT` int(11) DEFAULT 0 COMMENT '1차 반려수량',
                                                `2ND_REJECT_CNT` int(11) DEFAULT 0 COMMENT '2차 반려수량',
                                                `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                                `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                                `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                                `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                                PRIMARY KEY (`PROJECT_ID`,`USER_ACCOUNT`,`WORK_ROLE`,`ACT_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_DAILY_PROGRESS_STATISTICS`
--

LOCK TABLES `TB_DAILY_PROGRESS_STATISTICS` WRITE;
/*!40000 ALTER TABLE `TB_DAILY_PROGRESS_STATISTICS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_DAILY_PROGRESS_STATISTICS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_DATA`
--

DROP TABLE IF EXISTS `TB_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_DATA` (
                           `DATA_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '데이터 아이디',
                           `DATASET_ID` int(11) NOT NULL COMMENT '데이터셋 아이디',
                           `SAVE_PATH` varchar(300) COLLATE utf8_bin NOT NULL COMMENT '데이터파일 저장위치 /기준폴더/프로젝트ID/데이터셋ID/업로드일자',
                           `SAVE_FILENAME` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '저장된파일이름',
                           `ORIGIN_FILENAME` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '원본파일이름',
                           `DATA_SIZE` int(11) NOT NULL COMMENT '파일용량(바이트)',
                           `WIDTH` int(11) NOT NULL COMMENT '데이터 가로사이즈',
                           `HEIGHT` int(11) NOT NULL COMMENT '데이터 세로사이즈',
                           `FPS` double DEFAULT NULL COMMENT 'frame per seconds',
                           `FRAME` int(11) DEFAULT NULL COMMENT '프레임 수',
                           `DURATION` double DEFAULT NULL COMMENT '영상 길이',
                           `DATA_TYPE` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'I' COMMENT 'IMAGE:I VIDEO:V',
                           `DE_ID_COMPLETE_YN` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '비식별화처리여부(Y/N)',
                           `WORKER_ACCOUNT` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '작업자 계정',
                           `ASSIGN_WORKER_DT` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '작업자할당일',
                           `REQUEST_INSPECT_DT` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '검수요청일',
                           `1ST_INSPECT_ACCOUNT` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '검수자',
                           `ASSIGN_1ST_INSPECT_DT` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '검수할당일',
                           `COMPLETE_1ST_INSPECT_DT` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '검수처리일',
                           `1ST_REJECT_DT` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '반려일자',
                           `1ST_REJECT_MEMO` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '반려메모',
                           `2ND_INSPECT_ACCOUNT` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '검수자',
                           `ASSIGN_2ND_INSPECT_DT` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '검수할당일',
                           `COMPLETE_2ND_INSPECT_DT` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '2차검수처리일',
                           `2ND_REJECT_DT` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '반려일자',
                           `2ND_REJECT_MEMO` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '반려메모',
                           `REJECT_COUNT` int(5) DEFAULT 0,
                           `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                           `WORK_STATUS` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '대기:RE, 작업중(작업자할당):WK, 검수요청:IR, 1차검수완료(C1), 2차검수완료(C2),1차반려(R1),2차반려(R2)',
                           `DATA_UPLOAD_ID` int(11) NOT NULL COMMENT '데이터 업로드 이력 아이디',
                           `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                           `FIRST_INS_DTM` datetime NOT NULL DEFAULT current_timestamp() COMMENT '최초입력일시',
                           `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                           `LAST_UPD_DTM` datetime NOT NULL DEFAULT current_timestamp() COMMENT '마지막수정일시',
                           PRIMARY KEY (`DATA_ID`),
                           KEY `TB_DATA_DATASET_ID_IDX` (`DATASET_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2835 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_DATA`
--

LOCK TABLES `TB_DATA` WRITE;
/*!40000 ALTER TABLE `TB_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_DATASET`
--

DROP TABLE IF EXISTS `TB_DATASET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_DATASET` (
                              `DATASET_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '데이터셋 아이디',
                              `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트 아이디',
                              `LABELSET_ID` int(11) NOT NULL COMMENT '라벨셋 아이디',
                              `DATASET_NAME` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '이름',
                              `DATASET_DESC` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '설명',
                              `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H',
                              `DATA_TYPE` char(1) COLLATE utf8_bin NOT NULL COMMENT 'IMAGE:I VIDEO:V',
                              `AUTO_DISTRIBUTION_YN` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '자동분배여부(Y/N)',
                              `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                              `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                              `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                              `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                              PRIMARY KEY (`DATASET_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_DATASET`
--

LOCK TABLES `TB_DATASET` WRITE;
/*!40000 ALTER TABLE `TB_DATASET` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_DATASET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_DATA_HISTORY`
--

DROP TABLE IF EXISTS `TB_DATA_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_DATA_HISTORY` (
                                   `DATA_HISTORY_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '작업 이력 아이디',
                                   `DATA_ID` int(11) NOT NULL COMMENT '데이터 아이디',
                                   `WORK_STATUS` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '대기:RE, 작업중(작업자할당):WK, 검수요청:IR, 1차검수완료(C1), 2차검수완료(C2),1차반려(R1),2차반려(R2),회수, ',
                                   `ACTION_ACCOUNT` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '행위자 계정',
                                   `ACTION_WORK_ROLE` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT 'MANAGER(M) WORK(W) INSPECT(I1, I2) VIEW(V)',
                                   `TARGET_ACCOUNT` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '대상자 계정',
                                   `TARGET_WORK_ROLE` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT 'MANAGER(M) WORK(W) INSPECT(I1, I2) VIEW(V)',
                                   `ACTION_DTM` datetime NOT NULL COMMENT '해당 이력이 생성된 행동일',
                                   `REJECT_MEMO` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '반려메모',
                                   `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                   `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                   `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                   `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                   PRIMARY KEY (`DATA_HISTORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3853 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_DATA_HISTORY`
--

LOCK TABLES `TB_DATA_HISTORY` WRITE;
/*!40000 ALTER TABLE `TB_DATA_HISTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_DATA_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_DATA_UPLOAD_HISTORY`
--

DROP TABLE IF EXISTS `TB_DATA_UPLOAD_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_DATA_UPLOAD_HISTORY` (
                                          `DATA_UPLOAD_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '데이터 업로드 이력 아이디',
                                          `DATASET_ID` int(11) NOT NULL COMMENT '데이터셋 아이디',
                                          `UPLOAD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '업로드 계정',
                                          `UPLOAD_CNT` int(11) DEFAULT NULL COMMENT '업로드 건수',
                                          `UPLOAD_START_DTM` datetime DEFAULT NULL COMMENT '업로드 시작시간',
                                          `UPLOAD_END_DTM` datetime DEFAULT NULL COMMENT '업로드 종료시간',
                                          `UPLOAD_STATUS` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'SUCC:S FAIL:F',
                                          `UPLOAD_MEMO` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '업로드 관련메모',
                                          `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                          `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                          `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                          `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                          PRIMARY KEY (`DATA_UPLOAD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_DATA_UPLOAD_HISTORY`
--

LOCK TABLES `TB_DATA_UPLOAD_HISTORY` WRITE;
/*!40000 ALTER TABLE `TB_DATA_UPLOAD_HISTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_DATA_UPLOAD_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_EXTRACT_PROGRAM`
--

DROP TABLE IF EXISTS `TB_EXTRACT_PROGRAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_EXTRACT_PROGRAM` (
                                      `PROGRAM_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '실행프로그램 아이디',
                                      `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트 아이디',
                                      `PROGRAM_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '프로그램파일명 EX) EXTRACT_JSON.py',
                                      `PROGRAM_FILE_NAME` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '파일 이름 EX) EXTRACT_JSON.py',
                                      `PROGRAM_PATH` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '프로그램 저장 경로 ',
                                      `PROGRAM_DESC` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '프로그램 설명 ',
                                      `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                                      `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                      `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                      `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                      `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                      PRIMARY KEY (`PROGRAM_ID`),
                                      UNIQUE KEY `TB_EXTRACT_PROGRAM_IDX_001` (`PROJECT_ID`,`PROGRAM_NAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='추출프로그램 관리테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_EXTRACT_PROGRAM`
--

LOCK TABLES `TB_EXTRACT_PROGRAM` WRITE;
/*!40000 ALTER TABLE `TB_EXTRACT_PROGRAM` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_EXTRACT_PROGRAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_EXTRACT_PROGRAM_EXECUTE`
--

DROP TABLE IF EXISTS `TB_EXTRACT_PROGRAM_EXECUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_EXTRACT_PROGRAM_EXECUTE` (
                                              `PROGRAM_EXE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '실행프로그램 실행 아이디',
                                              `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트 아이디',
                                              `PROGRAM_ID` int(11) NOT NULL COMMENT '실행프로그램 아이디',
                                              `RESULT_FILENAME` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '결과파일명 EX) EXTRACT_YYYMMDDHHMMSS.zip',
                                              `RESULT_PATH` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '결과파일 PATH',
                                              `EXE_START_DTM` datetime DEFAULT NULL COMMENT '수행시작 시각 ',
                                              `EXE_END_DTM` datetime DEFAULT NULL COMMENT '수행종료 시각 ',
                                              `EXTRACT_CNT` int(11) DEFAULT NULL COMMENT '추출건수  ',
                                              `PROGRAM_DATA_STATUS` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '실행할 데이터 상태 리스트 ex) RE,C1,C2',
                                              `PROGRAM_DATASET_IDS` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '실행할 데이터셋 리스트 ex) 1,2,3,4',
                                              `PROGRAM_START_DTM` date DEFAULT NULL COMMENT '데이터 필터 시작 일자',
                                              `PROGRAM_END_DTM` date DEFAULT NULL COMMENT '데이터 필터 종료 일자',
                                              `PROGRAM_STATUS` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '프로그램 상태 (START, END, ERROR)',
                                              `PROGRAM_RESULT_MSG` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '프로그램 결과 메시지',
                                              `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                              `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                              `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                              `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                              PRIMARY KEY (`PROGRAM_EXE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='추출프로그램 수행이력 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_EXTRACT_PROGRAM_EXECUTE`
--

LOCK TABLES `TB_EXTRACT_PROGRAM_EXECUTE` WRITE;
/*!40000 ALTER TABLE `TB_EXTRACT_PROGRAM_EXECUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_EXTRACT_PROGRAM_EXECUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_EXTRACT_PROGRAM_SET`
--

DROP TABLE IF EXISTS `TB_EXTRACT_PROGRAM_SET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_EXTRACT_PROGRAM_SET` (
                                          `PROGRAM_SET_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '실행 프로그램 파라미터 설정 아이디',
                                          `PROGRAM_ID` int(11) NOT NULL COMMENT '실행 프로그램 아이디',
                                          `PROGRAM_DATASET_IDS` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '실행할 데이터셋 리스트 ex) 1,2,3,4',
                                          `PROGRAM_START_DTM` date DEFAULT NULL COMMENT '데이터 필터 시작 일자',
                                          `PROGRAM_END_DTM` date DEFAULT NULL COMMENT '데이터 필터 종료 일자',
                                          `PROGRAM_DATA_STATUS` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '실행할 데이터 상태 리스트 ex) RE,C1,C2',
                                          `LABEL_TYPE` char(1) COLLATE utf8_bin NOT NULL COMMENT '라벨 타입 B : 바운딩박스 G : 폴리곤',
                                          `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                                          `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                          `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                          `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                          `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                          PRIMARY KEY (`PROGRAM_SET_ID`),
                                          UNIQUE KEY `TB_EXTRACT_PROGRAM_SET_UN` (`PROGRAM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_EXTRACT_PROGRAM_SET`
--

LOCK TABLES `TB_EXTRACT_PROGRAM_SET` WRITE;
/*!40000 ALTER TABLE `TB_EXTRACT_PROGRAM_SET` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_EXTRACT_PROGRAM_SET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_FREQUENTLY_USED_WORD`
--

DROP TABLE IF EXISTS `TB_FREQUENTLY_USED_WORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_FREQUENTLY_USED_WORD` (
                                           `WORD_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '자주사용하는 문구 ID',
                                           `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트 ID',
                                           `USER_ACCOUNT` varchar(50) NOT NULL COMMENT '유저 계정 (검수자)',
                                           `WORD` varchar(100) NOT NULL COMMENT '단축어(자주사용하는문구)',
                                           `WORD_DESC` varchar(4000) NOT NULL COMMENT '자주사용하는문구 설명',
                                           `FIRST_INS_ACCOUNT` varchar(50) NOT NULL COMMENT '최초입력사용자계정',
                                           `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                           `LAST_UPD_ACCOUNT` varchar(50) NOT NULL COMMENT '마지막수정사용자계정',
                                           `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                           PRIMARY KEY (`WORD_ID`),
                                           KEY `TB_FREQUENTLY_USED_WORD_PROJECT_ID_IDX` (`PROJECT_ID`),
                                           KEY `TB_FREQUENTLY_USED_WORD_USER_ACCOUNT_IDX` (`USER_ACCOUNT`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='자주사용하는 문구 테이블 (검수 시 검수반려 문구)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_FREQUENTLY_USED_WORD`
--

LOCK TABLES `TB_FREQUENTLY_USED_WORD` WRITE;
/*!40000 ALTER TABLE `TB_FREQUENTLY_USED_WORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_FREQUENTLY_USED_WORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_GPU_SERVER`
--

DROP TABLE IF EXISTS `TB_GPU_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_GPU_SERVER` (
                                 `GPU_SERVER_ADDRESS` varchar(15) NOT NULL COMMENT 'GPU가 존재하는 서버 주소',
                                 `GPU_SERVER_PORT` varchar(5) NOT NULL COMMENT '서버 포트 번호',
                                 `GPU_SERVER_NAME` varchar(50) DEFAULT NULL COMMENT '서버명',
                                 `GPU_SERVER_ACCOUNT` varchar(30) DEFAULT NULL COMMENT '서버 계정명',
                                 `GPU_SERVER_PASSWORD` varchar(500) DEFAULT NULL COMMENT '서버 비밀번호',
                                 `GPU_SERVER_TYPE` varchar(10) DEFAULT NULL COMMENT 'GPU Node 타입 (master or worker)',
                                 `USE_STATUS` char(1) DEFAULT NULL COMMENT '사용 유무',
                                 `FIRST_INS_ACCOUNT` varchar(50) DEFAULT NULL COMMENT '최초 등록 사용자 계정',
                                 `FIRST_INS_DTM` datetime DEFAULT NULL COMMENT '최초 등록 시간',
                                 `LAST_UPD_ACCOUNT` varchar(50) DEFAULT NULL COMMENT '마지막 업데이트 사용자 계정',
                                 `LAST_UPD_DTM` datetime DEFAULT NULL COMMENT '마지막 업데이트 시간',
                                 PRIMARY KEY (`GPU_SERVER_ADDRESS`,`GPU_SERVER_PORT`),
                                 UNIQUE KEY `GPU_SERVER_ADDRESS_UNIQUE` (`GPU_SERVER_ADDRESS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_GPU_SERVER`
--

LOCK TABLES `TB_GPU_SERVER` WRITE;
/*!40000 ALTER TABLE `TB_GPU_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_GPU_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_GRADE_MENU`
--

DROP TABLE IF EXISTS `TB_GRADE_MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_GRADE_MENU` (
                                 `WORK_ROLE` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT 'MANAGER(M) WORK(W) INSPECT(I1, I2) VIEW(V)',
                                 `MENU_ID` int(11) NOT NULL COMMENT '메뉴 아이디',
                                 `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                                 `AUTH_READ` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '읽기권한',
                                 `AUTH_UPDATE` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '생성수정권한',
                                 `AUTH_DELETE` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '삭제권한',
                                 `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                 `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                 `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                 `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                 PRIMARY KEY (`WORK_ROLE`,`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_GRADE_MENU`
--

LOCK TABLES `TB_GRADE_MENU` WRITE;
/*!40000 ALTER TABLE `TB_GRADE_MENU` DISABLE KEYS */;
INSERT INTO `TB_GRADE_MENU` VALUES ('I1',1,'U','Y','N','N','SYSTEM','2022-06-15 16:11:30','SYSTEM','2022-06-15 16:11:30'),('I1',4,'U','Y','N','N','SYSTEM','2022-06-15 16:11:30','SYSTEM','2022-06-15 16:11:30'),('I1',6,'U','Y','N','N','SYSTEM','2023-10-17 17:10:26','SYSTEM','2023-10-17 17:10:26'),('I2',1,'U','Y','N','N','SYSTEM','2022-06-15 16:12:12','SYSTEM','2022-06-15 16:12:12'),('I2',4,'U','Y','N','N','SYSTEM','2022-06-15 16:12:12','SYSTEM','2022-06-15 16:12:12'),('I2',6,'U','Y','N','N','SYSTEM','2023-10-17 17:11:56','SYSTEM','2023-10-17 17:11:56'),('M',1,'U','Y','Y','Y','SYSTEM','2022-06-15 16:08:34','SYSTEM','2022-06-15 16:08:34'),('M',2,'U','Y','Y','N','SYSTEM','2022-06-15 16:08:34','SYSTEM','2022-06-15 16:08:34'),('M',3,'U','Y','Y','Y','SYSTEM','2022-06-15 16:08:34','SYSTEM','2022-06-15 16:08:34'),('M',4,'U','Y','Y','Y','SYSTEM','2022-06-15 16:08:34','SYSTEM','2022-06-15 16:08:34'),('M',5,'U','Y','Y','Y','SYSTEM','2022-06-15 16:08:34','SYSTEM','2022-06-15 16:08:34'),('M',6,'U','Y','Y','Y','SYSTEM','2023-10-17 17:12:30','SYSTEM','2023-10-17 17:12:30'),('M',7,'U','Y','Y','Y','SYSTEM','2023-10-17 17:12:30','SYSTEM','2023-10-17 17:12:30'),('U',6,'U','Y','N','N','SYSTEM','2023-10-17 17:13:18','SYSTEM','2023-10-17 17:13:18'),('U',7,'U','Y','N','N','SYSTEM','2023-10-17 17:13:18','SYSTEM','2023-10-17 17:13:18'),('V',1,'U','Y','N','N','SYSTEM','2022-06-15 16:09:49','SYSTEM','2022-06-15 16:09:49'),('V',2,'U','Y','N','N','SYSTEM','2022-06-15 16:09:49','SYSTEM','2022-06-15 16:09:49'),('V',3,'U','Y','N','N','SYSTEM','2022-06-15 16:09:49','SYSTEM','2022-06-15 16:09:49'),('V',4,'U','Y','N','N','SYSTEM','2022-06-15 16:09:49','SYSTEM','2022-06-15 16:09:49'),('V',5,'U','Y','N','N','SYSTEM','2022-06-15 16:09:49','SYSTEM','2022-06-15 16:09:49'),('W',1,'U','Y','N','N','SYSTEM','2022-06-15 16:10:42','SYSTEM','2022-06-15 16:10:42'),('W',4,'U','Y','N','N','SYSTEM','2022-06-15 16:10:42','SYSTEM','2022-06-15 16:10:42'),('W',6,'U','Y','N','N','SYSTEM','2023-10-17 17:14:00','SYSTEM','2023-10-17 17:14:00');
/*!40000 ALTER TABLE `TB_GRADE_MENU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_LABEL`
--

DROP TABLE IF EXISTS `TB_LABEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_LABEL` (
                            `LABEL_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '라벨 아이디',
                            `LABELSET_ID` int(11) NOT NULL COMMENT '라벨셋 아이디',
                            `LABEL_NAME` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '라벨 이름',
                            `LABEL_DESC` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '라벨 설명',
                            `LABEL_COLOR` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT '라벨 색상',
                            `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H',
                            `TARGET_QUANTITY` int(11) DEFAULT 0 COMMENT '목표수량',
                            `LABEL_TYPE` char(1) COLLATE utf8_bin DEFAULT 'B' COMMENT '라벨타입 BBOX:B    POLYGON:G   POLYLINE:L',
                            `SYSTEM_LABEL_YN` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '시스템라벨 여부표시-비식별화 등(Y/N)',
                            `DISPLAY_ORDER` int(3) NOT NULL,
                            `GROUPING_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '라벨의 상위 라벨명칭',
                            `IS_CROWD_VIEW_OPT` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '가림여부 Default값 설정',
                            `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                            `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                            `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                            `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                            PRIMARY KEY (`LABEL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LABEL`
--

LOCK TABLES `TB_LABEL` WRITE;
/*!40000 ALTER TABLE `TB_LABEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_LABEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_LABELSET`
--

DROP TABLE IF EXISTS `TB_LABELSET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_LABELSET` (
                               `LABELSET_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '라벨셋 아이디',
                               `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트 아이디',
                               `LABELSET_NAME` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '라벨 셋 이름',
                               `LABELSET_DESC` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '라벨셋 설명',
                               `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H',
                               `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                               `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                               `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                               `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                               PRIMARY KEY (`LABELSET_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LABELSET`
--

LOCK TABLES `TB_LABELSET` WRITE;
/*!40000 ALTER TABLE `TB_LABELSET` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_LABELSET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_LABEL_PROGRESS_STATISTICS`
--

DROP TABLE IF EXISTS `TB_LABEL_PROGRESS_STATISTICS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_LABEL_PROGRESS_STATISTICS` (
                                                `LABEL_ID` int(11) NOT NULL COMMENT '라벨 아이디',
                                                `1ST_INSPECT_CNT` int(11) DEFAULT 0 COMMENT '1차검수된 수량',
                                                `2ND_INSPECT_CNT` int(11) DEFAULT 0 COMMENT '2차검수된 수량',
                                                `1ST_REJECT_CNT` int(11) DEFAULT 0 COMMENT '반려 1차 수량',
                                                `2ND_REJECT_CNT` int(11) DEFAULT 0 COMMENT '반려 2차 수량',
                                                `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                                `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                                `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                                `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                                PRIMARY KEY (`LABEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LABEL_PROGRESS_STATISTICS`
--

LOCK TABLES `TB_LABEL_PROGRESS_STATISTICS` WRITE;
/*!40000 ALTER TABLE `TB_LABEL_PROGRESS_STATISTICS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_LABEL_PROGRESS_STATISTICS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_LOGIN`
--

DROP TABLE IF EXISTS `TB_LOGIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_LOGIN` (
                            `USER_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '로그인 시도 사용자 계정',
                            `REFRESH_TOKEN` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '재활성_토큰',
                            `IP_ADDRESS` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '로그인을 시도한 ip 주소',
                            `CONNECT_DEVICE` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '로그인 접속을 시도한 기기',
                            `LOGIN_SUCCESS_YN` char(1) COLLATE utf8_bin DEFAULT 'Y' COMMENT '현재접속 로그인 성공유무 ',
                            `CURRENT_LOGIN_DTM` datetime NOT NULL COMMENT '현재접속 로그인 시도시간 ',
                            `PREVIOUS_LOGIN_DTM` datetime DEFAULT NULL COMMENT '이전접속 로그인 시도시간 ',
                            `LOGIN_FAIL_CNT` int(2) DEFAULT 0 COMMENT '로그인 연속 누적실패건수 ',
                            `FAIL_REASON` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '로그인 실패사유',
                            `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                            `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                            `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                            `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                            PRIMARY KEY (`USER_ACCOUNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LOGIN`
--

LOCK TABLES `TB_LOGIN` WRITE;
/*!40000 ALTER TABLE `TB_LOGIN` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_LOGIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_LOGIN_HISTORY`
--

DROP TABLE IF EXISTS `TB_LOGIN_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_LOGIN_HISTORY` (
                                    `LOGIN_HISTORY_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '로그인 히스토리id',
                                    `USER_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '로그인 시도 사용자 계정',
                                    `IP_ADDRESS` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '로그인을 시도한 ip 주소',
                                    `CONNECT_DEVICE` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '로그인 접속을 시도한 기기',
                                    `LOGIN_SUCCESS_YN` char(1) COLLATE utf8_bin DEFAULT 'Y' COMMENT '현재접속 로그인 성공유무 ',
                                    `CURRENT_LOGIN_DTM` datetime DEFAULT NULL COMMENT '현재접속 로그인 시도시간 ',
                                    `PREVIOUS_LOGIN_DTM` datetime DEFAULT NULL COMMENT '이전접속 로그인 시도시간 ',
                                    `LOGIN_FAIL_CNT` int(2) DEFAULT 0 COMMENT '로그인 연속 누적실패건수 ',
                                    `FAIL_REASON` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '로그인 실패사유',
                                    `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                    `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                    `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                    `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                    PRIMARY KEY (`LOGIN_HISTORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2560 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LOGIN_HISTORY`
--

LOCK TABLES `TB_LOGIN_HISTORY` WRITE;
/*!40000 ALTER TABLE `TB_LOGIN_HISTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_LOGIN_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_MENU`
--

DROP TABLE IF EXISTS `TB_MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_MENU` (
                           `MENU_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '메뉴 아이디',
                           `URI` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '권한 관리를 위해 등록한 메뉴의 URI 값',
                           `MENU_NAME` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '메뉴 명',
                           `MENU_DESC` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '메뉴의 설명',
                           `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                           `UPPER_MENU_ID` int(11) DEFAULT NULL COMMENT '상위 메뉴의 아이디',
                           `MENU_LEVEL` int(11) NOT NULL COMMENT '메뉴 레벨, 상위 메뉴부터 1,2,3 으로 진행된다.',
                           `COMMON_PERMISSION_YN` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '공통 권한여부, 프로젝트와 연관되지 않은 메뉴 권한이면 Y, 아니면 N',
                           `DISPLAY_ORDER` int(3) NOT NULL COMMENT '정렬번호',
                           `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                           `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                           `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                           `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                           PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_MENU`
--

LOCK TABLES `TB_MENU` WRITE;
/*!40000 ALTER TABLE `TB_MENU` DISABLE KEYS */;
INSERT INTO `TB_MENU` VALUES (1,'/projectListManage','프로젝트','프로젝트 상위메뉴','U',1,0,'Y',1,'SYSTEM','2022-05-12 12:33:41','SYSTEM','2022-05-12 12:33:41'),(2,'/projectManage','프로젝트정보','프로젝트정보 (상세)','U',1,1,'N',2,'SYSTEM','2022-05-12 12:33:41','SYSTEM','2022-05-12 12:33:41'),(3,'/datasetManage','데이터셋','데이터셋 관리','U',1,1,'N',5,'SYSTEM','2022-05-12 12:33:41','SYSTEM','2022-05-12 12:33:41'),(4,'/dataManage','데이터','데이터 목록','U',1,1,'N',6,'SYSTEM','2022-05-12 12:33:41','SYSTEM','2022-05-12 12:33:41'),(5,'/labelsetManage','라벨셋','라벨셋 관리','U',1,1,'N',4,'SYSTEM','2022-05-12 12:33:41','SYSTEM','2022-05-12 12:33:41'),(6,'/dashboard','대시보드','대시보드','U',1,1,'N',3,'SYSTEM','2023-10-17 17:07:48','SYSTEM','2023-10-17 17:07:48'),(7,'/dataExtractManage','데이터 추출','데이터 추출 (json)','U',1,1,'N',7,'SYSTEM','2023-10-17 17:08:21','SYSTEM','2023-10-17 17:08:21');
/*!40000 ALTER TABLE `TB_MENU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_META`
--

DROP TABLE IF EXISTS `TB_META`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_META` (
                           `META_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '메타 아이디',
                           `DATA_ID` int(11) NOT NULL COMMENT '데이터 아이디',
                           `ANNOTATION` longtext COLLATE utf8_bin NOT NULL COMMENT '좌표값',
                           `LABEL_TYPE` char(1) COLLATE utf8_bin NOT NULL COMMENT '라벨타입 BBOX:B    POLYGON:G   POLYLINE:L',
                           `LABEL_ID` int(11) NOT NULL COMMENT '라벨 아이디',
                           `LAST_WORKER_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막작업자 계정',
                           `REJECT_YN` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '반려여부',
                           `REJECT_CODE` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '반려코드',
                           `REJECT_MEMO` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '반려메모',
                           `ISCROWD` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '0 : 온전함 , 1: 가려짐',
                           `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                           `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                           `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                           `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                           `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U',
                           PRIMARY KEY (`META_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14515 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_META`
--

LOCK TABLES `TB_META` WRITE;
/*!40000 ALTER TABLE `TB_META` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_META` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_PRETRAINED_MODEL`
--

DROP TABLE IF EXISTS `TB_PRETRAINED_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_PRETRAINED_MODEL` (
                                       `PRETRAINED_MODEL_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '사전학습모델ID',
                                       `ALGORITHM_ID` int(11) DEFAULT NULL COMMENT '알고리즘ID',
                                       `TITLE` varchar(100) DEFAULT NULL COMMENT '사전학습모델명',
                                       `CONTENTS` varchar(500) DEFAULT NULL COMMENT '사전학습모델 설명',
                                       `TRAIN_PARAM` longtext DEFAULT NULL COMMENT '학습 파라미터',
                                       `MODEL_PATH` varchar(100) DEFAULT NULL,
                                       `MODEL_TYPE` char(1) DEFAULT NULL COMMENT '검출 타입 BBOX:B    POLYGON:G   POLYLINE:L',
                                       `USE_STATUS` char(1) DEFAULT NULL COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                                       `FIRST_INS_ACCOUNT` varchar(50) DEFAULT NULL COMMENT '최초입력사용자계정',
                                       `FIRST_INS_DTM` datetime DEFAULT NULL COMMENT '최초입력일시',
                                       `LAST_UPD_ACOUNT` varchar(50) DEFAULT NULL COMMENT '마지막수정사용자계정',
                                       `LAST_UPD_DTM` datetime DEFAULT NULL COMMENT '마지막수정일시',
                                       PRIMARY KEY (`PRETRAINED_MODEL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PRETRAINED_MODEL`
--

LOCK TABLES `TB_PRETRAINED_MODEL` WRITE;
/*!40000 ALTER TABLE `TB_PRETRAINED_MODEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_PRETRAINED_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_PRETRAINED_MODEL_LABEL`
--

DROP TABLE IF EXISTS `TB_PRETRAINED_MODEL_LABEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_PRETRAINED_MODEL_LABEL` (
                                             `PRETRAINED_MODEL_ID` int(11) NOT NULL COMMENT '사전학습모델 ID',
                                             `PRETRAINED_MODEL_DETECT_ID` int(11) NOT NULL COMMENT '사전학습모델 검출 클래스ID',
                                             `PRETRAINED_MODEL_LABEL_NAME` varchar(50) DEFAULT NULL COMMENT '사전학습모델 검출 클래스 명',
                                             `USE_STATUS` char(1) DEFAULT NULL COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                                             `FIRST_INS_ACCOUNT` varchar(50) DEFAULT NULL COMMENT '최초입력사용자계정',
                                             `FIRST_INS_DTM` datetime DEFAULT NULL COMMENT '최초입력일시',
                                             `LAST_UPD_ACCOUNT` varchar(50) DEFAULT NULL COMMENT '마지막수정사용자계정',
                                             `LAST_UPD_DTM` datetime DEFAULT NULL COMMENT '마지막수정일시',
                                             PRIMARY KEY (`PRETRAINED_MODEL_ID`,`PRETRAINED_MODEL_DETECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PRETRAINED_MODEL_LABEL`
--

LOCK TABLES `TB_PRETRAINED_MODEL_LABEL` WRITE;
/*!40000 ALTER TABLE `TB_PRETRAINED_MODEL_LABEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_PRETRAINED_MODEL_LABEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_PROCEDURE_LOG`
--

DROP TABLE IF EXISTS `TB_PROCEDURE_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_PROCEDURE_LOG` (
                                    `LOG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '로그ID',
                                    `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트 ID',
                                    `FUNCTION_TYPE` varchar(20) NOT NULL COMMENT '배분(DISTRIBUTION), 회수(RECOVERY), 검수(INSPECTION), 반려(REJECTION)',
                                    `RUN_DATE` char(14) NOT NULL COMMENT '실행일자',
                                    `RUN_TYPE` varchar(20) NOT NULL COMMENT '자동(AUTO), 수동(MANUAL)',
                                    `WORK_TYPE` varchar(20) NOT NULL COMMENT '작업자(WORKER), 1차검수자(INSPECTOR1), 2차검수자(INSPECTOR2)',
                                    `LOG_MSG` varchar(4000) NOT NULL COMMENT '로그내용',
                                    PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1280 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PROCEDURE_LOG`
--

LOCK TABLES `TB_PROCEDURE_LOG` WRITE;
/*!40000 ALTER TABLE `TB_PROCEDURE_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_PROCEDURE_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_PROJECT`
--

DROP TABLE IF EXISTS `TB_PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_PROJECT` (
                              `PROJECT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '프로젝트 아이디',
                              `PROJECT_NAME` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '프로젝트 이름',
                              `PROJECT_DESC` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '프로젝트 설명',
                              `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D',
                              `PROJECT_PROGRESS_YN` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '프로젝트 유무 사용 : U, 삭제 : D',
                              `HOST_COMPANY` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '주관사',
                              `APPLICATION_TYPE` varchar(200) COLLATE utf8_bin DEFAULT NULL,
                              `PROJECT_START_DT` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '프로젝트 시작일시',
                              `PROJECT_END_DT` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '프로젝트 종료일시',
                              `INSPECTION_NUM` int(2) DEFAULT 1 COMMENT '검수 단계의 설정 값 (1부터)',
                              `GOAL_DATA_CNT` int(11) DEFAULT 0 COMMENT '목표완료 데이터수',
                              `INCOME_UPDATE_YN` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT 'N',
                              `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                              `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                              `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                              `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                              PRIMARY KEY (`PROJECT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PROJECT`
--

LOCK TABLES `TB_PROJECT` WRITE;
/*!40000 ALTER TABLE `TB_PROJECT` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_PROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_PROJECT_GUIDELINE`
--

DROP TABLE IF EXISTS `TB_PROJECT_GUIDELINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_PROJECT_GUIDELINE` (
                                        `GUIDELINE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '가이드라인ID',
                                        `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트ID',
                                        `SAVE_PATH` varchar(300) NOT NULL COMMENT '가이드라인 파일 저장위치/기준폴더/프로젝트ID/업로드일자(년원일)',
                                        `SAVE_FILENAME` varchar(300) NOT NULL COMMENT '저장된 파일 이름',
                                        `ORIGIN_FILENAME` varchar(300) NOT NULL COMMENT '원본 파일 이름',
                                        `DATA_SIZE` int(11) NOT NULL COMMENT '파일용량(바이트)',
                                        `WIDTH` int(11) NOT NULL COMMENT '데이터 가로 사이즈',
                                        `HEIGHT` int(11) NOT NULL COMMENT '데이터 세로 사이즈',
                                        `USE_STATUS` char(1) NOT NULL COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                                        `FIRST_INS_ACCOUNT` varchar(50) NOT NULL COMMENT '최초 입력 사용자계정',
                                        `FIRST_INS_DTM` datetime DEFAULT NULL COMMENT '최초 입력일시',
                                        `LAST_UPD_ACCOUNT` varchar(50) NOT NULL COMMENT '마지막 수정 사용자 계정',
                                        `LAST_UPD_DTM` datetime DEFAULT NULL COMMENT '마지막 수정 사용자 일시',
                                        PRIMARY KEY (`GUIDELINE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PROJECT_GUIDELINE`
--

LOCK TABLES `TB_PROJECT_GUIDELINE` WRITE;
/*!40000 ALTER TABLE `TB_PROJECT_GUIDELINE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_PROJECT_GUIDELINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_PROJECT_MODEL`
--

DROP TABLE IF EXISTS `TB_PROJECT_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_PROJECT_MODEL` (
                                    `PROJECT_MODEL_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '프로젝트 모델 ID',
                                    `ALGORITHM_ID` int(11) NOT NULL COMMENT '알고리즘ID',
                                    `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트ID',
                                    `TITLE` varchar(100) NOT NULL COMMENT '모델명',
                                    `CONTENTS` varchar(500) NOT NULL COMMENT '모델 설명',
                                    `TRAIN_PARAM` longtext NOT NULL COMMENT '학습 파라미터',
                                    `UPLOAD_YN` char(1) DEFAULT 'N' COMMENT '업로드 된 모델: Y 학습을 통해 생성된 모델: N',
                                    `MODEL_PATH` varchar(300) NOT NULL COMMENT '서버에 저장된 모델 경로',
                                    `MODEL_TYPE` char(1) NOT NULL COMMENT '검출 타입 BBOX:B    POLYGON:G   POLYLINE:L',
                                    `UUID` varchar(32) DEFAULT NULL COMMENT '모델 저장 디렉터리 명',
                                    `DATASET_ID` int(11) DEFAULT NULL COMMENT '모델 학습에 사용된 데이터 셋 아이디',
                                    `USE_STATUS` char(1) DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                                    `FIRST_INS_ACCOUNT` varchar(50) NOT NULL COMMENT '최초입력사용자계정',
                                    `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                    `LAST_UPD_ACOUNT` varchar(50) NOT NULL COMMENT '마지막수정사용자계정',
                                    `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                    PRIMARY KEY (`PROJECT_MODEL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PROJECT_MODEL`
--

LOCK TABLES `TB_PROJECT_MODEL` WRITE;
/*!40000 ALTER TABLE `TB_PROJECT_MODEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_PROJECT_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_PROJECT_MODEL_LABEL`
--

DROP TABLE IF EXISTS `TB_PROJECT_MODEL_LABEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_PROJECT_MODEL_LABEL` (
                                          `PROJECT_MODEL_ID` int(11) NOT NULL COMMENT '프로젝트 모델 ID',
                                          `PROJECT_MODEL_DETECT_ID` int(11) NOT NULL COMMENT '프로젝트 모델 검출 클래스ID',
                                          `PROJECT_MODEL_LABEL_NAME` varchar(50) DEFAULT NULL COMMENT '프로젝트 모델 검출 클래스 명',
                                          `USE_STATUS` char(1) DEFAULT NULL COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                                          `FIRST_INS_ACCOUNT` varchar(50) DEFAULT NULL COMMENT '최초입력사용자계정',
                                          `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                          `LAST_UPD_ACCOUNT` varchar(50) DEFAULT NULL COMMENT '마지막수정사용자계정',
                                          `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                          PRIMARY KEY (`PROJECT_MODEL_ID`,`PROJECT_MODEL_DETECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PROJECT_MODEL_LABEL`
--

LOCK TABLES `TB_PROJECT_MODEL_LABEL` WRITE;
/*!40000 ALTER TABLE `TB_PROJECT_MODEL_LABEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_PROJECT_MODEL_LABEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_PROJECT_MODEL_LABEL_MAPPING`
--

DROP TABLE IF EXISTS `TB_PROJECT_MODEL_LABEL_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_PROJECT_MODEL_LABEL_MAPPING` (
                                                  `PROJECT_MODEL_DETECT_ID` int(11) NOT NULL COMMENT '프로젝트 모델 검출 클래스ID',
                                                  `LABELSET_ID` int(11) NOT NULL COMMENT '라벨 셋 아이디',
                                                  `LABEL_ID` int(11) NOT NULL COMMENT '라벨 아이디',
                                                  `PROJECT_MODEL_ID` int(11) NOT NULL COMMENT '프로젝트 모델 ID',
                                                  PRIMARY KEY (`PROJECT_MODEL_ID`,`PROJECT_MODEL_DETECT_ID`,`LABELSET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PROJECT_MODEL_LABEL_MAPPING`
--

LOCK TABLES `TB_PROJECT_MODEL_LABEL_MAPPING` WRITE;
/*!40000 ALTER TABLE `TB_PROJECT_MODEL_LABEL_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_PROJECT_MODEL_LABEL_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_PROJECT_USER`
--

DROP TABLE IF EXISTS `TB_PROJECT_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_PROJECT_USER` (
                                   `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트 아이디',
                                   `USER_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '사용자 계정',
                                   `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H',
                                   `WORK_ROLE` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT 'MANAGER(M) WORK(W) INSPECT(I1, I2) VIEW(V)',
                                   `MAX_HOLDING_DATA_CNT` int(11) NOT NULL DEFAULT 1000 COMMENT '본인이 가지고 있을 최대 작업대기수',
                                   `AUTO_DISTRIBUTION_YN` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '자동분배여부(Y/N)',
                                   `FAVORITES_YN` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '즐겨찾기 프로젝트 유무',
                                   `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                   `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                   `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                   `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                   PRIMARY KEY (`PROJECT_ID`,`USER_ACCOUNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PROJECT_USER`
--

LOCK TABLES `TB_PROJECT_USER` WRITE;
/*!40000 ALTER TABLE `TB_PROJECT_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_PROJECT_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_USER`
--

DROP TABLE IF EXISTS `TB_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_USER` (
                           `USER_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '사용자계정',
                           `USER_EMAIL` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '사용자 이메일',
                           `PASSWORD` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '사용자비밀번호',
                           `USER_NAME` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '사용자 이름',
                           `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H',
                           `PHONE_NUM` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '사용자 전화번호',
                           `BANK_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '사용자 은행 이름',
                           `BANK_ACCOUNT` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '사용자 은행 계정',
                           `RES_REGISTER_NUM` varchar(13) COLLATE utf8_bin DEFAULT NULL,
                           `ADDRESS` varchar(500) COLLATE utf8_bin DEFAULT NULL,
                           `SUPER_ADMIN_YN` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '슈퍼어드민 유무',
                           `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                           `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                           `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                           `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                           PRIMARY KEY (`USER_ACCOUNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_USER`
--

LOCK TABLES `TB_USER` WRITE;
/*!40000 ALTER TABLE `TB_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_USER_DASHBOARD`
--

DROP TABLE IF EXISTS `TB_USER_DASHBOARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_USER_DASHBOARD` (
                                     `PROJECT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '프로젝트 아이디',
                                     `USER_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '사용자계정',
                                     `WIDGET_ID` int(11) NOT NULL COMMENT '위젯ID',
                                     `WIDGET_X` int(5) NOT NULL COMMENT '좌표X',
                                     `WIDGET_Y` int(5) NOT NULL COMMENT '좌표Y',
                                     `WIDGET_W` int(5) NOT NULL COMMENT '위젯넓이 ',
                                     `WIDGET_H` int(5) NOT NULL COMMENT '위젯높이 ',
                                     `VISIBLE_VALUE` char(3) COLLATE utf8_bin NOT NULL COMMENT 'VISIBLE_VALUE (위젯 크기 : lg, md, sm,xs,xxs )',
                                     `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D',
                                     `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                     `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                     `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                     `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                     PRIMARY KEY (`PROJECT_ID`,`USER_ACCOUNT`,`WIDGET_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_USER_DASHBOARD`
--

LOCK TABLES `TB_USER_DASHBOARD` WRITE;
/*!40000 ALTER TABLE `TB_USER_DASHBOARD` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_USER_DASHBOARD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_USER_MENU`
--

DROP TABLE IF EXISTS `TB_USER_MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_USER_MENU` (
                                `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트 아이디',
                                `USER_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '사용자 계정',
                                `MENU_ID` int(11) NOT NULL COMMENT '메뉴 아이디',
                                `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D 홀딩:H 불용:N',
                                `AUTH_READ` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '읽기권한',
                                `AUTH_UPDATE` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '생성수정권한',
                                `AUTH_DELETE` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '삭제권한',
                                `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                PRIMARY KEY (`PROJECT_ID`,`USER_ACCOUNT`,`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_USER_MENU`
--

LOCK TABLES `TB_USER_MENU` WRITE;
/*!40000 ALTER TABLE `TB_USER_MENU` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_USER_MENU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_USER_PROGRESS_STATISTICS`
--

DROP TABLE IF EXISTS `TB_USER_PROGRESS_STATISTICS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_USER_PROGRESS_STATISTICS` (
                                               `PROJECT_ID` int(11) NOT NULL COMMENT '프로젝트 아이디',
                                               `USER_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '사용자 계정',
                                               `ACTION_DT` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '실제수행일',
                                               `ASSIGN_CNT` int(11) DEFAULT 0 COMMENT '할당건수',
                                               `WORK_CNT` int(11) DEFAULT 0 COMMENT '작업중 건수',
                                               `REQUEST_INSPECT_CNT` int(11) DEFAULT 0 COMMENT '검수요청건수',
                                               `1ST_INSPECT_CNT` int(11) DEFAULT 0 COMMENT '1차검수완료건수',
                                               `2ND_INSPECT_CNT` int(11) DEFAULT 0 COMMENT '2차검수완료건수',
                                               `1ST_REJECT_CNT` int(11) DEFAULT 0 COMMENT '1차반려건수',
                                               `2ND_REJECT_CNT` int(11) DEFAULT 0 COMMENT '2차반려건수',
                                               `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                               `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                               `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                               `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                               PRIMARY KEY (`PROJECT_ID`,`USER_ACCOUNT`,`ACTION_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_USER_PROGRESS_STATISTICS`
--

LOCK TABLES `TB_USER_PROGRESS_STATISTICS` WRITE;
/*!40000 ALTER TABLE `TB_USER_PROGRESS_STATISTICS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_USER_PROGRESS_STATISTICS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_VERIFY_QUERY`
--

DROP TABLE IF EXISTS `TB_VERIFY_QUERY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_VERIFY_QUERY` (
                                   `QUERY_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '쿼리 아이디',
                                   `PROJECT_ID` int(11) NOT NULL COMMENT '등록된 프로젝트 아이디',
                                   `QUERY_SQL` longtext COLLATE utf8_bin NOT NULL COMMENT '실행쿼리',
                                   `QUERY_DESC` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '쿼리  설명 ',
                                   `SHARE_YN` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '타프로젝트 공유여부  ',
                                   `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                   `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                   `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                   `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                   PRIMARY KEY (`QUERY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='검증 쿼리 관리테이블 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_VERIFY_QUERY`
--

LOCK TABLES `TB_VERIFY_QUERY` WRITE;
/*!40000 ALTER TABLE `TB_VERIFY_QUERY` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_VERIFY_QUERY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_VERIFY_QUERY_EXECUTE`
--

DROP TABLE IF EXISTS `TB_VERIFY_QUERY_EXECUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_VERIFY_QUERY_EXECUTE` (
                                           `QUERY_EXECUTE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '쿼리 아이디',
                                           `EXE_PROJECT_ID` int(11) NOT NULL COMMENT '수행한 프로젝트 아이디',
                                           `QUERY_ID` int(11) NOT NULL COMMENT '쿼리 아이디',
                                           `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                                           `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                                           `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                                           `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                                           PRIMARY KEY (`QUERY_EXECUTE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='검증 쿼리 실행 이력  ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_VERIFY_QUERY_EXECUTE`
--

LOCK TABLES `TB_VERIFY_QUERY_EXECUTE` WRITE;
/*!40000 ALTER TABLE `TB_VERIFY_QUERY_EXECUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_VERIFY_QUERY_EXECUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_WIDGET`
--

DROP TABLE IF EXISTS `TB_WIDGET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_WIDGET` (
                             `WIDGET_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '위젯ID',
                             `WIDGET_NAME` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '위젯명칭 ',
                             `WIDGET_DESC` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '위젯 설명 ',
                             `AVAILABLE_ADMIN_YN` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '어드민 사용가능여부(Y/N)',
                             `AVAILABLE_MANAGER_YN` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '매니저 사용가능여부(Y/N) ',
                             `AVAILABLE_WORKER_YN` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '작업자 사용가능여부(Y/N) ',
                             `AVAILABLE_INSPECTOR_YN` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '검수자 사용가능여부(Y/N)',
                             `AVAILABLE_VIEWER_YN` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'N' COMMENT '뷰어 사용가능여부(Y/N)',
                             `USE_STATUS` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'U' COMMENT '사용중:U 삭제:D',
                             `FIRST_INS_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '최초입력사용자계정',
                             `FIRST_INS_DTM` datetime DEFAULT current_timestamp() COMMENT '최초입력일시',
                             `LAST_UPD_ACCOUNT` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '마지막수정사용자계정',
                             `LAST_UPD_DTM` datetime DEFAULT current_timestamp() COMMENT '마지막수정일시',
                             PRIMARY KEY (`WIDGET_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_WIDGET`
--

LOCK TABLES `TB_WIDGET` WRITE;
/*!40000 ALTER TABLE `TB_WIDGET` DISABLE KEYS */;
INSERT INTO `TB_WIDGET` VALUES (1,'프로젝트 관련 정보','프로젝트의 일정, 목표 수량 진척도, 업로드 데이터양을 백분율로 표시합니다.','Y','Y','N','N','Y','U','SYSTEM','2022-05-11 18:43:01','SYSTEM','2022-05-11 18:43:01'),(2,'데이터 생산 지표','프로젝트의 데이터 생산 지표를 꺾은선 그래프로 표시합니다. ( 일별 1차 검수완료 횟수 )<br/>X축 (좌측: 프로젝트 최초 시작일, 우측: 현재 시점)<br/>Y축 (1차 검수 완료 수 )','Y','Y','N','N','Y','U','SYSTEM','2022-05-11 18:43:01','SYSTEM','2022-05-11 18:43:01'),(3,'데이터 작업 현황','상태 별 데이터 수량 비율을 파이 그래프로 확인합니다.','Y','Y','N','N','Y','U','SYSTEM','2022-05-11 18:43:01','SYSTEM','2022-05-11 18:43:01'),(4,'반려 데이터 결과','반려 사유별 분포를 파이그래프로 표시합니다.','Y','Y','N','N','Y','D','SYSTEM','2022-05-11 18:43:01','SYSTEM','2022-05-11 18:43:01'),(5,'라벨 분포 지도','라벨별 분포를 트리맵으로 표시합니다. ( 검수완료된 데이터 기준 )','Y','Y','N','N','Y','U','SYSTEM','2022-05-11 18:43:01','SYSTEM','2022-05-11 18:43:01'),(6,'라벨별 목표 달성률','라벨별 목표 수량 대비 최종 검수 완료된 라벨 수량을 백분율로 표시합니다.</br>최종 검수 완료된 라벨 수량 / 라벨 목표 수량','Y','Y','N','N','Y','U','SYSTEM','2022-05-11 18:43:01','SYSTEM','2022-05-11 18:43:01'),(7,'데이터 가공 및 검수 트렌드','일별 검수요청 및 검수완료 누적데이터 수를 꺾은선 그래프로 표시합니다.','Y','Y','N','N','Y','U','SYSTEM','2022-05-11 18:43:01','SYSTEM','2022-05-11 18:43:01'),(8,'데이터 작업 현황','라벨러 및 검수자의 작업 완료율을 Gauge 그래프로 표시합니다.','N','N','Y','Y','N','U','SYSTEM','2022-05-11 18:43:01','SYSTEM','2022-05-11 18:43:01'),(9,'전체데이터 비교 표','라벨러 및 검수자가 보유한 데이터를 표시합니다.','N','N','Y','Y','N','U','SYSTEM','2022-05-11 18:43:01','SYSTEM','2023-04-11 09:21:02');
/*!40000 ALTER TABLE `TB_WIDGET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'market_place'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_inspector1_distribution` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_inspector1_distribution`(IN p_PROJECT_ID INT, IN p_INSPECTOR1_ACCOUNT VARCHAR(50), p_MANAGER_ACCOUNT VARCHAR(50),
                                                                 IN p_DATASET_LIST VARCHAR(4000), IN p_DISTRIBUTION_CNT INT, IN p_DISTRIBUTION_INSPECTOR_CNT INT, IN p_RUNTYPE VARCHAR(10), OUT p_RTN_VALUE INT)
BEGIN
    -- 1차 검수자 배분 프로시저

    DECLARE s_OUTER_DONE BOOLEAN DEFAULT FALSE;
    DECLARE s_INNER_DONE BOOLEAN DEFAULT FALSE;

    DECLARE v_RUNDATE CHAR(14);
    DECLARE v_RUNTYPE VARCHAR(20);
    DECLARE v_LOGMSG VARCHAR(2000);

    DECLARE v_WORK_ROLE VARCHAR(5);  			-- 계정권한 (매니저 또는 슈퍼관리자)
    DECLARE v_MAX_HOLDING_DATA_CNT INT;			-- 유저 MAX 데이터 건수
    DECLARE v_CURRENT_DATA_CNT INT;				-- 현재 유저에게 할당된 데이터 건수 ((1차,2차) 검수완료를 제외한)
    DECLARE v_TOTAL_DATA_CNT INT;				-- 검수자 별 할당된 이후 갖고있는 (배분)데이터 총 개수

    DECLARE c_INSPECTOR1_ACCOUNT VARCHAR(100);      -- cursor 변수
    DECLARE c_DATA_ID INT;  				  		-- cursor 변수
    DECLARE c_LIMIT_COUNT INT;  					-- cursor 변수
    DECLARE c_MAX_HOLDING_DATA_CNT INT; 			-- cursor 변수 (검수자별 MAX수량)
    DECLARE c_CURRENT_DATA_CNT INT; 				-- cursor 변수 (검수자별 현재 갖고있는 데이터 수량)

    DECLARE v_SQL_STATE varchar(5);		  			-- ERROR 상태
    DECLARE v_INT_ERROR_NO INT;				  		-- ERROR NUM
    DECLARE v_TXT_ERROR_MSG TEXT;		      		-- ERROR MSG


    -- 1번째 Corsor for DATA LIST
    DECLARE CURSOR_DATA CURSOR FOR
        SELECT DATA_ID
        FROM TB_DATA AS DT
                 JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
        WHERE 1=1
          AND PROJECT_ID 			= p_PROJECT_ID
          AND DTS.USE_STATUS 		= 'U'    -- 사용중
          AND DT.USE_STATUS 		= 'U'    -- 사용중
          AND WORK_STATUS 		= 'IR'  -- 검수요청
          AND REQUEST_INSPECT_DT IS NOT NULL
          AND (`1ST_INSPECT_ACCOUNT` = '' OR `1ST_INSPECT_ACCOUNT` IS NULL)
          AND (ASSIGN_1ST_INSPECT_DT = '' OR ASSIGN_1ST_INSPECT_DT IS NULL)
          AND (`2ND_INSPECT_ACCOUNT` = '' OR `2ND_INSPECT_ACCOUNT` IS NULL)
          AND (ASSIGN_2ND_INSPECT_DT = '' OR ASSIGN_2ND_INSPECT_DT IS NULL)
          AND CASE WHEN p_RUNTYPE = 'AUTO' THEN 1 = 1
                   ELSE FIND_IN_SET(DT.DATASET_ID, p_DATASET_LIST) END
        ORDER BY DT.REQUEST_INSPECT_DT ASC
        LIMIT p_DISTRIBUTION_CNT;

    /* 커서 종료조건 : 더이상 없다면 종료 */
    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET s_OUTER_DONE := TRUE;


    -- 할당건수 0 초기화
    SET c_LIMIT_COUNT = 0;

    -- LOG TABEL INSERT 기본값 셋팅
    SET v_RUNTYPE = p_RUNTYPE; -- AUTO(자동), MANUAL(수동)
    SELECT DATE_FORMAT(now(), '%Y%m%d%H%i%s') INTO v_RUNDATE FROM dual;  -- 실행 일자 세팅 ( YYYYMMDDHHMMSS )

    SET v_LOGMSG = CONCAT( '[START] 시작시간 - ', NOW());
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'INSPECTOR1', v_LOGMSG);

    IF p_RUNTYPE = 'MANUAL' THEN
        SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_RUNTYPE ,', INSPECTOR1 : ', p_INSPECTOR1_ACCOUNT , ', DATASET : ', p_DATASET_LIST, ', 분배기준 개수 :', p_DISTRIBUTION_CNT );
    ELSE
        SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_RUNTYPE ,', INSPECTOR1 : ', p_INSPECTOR1_ACCOUNT , ', DATASET : ', p_DATASET_LIST, ', 분배기준 개수 :', CAST(FLOOR((p_DISTRIBUTION_CNT/p_DISTRIBUTION_INSPECTOR_CNT)) AS CHAR) );
    END IF;

-- 	INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'INSPECTOR1', v_LOGMSG);


    IF p_RUNTYPE = 'MANUAL' THEN      -- 수동

        OPEN CURSOR_DATA;

        LOOP_DATA: LOOP         -- 내부 루프 시작
        FETCH CURSOR_DATA INTO c_DATA_ID;

        -- 검수자의 최대 할당개수, 현재 할당된 개수 조회
        SELECT
            MAX_HOLDING_DATA_CNT
             ,(SELECT COUNT(DATA_ID)
               FROM TB_DATA AS DT
                        JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
               WHERE 1=1
                 AND 	PROJECT_ID 		  = p_PROJECT_ID
                 AND 	DTS.USE_STATUS	  = 'U'
                 AND 	DT.USE_STATUS	  = 'U'
                 AND   `1ST_INSPECT_ACCOUNT` = USER_ACCOUNT -- 1차검수자 계정 체크
                 AND   WORK_STATUS	  = 'IR' 				-- 검수요청
                 AND   ASSIGN_1ST_INSPECT_DT IS NOT NULL   	-- 1차 할당일 체크

        ) AS CURRENT_DATA_CNT
        INTO v_MAX_HOLDING_DATA_CNT, v_CURRENT_DATA_CNT

        FROM TB_PROJECT_USER AS P_USER
                 JOIN TB_PROJECT 		AS P ON P.PROJECT_ID = P_USER.PROJECT_ID
        WHERE
                P.PROJECT_ID = p_PROJECT_ID	-- 프로젝트ID
          AND P_USER.USER_ACCOUNT = p_INSPECTOR1_ACCOUNT; -- 사용자ID

        -- 클라이언트가 요청한 데이터 개수를 만족하면 루프를 종료
        IF (c_LIMIT_COUNT = p_DISTRIBUTION_CNT)
            OR v_MAX_HOLDING_DATA_CNT = v_CURRENT_DATA_CNT
            -- OR s_OUTER_DONE

        THEN
            CLOSE CURSOR_DATA;
            LEAVE LOOP_DATA;
        END IF;

        -- 데이터 테이블 업데이트(검수자 할당)
        UPDATE TB_DATA
        SET
            `1ST_INSPECT_ACCOUNT` 	= p_INSPECTOR1_ACCOUNT			-- 검수자 계정
          ,ASSIGN_1ST_INSPECT_DT 	= DATE_FORMAT(now(), '%Y%m%d')	-- 검수할당 일자
          -- ,WORK_STATUS = 'AW'								    -- 검수할당일 경우에는 이력테이블에만 'A1' 1차검수할당을 업데이트
          ,LAST_UPD_ACCOUNT = p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
          ,LAST_UPD_DTM = DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
        WHERE 1=1
          AND DATA_ID = c_DATA_ID;

        SELECT WORK_ROLE INTO v_WORK_ROLE   -- 매니저 또는 슈퍼관리자 권한
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID = p_PROJECT_ID
          AND USER_ACCOUNT = p_MANAGER_ACCOUNT;

        -- 데이터 히스토리 업데이트
        INSERT INTO TB_DATA_HISTORY(
                                    DATA_ID
                                   ,WORK_STATUS
                                   ,ACTION_ACCOUNT
                                   ,ACTION_WORK_ROLE
                                   ,TARGET_ACCOUNT
                                   ,TARGET_WORK_ROLE
                                   ,ACTION_DTM
                                   ,FIRST_INS_ACCOUNT
                                   ,FIRST_INS_DTM
                                   ,LAST_UPD_ACCOUNT
                                   ,LAST_UPD_DTM)
        VALUES(
                  c_DATA_ID
              ,'A1'					-- A1 : 1차검수자 할당
              ,p_MANAGER_ACCOUNT
              ,v_WORK_ROLE
              ,p_INSPECTOR1_ACCOUNT
              ,'I1'					-- I1 : 1차검수자
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')  -- 액션일자
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              );

        SET c_LIMIT_COUNT = c_LIMIT_COUNT + 1;

        END LOOP;

        SET v_LOGMSG = CONCAT( '[LOG] - 할당대상ID : ', p_INSPECTOR1_ACCOUNT,', - 분배자 ID : ', p_MANAGER_ACCOUNT , ', 할당건수 : ', c_LIMIT_COUNT, ', 할당합계 : ' , v_CURRENT_DATA_CNT ,', (할당)최대개수 : ', v_MAX_HOLDING_DATA_CNT);
        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'INSPECTOR1', v_LOGMSG);

        SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'INSPECTOR1', v_LOGMSG);

        -- RETURN VALUE
        SET p_RTN_VALUE = 1;

    ELSE -- 자동

        BLOCK_OUTER: BEGIN        -- // 내부 프로시져 블럭 시작

            -- 2번째 Corsor for INSPECTOR1 LIST
            DECLARE CURSOR_INSPECTOR1 CURSOR FOR
                SELECT USER_ACCOUNT, MAX_HOLDING_DATA_CNT
                     ,(SELECT COUNT(DATA_ID)
                       FROM TB_DATA AS DT
                                JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
                       WHERE 1=1
                         AND	PROJECT_ID	  = p_PROJECT_ID
                         AND	DTS.USE_STATUS	  = 'U'
                         AND	DT.USE_STATUS	  = 'U'
                         AND   `1ST_INSPECT_ACCOUNT` = USER_ACCOUNT -- 1차검수자 계정 체크
                         AND   WORK_STATUS	  = 'IR' 				-- 검수요청
                         AND   ASSIGN_1ST_INSPECT_DT IS NOT NULL   	-- 1차 할당일 체크
                ) AS CURRENT_DATA_CNT

                FROM TB_PROJECT_USER AS P_USER
                         JOIN TB_PROJECT 		AS P ON P.PROJECT_ID = P_USER.PROJECT_ID
                WHERE
                        P.PROJECT_ID = p_PROJECT_ID	-- 프로젝트ID
                  AND P.USE_STATUS = 'U'			-- 사용유무 체크
                  AND P_USER.USE_STATUS = 'U'		-- 사용유무 체크
                  AND AUTO_DISTRIBUTION_YN = 'Y'	-- 자동분배여부 체크
                  AND WORK_ROLE = 'I1'			-- 검수자만
                  AND MAX_HOLDING_DATA_CNT >
                      (SELECT COUNT(DATA_ID)
                       FROM TB_DATA AS DT
                                JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
                       WHERE 	1=1
                         AND 	PROJECT_ID	  = p_PROJECT_ID
                         AND 	DTS.USE_STATUS	  = 'U'
                         AND 	DT.USE_STATUS	  = 'U'
                         AND   `1ST_INSPECT_ACCOUNT` = USER_ACCOUNT -- 1차검수자 계정 체크
                         AND   WORK_STATUS	  = 'IR' 				-- 검수요청
                         AND   ASSIGN_1ST_INSPECT_DT IS NOT NULL   	-- 1차 할당일 체크
                      );

            /* 커서 종료조건 : 더이상 없다면 종료 */
            DECLARE CONTINUE HANDLER
                FOR NOT FOUND SET s_INNER_DONE := TRUE;

            OPEN CURSOR_INSPECTOR1; 														-- DATA CURSOR OPEN

            LOOP_OUTER: LOOP         	-- 외부 루프 시작 (INSPECTOR1)
            FETCH CURSOR_INSPECTOR1 INTO c_INSPECTOR1_ACCOUNT, c_MAX_HOLDING_DATA_CNT, c_CURRENT_DATA_CNT;
            IF s_INNER_DONE OR s_OUTER_DONE THEN
                CLOSE CURSOR_INSPECTOR1;
                LEAVE LOOP_OUTER;
            END IF;

            OPEN CURSOR_DATA;


            LOOP_INNER: LOOP         -- 내부 루프 시작 (DATA)
            FETCH CURSOR_DATA INTO c_DATA_ID;
            --
            IF (c_LIMIT_COUNT = (p_DISTRIBUTION_CNT / p_DISTRIBUTION_INSPECTOR_CNT))	-- 전체 건수 = (분배건수 / 검수자 수 )  자동일 경우 분배건수 = (검수자수*일괄분배수량)
                OR (c_MAX_HOLDING_DATA_CNT = c_CURRENT_DATA_CNT) 					-- 검수자별 MAX 수량 = 현재할당된 수량
            THEN
                CLOSE CURSOR_DATA;
                LEAVE LOOP_INNER;
            END IF;

            -- 데이터 테이블 업데이트(검수자 할당)
            UPDATE TB_DATA
            SET
                `1ST_INSPECT_ACCOUNT` 	= c_INSPECTOR1_ACCOUNT					-- 검수자 계정
              ,ASSIGN_1ST_INSPECT_DT 	= DATE_FORMAT(now(), '%Y%m%d')		-- 작업할당 일자
              -- ,WORK_STATUS = 'AW'										-- 검수할당의 경우에는 이력테이블에만 'A1' 1차검수할당을 업데이트
              ,LAST_UPD_ACCOUNT = 'SYSTEM'							-- AUTO 이기 때문에 SYSTEM
              ,LAST_UPD_DTM = DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
            WHERE 1=1
              AND DATA_ID = c_DATA_ID;

            -- 데이터 히스토리 업데이트
            INSERT INTO TB_DATA_HISTORY(
                                        DATA_ID
                                       ,WORK_STATUS
                                       ,TARGET_ACCOUNT
                                       ,TARGET_WORK_ROLE
                                       ,ACTION_DTM
                                       ,FIRST_INS_ACCOUNT
                                       ,FIRST_INS_DTM
                                       ,LAST_UPD_ACCOUNT
                                       ,LAST_UPD_DTM)
            VALUES(
                      c_DATA_ID
                  ,'A1'					-- A1 : 1차검수자 할당
                  ,c_INSPECTOR1_ACCOUNT
                  ,'I1'					-- I1 : 1차검수자
                  ,DATE_FORMAT(now(), '%Y%m%d')
                  ,'SYSTEM'
                  ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
                  ,'SYSTEM'
                  ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
                  );


            SET c_LIMIT_COUNT = c_LIMIT_COUNT +1;						-- 할당할 데이터 수 +1  (배분지정개수)
            SET c_CURRENT_DATA_CNT = c_CURRENT_DATA_CNT + 1;			-- 유저별 현재 할당된 데이터 수 +1 (유저별 MAX 체크

            END LOOP LOOP_INNER;


            SET v_TOTAL_DATA_CNT = c_CURRENT_DATA_CNT;

            SET v_LOGMSG = CONCAT( '[LOG] - 할당대상ID : ', c_INSPECTOR1_ACCOUNT,', - 분배자 ID : ', p_MANAGER_ACCOUNT , ', 할당건수 : ', c_LIMIT_COUNT, ',  할당합계 : ', v_TOTAL_DATA_CNT , ', (할당)최대개수 : ', c_MAX_HOLDING_DATA_CNT);
            -- 할당 LIMIT  초기화
            SET c_LIMIT_COUNT = 0;
            INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'INSPECTOR1', v_LOGMSG);

            END LOOP LOOP_OUTER;

        END BLOCK_OUTER;

        SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'INSPECTOR1', v_LOGMSG);

        -- RETURN VALUE
        SET p_RTN_VALUE = 1;

    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inspector1_inspection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_inspector1_inspection`(IN p_PROJECT_ID INT, IN p_INSPECTOR_ACCOUNT VARCHAR(4000), p_MANAGER_ACCOUNT VARCHAR(50),  IN p_INSPECTION_NUM INT, OUT p_RTN_VALUE INT)
BLOCK_OUTER: BEGIN
    -- 1차 검수자 검수 프로시저

    DECLARE s_OUTER_DONE BOOLEAN DEFAULT FALSE;

    DECLARE v_RUNDATE CHAR(14);
    DECLARE v_LOGMSG VARCHAR(4000);

    DECLARE v_WORK_ROLE VARCHAR(5);  			-- 계정권한 (매니저 또는 슈퍼관리자)

    DECLARE c_INSPECTOR_ACCOUNT VARCHAR(100);      -- cursor 변수
    -- DECLARE c_DATA_ID INT;  				  	-- cursor 변수
    DECLARE c_LIMIT_COUNT INT;  				-- cursor 변수

    DECLARE v_SQL_STATE varchar(5);		  		-- ERROR 상태
    DECLARE v_INT_ERROR_NO INT;				  	-- ERROR NUM
    DECLARE v_TXT_ERROR_MSG TEXT;		      	-- ERROR MSG

    DECLARE v_DEFAULT_RUNTYPE 			VARCHAR(6);				-- DEFAULT STRING 구동타입
    DECLARE v_DEFAULT_INSPECTOR 		VARCHAR(10);
    DECLARE V_DEFAULT_INSPECTION 		VARCHAR(10);
    DECLARE v_DEFAULT_WORK_STATUS_C1 	VARCHAR(2);
    DECLARE v_DEFAULT_WORK_STATUS_C2 	VARCHAR(2);
    DECLARE v_DEFAULT_INSPECTOR_ROLE_I1 	VARCHAR(2);

    -- 1번째 Corsor for DATA LIST
    DECLARE CURSOR_INSPECTOR CURSOR FOR
        SELECT USER_ACCOUNT
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID 	= p_PROJECT_ID
          AND WORK_ROLE	= 'I1'			-- 1차검수자(라벨러)
          AND USE_STATUS 	= 'U'    		-- 사용중
          AND FIND_IN_SET(USER_ACCOUNT, p_INSPECTOR_ACCOUNT);

    /* 커서 종료조건 : 더이상 없다면 종료 */
    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET s_OUTER_DONE := TRUE;

    --  DEFAULT 셋팅
    SET v_DEFAULT_RUNTYPE 				= 'MANUAL';			-- 수동
    SET v_DEFAULT_INSPECTOR 			= 'INSPECTOR1';		-- 검수자1
    SET V_DEFAULT_INSPECTION 			= 'INSPECTION';		-- 검수
    SET v_DEFAULT_WORK_STATUS_C1 		= 'C1';		-- 1차 검수완료
    SET v_DEFAULT_WORK_STATUS_C2 		= 'C2';		-- 2차 검수완료
    SET v_DEFAULT_INSPECTOR_ROLE_I1 	= 'I1';		-- 계정 _ 권한

    -- 할당건수 0 초기화
    SET c_LIMIT_COUNT = 0;

    -- LOG TABEL INSERT 기본값 셋팅
    SELECT DATE_FORMAT(now(), '%Y%m%d%H%i%s') INTO v_RUNDATE FROM dual;  -- 실행 일자 세팅 ( YYYYMMDDHHMMSS )

    SET v_LOGMSG = CONCAT( '[START] 시작시간 - ', NOW());
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, V_DEFAULT_INSPECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_DEFAULT_RUNTYPE , ', ',  v_DEFAULT_INSPECTOR, ' : ', p_INSPECTOR_ACCOUNT , ', MANAGER_ACCOUNT : ', p_MANAGER_ACCOUNT);

    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, V_DEFAULT_INSPECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    -- 커서 시작
    OPEN CURSOR_INSPECTOR;

    -- 데이터 루프시작
    LOOP_OUTER: LOOP         -- 내부 루프 시작
    FETCH CURSOR_INSPECTOR INTO c_INSPECTOR_ACCOUNT;

    -- 클라이언트가 요청한 데이터 개수를 만족하면 루프를 종료
    IF s_OUTER_DONE
    THEN
        CLOSE CURSOR_INSPECTOR;
        LEAVE LOOP_OUTER;
    END IF;

    BLOCK_INNER: BEGIN
        DECLARE s_INNER_DONE BOOLEAN DEFAULT FALSE;
        DECLARE c_DATA_ID INT;  				  	-- cursor 변수

        -- 내부 CURSOR 시작
        DECLARE CURSOR_DATA CURSOR FOR
            /*
            SELECT
                DATA_ID
             FROM TB_DATA	AS DT
             JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
             WHERE 1=1
             AND PROJECT_ID 				= p_PROJECT_ID
             AND `1ST_INSPECT_ACCOUNT` 		= c_INSPECTOR_ACCOUNT
             AND WORK_STATUS				= v_DEFAULT_WORK_STATUS_C1	-- 1차검수완료 단계
             AND ASSIGN_1ST_INSPECT_DT 		IS NOT NULL
             AND COMPLETE_1ST_INSPECT_DT 	IS NOT NULL
             AND DTS.USE_STATUS 			= 'U'
             AND DT.USE_STATUS 				= 'U';
            */
            SELECT
                DATA_ID
            FROM TB_DATA	AS DT
                     JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
            WHERE 1=1
              AND PROJECT_ID 				= p_PROJECT_ID
              AND `1ST_INSPECT_ACCOUNT` 		= c_INSPECTOR_ACCOUNT
              AND WORK_STATUS				= v_DEFAULT_WORK_STATUS_C1	-- 1차검수완료 단계
              AND ASSIGN_1ST_INSPECT_DT 		IS NOT NULL
              AND COMPLETE_1ST_INSPECT_DT 	IS NOT NULL
              AND (`2ND_INSPECT_ACCOUNT`      IS NOT NULL OR `2ND_INSPECT_ACCOUNT` != '')
              AND (ASSIGN_2ND_INSPECT_DT      IS NOT NULL OR ASSIGN_2ND_INSPECT_DT != '')
              AND DTS.USE_STATUS 			= 'U'
              AND DT.USE_STATUS 				= 'U';

        /* 커서 종료조건 : 더이상 없다면 종료 */
        DECLARE CONTINUE HANDLER
            FOR NOT FOUND SET s_INNER_DONE := TRUE;

        OPEN CURSOR_DATA;

        LOOP_INNER: LOOP         -- 내부 루프 시작 (DATA)
        FETCH CURSOR_DATA INTO c_DATA_ID;

        IF s_INNER_DONE
        THEN
            CLOSE CURSOR_DATA;
            LEAVE LOOP_INNER;
        END IF;

        -- 데이터 테이블 업데이트(작업자 할당)
        /*
        UPDATE TB_DATA
        SET
             WORK_STATUS 				= v_DEFAULT_WORK_STATUS_C2		-- 2차 검수완료
            ,`2ND_INSPECT_ACCOUNT` 		= 	p_MANAGER_ACCOUNT
            ,ASSIGN_2ND_INSPECT_DT		=	DATE_FORMAT(CURRENT_TIMESTAMP, '%Y%m%d')
            ,COMPLETE_2ND_INSPECT_DT	=	DATE_FORMAT(CURRENT_TIMESTAMP, '%Y%m%d')
            ,LAST_UPD_ACCOUNT 			= 	p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
            ,LAST_UPD_DTM 				= 	DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
        WHERE 1=1
        AND DATA_ID = c_DATA_ID;
        */

        UPDATE TB_DATA
        SET
            WORK_STATUS 				= v_DEFAULT_WORK_STATUS_C2		-- 2차 검수완료
          ,ASSIGN_2ND_INSPECT_DT		=	DATE_FORMAT(CURRENT_TIMESTAMP, '%Y%m%d')
          ,COMPLETE_2ND_INSPECT_DT	=	DATE_FORMAT(CURRENT_TIMESTAMP, '%Y%m%d')
          ,LAST_UPD_ACCOUNT 			= 	p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
          ,LAST_UPD_DTM 				= 	DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
        WHERE 1=1
          AND DATA_ID = c_DATA_ID;


        SELECT IFNULL(MAX(WORK_ROLE), 'S') AS WORK_ROLE INTO v_WORK_ROLE   -- 매니저 또는 슈퍼관리자 권한
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID = p_PROJECT_ID
          AND USER_ACCOUNT = p_MANAGER_ACCOUNT;

        -- 데이터 히스토리 업데이트
        INSERT INTO TB_DATA_HISTORY(
                                    DATA_ID
                                   ,WORK_STATUS
                                   ,ACTION_ACCOUNT
                                   ,ACTION_WORK_ROLE
                                   ,TARGET_ACCOUNT
                                   ,TARGET_WORK_ROLE
                                   ,ACTION_DTM
                                   ,FIRST_INS_ACCOUNT
                                   ,FIRST_INS_DTM
                                   ,LAST_UPD_ACCOUNT
                                   ,LAST_UPD_DTM)
        VALUES(
                  c_DATA_ID
              ,v_DEFAULT_WORK_STATUS_C2							-- W1 : 1차검수자 회수
              ,p_MANAGER_ACCOUNT
              ,v_WORK_ROLE
              ,c_INSPECTOR_ACCOUNT
              ,v_DEFAULT_INSPECTOR_ROLE_I1						-- I1 : 1차검수자
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')  	-- 액션일자
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              );

        SET c_LIMIT_COUNT = c_LIMIT_COUNT + 1;

        END LOOP LOOP_INNER;

    END BLOCK_INNER;

    END LOOP LOOP_OUTER;

    SET v_LOGMSG = CONCAT( '[LOG] - 검수대상ID : ', p_INSPECTOR_ACCOUNT,', - 검수자 ID : ', p_MANAGER_ACCOUNT , ', 검수 총건수 : ', c_LIMIT_COUNT);
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, V_DEFAULT_INSPECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, V_DEFAULT_INSPECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    -- RETURN VALUE
    SET p_RTN_VALUE = 1;


    COMMIT;
END BLOCK_OUTER ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inspector1_recall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_inspector1_recall`(IN p_PROJECT_ID INT, IN p_INSPECTOR_ACCOUNT VARCHAR(4000), p_MANAGER_ACCOUNT VARCHAR(50), IN p_INSPECTION_NUM INT, OUT p_RTN_VALUE INT)
BLOCK_OUTER : BEGIN
    -- 1차검수자 회수 프로시저

    DECLARE s_OUTER_DONE BOOLEAN DEFAULT FALSE;

    DECLARE v_RUNDATE CHAR(14);
    DECLARE v_LOGMSG VARCHAR(2000);

    DECLARE v_WORK_ROLE VARCHAR(5);  			-- 계정권한 (매니저 또는 슈퍼관리자)

    DECLARE c_INSPECTOR_ACCOUNT VARCHAR(100);      -- cursor 변수
    -- DECLARE c_DATA_ID INT;  				  	-- cursor 변수
    DECLARE c_LIMIT_COUNT INT;  				-- cursor 변수

    DECLARE v_SQL_STATE varchar(5);		  		-- ERROR 상태
    DECLARE v_INT_ERROR_NO INT;				  	-- ERROR NUM
    DECLARE v_TXT_ERROR_MSG TEXT;		      	-- ERROR MSG

    DECLARE v_DEFAULT_RUNTYPE 			VARCHAR(6);				-- DEFAULT STRING 구동타입
    DECLARE v_DEFAULT_INSPECTOR 		VARCHAR(10);
    DECLARE v_DEFAULT_RECALL 			VARCHAR(6);
    DECLARE v_DEFAULT_WORK_STATUS_IR 	VARCHAR(2);
    DECLARE v_DEFAULT_WORK_STATUS_W1 	VARCHAR(2);
    DECLARE v_DEFAULT_INSPECTOR_ROLE_I1 VARCHAR(2);

    -- 1번째 Corsor for DATA LIST
    DECLARE CURSOR_INSPECTOR CURSOR FOR
        SELECT USER_ACCOUNT
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID 	= p_PROJECT_ID
          AND WORK_ROLE	= 'I1'			-- 1차검수자(라벨러)
          AND USE_STATUS 	= 'U'    		-- 사용중
          AND FIND_IN_SET(USER_ACCOUNT, p_INSPECTOR_ACCOUNT);

    /* 커서 종료조건 : 더이상 없다면 종료 */
    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET s_OUTER_DONE := TRUE;

    --  DEFAULT 셋팅
    SET v_DEFAULT_RUNTYPE 	= 'MANUAL';			-- 수동
    SET v_DEFAULT_INSPECTOR = 'INSPECTOR1';		-- 검수자1
    SET v_DEFAULT_RECALL 	= 'RECALL';			-- 회수
    SET v_DEFAULT_WORK_STATUS_IR 	= 'IR';		-- 검수요청 (검수자가 할당되기전 마지막 상태)
    SET v_DEFAULT_WORK_STATUS_W1 	= 'W1';		-- 1차검수자회수
    SET v_DEFAULT_INSPECTOR_ROLE_I1 	= 'I1';		-- 계정 _ 권한

    -- 할당건수 0 초기화
    SET c_LIMIT_COUNT = 0;

    -- LOG TABEL INSERT 기본값 셋팅
    SELECT DATE_FORMAT(now(), '%Y%m%d%H%i%s') INTO v_RUNDATE FROM dual;  -- 실행 일자 세팅 ( YYYYMMDDHHMMSS )

    SET v_LOGMSG = CONCAT( '[START] 시작시간 - ', NOW());
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_DEFAULT_RUNTYPE , ', ',  v_DEFAULT_INSPECTOR, ' : ', p_INSPECTOR_ACCOUNT , ', MANAGER_ACCOUNT : ', p_MANAGER_ACCOUNT);

    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);


    -- 커서 시작
    OPEN CURSOR_INSPECTOR;

    -- 데이터 루프시작
    LOOP_OUTER: LOOP         -- 내부 루프 시작
    FETCH CURSOR_INSPECTOR INTO c_INSPECTOR_ACCOUNT;

    -- 클라이언트가 요청한 데이터 개수를 만족하면 루프를 종료
    IF s_OUTER_DONE
    THEN
        CLOSE CURSOR_INSPECTOR;
        LEAVE LOOP_OUTER;
    END IF;

    BLOCK_INNER: BEGIN
        DECLARE s_INNER_DONE BOOLEAN DEFAULT FALSE;
        DECLARE c_DATA_ID INT;  				  	-- cursor 변수



        -- DATA 조회  : 검수요청 상태에서는 검수자에게 할당되지 않은 데이터만 회수처리.
        -- 내부 CURSOR 시작
        DECLARE CURSOR_DATA CURSOR FOR
            /**
            SELECT
                DATA_ID
             FROM TB_DATA AS DT
             JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
             WHERE 1=1
             AND PROJECT_ID = p_PROJECT_ID
             AND `1ST_INSPECT_ACCOUNT` 		= c_INSPECTOR_ACCOUNT
             AND WORK_STATUS				= v_DEFAULT_WORK_STATUS_IR	-- 검수요청 단계
             AND (`2ND_INSPECT_ACCOUNT` IS NULL OR `2ND_INSPECT_ACCOUNT` = '')
             AND (ASSIGN_2ND_INSPECT_DT IS NULL OR ASSIGN_2ND_INSPECT_DT = '')
             AND (COMPLETE_1ST_INSPECT_DT IS NULL OR COMPLETE_1ST_INSPECT_DT = '')
             AND (COMPLETE_2ND_INSPECT_DT IS NULL OR COMPLETE_2ND_INSPECT_DT = '')
             AND DTS.USE_STATUS = 'U'
             AND DT.USE_STATUS = 'U';
            */

            SELECT
                DATA_ID
            FROM TB_DATA AS DT
                     JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
            WHERE 1=1
              AND PROJECT_ID = p_PROJECT_ID
              AND `1ST_INSPECT_ACCOUNT` 		= c_INSPECTOR_ACCOUNT
              AND
                CASE WHEN p_INSPECTION_NUM = 1
                         THEN
                             (COMPLETE_1ST_INSPECT_DT IS NULL OR COMPLETE_1ST_INSPECT_DT = '')
                             AND DT.WORK_STATUS != 'R1'
                     ELSE
                             (COMPLETE_2ND_INSPECT_DT IS NULL OR COMPLETE_2ND_INSPECT_DT = '')
                             AND DT.WORK_STATUS != 'R2'
                    END
              AND DTS.USE_STATUS = 'U'
              AND DT.USE_STATUS = 'U';

        /* 커서 종료조건 : 더이상 없다면 종료 */
        DECLARE CONTINUE HANDLER
            FOR NOT FOUND SET s_INNER_DONE := TRUE;

        OPEN CURSOR_DATA;

        LOOP_INNER: LOOP         -- 내부 루프 시작 (DATA)
        FETCH CURSOR_DATA INTO c_DATA_ID;

        IF s_INNER_DONE
        THEN
            CLOSE CURSOR_DATA;
            LEAVE LOOP_INNER;
        END IF;

        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, c_DATA_ID);

        -- 데이터 테이블 업데이트(작업자 할당)
        /**
         UPDATE TB_DATA
         SET
              `1ST_INSPECT_ACCOUNT` 	= NULL							-- 1차 검수자 계정 초기화
             ,ASSIGN_1ST_INSPECT_DT 	= NULL							-- 1차 검수자 할당일 초기화
             -- ,WORK_STATUS 		= v_DEFAULT_WORK_STATUS_IR		-- 데이터 회수( 검수요청단계 - 검수자 할당 바로 전 단계 )
             ,LAST_UPD_ACCOUNT 	= p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
             ,LAST_UPD_DTM 		= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
         WHERE 1=1
         AND DATA_ID = c_DATA_ID;

         SELECT IFNULL(MAX(WORK_ROLE), 'S') AS WORK_ROLE INTO v_WORK_ROLE   -- 매니저 또는 슈퍼관리자 권한
         FROM TB_PROJECT_USER
         WHERE 1=1
         AND PROJECT_ID = p_PROJECT_ID
         AND USER_ACCOUNT = p_MANAGER_ACCOUNT;
         */
        IF p_INSPECTION_NUM = 1 THEN
            UPDATE TB_DATA
            SET
                `1ST_INSPECT_ACCOUNT` 	= NULL							-- 1차 검수자 계정 초기화
              ,ASSIGN_1ST_INSPECT_DT 	= NULL							-- 1차 검수자 할당일 초기화
              ,1ST_REJECT_DT = NULL									-- 1차 반려 일 초기화
              ,1ST_REJECT_MEMO = NULL 								-- 1차 반려 메모 초기화
              ,REJECT_COUNT = NULL                                    -- 반려 누적수 초기화
              ,WORK_STATUS 		= v_DEFAULT_WORK_STATUS_IR		-- 데이터 회수( 검수요청단계 - 검수자 할당 바로 전 단계 )
              ,LAST_UPD_ACCOUNT 	= p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
              ,LAST_UPD_DTM 		= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
            WHERE 1=1
              AND DATA_ID = c_DATA_ID;
        ELSE
            UPDATE TB_DATA
            SET
                `1ST_INSPECT_ACCOUNT` 	= NULL							-- 1차 검수자 계정 초기화
              ,ASSIGN_1ST_INSPECT_DT 	= NULL							-- 1차 검수자 할당일 초기화
              ,1ST_REJECT_DT = NULL									-- 1차 반려 일 초기화
              ,1ST_REJECT_MEMO = NULL 								-- 1차 반려 메모 초기화
              ,COMPLETE_1ST_INSPECT_DT = NULL							-- 1차 검수 완료 초기화
              ,2ND_INSPECT_ACCOUNT = NULL                             -- 2차 검수자 계정 초기화
              ,ASSIGN_2ND_INSPECT_DT = NULL                           -- 2차 검수자 할당일 초기화
              ,2ND_REJECT_DT = NULL                                   -- 2차 반려 일 초기화
              ,2ND_REJECT_MEMO = NULL                                 -- 2차 반려 메모 초기화
              ,REJECT_COUNT = 0                                    -- 반려 누적수 초기화
              ,WORK_STATUS 		= v_DEFAULT_WORK_STATUS_IR		-- 데이터 회수( 검수요청단계 - 검수자 할당 바로 전 단계 )
              ,LAST_UPD_ACCOUNT 	= p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
              ,LAST_UPD_DTM 		= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
            WHERE 1=1
              AND DATA_ID = c_DATA_ID;
        END IF;

        SELECT IFNULL(MAX(WORK_ROLE), 'S') AS WORK_ROLE INTO v_WORK_ROLE   -- 매니저 또는 슈퍼관리자 권한
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID = p_PROJECT_ID
          AND USER_ACCOUNT = p_MANAGER_ACCOUNT;

        -- 데이터 히스토리 업데이트
        INSERT INTO TB_DATA_HISTORY(
                                    DATA_ID
                                   ,WORK_STATUS
                                   ,ACTION_ACCOUNT
                                   ,ACTION_WORK_ROLE
                                   ,TARGET_ACCOUNT
                                   ,TARGET_WORK_ROLE
                                   ,ACTION_DTM
                                   ,FIRST_INS_ACCOUNT
                                   ,FIRST_INS_DTM
                                   ,LAST_UPD_ACCOUNT
                                   ,LAST_UPD_DTM)
        VALUES(
                  c_DATA_ID
              ,v_DEFAULT_WORK_STATUS_W1							-- W1 : 1차검수자 회수
              ,p_MANAGER_ACCOUNT
              ,v_WORK_ROLE
              ,c_INSPECTOR_ACCOUNT
              ,v_DEFAULT_INSPECTOR_ROLE_I1						-- I1 : 1차검수자
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')  	-- 액션일자
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              );

        SET c_LIMIT_COUNT = c_LIMIT_COUNT + 1;

        END LOOP LOOP_INNER;

    END BLOCK_INNER;

    END LOOP LOOP_OUTER;

    SET v_LOGMSG = CONCAT( '[LOG] - 회수대상ID : ', p_INSPECTOR_ACCOUNT,', - 회수자 ID : ', p_MANAGER_ACCOUNT , ', 회수 총건수 : ', c_LIMIT_COUNT);
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    -- RETURN VALUE
    SET p_RTN_VALUE = 1;


    COMMIT;
END BLOCK_OUTER ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inspector1_rejection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_inspector1_rejection`(IN p_PROJECT_ID INT, IN p_INSPECTOR_ACCOUNT VARCHAR(4000), p_MANAGER_ACCOUNT VARCHAR(50), OUT p_RTN_VALUE INT)
BLOCK_OUTER : BEGIN
    -- 1차 검수자 반려 프로시저

    DECLARE s_OUTER_DONE BOOLEAN DEFAULT FALSE;

    DECLARE v_RUNDATE CHAR(14);
    DECLARE v_LOGMSG VARCHAR(2000);

    DECLARE v_WORK_ROLE VARCHAR(5);  			-- 계정권한 (매니저 또는 슈퍼관리자)

    DECLARE c_INSPECTOR_ACCOUNT VARCHAR(100);      -- cursor 변수
    -- DECLARE c_DATA_ID INT;  				  	-- cursor 변수
    DECLARE c_LIMIT_COUNT INT;  				-- cursor 변수

    DECLARE v_SQL_STATE varchar(5);		  		-- ERROR 상태
    DECLARE v_INT_ERROR_NO INT;				  	-- ERROR NUM
    DECLARE v_TXT_ERROR_MSG TEXT;		      	-- ERROR MSG

    DECLARE v_DEFAULT_RUNTYPE 			VARCHAR(6);				-- DEFAULT STRING 구동타입
    DECLARE v_DEFAULT_INSPECTOR 		VARCHAR(10);
    DECLARE v_DEFAULT_REJECTION 		VARCHAR(10);
    DECLARE v_DEFAULT_WORK_STATUS_C1 	VARCHAR(2);
    DECLARE v_DEFAULT_WORK_STATUS_R2 	VARCHAR(2);
    DECLARE v_DEFAULT_INSPECTOR_ROLE_I1 	VARCHAR(2);

    -- 1번째 Corsor for DATA LIST
    DECLARE CURSOR_INSPECTOR CURSOR FOR
        SELECT USER_ACCOUNT
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID 	= p_PROJECT_ID
          AND WORK_ROLE	= 'I1'			-- 1차검수자(라벨러)
          AND USE_STATUS 	= 'U'    		-- 사용중
          AND FIND_IN_SET(USER_ACCOUNT, p_INSPECTOR_ACCOUNT);

    /* 커서 종료조건 : 더이상 없다면 종료 */
    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET s_OUTER_DONE := TRUE;

    --  DEFAULT 셋팅
    SET v_DEFAULT_RUNTYPE 	= 'MANUAL';			-- 수동
    SET v_DEFAULT_INSPECTOR = 'INSPECTOR1';		-- 검수자1
    SET v_DEFAULT_REJECTION = 'REJECTION';			-- 회수
    SET v_DEFAULT_WORK_STATUS_C1 	= 'C1';		-- 검수요청 (검수자가 할당되기전 마지막 상태)
    SET v_DEFAULT_WORK_STATUS_R2 	= 'R2';		-- 1차검수자회수
    SET v_DEFAULT_INSPECTOR_ROLE_I1 	= 'I1';		-- 계정 _ 권한

    -- 할당건수 0 초기화
    SET c_LIMIT_COUNT = 0;

    -- LOG TABEL INSERT 기본값 셋팅
    SELECT DATE_FORMAT(now(), '%Y%m%d%H%i%s') INTO v_RUNDATE FROM dual;  -- 실행 일자 세팅 ( YYYYMMDDHHMMSS )

    SET v_LOGMSG = CONCAT( '[START] 시작시간 - ', NOW());
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_REJECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_DEFAULT_RUNTYPE , ', ',  v_DEFAULT_INSPECTOR, ' : ', p_INSPECTOR_ACCOUNT , ', MANAGER_ACCOUNT : ', p_MANAGER_ACCOUNT);

    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_REJECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    -- 커서 시작
    OPEN CURSOR_INSPECTOR;

    -- 데이터 루프시작
    LOOP_OUTER: LOOP         -- 내부 루프 시작
    FETCH CURSOR_INSPECTOR INTO c_INSPECTOR_ACCOUNT;

    -- 클라이언트가 요청한 데이터 개수를 만족하면 루프를 종료
    IF s_OUTER_DONE
    THEN
        CLOSE CURSOR_INSPECTOR;
        LEAVE LOOP_OUTER;
    END IF;

    BLOCK_INNER: BEGIN
        DECLARE s_INNER_DONE BOOLEAN DEFAULT FALSE;
        DECLARE c_DATA_ID INT;  				  	-- cursor 변수

        -- 내부 CURSOR 시작
        DECLARE CURSOR_DATA CURSOR FOR
            /*
            SELECT
                DATA_ID
             FROM TB_DATA AS DT
             JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
             WHERE 1=1
             AND PROJECT_ID = p_PROJECT_ID
             AND `1ST_INSPECT_ACCOUNT` 		= c_INSPECTOR_ACCOUNT
             AND WORK_STATUS				= v_DEFAULT_WORK_STATUS_C1	-- 1차검수완료 단계
             AND (`2ND_INSPECT_ACCOUNT` IS NULL OR `2ND_INSPECT_ACCOUNT` = '')
             AND (ASSIGN_2ND_INSPECT_DT IS NULL OR ASSIGN_2ND_INSPECT_DT = '')
             AND DTS.USE_STATUS = 'U'
             AND DT.USE_STATUS = 'U'
             ;
            */

            SELECT
                DATA_ID
            FROM TB_DATA AS DT
                     JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
            WHERE 1=1
              AND PROJECT_ID = p_PROJECT_ID
              AND `1ST_INSPECT_ACCOUNT` 		= c_INSPECTOR_ACCOUNT
              AND WORK_STATUS				= v_DEFAULT_WORK_STATUS_C1	-- 1차검수완료 단계
              AND (`2ND_INSPECT_ACCOUNT` IS NOT NULL OR `2ND_INSPECT_ACCOUNT` != '')
              AND (ASSIGN_2ND_INSPECT_DT IS NOT NULL OR ASSIGN_2ND_INSPECT_DT != '')
              AND DTS.USE_STATUS = 'U'
              AND DT.USE_STATUS = 'U'
        ;

        /* 커서 종료조건 : 더이상 없다면 종료 */
        DECLARE CONTINUE HANDLER
            FOR NOT FOUND SET s_INNER_DONE := TRUE;

        OPEN CURSOR_DATA;

        LOOP_INNER: LOOP         -- 내부 루프 시작 (DATA)
        FETCH CURSOR_DATA INTO c_DATA_ID;

        IF s_INNER_DONE
        THEN
            CLOSE CURSOR_DATA;
            LEAVE LOOP_INNER;
        END IF;

        -- 메타(어노테이션) 테이블 업데이트
        UPDATE TB_META
        SET
            REJECT_YN			= 'Y'
          ,REJECT_CODE		= '005'
          ,REJECT_MEMO		= (SELECT CODE_NAME FROM TB_COMMON_CODE WHERE FIELD_NAME = 'REJECT_CODE' AND COMMON_CODE = '005')
        WHERE 1=1
          AND DATA_ID = c_DATA_ID;


        -- 데이터 테이블 업데이트(작업자 할당)
        /*
        UPDATE TB_DATA
        SET
            WORK_STATUS 				= v_DEFAULT_WORK_STATUS_R2						-- 2차 반려
            ,`2ND_REJECT_MEMO`			= (SELECT CODE_NAME FROM TB_COMMON_CODE WHERE FIELD_NAME = 'REJECT_CODE' AND COMMON_CODE = '005')
            ,`2ND_REJECT_DT` 			= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y%m%d')
            ,LAST_UPD_ACCOUNT 	= p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
            ,LAST_UPD_DTM 		= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
        WHERE 1=1
        AND DATA_ID = c_DATA_ID;
        */

        UPDATE TB_DATA
        SET
            WORK_STATUS 				= v_DEFAULT_WORK_STATUS_R2						-- 2차 반려
          ,`2ND_REJECT_MEMO`			= (SELECT CODE_NAME FROM TB_COMMON_CODE WHERE FIELD_NAME = 'REJECT_CODE' AND COMMON_CODE = '005')
          ,`2ND_REJECT_DT` 			= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y%m%d')
          ,LAST_UPD_ACCOUNT 	= p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
          ,LAST_UPD_DTM 		= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
        WHERE 1=1
          AND DATA_ID = c_DATA_ID;


        SELECT IFNULL(MAX(WORK_ROLE), 'S') AS WORK_ROLE INTO v_WORK_ROLE   -- 매니저 또는 슈퍼관리자 권한
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID = p_PROJECT_ID
          AND USER_ACCOUNT = p_MANAGER_ACCOUNT;

        -- 데이터 히스토리 업데이트
        INSERT INTO TB_DATA_HISTORY(
                                    DATA_ID
                                   ,WORK_STATUS
                                   ,ACTION_ACCOUNT
                                   ,ACTION_WORK_ROLE
                                   ,TARGET_ACCOUNT
                                   ,TARGET_WORK_ROLE
                                   ,ACTION_DTM
                                   ,FIRST_INS_ACCOUNT
                                   ,FIRST_INS_DTM
                                   ,LAST_UPD_ACCOUNT
                                   ,LAST_UPD_DTM)
        VALUES(
                  c_DATA_ID
              ,v_DEFAULT_WORK_STATUS_R2							-- W1 : 1차검수자 회수
              ,p_MANAGER_ACCOUNT
              ,v_WORK_ROLE
              ,c_INSPECTOR_ACCOUNT
              ,v_DEFAULT_INSPECTOR_ROLE_I1						-- I1 : 1차검수자
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')  	-- 액션일자
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              );

        SET c_LIMIT_COUNT = c_LIMIT_COUNT + 1;

        END LOOP LOOP_INNER;

    END BLOCK_INNER;

    END LOOP LOOP_OUTER;

    SET v_LOGMSG = CONCAT( '[LOG] - 반려대상ID : ', p_INSPECTOR_ACCOUNT,', - 반려행위자 ID : ', p_MANAGER_ACCOUNT , ', 반려 총건수 : ', c_LIMIT_COUNT);
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_REJECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_REJECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    -- RETURN VALUE
    SET p_RTN_VALUE = 1;


    COMMIT;
END BLOCK_OUTER ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inspector2_distribution` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_inspector2_distribution`(IN p_PROJECT_ID INT, IN p_INSPECTOR2_ACCOUNT VARCHAR(50), p_MANAGER_ACCOUNT VARCHAR(50),
                                                                 IN p_DATASET_LIST VARCHAR(4000), IN p_DISTRIBUTION_CNT INT, IN p_DISTRIBUTION_INSPECTOR_CNT INT, IN p_RUNTYPE VARCHAR(10), OUT p_RTN_VALUE INT)
BEGIN
    -- 2차 검수자 배분 프로시저

    DECLARE s_OUTER_DONE BOOLEAN DEFAULT FALSE;
    DECLARE s_INNER_DONE BOOLEAN DEFAULT FALSE;

    DECLARE v_RUNDATE CHAR(14);
    DECLARE v_RUNTYPE VARCHAR(20);
    DECLARE v_LOGMSG VARCHAR(2000);

    DECLARE v_WORK_ROLE VARCHAR(5);  			-- 계정권한 (매니저 또는 슈퍼관리자)
    DECLARE v_MAX_HOLDING_DATA_CNT INT;			-- 유저 MAX 데이터 건수
    DECLARE v_CURRENT_DATA_CNT INT;				-- 현재 유저에게 할당된 데이터 건수 ((1차,2차) 검수완료를 제외한)
    DECLARE v_TOTAL_DATA_CNT INT;				-- 검수자 별 할당된 이후 갖고있는 (배분)데이터 총 개수

    DECLARE c_INSPECTOR2_ACCOUNT VARCHAR(100);      -- cursor 변수
    DECLARE c_DATA_ID INT;  				  		-- cursor 변수
    DECLARE c_LIMIT_COUNT INT;  					-- cursor 변수
    DECLARE c_MAX_HOLDING_DATA_CNT INT; 			-- cursor 변수 (검수자별 MAX수량)
    DECLARE c_CURRENT_DATA_CNT INT; 				-- cursor 변수 (검수자별 현재 갖고있는 데이터 수량)

    DECLARE v_SQL_STATE varchar(5);		  			-- ERROR 상태
    DECLARE v_INT_ERROR_NO INT;				  		-- ERROR NUM
    DECLARE v_TXT_ERROR_MSG TEXT;		      		-- ERROR MSG


    -- 1번째 Corsor for DATA LIST
    DECLARE CURSOR_DATA CURSOR FOR
        SELECT DATA_ID
        FROM TB_DATA AS DT
                 JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
        WHERE 1=1
          AND PROJECT_ID = p_PROJECT_ID
          AND DTS.USE_STATUS = 'U'    -- 사용중
          AND DT.USE_STATUS = 'U'    -- 사용중
          AND WORK_STATUS = 'C1'  -- 1차 검수완료
          AND COMPLETE_1ST_INSPECT_DT IS NOT NULL		-- 1차 검수완료일
          AND (`2ND_INSPECT_ACCOUNT` IS NULL OR `2ND_INSPECT_ACCOUNT` = '')
          AND (ASSIGN_2ND_INSPECT_DT IS NULL OR ASSIGN_2ND_INSPECT_DT = '')
          AND CASE WHEN p_RUNTYPE = 'AUTO' THEN 1 = 1
                   ELSE FIND_IN_SET(DT.DATASET_ID, p_DATASET_LIST) END
        LIMIT p_DISTRIBUTION_CNT;

    /* 커서 종료조건 : 더이상 없다면 종료 */
    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET s_OUTER_DONE := TRUE;


    -- 할당건수 0 초기화
    SET c_LIMIT_COUNT = 0;

    -- LOG TABEL INSERT 기본값 셋팅
    SET v_RUNTYPE = p_RUNTYPE; -- AUTO(자동), MANUAL(수동)
    SELECT DATE_FORMAT(now(), '%Y%m%d%H%i%s') INTO v_RUNDATE FROM dual;  -- 실행 일자 세팅 ( YYYYMMDDHHMMSS )

    SET v_LOGMSG = CONCAT( '[START] 시작시간 - ', NOW());
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'INSPECTOR2', v_LOGMSG);

    IF p_RUNTYPE = 'MANUAL' THEN
        SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_RUNTYPE ,', INSPECTOR2 : ', p_INSPECTOR2_ACCOUNT , ', DATASET : ', p_DATASET_LIST, ', 분배기준 개수 :', p_DISTRIBUTION_CNT );
    ELSE
        SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_RUNTYPE ,', INSPECTOR2 : ', p_INSPECTOR2_ACCOUNT , ', DATASET : ', p_DATASET_LIST, ', 분배기준 개수 :', CAST(FLOOR((p_DISTRIBUTION_CNT/p_DISTRIBUTION_INSPECTOR_CNT)) AS CHAR) );
    END IF;

-- 	INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'INSPECTOR2', v_LOGMSG);


    IF p_RUNTYPE = 'MANUAL' THEN      -- 수동

        OPEN CURSOR_DATA;

        LOOP_DATA: LOOP         -- 내부 루프 시작
        FETCH CURSOR_DATA INTO c_DATA_ID;

        -- 검수자의 최대 할당개수, 현재 할당된 개수 조회
        SELECT
            MAX_HOLDING_DATA_CNT
             ,(SELECT COUNT(DATA_ID)
               FROM TB_DATA AS DT
                        JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
               WHERE 1=1
                 AND 	PROJECT_ID = p_PROJECT_ID
                 AND 	DTS.USE_STATUS	  = 'U'
                 AND 	DT.USE_STATUS	  = 'U'
                 AND   `2ND_INSPECT_ACCOUNT` = USER_ACCOUNT -- 2차검수자 계정 체크
                 AND   WORK_STATUS	  = 'C1' 				-- 검수요청
                 AND   ASSIGN_2ND_INSPECT_DT IS NOT NULL   	-- 2차 할당일 체크

        ) AS CURRENT_DATA_CNT
        INTO v_MAX_HOLDING_DATA_CNT, v_CURRENT_DATA_CNT

        FROM TB_PROJECT_USER AS P_USER
                 JOIN TB_PROJECT 		AS P ON P.PROJECT_ID = P_USER.PROJECT_ID
        WHERE
                P.PROJECT_ID = p_PROJECT_ID	-- 프로젝트ID
          AND P_USER.USER_ACCOUNT = p_INSPECTOR2_ACCOUNT; -- 사용자ID

        -- 클라이언트가 요청한 데이터 개수를 만족하면 루프를 종료
        IF (c_LIMIT_COUNT = p_DISTRIBUTION_CNT)
            OR v_MAX_HOLDING_DATA_CNT = v_CURRENT_DATA_CNT
            -- OR s_OUTER_DONE

        THEN
            CLOSE CURSOR_DATA;
            LEAVE LOOP_DATA;
        END IF;

        -- 데이터 테이블 업데이트(검수자 할당)
        UPDATE TB_DATA
        SET
            `2ND_INSPECT_ACCOUNT` 	= p_INSPECTOR2_ACCOUNT			-- 검수자 계정
          ,ASSIGN_2ND_INSPECT_DT 	= DATE_FORMAT(now(), '%Y%m%d')	-- 검수할당 일자
          -- ,WORK_STATUS = 'AW'								    -- 검수할당일 경우에는 이력테이블에만 'A1' 1차검수할당을 업데이트
          ,LAST_UPD_ACCOUNT = p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
          ,LAST_UPD_DTM = DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
        WHERE 1=1
          AND DATA_ID = c_DATA_ID;

        SELECT WORK_ROLE INTO v_WORK_ROLE   -- 매니저 또는 슈퍼관리자 권한
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID = p_PROJECT_ID
          AND USER_ACCOUNT = p_MANAGER_ACCOUNT;

        -- 데이터 히스토리 업데이트
        INSERT INTO TB_DATA_HISTORY(
                                    DATA_ID
                                   ,WORK_STATUS
                                   ,ACTION_ACCOUNT
                                   ,ACTION_WORK_ROLE
                                   ,TARGET_ACCOUNT
                                   ,TARGET_WORK_ROLE
                                   ,ACTION_DTM
                                   ,FIRST_INS_ACCOUNT
                                   ,FIRST_INS_DTM
                                   ,LAST_UPD_ACCOUNT
                                   ,LAST_UPD_DTM)
        VALUES(
                  c_DATA_ID
              ,'A2'					-- A2 : 2차검수자 할당
              ,p_MANAGER_ACCOUNT
              ,v_WORK_ROLE
              ,p_INSPECTOR2_ACCOUNT
              ,'I2'					-- I1 : 1차검수자
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')  -- 액션일자
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              );

        SET c_LIMIT_COUNT = c_LIMIT_COUNT + 1;

        END LOOP;

        SET v_LOGMSG = CONCAT( '[LOG] - 할당대상ID : ', p_INSPECTOR2_ACCOUNT,', - 분배자 ID : ', p_MANAGER_ACCOUNT , ', 할당건수 : ', c_LIMIT_COUNT, ', 할당합계 : ' , v_CURRENT_DATA_CNT ,', (할당)최대개수 : ', v_MAX_HOLDING_DATA_CNT);
        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'INSPECTOR2', v_LOGMSG);

        SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'INSPECTOR2', v_LOGMSG);

        -- RETURN VALUE
        SET p_RTN_VALUE = 1;

    ELSE -- 자동

        BLOCK_OUTER: BEGIN        -- // 내부 프로시져 블럭 시작

            -- 2번째 Corsor for INSPECTOR2 LIST
            DECLARE CURSOR_INSPECTOR2 CURSOR FOR
                SELECT USER_ACCOUNT, MAX_HOLDING_DATA_CNT
                     ,(SELECT COUNT(DATA_ID)
                       FROM TB_DATA AS DT
                                JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
                       WHERE 1=1
                         AND 	PROJECT_ID = p_PROJECT_ID
                         AND 	DTS.USE_STATUS	  = 'U'
                         AND 	DT.USE_STATUS	  = 'U'
                         AND   `2ND_INSPECT_ACCOUNT` = USER_ACCOUNT -- 2차검수자 계정 체크
                         AND   WORK_STATUS	  = 'C1' 				-- 1차검수완료
                         AND   ASSIGN_2ND_INSPECT_DT IS NOT NULL   	-- 2차 할당일 체크
                ) AS CURRENT_DATA_CNT

                FROM TB_PROJECT_USER AS P_USER
                         JOIN TB_PROJECT 		AS P ON P.PROJECT_ID = P_USER.PROJECT_ID
                WHERE
                        P.PROJECT_ID = p_PROJECT_ID	-- 프로젝트ID
                  AND P.USE_STATUS = 'U'			-- 사용유무 체크
                  AND P_USER.USE_STATUS = 'U'		-- 사용유무 체크
                  AND AUTO_DISTRIBUTION_YN = 'Y'	-- 자동분배여부 체크
                  AND WORK_ROLE = 'I2'			-- 검수자만
                  AND MAX_HOLDING_DATA_CNT >
                      (SELECT COUNT(DATA_ID)
                       FROM TB_DATA AS DT
                                JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
                       WHERE 1=1
                         AND 	PROJECT_ID = p_PROJECT_ID
                         AND 	DTS.USE_STATUS	  = 'U'
                         AND 	DT.USE_STATUS	  = 'U'
                         AND   `2ND_INSPECT_ACCOUNT` = USER_ACCOUNT -- 1차검수자 계정 체크
                         AND   WORK_STATUS	  = 'C1' 				-- 검수요청
                         AND   ASSIGN_2ND_INSPECT_DT IS NOT NULL   	-- 1차 할당일 체크
                      );

            /* 커서 종료조건 : 더이상 없다면 종료 */
            DECLARE CONTINUE HANDLER
                FOR NOT FOUND SET s_INNER_DONE := TRUE;

            OPEN CURSOR_INSPECTOR2; 														-- DATA CURSOR OPEN

            LOOP_OUTER: LOOP         	-- 외부 루프 시작 (INSPECTOR2)
            FETCH CURSOR_INSPECTOR2 INTO c_INSPECTOR2_ACCOUNT, c_MAX_HOLDING_DATA_CNT, c_CURRENT_DATA_CNT;
            IF s_INNER_DONE OR s_OUTER_DONE THEN
                CLOSE CURSOR_INSPECTOR2;
                LEAVE LOOP_OUTER;
            END IF;

            OPEN CURSOR_DATA;


            LOOP_INNER: LOOP         -- 내부 루프 시작 (DATA)
            FETCH CURSOR_DATA INTO c_DATA_ID;
            --
            IF (c_LIMIT_COUNT = (p_DISTRIBUTION_CNT / p_DISTRIBUTION_INSPECTOR_CNT))	-- 전체 건수 = (분배건수 / 검수자 수 )  자동일 경우 분배건수 = (검수자수*일괄분배수량)
                OR (c_MAX_HOLDING_DATA_CNT = c_CURRENT_DATA_CNT) 					-- 검수자별 MAX 수량 = 현재할당된 수량
            THEN
                CLOSE CURSOR_DATA;
                LEAVE LOOP_INNER;
            END IF;

            -- 데이터 테이블 업데이트(검수자 할당)
            UPDATE TB_DATA
            SET
                `2ND_INSPECT_ACCOUNT` 	= c_INSPECTOR2_ACCOUNT					-- 검수자 계정
              ,ASSIGN_2ND_INSPECT_DT 	= DATE_FORMAT(now(), '%Y%m%d')		-- 작업할당 일자
              -- ,WORK_STATUS = 'AW'										-- 검수할당의 경우에는 이력테이블에만 'A1' 1차검수할당을 업데이트
              ,LAST_UPD_ACCOUNT = 'SYSTEM'							-- AUTO 이기 때문에 SYSTEM
              ,LAST_UPD_DTM = DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
            WHERE 1=1
              AND DATA_ID = c_DATA_ID;

            -- 데이터 히스토리 업데이트
            INSERT INTO TB_DATA_HISTORY(
                                        DATA_ID
                                       ,WORK_STATUS
                                       ,TARGET_ACCOUNT
                                       ,TARGET_WORK_ROLE
                                       ,ACTION_DTM
                                       ,FIRST_INS_ACCOUNT
                                       ,FIRST_INS_DTM
                                       ,LAST_UPD_ACCOUNT
                                       ,LAST_UPD_DTM)
            VALUES(
                      c_DATA_ID
                  ,'A2'					-- A2 : 2차검수자 할당
                  ,c_INSPECTOR2_ACCOUNT
                  ,'I2'					-- I1 : 2차검수자
                  ,DATE_FORMAT(now(), '%Y%m%d')
                  ,'SYSTEM'
                  ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
                  ,'SYSTEM'
                  ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
                  );


            SET c_LIMIT_COUNT = c_LIMIT_COUNT +1;						-- 할당할 데이터 수 +1  (배분지정개수)
            SET c_CURRENT_DATA_CNT = c_CURRENT_DATA_CNT + 1;			-- 유저별 현재 할당된 데이터 수 +1 (유저별 MAX 체크

            END LOOP LOOP_INNER;


            SET v_TOTAL_DATA_CNT = c_CURRENT_DATA_CNT;

            SET v_LOGMSG = CONCAT( '[LOG] - 할당대상ID : ', c_INSPECTOR2_ACCOUNT,', - 분배자 ID : ', p_MANAGER_ACCOUNT , ', 할당건수 : ', c_LIMIT_COUNT, ',  할당합계 : ', v_TOTAL_DATA_CNT , ', (할당)최대개수 : ', c_MAX_HOLDING_DATA_CNT);
            -- 할당 LIMIT  초기화
            SET c_LIMIT_COUNT = 0;
            INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'INSPECTOR2', v_LOGMSG);

            END LOOP LOOP_OUTER;

        END BLOCK_OUTER;

        SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'INSPECTOR2', v_LOGMSG);

        -- RETURN VALUE
        SET p_RTN_VALUE = 1;

    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_inspector2_recall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_inspector2_recall`(IN p_PROJECT_ID INT, IN p_INSPECTOR_ACCOUNT VARCHAR(4000), p_MANAGER_ACCOUNT VARCHAR(50), IN p_INSPECTION_NUM INT, OUT p_RTN_VALUE INT)
BLOCK_OUTER : BEGIN
    -- 2차 검수자 회수 프로시저

    DECLARE s_OUTER_DONE BOOLEAN DEFAULT FALSE;

    DECLARE v_RUNDATE CHAR(14);
    DECLARE v_LOGMSG VARCHAR(2000);

    DECLARE v_WORK_ROLE VARCHAR(5);  			-- 계정권한 (매니저 또는 슈퍼관리자)

    DECLARE c_INSPECTOR_ACCOUNT VARCHAR(100);      -- cursor 변수
    -- DECLARE c_DATA_ID INT;  				  	-- cursor 변수
    DECLARE c_LIMIT_COUNT INT;  				-- cursor 변수

    DECLARE v_SQL_STATE varchar(5);		  		-- ERROR 상태
    DECLARE v_INT_ERROR_NO INT;				  	-- ERROR NUM
    DECLARE v_TXT_ERROR_MSG TEXT;		      	-- ERROR MSG

    DECLARE v_DEFAULT_RUNTYPE 			VARCHAR(6);				-- DEFAULT STRING 구동타입
    DECLARE v_DEFAULT_INSPECTOR 		VARCHAR(10);
    DECLARE v_DEFAULT_RECALL 			VARCHAR(6);
    DECLARE v_DEFAULT_WORK_STATUS_C1 	VARCHAR(2);
    DECLARE v_DEFAULT_WORK_STATUS_W2 	VARCHAR(2);
    DECLARE v_DEFAULT_INSPECTOR_ROLE_I2 	VARCHAR(2);

    -- 1번째 Corsor for DATA LIST
    DECLARE CURSOR_INSPECTOR CURSOR FOR
        SELECT USER_ACCOUNT
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID 	= p_PROJECT_ID
          AND WORK_ROLE	= 'I2'			-- 1차검수자(라벨러)
          AND USE_STATUS 	= 'U'    		-- 사용중
          AND FIND_IN_SET(USER_ACCOUNT, p_INSPECTOR_ACCOUNT);

    /* 커서 종료조건 : 더이상 없다면 종료 */
    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET s_OUTER_DONE := TRUE;

    --  DEFAULT 셋팅
    SET v_DEFAULT_RUNTYPE 	= 'MANUAL';			-- 수동
    SET v_DEFAULT_INSPECTOR = 'INSPECTOR2';		-- 검수자1
    SET v_DEFAULT_RECALL 	= 'RECALL';			-- 회수
    SET v_DEFAULT_WORK_STATUS_C1 	= 'C1';		--
    SET v_DEFAULT_WORK_STATUS_W2 	= 'W2';		-- 2차검수자회수
    SET v_DEFAULT_INSPECTOR_ROLE_I2 	= 'I2';		-- 계정 _ 권한

    -- 할당건수 0 초기화
    SET c_LIMIT_COUNT = 0;

    -- LOG TABEL INSERT 기본값 셋팅
    SELECT DATE_FORMAT(now(), '%Y%m%d%H%i%s') INTO v_RUNDATE FROM dual;  -- 실행 일자 세팅 ( YYYYMMDDHHMMSS )

    SET v_LOGMSG = CONCAT( '[START] 시작시간 - ', NOW());
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_DEFAULT_RUNTYPE , ', ',  v_DEFAULT_INSPECTOR, ' : ', p_INSPECTOR_ACCOUNT , ', MANAGER_ACCOUNT : ', p_MANAGER_ACCOUNT);

    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);


    -- 커서 시작
    OPEN CURSOR_INSPECTOR;

    -- 데이터 루프시작
    LOOP_OUTER: LOOP         -- 내부 루프 시작
    FETCH CURSOR_INSPECTOR INTO c_INSPECTOR_ACCOUNT;

    -- 클라이언트가 요청한 데이터 개수를 만족하면 루프를 종료
    IF s_OUTER_DONE
    THEN
        CLOSE CURSOR_INSPECTOR;
        LEAVE LOOP_OUTER;
    END IF;

    BLOCK_INNER: BEGIN

        DECLARE s_INNER_DONE BOOLEAN DEFAULT FALSE;
        DECLARE c_DATA_ID INT;  				  	-- cursor 변수

        -- DATA 조회  : 검수요청 상태에서는 검수자에게 할당되지 않은 데이터만 회수처리.
        -- 내부 CURSOR 시작
        DECLARE CURSOR_DATA CURSOR FOR
            /**
            SELECT
                DATA_ID
             FROM TB_DATA AS DT
             JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
             WHERE 1=1
             AND PROJECT_ID = p_PROJECT_ID
             AND `2ND_INSPECT_ACCOUNT` 		= c_INSPECTOR_ACCOUNT
             AND WORK_STATUS				= v_DEFAULT_WORK_STATUS_C1
             AND (COMPLETE_2ND_INSPECT_DT IS NULL OR COMPLETE_2ND_INSPECT_DT = '')
             AND DTS.USE_STATUS = 'U'
             AND DT.USE_STATUS = 'U'
             ;	-- 1차검수완료 단계
             */

            SELECT
                DATA_ID
            FROM TB_DATA AS DT
                     JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
            WHERE 1=1
              AND PROJECT_ID = p_PROJECT_ID
              AND `2ND_INSPECT_ACCOUNT` 		= c_INSPECTOR_ACCOUNT
              AND DT.WORK_STATUS != 'R2'
              AND (COMPLETE_2ND_INSPECT_DT IS NULL OR COMPLETE_2ND_INSPECT_DT = '')
              AND DTS.USE_STATUS = 'U'
              AND DT.USE_STATUS = 'U'
        ;	-- 1차검수완료 단계


        /* 커서 종료조건 : 더이상 없다면 종료 */
        DECLARE CONTINUE HANDLER
            FOR NOT FOUND SET s_INNER_DONE := TRUE;

        OPEN CURSOR_DATA;

        LOOP_INNER: LOOP         -- 내부 루프 시작 (DATA)
        FETCH CURSOR_DATA INTO c_DATA_ID;

        IF s_INNER_DONE
        THEN
            CLOSE CURSOR_DATA;
            LEAVE LOOP_INNER;
        END IF;
        /*
            UPDATE TB_DATA
            SET
                 `2ND_INSPECT_ACCOUNT` 	= NULL							-- 2차 검수자 계정 초기화
                ,ASSIGN_2ND_INSPECT_DT 	= NULL							-- 2차 검수자 할당일 초기화
                -- ,WORK_STATUS 		= v_DEFAULT_WORK_STATUS_C1		-- 데이터 회수( 1차검수완료단계 - 2검수자 할당 바로 전 단계 )
                ,LAST_UPD_ACCOUNT 	= p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
                ,LAST_UPD_DTM 		= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
            WHERE 1=1
            AND DATA_ID = c_DATA_ID;
        */

        UPDATE TB_DATA
        SET
            `2ND_INSPECT_ACCOUNT` 	= NULL							-- 2차 검수자 계정 초기화
          ,ASSIGN_2ND_INSPECT_DT 	= NULL							-- 2차 검수자 할당일 초기화
          ,WORK_STATUS 		= v_DEFAULT_WORK_STATUS_C1		-- 데이터 회수( 1차검수완료단계 - 2검수자 할당 바로 전 단계 )
          ,LAST_UPD_ACCOUNT 	= p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
          ,LAST_UPD_DTM 		= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
        WHERE 1=1
          AND DATA_ID = c_DATA_ID;


        SELECT IFNULL(MAX(WORK_ROLE), 'S') AS WORK_ROLE INTO v_WORK_ROLE   -- 매니저 또는 슈퍼관리자 권한
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID = p_PROJECT_ID
          AND USER_ACCOUNT = p_MANAGER_ACCOUNT;

        -- 데이터 히스토리 업데이트
        INSERT INTO TB_DATA_HISTORY(
                                    DATA_ID
                                   ,WORK_STATUS
                                   ,ACTION_ACCOUNT
                                   ,ACTION_WORK_ROLE
                                   ,TARGET_ACCOUNT
                                   ,TARGET_WORK_ROLE
                                   ,ACTION_DTM
                                   ,FIRST_INS_ACCOUNT
                                   ,FIRST_INS_DTM
                                   ,LAST_UPD_ACCOUNT
                                   ,LAST_UPD_DTM)
        VALUES(
                  c_DATA_ID
              ,v_DEFAULT_WORK_STATUS_W2							-- W2 : 2차검수자 회수
              ,p_MANAGER_ACCOUNT
              ,v_WORK_ROLE
              ,c_INSPECTOR_ACCOUNT
              ,v_DEFAULT_INSPECTOR_ROLE_I2						-- I2 : 2차검수자
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')  	-- 액션일자
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              );

        SET c_LIMIT_COUNT = c_LIMIT_COUNT + 1;
        END LOOP LOOP_INNER;

    END BLOCK_INNER;

    END LOOP LOOP_OUTER;

    SET v_LOGMSG = CONCAT( '[LOG] - 회수대상ID : ', p_INSPECTOR_ACCOUNT,', - 회수자 ID : ', p_MANAGER_ACCOUNT , ', 회수 총건수 : ', c_LIMIT_COUNT);
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_INSPECTOR, v_LOGMSG);

    -- RETURN VALUE
    SET p_RTN_VALUE = 1;


    COMMIT;
END BLOCK_OUTER ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_worker_distribution` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_worker_distribution`(IN p_PROJECT_ID INT, IN p_WORKER_ACCOUNT VARCHAR(50), p_MANAGER_ACCOUNT VARCHAR(50),
                                                             IN p_DATASET_LIST VARCHAR(4000), IN p_DISTRIBUTION_CNT INT, IN p_DISTRIBUTION_WORKER_CNT INT, IN p_RUNTYPE VARCHAR(10), OUT p_RTN_VALUE INT)
BEGIN
    -- 작업자 자동/수동 분배 프로시저

    DECLARE s_OUTER_DONE BOOLEAN DEFAULT FALSE;
    DECLARE s_INNER_DONE BOOLEAN DEFAULT FALSE;

    DECLARE v_RUNDATE CHAR(14);
    DECLARE v_RUNTYPE VARCHAR(20);
    DECLARE v_LOGMSG VARCHAR(2000);

    DECLARE v_WORK_ROLE VARCHAR(5);  			-- 계정권한 (매니저 또는 슈퍼관리자)
    DECLARE v_MAX_HOLDING_DATA_CNT INT;			-- 유저 MAX 데이터 건수
    DECLARE v_CURRENT_DATA_CNT INT;				-- 현재 유저에게 할당된 데이터 건수 ((1차,2차) 검수완료를 제외한)
    DECLARE v_TOTAL_DATA_CNT INT;				-- 작업자 별 할당된 이후 갖고있는 (배분)데이터 총 개수

    DECLARE c_WORKER_ACCOUNT VARCHAR(100);      -- cursor 변수
    DECLARE c_DATA_ID INT;  				  	-- cursor 변수
    DECLARE c_LIMIT_COUNT INT;  				-- cursor 변수
    DECLARE c_MAX_HOLDING_DATA_CNT INT; 		-- cursor 변수 (작업자별 MAX수량)
    DECLARE c_CURRENT_DATA_CNT INT; 			-- cursor 변수 (작업자별 현재 갖고있는 데이터 수량)

    DECLARE v_SQL_STATE varchar(5);		  		-- ERROR 상태
    DECLARE v_INT_ERROR_NO INT;				  	-- ERROR NUM
    DECLARE v_TXT_ERROR_MSG TEXT;		      	-- ERROR MSG


    -- 1번째 Corsor for DATA LIST
    DECLARE CURSOR_DATA CURSOR FOR
        SELECT DATA_ID
        FROM TB_DATA AS DT
                 JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
        WHERE 1=1
          AND PROJECT_ID = p_PROJECT_ID
          AND DTS.USE_STATUS = 'U'    -- 사용중
          AND DT.USE_STATUS = 'U'    -- 사용중
          AND WORK_STATUS = 'RE'  -- 대기
          AND CASE WHEN p_RUNTYPE = 'AUTO' THEN 1 = 1
                   ELSE FIND_IN_SET(DT.DATASET_ID, p_DATASET_LIST) END
        LIMIT p_DISTRIBUTION_CNT;

    /* 커서 종료조건 : 더이상 없다면 종료 */
    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET s_OUTER_DONE := TRUE;


    -- 할당건수 0 초기화
    SET c_LIMIT_COUNT = 0;

    -- LOG TABEL INSERT 기본값 셋팅
    SET v_RUNTYPE = p_RUNTYPE; -- AUTO(자동), MANUAL(수동)
    SELECT DATE_FORMAT(now(), '%Y%m%d%H%i%s') INTO v_RUNDATE FROM dual;  -- 실행 일자 세팅 ( YYYYMMDDHHMMSS )

    SET v_LOGMSG = CONCAT( '[START] 시작시간 - ', NOW());
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'WORKER', v_LOGMSG);

    IF p_RUNTYPE = 'MANUAL' THEN
        SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_RUNTYPE ,', WORKER : ', p_WORKER_ACCOUNT , ', DATASET : ', p_DATASET_LIST, ', 분배기준 개수 :', p_DISTRIBUTION_CNT );
    ELSE
        SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_RUNTYPE ,', WORKER : ', p_WORKER_ACCOUNT , ', DATASET : ', p_DATASET_LIST, ', 분배기준 개수 :', CAST(FLOOR((p_DISTRIBUTION_CNT/p_DISTRIBUTION_WORKER_CNT)) AS CHAR) );
    END IF;

    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'WORKER', v_LOGMSG);


    IF p_RUNTYPE = 'MANUAL' THEN      -- 수동

        OPEN CURSOR_DATA;

        LOOP_DATA: LOOP         -- 내부 루프 시작
        FETCH CURSOR_DATA INTO c_DATA_ID;

        -- 작업자의 최대 할당개수, 현재 할당된 개수 조회
        SELECT
            MAX_HOLDING_DATA_CNT
             ,(SELECT COUNT(DATA_ID)
               FROM TB_DATA AS DT
                        JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
               WHERE 1=1
                 AND PROJECT_ID = p_PROJECT_ID
                 AND	WORKER_ACCOUNT = USER_ACCOUNT
                 AND   DTS.USE_STATUS	  = 'U'
                 AND   DT.USE_STATUS	  = 'U'
                 AND   CASE WHEN P.INSPECTION_NUM = 1
                                THEN WORK_STATUS   <> 'C1'
                            ELSE WORK_STATUS   <> 'C2' END
        ) AS CURRENT_DATA_CNT
        INTO v_MAX_HOLDING_DATA_CNT, v_CURRENT_DATA_CNT

        FROM TB_PROJECT_USER AS P_USER
                 JOIN TB_PROJECT 		AS P ON P.PROJECT_ID = P_USER.PROJECT_ID
        WHERE
                P.PROJECT_ID = p_PROJECT_ID	-- 프로젝트ID
          AND P_USER.USER_ACCOUNT = p_WORKER_ACCOUNT; -- 사용자ID

        -- 클라이언트가 요청한 데이터 개수를 만족하면 루프를 종료
        IF (c_LIMIT_COUNT = p_DISTRIBUTION_CNT)
            OR v_MAX_HOLDING_DATA_CNT = v_CURRENT_DATA_CNT
            -- OR s_OUTER_DONE

        THEN
            CLOSE CURSOR_DATA;
            LEAVE LOOP_DATA;
        END IF;

        -- 데이터 테이블 업데이트(작업자 할당)
        UPDATE TB_DATA
        SET
            WORKER_ACCOUNT = p_WORKER_ACCOUNT					-- 작업자 계정
          ,ASSIGN_WORKER_DT = DATE_FORMAT(now(), '%Y%m%d')	-- 작업할당 일자
          ,WORK_STATUS = 'AW'									-- 작업중
          ,LAST_UPD_ACCOUNT = p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
          ,LAST_UPD_DTM = DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
        WHERE 1=1
          AND DATA_ID = c_DATA_ID;

        SELECT WORK_ROLE INTO v_WORK_ROLE   -- 매니저 또는 슈퍼관리자 권한
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID = p_PROJECT_ID
          AND USER_ACCOUNT = p_MANAGER_ACCOUNT;

        -- 데이터 히스토리 업데이트
        INSERT INTO TB_DATA_HISTORY(
                                    DATA_ID
                                   ,WORK_STATUS
                                   ,ACTION_ACCOUNT
                                   ,ACTION_WORK_ROLE
                                   ,TARGET_ACCOUNT
                                   ,TARGET_WORK_ROLE
                                   ,ACTION_DTM
                                   ,FIRST_INS_ACCOUNT
                                   ,FIRST_INS_DTM
                                   ,LAST_UPD_ACCOUNT
                                   ,LAST_UPD_DTM)
        VALUES(
                  c_DATA_ID
              ,'AW'					-- AW : 작업중
              ,p_MANAGER_ACCOUNT
              ,v_WORK_ROLE
              ,p_WORKER_ACCOUNT
              ,'W'					-- W : 작업자
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')  -- 액션일자
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              );

        SET c_LIMIT_COUNT = c_LIMIT_COUNT + 1;

        END LOOP;

        SET v_LOGMSG = CONCAT( '[LOG] - 할당대상ID : ', p_WORKER_ACCOUNT,', - 분배자 ID : ', p_MANAGER_ACCOUNT , ', 할당건수 : ', c_LIMIT_COUNT, ', 할당합계 : ' , v_CURRENT_DATA_CNT ,', (할당)최대개수 : ', v_MAX_HOLDING_DATA_CNT);
        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'WORKER', v_LOGMSG);

        SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'WORKER', v_LOGMSG);

        -- RETURN VALUE
        SET p_RTN_VALUE = 1;

    ELSE -- 자동

        BLOCK_OUTER: BEGIN        -- // 내부 프로시져 블럭 시작

            -- 2번째 Corsor for WORKER LIST
            DECLARE CURSOR_WORKER CURSOR FOR
                SELECT USER_ACCOUNT, MAX_HOLDING_DATA_CNT
                     ,(SELECT COUNT(DATA_ID)
                       FROM TB_DATA AS DT
                                JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
                       WHERE 1=1
                         AND 	PROJECT_ID = p_PROJECT_ID
                         AND	WORKER_ACCOUNT = USER_ACCOUNT
                         AND   DTS.USE_STATUS	  = 'U'
                         AND   DT.USE_STATUS	  = 'U'
                         AND   CASE WHEN P.INSPECTION_NUM = 1
                                        THEN WORK_STATUS   <> 'C1'
                                    ELSE WORK_STATUS   <> 'C2' END
                ) AS CURRENT_DATA_CNT

                FROM TB_PROJECT_USER AS P_USER
                         JOIN TB_PROJECT 		AS P ON P.PROJECT_ID = P_USER.PROJECT_ID
                WHERE
                        P.PROJECT_ID = p_PROJECT_ID	-- 프로젝트ID
                  AND P.USE_STATUS = 'U'			-- 사용유무 체크
                  AND P_USER.USE_STATUS = 'U'		-- 사용유무 체크
                  AND AUTO_DISTRIBUTION_YN = 'Y'	-- 자동분배여부 체크
                  AND WORK_ROLE = 'W'				-- 작업자만
                  AND MAX_HOLDING_DATA_CNT >
                      (SELECT COUNT(DATA_ID)
                       FROM TB_DATA AS DT
                                JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
                       WHERE 1=1
                         AND 	PROJECT_ID = p_PROJECT_ID
                         AND	WORKER_ACCOUNT = P_USER.USER_ACCOUNT					-- 작업자계정 비교
                         AND   DTS.USE_STATUS	  = 'U'									    -- 사용유무 체크
                         AND   DT.USE_STATUS	  = 'U'									    -- 사용유무 체크
                         AND CASE WHEN P.INSPECTION_NUM = 1 THEN WORK_STATUS   <> 'C1'  -- 1차검수완료, 2차검수 완료 제외한 나머지 개수 카운팅
                                  ELSE WORK_STATUS   <> 'C2' END);

            /* 커서 종료조건 : 더이상 없다면 종료 */
            DECLARE CONTINUE HANDLER
                FOR NOT FOUND SET s_INNER_DONE := TRUE;

            OPEN CURSOR_WORKER; 														-- DATA CURSOR OPEN

            LOOP_OUTER: LOOP         	-- 외부 루프 시작 (WORKER)
            FETCH CURSOR_WORKER INTO c_WORKER_ACCOUNT, c_MAX_HOLDING_DATA_CNT, c_CURRENT_DATA_CNT;
            IF s_INNER_DONE OR s_OUTER_DONE THEN
                CLOSE CURSOR_WORKER;
                LEAVE LOOP_OUTER;
            END IF;

            OPEN CURSOR_DATA;


            LOOP_INNER: LOOP         -- 내부 루프 시작 (DATA)
            FETCH CURSOR_DATA INTO c_DATA_ID;
            --
            IF (c_LIMIT_COUNT = (p_DISTRIBUTION_CNT / p_DISTRIBUTION_WORKER_CNT))	-- 전체 건수 = (분배건수 / 작업자 수 )  자동일 경우 분배건수 = (작업자수*일괄분배수량)
                OR (c_MAX_HOLDING_DATA_CNT = c_CURRENT_DATA_CNT) 					-- 작업자별 MAX 수량 = 현재할당된 수량
            THEN
                CLOSE CURSOR_DATA;
                LEAVE LOOP_INNER;
            END IF;

            -- 데이터 테이블 업데이트(작업자 할당)
            UPDATE TB_DATA
            SET
                WORKER_ACCOUNT = c_WORKER_ACCOUNT					-- 작업자 계정
              ,ASSIGN_WORKER_DT = DATE_FORMAT(now(), '%Y%m%d')	-- 작업할당 일자
              ,WORK_STATUS = 'AW'									-- 작업중
              ,LAST_UPD_ACCOUNT = 'SYSTEM'						-- AUTO 이기 때문에 SYSTEM
              ,LAST_UPD_DTM = DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
            WHERE 1=1
              AND DATA_ID = c_DATA_ID;

            -- 데이터 히스토리 업데이트
            INSERT INTO TB_DATA_HISTORY(
                                        DATA_ID
                                       ,WORK_STATUS
                                       ,TARGET_ACCOUNT
                                       ,TARGET_WORK_ROLE
                                       ,ACTION_DTM
                                       ,FIRST_INS_ACCOUNT
                                       ,FIRST_INS_DTM
                                       ,LAST_UPD_ACCOUNT
                                       ,LAST_UPD_DTM)
            VALUES(
                      c_DATA_ID
                  ,'AW'					-- AW : 작업중
                  ,c_WORKER_ACCOUNT
                  ,'W'					-- W : 작업자
                  ,DATE_FORMAT(now(), '%Y%m%d')
                  ,'SYSTEM'
                  ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
                  ,'SYSTEM'
                  ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
                  );


            SET c_LIMIT_COUNT = c_LIMIT_COUNT +1;						-- 할당할 데이터 수 +1  (배분지정개수)
            SET c_CURRENT_DATA_CNT = c_CURRENT_DATA_CNT + 1;			-- 유저별 현재 할당된 데이터 수 +1 (유저별 MAX 체크

            END LOOP LOOP_INNER;


            SET v_TOTAL_DATA_CNT = c_CURRENT_DATA_CNT;

            SET v_LOGMSG = CONCAT( '[LOG] - 할당대상ID : ', c_WORKER_ACCOUNT,', - 분배자 ID : ', p_MANAGER_ACCOUNT , ', 할당건수 : ', c_LIMIT_COUNT, ',  할당합계 : ', v_TOTAL_DATA_CNT , ', (할당)최대개수 : ', c_MAX_HOLDING_DATA_CNT);
            -- 할당 LIMIT  초기화
            SET c_LIMIT_COUNT = 0;
            INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'WORKER', v_LOGMSG);

            END LOOP LOOP_OUTER;

        END BLOCK_OUTER;

        SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, 'DISTRIBUTION', v_RUNDATE, v_RUNTYPE, 'WORKER', v_LOGMSG);

        -- RETURN VALUE
        SET p_RTN_VALUE = 1;

    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_worker_inspection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_worker_inspection`(IN p_PROJECT_ID INT, IN p_WORKER_ACCOUNT VARCHAR(4000), p_MANAGER_ACCOUNT VARCHAR(50), IN p_INSPECTION_NUM INT, OUT p_RTN_VALUE INT)
BLOCK_OUTER: BEGIN
    -- 작업자 검수 프로시저

    DECLARE s_OUTER_DONE BOOLEAN DEFAULT FALSE;
    DECLARE v_RTN_VALUE INT;

    DECLARE v_RUNDATE CHAR(14);
    DECLARE v_LOGMSG VARCHAR(2000);

    DECLARE v_WORK_ROLE VARCHAR(5);  			-- 계정권한 (매니저 또는 슈퍼관리자)

    DECLARE c_WORKER_ACCOUNT VARCHAR(100);      -- cursor 변수
    -- DECLARE c_DATA_ID INT;  				  	-- cursor 변수
    DECLARE c_LIMIT_COUNT INT;  				-- cursor 변수

    DECLARE v_SQL_STATE varchar(5);		  		-- ERROR 상태
    DECLARE v_INT_ERROR_NO INT;				  	-- ERROR NUM
    DECLARE v_TXT_ERROR_MSG TEXT;		      	-- ERROR MSG

    DECLARE v_DEFAULT_RUNTYPE 			VARCHAR(6);				-- DEFAULT STRING 구동타입
    DECLARE v_DEFAULT_WORKER 			VARCHAR(6);
    DECLARE v_DEFAULT_INSPECTION 		VARCHAR(10);
    DECLARE v_DEFAULT_WORK_STATUS_IR 	VARCHAR(2);
    DECLARE v_DEFAULT_WORK_STATUS_C1 	VARCHAR(2);
    DECLARE v_DEFAULT_WORKER_ROLE_W 	VARCHAR(1);

    -- 1번째 Corsor for DATA LIST
    DECLARE CURSOR_WORKER CURSOR FOR
        SELECT USER_ACCOUNT
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID 	= p_PROJECT_ID
          AND WORK_ROLE	= 'W'			-- 작업자(라벨러)
          AND USE_STATUS 	= 'U'    		-- 사용중
          AND FIND_IN_SET(USER_ACCOUNT, p_WORKER_ACCOUNT);

    /* 커서 종료조건 : 더이상 없다면 종료 */
    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET s_OUTER_DONE := TRUE;

    --  DEFAULT 셋팅
    SET v_DEFAULT_RUNTYPE 			= 'MANUAL';			-- 수동
    SET v_DEFAULT_WORKER 			= 'WORKER';			-- 작업자
    SET v_DEFAULT_INSPECTION 		= 'INSPECTION';		-- 검수
    SET v_DEFAULT_WORK_STATUS_IR 	= 'IR';				-- 검수요청
    SET v_DEFAULT_WORK_STATUS_C1 	= 'C1';				-- 1차검수완료
    SET v_DEFAULT_WORKER_ROLE_W 	= 'W';				-- 계정 _ 권한

    -- 할당건수 0 초기화
    SET c_LIMIT_COUNT = 0;

    -- LOG TABEL INSERT 기본값 셋팅
    SELECT DATE_FORMAT(now(), '%Y%m%d%H%i%s') INTO v_RUNDATE FROM dual;  -- 실행 일자 세팅 ( YYYYMMDDHHMMSS )

    SET v_LOGMSG = CONCAT( '[START] 시작시간 - ', NOW());
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_INSPECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_DEFAULT_RUNTYPE , ', ',  v_DEFAULT_WORKER, ' : ', p_WORKER_ACCOUNT , ', MANAGER_ACCOUNT : ', p_MANAGER_ACCOUNT);

    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_INSPECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);

    -- 커서 시작
    OPEN CURSOR_WORKER;

    -- 데이터 루프시작
    LOOP_OUTER: LOOP         -- 내부 루프 시작
    FETCH CURSOR_WORKER INTO c_WORKER_ACCOUNT;
    -- 클라이언트가 요청한 데이터 개수를 만족하면 루프를 종료
    IF s_OUTER_DONE
    THEN
        CLOSE CURSOR_WORKER;
        LEAVE LOOP_OUTER;
    END IF;

    BLOCK_INNER: BEGIN
        DECLARE s_INNER_DONE BOOLEAN DEFAULT FALSE;
        DECLARE c_DATA_ID INT;  				  	-- cursor 변수

        -- 내부 CURSOR 시작
        DECLARE CURSOR_DATA CURSOR FOR
            /**
            SELECT
                DATA_ID
             FROM TB_DATA AS DT
             JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
             WHERE 1=1
             AND PROJECT_ID 				= p_PROJECT_ID
             AND WORKER_ACCOUNT 			= c_WORKER_ACCOUNT
             AND WORK_STATUS				= v_DEFAULT_WORK_STATUS_IR	-- 검수요청 단계
             AND REQUEST_INSPECT_DT IS NOT NULL
             #AND (`1ST_REJECT_DT` 			IS NULL OR `1ST_REJECT_DT` = '')
             #AND (ASSIGN_1ST_INSPECT_DT 	IS NULL OR ASSIGN_1ST_INSPECT_DT = '')
             AND DTS.USE_STATUS 			= 'U'
             AND DT.USE_STATUS 				= 'U';
            */
            SELECT
                DATA_ID
            FROM TB_DATA AS DT
                     JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
            WHERE 1=1
              AND PROJECT_ID 				= p_PROJECT_ID
              AND WORKER_ACCOUNT 			= c_WORKER_ACCOUNT
              AND WORK_STATUS				= v_DEFAULT_WORK_STATUS_IR	-- 검수요청 단계
              AND REQUEST_INSPECT_DT IS NOT NULL
              AND (`1ST_INSPECT_ACCOUNT` IS NOT NULL OR `1ST_INSPECT_ACCOUNT` != '')
              AND (ASSIGN_1ST_INSPECT_DT IS NOT NULL OR ASSIGN_1ST_INSPECT_DT != '')
              AND DTS.USE_STATUS 			= 'U'
              AND DT.USE_STATUS 				= 'U';

        /* 커서 종료조건 : 더이상 없다면 종료 */
        DECLARE CONTINUE HANDLER
            FOR NOT FOUND SET s_INNER_DONE := TRUE;


        OPEN CURSOR_DATA;

        LOOP_INNER: LOOP         -- 내부 루프 시작 (DATA)
        FETCH CURSOR_DATA INTO c_DATA_ID;

        IF s_INNER_DONE
        THEN
            CLOSE CURSOR_DATA;
            LEAVE LOOP_INNER;

        END IF;

        -- 데이터 테이블 업데이트(작업자 할당)
        UPDATE TB_DATA
        SET
            WORK_STATUS 				= v_DEFAULT_WORK_STATUS_C1						-- 1차 검수완료
          ,ASSIGN_1ST_INSPECT_DT 		= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y%m%d')
          ,COMPLETE_1ST_INSPECT_DT	= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y%m%d')
          ,LAST_UPD_ACCOUNT 			= p_MANAGER_ACCOUNT								-- 매니저 또는 슈퍼관리자
          ,LAST_UPD_DTM 				= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
        WHERE 1=1
          AND DATA_ID = c_DATA_ID;

        SELECT IFNULL(MAX(WORK_ROLE), 'S') AS WORK_ROLE INTO v_WORK_ROLE   -- 매니저 또는 슈퍼관리자 권한
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID = p_PROJECT_ID
          AND USER_ACCOUNT = p_MANAGER_ACCOUNT;

        -- 데이터 히스토리 업데이트
        INSERT INTO TB_DATA_HISTORY(
                                    DATA_ID
                                   ,WORK_STATUS
                                   ,ACTION_ACCOUNT
                                   ,ACTION_WORK_ROLE
                                   ,TARGET_ACCOUNT
                                   ,TARGET_WORK_ROLE
                                   ,ACTION_DTM
                                   ,FIRST_INS_ACCOUNT
                                   ,FIRST_INS_DTM
                                   ,LAST_UPD_ACCOUNT
                                   ,LAST_UPD_DTM)
        VALUES(
                  c_DATA_ID
              ,v_DEFAULT_WORK_STATUS_C1						-- C1 : 1차검수완료
              ,p_MANAGER_ACCOUNT
              ,v_WORK_ROLE
              ,c_WORKER_ACCOUNT
              ,v_DEFAULT_WORKER_ROLE_W						-- W : 작업자
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')  	-- 액션일자
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              );

        SET c_LIMIT_COUNT = c_LIMIT_COUNT + 1;

        END LOOP LOOP_INNER;

    END BLOCK_INNER;

    END LOOP LOOP_OUTER;

    SET v_LOGMSG = CONCAT( '[LOG] - 검수대상ID : ', p_WORKER_ACCOUNT,', - 검수자 ID : ', p_MANAGER_ACCOUNT , ', 검수 총건수 : ', c_LIMIT_COUNT);
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_INSPECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_INSPECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);

    IF c_LIMIT_COUNT > 0 THEN
        SET p_RTN_VALUE = 1;  -- RETURN 1 : Success
    ELSE
        SET p_RTN_VALUE = 0;  -- RETURN 0 : fail
    END IF;

    COMMIT;
END BLOCK_OUTER ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_worker_recall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_worker_recall`(IN p_PROJECT_ID INT, IN p_WORKER_ACCOUNT VARCHAR(4000), p_MANAGER_ACCOUNT VARCHAR(50),
                                                       IN p_WORK_STATUS VARCHAR(2), IN p_INSPECTION_NUM INT, OUT p_RTN_VALUE INT)
BLOCK_OUTER : BEGIN
    -- 작업자 회수 프로시저

    DECLARE s_OUTER_DONE BOOLEAN DEFAULT FALSE;

    DECLARE v_RUNDATE CHAR(14);
    DECLARE v_LOGMSG VARCHAR(2000);

    DECLARE v_WORK_ROLE VARCHAR(5);  			-- 계정권한 (매니저 또는 슈퍼관리자)

    DECLARE c_WORKER_ACCOUNT VARCHAR(100);      -- cursor 변수
    -- DECLARE c_DATA_ID INT;  				  	-- cursor 변수
    DECLARE c_LIMIT_COUNT INT;  				-- cursor 변수

    DECLARE v_SQL_STATE varchar(5);		  		-- ERROR 상태
    DECLARE v_INT_ERROR_NO INT;				  	-- ERROR NUM
    DECLARE v_TXT_ERROR_MSG TEXT;		      	-- ERROR MSG

    DECLARE v_DEFAULT_RUNTYPE 			VARCHAR(6);				-- DEFAULT STRING 구동타입
    DECLARE v_DEFAULT_WORKER 			VARCHAR(6);
    DECLARE v_DEFAULT_RECALL 			VARCHAR(6);
    DECLARE v_DEFAULT_WORK_STATUS_RE 	VARCHAR(2);
    DECLARE v_DEFAULT_WORK_STATUS_WD 	VARCHAR(2);
    DECLARE v_DEFAULT_WORKER_ROLE_W 	VARCHAR(1);

    -- 1번째 Corsor for DATA LIST
    DECLARE CURSOR_WORKER CURSOR FOR
        SELECT USER_ACCOUNT
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID 	= p_PROJECT_ID
          AND WORK_ROLE	= 'W'			-- 작업자(라벨러)
          AND USE_STATUS 	= 'U'    		-- 사용중
          AND FIND_IN_SET(USER_ACCOUNT, p_WORKER_ACCOUNT);

    /* 커서 종료조건 : 더이상 없다면 종료 */
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        BEGIN
            SET s_OUTER_DONE := TRUE;
        END;

    --  DEFAULT 셋팅
    SET v_DEFAULT_RUNTYPE 	= 'MANUAL';
    SET v_DEFAULT_WORKER 	= 'WORKER';
    SET v_DEFAULT_RECALL 	= 'RECALL';
    SET v_DEFAULT_WORK_STATUS_RE 	= 'RE';
    SET v_DEFAULT_WORK_STATUS_WD 	= 'WD';
    SET v_DEFAULT_WORKER_ROLE_W 	= 'W';

    -- 할당건수 0 초기화
    SET c_LIMIT_COUNT = 0;

    -- LOG TABEL INSERT 기본값 셋팅
    SELECT DATE_FORMAT(now(), '%Y%m%d%H%i%s') INTO v_RUNDATE FROM dual;  -- 실행 일자 세팅 ( YYYYMMDDHHMMSS )

    SET v_LOGMSG = CONCAT( '[START] 시작시간 - ', NOW());
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_DEFAULT_RUNTYPE , ', ',  v_DEFAULT_WORKER, ' : ', p_WORKER_ACCOUNT , ', WORK_STATUS : ', p_WORK_STATUS);

    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);


    -- 작업중, 검수요청, 1차반려, 2차반려
    -- IF p_WORK_STATUS = 'IR' OR p_WORK_STATUS = 'AW' OR p_WORK_STATUS = 'R1' OR p_WORK_STATUS = 'R2' THEN
    IF p_WORK_STATUS = 'IR' OR p_WORK_STATUS = 'AW' OR p_WORK_STATUS = 'R' THEN

        OPEN CURSOR_WORKER;

        LOOP_OUTER: LOOP         -- 내부 루프 시작
        FETCH CURSOR_WORKER INTO c_WORKER_ACCOUNT;

        -- 클라이언트가 요청한 데이터 개수를 만족하면 루프를 종료
        IF s_OUTER_DONE
        THEN
            CLOSE CURSOR_WORKER;
            LEAVE LOOP_OUTER;
        END IF;
        -- DATA 조회  : 검수요청 상태에서는 검수자에게 할당되지 않은 데이터만 회수처리.

        BLOCK_INNER: BEGIN
            DECLARE s_INNER_DONE BOOLEAN DEFAULT FALSE;
            DECLARE c_DATA_ID INT;  				  	-- cursor 변수

            -- 내부 CURSOR 시작
            DECLARE CURSOR_DATA CURSOR FOR
                /**SELECT
                    DATA_ID
                 FROM TB_DATA AS DT
                 JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
                 WHERE 1=1
                 AND PROJECT_ID = p_PROJECT_ID
                 AND WORKER_ACCOUNT 		= c_WORKER_ACCOUNT
                 AND
                    CASE WHEN p_WORK_STATUS = 'IR' THEN WORK_STATUS = 'IR'
                         WHEN p_WORK_STATUS = 'AW' THEN WORK_STATUS = 'AW'
                         WHEN p_WORK_STATUS = 'R' THEN (WORK_STATUS = 'R1' OR WORK_STATUS = 'R2')
                    ELSE ''
                    END
                 AND (`1ST_INSPECT_ACCOUNT` IS NULL OR `1ST_INSPECT_ACCOUNT` = '')		-- 검수요청 단계에서는 검수자 할당된 데이터에 대해서 조회하지 않는다.
                 AND (ASSIGN_1ST_INSPECT_DT IS NULL OR ASSIGN_1ST_INSPECT_DT = '')		-- 검수요청 단계에서는 검수자 할당된 데이터에 대해서 조회하지 않는다.
                 AND (`2ND_INSPECT_ACCOUNT` IS NULL OR `2ND_INSPECT_ACCOUNT` = '')		-- 검수요청 단계에서는 검수자 할당된 데이터에 대해서 조회하지 않는다.
                 AND (ASSIGN_2ND_INSPECT_DT IS NULL OR ASSIGN_2ND_INSPECT_DT = '')		-- 검수요청 단계에서는 검수자 할당된 데이터에 대해서 조회하지 않는다.
                 AND (COMPLETE_2ND_INSPECT_DT IS NULL OR COMPLETE_2ND_INSPECT_DT = '')
                 AND DTS.USE_STATUS 		= 'U'
                 AND DT.USE_STATUS 			= 'U';
                 */

                SELECT
                    DATA_ID
                FROM TB_DATA AS DT
                         JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
                WHERE 1=1
                  AND PROJECT_ID = p_PROJECT_ID
                  AND WORKER_ACCOUNT 		= c_WORKER_ACCOUNT
                  AND
                    CASE WHEN p_WORK_STATUS = 'IR' THEN WORK_STATUS = 'IR'
                         WHEN p_WORK_STATUS = 'AW' THEN WORK_STATUS = 'AW'
                         WHEN p_WORK_STATUS = 'R' THEN (WORK_STATUS = 'R1' OR WORK_STATUS = 'R2')
                         WHEN p_WORK_STATUS = 'C1' THEN WORK_STATUS = 'C1'
                         ELSE ''
                        END
                  AND
                    CASE WHEN p_INSPECTION_NUM = 1
                             THEN
                             (COMPLETE_1ST_INSPECT_DT IS NULL OR COMPLETE_1ST_INSPECT_DT = '')
                         ELSE
                             (COMPLETE_2ND_INSPECT_DT IS NULL OR COMPLETE_2ND_INSPECT_DT = '')
                        END
                  AND DTS.USE_STATUS 		= 'U'
                  AND DT.USE_STATUS 			= 'U';


            /* 커서 종료조건 : 더이상 없다면 종료 */
            DECLARE CONTINUE HANDLER FOR NOT FOUND
                BEGIN
                    SET s_INNER_DONE := TRUE;
                END;

            OPEN CURSOR_DATA;

            LOOP_INNER: LOOP         -- 내부 루프 시작 (DATA)
            FETCH CURSOR_DATA INTO c_DATA_ID;

            -- IF s_INNER_DONE
            IF s_INNER_DONE
            THEN
                -- set s_OUTER_DONE := false;
                CLOSE CURSOR_DATA;
                LEAVE LOOP_INNER;
            END IF;
            -- 데이터 테이블 업데이트(작업자 할당)
            /**
            UPDATE TB_DATA
            SET
                WORKER_ACCOUNT 		= NULL							-- 작업자 계정 초기화
                ,ASSIGN_WORKER_DT 	= NULL							-- 작업할당 일자 초기화
                ,WORK_STATUS 		= v_DEFAULT_WORK_STATUS_RE		-- 데이터 회수( 대기상태 )
                ,LAST_UPD_ACCOUNT 	= p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
                ,LAST_UPD_DTM 		= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
            WHERE 1=1
            AND DATA_ID = c_DATA_ID;
            */

            IF p_INSPECTION_NUM = 1 THEN
                UPDATE TB_DATA
                SET
                    WORKER_ACCOUNT 		= NULL							-- 작업자 계정 초기화
                  ,ASSIGN_WORKER_DT 	= NULL							-- 작업할당 일자 초기화
                  ,REQUEST_INSPECT_DT = NULL 							-- 검수 요청일 초기화
                  ,1ST_INSPECT_ACCOUNT = NULL 						-- 1차 검수자 초기화
                  ,1ST_REJECT_DT = NULL  								-- 반려 일자 초기화
                  ,1ST_REJECT_MEMO = NULL  							-- 반려 메모 초기화
                  ,ASSIGN_1ST_INSPECT_DT = NULL  						-- 검수 할당일 초기화
                  ,REJECT_COUNT = NULL                                    -- 반려 누적수 초기화
                  ,WORK_STATUS 		= v_DEFAULT_WORK_STATUS_RE		-- 데이터 회수( 대기상태 )
                  ,LAST_UPD_ACCOUNT 	= p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
                  ,LAST_UPD_DTM 		= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
                WHERE 1=1
                  AND DATA_ID = c_DATA_ID;
            ELSE
                UPDATE TB_DATA
                SET
                    WORKER_ACCOUNT 		= NULL							-- 작업자 계정 초기화
                  ,ASSIGN_WORKER_DT 	= NULL							-- 작업할당 일자 초기화
                  ,REQUEST_INSPECT_DT = NULL 							-- 검수 요청일 초기화\
                  ,1ST_INSPECT_ACCOUNT = NULL 						-- 1차 검수자 초기화
                  ,1ST_REJECT_DT = NULL  								-- 반려 일자 초기화
                  ,1ST_REJECT_MEMO = NULL  							-- 반려 메모 초기화
                  ,2ND_INSPECT_ACCOUNT = NULL  						-- 2차 검수자 초기화
                  ,2ND_REJECT_DT = NULL  								-- 2차 반려 일자 초기화
                  ,2ND_REJECT_MEMO = NULL  							-- 2차 반려 메모 초기화
                  ,COMPLETE_1ST_INSPECT_DT = NULL  					-- 1차 검수완료 일자 초기화
                  ,ASSIGN_2ND_INSPECT_DT = NULL  						-- 2차 검수 할당 일 초기화
                  ,ASSIGN_1ST_INSPECT_DT = NULL  						-- 검수 할당일 초기화
                  ,REJECT_COUNT = NULL                                    -- 반려 누적수 초기화
                  ,WORK_STATUS 		= v_DEFAULT_WORK_STATUS_RE		-- 데이터 회수( 대기상태 )
                  ,LAST_UPD_ACCOUNT 	= p_MANAGER_ACCOUNT				-- 매니저 또는 슈퍼관리자
                  ,LAST_UPD_DTM 		= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
                WHERE 1=1
                  AND DATA_ID = c_DATA_ID;
            END IF;

            SELECT IFNULL(MAX(WORK_ROLE), 'S') AS WORK_ROLE INTO v_WORK_ROLE   -- 매니저 또는 슈퍼관리자 권한
            FROM TB_PROJECT_USER
            WHERE 1=1
              AND PROJECT_ID = p_PROJECT_ID
              AND USER_ACCOUNT = p_MANAGER_ACCOUNT;

            -- 데이터 히스토리 업데이트
            INSERT INTO TB_DATA_HISTORY(
                                        DATA_ID
                                       ,WORK_STATUS
                                       ,ACTION_ACCOUNT
                                       ,ACTION_WORK_ROLE
                                       ,TARGET_ACCOUNT
                                       ,TARGET_WORK_ROLE
                                       ,ACTION_DTM
                                       ,FIRST_INS_ACCOUNT
                                       ,FIRST_INS_DTM
                                       ,LAST_UPD_ACCOUNT
                                       ,LAST_UPD_DTM)
            VALUES(
                      c_DATA_ID
                  ,v_DEFAULT_WORK_STATUS_WD						-- WD : 작업자 회수
                  ,p_MANAGER_ACCOUNT
                  ,v_WORK_ROLE
                  ,c_WORKER_ACCOUNT
                  ,v_DEFAULT_WORKER_ROLE_W						-- W : 작업자
                  ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')  -- 액션일자
                  ,p_MANAGER_ACCOUNT
                  ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
                  ,p_MANAGER_ACCOUNT
                  ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
                  );

            SET c_LIMIT_COUNT = c_LIMIT_COUNT + 1;
            END LOOP LOOP_INNER;

        END BLOCK_INNER;

        END LOOP LOOP_OUTER;

        SET v_LOGMSG = CONCAT( '[LOG] - 회수대상ID : ', p_WORKER_ACCOUNT,', - 회수자 ID : ', p_MANAGER_ACCOUNT , ', 회수 총건수 : ', c_LIMIT_COUNT);
        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);

        SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);

        -- RETURN VALUE
        SET p_RTN_VALUE = 1;


    ELSE -- 타입에러

        SET v_LOGMSG = CONCAT( '[ERROR] : p_WORK_STATUS TYPE ERROR');
        INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_RECALL, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);
        SET p_RTN_VALUE = 0;

    END IF;

    COMMIT;
END BLOCK_OUTER ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_worker_rejection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_worker_rejection`(IN p_PROJECT_ID INT, IN p_WORKER_ACCOUNT VARCHAR(4000), p_MANAGER_ACCOUNT VARCHAR(50), OUT p_RTN_VALUE INT)
BLOCK_OUTER : BEGIN
    -- 작업자 반려 프로시저

    DECLARE s_OUTER_DONE BOOLEAN DEFAULT FALSE;

    DECLARE v_RUNDATE CHAR(14);
    DECLARE v_LOGMSG VARCHAR(2000);

    DECLARE v_WORK_ROLE VARCHAR(5);  			-- 계정권한 (매니저 또는 슈퍼관리자)

    DECLARE c_WORKER_ACCOUNT VARCHAR(100);      -- cursor 변수
    -- DECLARE c_DATA_ID INT;  				  	-- cursor 변수
    DECLARE c_LIMIT_COUNT INT;  				-- cursor 변수

    DECLARE v_SQL_STATE varchar(5);		  		-- ERROR 상태
    DECLARE v_INT_ERROR_NO INT;				  	-- ERROR NUM
    DECLARE v_TXT_ERROR_MSG TEXT;		      	-- ERROR MSG

    DECLARE v_DEFAULT_RUNTYPE 			VARCHAR(6);				-- DEFAULT STRING 구동타입
    DECLARE v_DEFAULT_WORKER 			VARCHAR(6);
    DECLARE v_DEFAULT_REJECTION 		VARCHAR(10);
    DECLARE v_DEFAULT_WORK_STATUS_IR 	VARCHAR(2);
    DECLARE v_DEFAULT_WORK_STATUS_R1 	VARCHAR(2);
    DECLARE v_DEFAULT_WORKER_ROLE_W 	VARCHAR(1);

    -- 1번째 Corsor for DATA LIST
    DECLARE CURSOR_WORKER CURSOR FOR
        SELECT USER_ACCOUNT
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID 	= p_PROJECT_ID
          AND WORK_ROLE	= 'W'			-- 작업자(라벨러)
          AND USE_STATUS 	= 'U'    		-- 사용중
          AND FIND_IN_SET(USER_ACCOUNT, p_WORKER_ACCOUNT);

    /* 커서 종료조건 : 더이상 없다면 종료 */
    DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET s_OUTER_DONE := TRUE;

    --  DEFAULT 셋팅
    SET v_DEFAULT_RUNTYPE 			= 'MANUAL';			-- 수동
    SET v_DEFAULT_WORKER 			= 'WORKER';			-- 작업자
    SET v_DEFAULT_REJECTION 		= 'REJECTION';		-- 반려
    SET v_DEFAULT_WORK_STATUS_IR 	= 'IR';				-- 검수요청
    SET v_DEFAULT_WORK_STATUS_R1 	= 'R1';				-- 1차검수완료
    SET v_DEFAULT_WORKER_ROLE_W 	= 'W';				-- 계정 _ 권한

    -- 할당건수 0 초기화
    SET c_LIMIT_COUNT = 0;

    -- LOG TABEL INSERT 기본값 셋팅
    SELECT DATE_FORMAT(now(), '%Y%m%d%H%i%s') INTO v_RUNDATE FROM dual;  -- 실행 일자 세팅 ( YYYYMMDDHHMMSS )

    SET v_LOGMSG = CONCAT( '[START] 시작시간 - ', NOW());
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_REJECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[LOG] PARAMETER -실행타입 : ', v_DEFAULT_RUNTYPE , ', ',  v_DEFAULT_WORKER, ' : ', p_WORKER_ACCOUNT , ', MANAGER_ACCOUNT : ', p_MANAGER_ACCOUNT);

    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_REJECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);

    -- 커서 시작
    OPEN CURSOR_WORKER;

    -- 데이터 루프시작
    LOOP_OUTER: LOOP         -- 내부 루프 시작
    FETCH CURSOR_WORKER INTO c_WORKER_ACCOUNT;

    IF s_OUTER_DONE
    THEN
        CLOSE CURSOR_WORKER;
        LEAVE LOOP_OUTER;
    END IF;

    BLOCK_INNER: BEGIN
        DECLARE s_INNER_DONE BOOLEAN DEFAULT FALSE;
        DECLARE c_DATA_ID INT;  				  	-- cursor 변수

        -- 내부 CURSOR 시작
        DECLARE CURSOR_DATA CURSOR FOR
            /*
            SELECT
                DATA_ID
             FROM TB_DATA AS DT
             JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
             WHERE 1=1
             AND PROJECT_ID 				= p_PROJECT_ID
             AND WORKER_ACCOUNT 			= c_WORKER_ACCOUNT
             AND WORK_STATUS				= v_DEFAULT_WORK_STATUS_IR	-- 검수요청 단계
             AND (`1ST_REJECT_DT` 			IS NULL OR `1ST_REJECT_DT` = '')
             AND (ASSIGN_1ST_INSPECT_DT 	IS NULL OR ASSIGN_1ST_INSPECT_DT = '')
             AND DTS.USE_STATUS 			= 'U'
             AND DT.USE_STATUS 				= 'U';
            */

            SELECT
                DATA_ID
            FROM TB_DATA AS DT
                     JOIN TB_DATASET AS DTS ON DTS.DATASET_ID = DT.DATASET_ID
            WHERE 1=1
              AND PROJECT_ID 				= p_PROJECT_ID
              AND WORKER_ACCOUNT 			= c_WORKER_ACCOUNT
              AND WORK_STATUS				= v_DEFAULT_WORK_STATUS_IR	-- 검수요청 단계
              AND (`1ST_INSPECT_ACCOUNT` 	IS NOT NULL OR `1ST_INSPECT_ACCOUNT` != '')
              AND (ASSIGN_1ST_INSPECT_DT 	IS NOT NULL OR ASSIGN_1ST_INSPECT_DT != '')
              AND DTS.USE_STATUS 			= 'U'
              AND DT.USE_STATUS 				= 'U';

        /* 커서 종료조건 : 더이상 없다면 종료 */
        DECLARE CONTINUE HANDLER
            FOR NOT FOUND SET s_INNER_DONE := TRUE;

        OPEN CURSOR_DATA;

        LOOP_INNER: LOOP         -- 내부 루프 시작 (DATA)
        FETCH CURSOR_DATA INTO c_DATA_ID;

        IF s_INNER_DONE
        THEN
            CLOSE CURSOR_DATA;
            LEAVE LOOP_INNER;
        END IF;

        -- 메타(어노테이션) 테이블 업데이트
        UPDATE TB_META
        SET
            REJECT_YN			= 'Y'
          ,REJECT_CODE		= '005'
          ,REJECT_MEMO		= (SELECT CODE_NAME FROM TB_COMMON_CODE WHERE FIELD_NAME = 'REJECT_CODE' AND COMMON_CODE = '005')
        WHERE 1=1
          AND DATA_ID = c_DATA_ID;

        -- 데이터 테이블 업데이트
        /*
        UPDATE TB_DATA
        SET
             WORK_STATUS 				= v_DEFAULT_WORK_STATUS_R1						-- 1차 반려
            ,`1ST_REJECT_MEMO`			= (SELECT CODE_NAME FROM TB_COMMON_CODE WHERE FIELD_NAME = 'REJECT_CODE' AND COMMON_CODE = '005')
            ,`1ST_REJECT_DT` 			= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y%m%d')
            ,LAST_UPD_ACCOUNT 			= p_MANAGER_ACCOUNT								-- 매니저 또는 슈퍼관리자
            ,LAST_UPD_DTM 				= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
        WHERE 1=1
        AND DATA_ID = c_DATA_ID;
        */

        UPDATE TB_DATA
        SET
            WORK_STATUS 				= v_DEFAULT_WORK_STATUS_R1						-- 1차 반려
          ,`1ST_REJECT_MEMO`			= (SELECT CODE_NAME FROM TB_COMMON_CODE WHERE FIELD_NAME = 'REJECT_CODE' AND COMMON_CODE = '005')
          ,`1ST_REJECT_DT` 			= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y%m%d')
          ,LAST_UPD_ACCOUNT 			= p_MANAGER_ACCOUNT								-- 매니저 또는 슈퍼관리자
          ,LAST_UPD_DTM 				= DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
        WHERE 1=1
          AND DATA_ID = c_DATA_ID;

        SELECT IFNULL(MAX(WORK_ROLE), 'S') AS WORK_ROLE INTO v_WORK_ROLE   -- 매니저 또는 슈퍼관리자 권한
        FROM TB_PROJECT_USER
        WHERE 1=1
          AND PROJECT_ID = p_PROJECT_ID
          AND USER_ACCOUNT = p_MANAGER_ACCOUNT;

        -- 데이터 히스토리 업데이트
        INSERT INTO TB_DATA_HISTORY(
                                    DATA_ID
                                   ,WORK_STATUS
                                   ,ACTION_ACCOUNT
                                   ,ACTION_WORK_ROLE
                                   ,TARGET_ACCOUNT
                                   ,TARGET_WORK_ROLE
                                   ,ACTION_DTM
                                   ,FIRST_INS_ACCOUNT
                                   ,FIRST_INS_DTM
                                   ,LAST_UPD_ACCOUNT
                                   ,LAST_UPD_DTM)
        VALUES(
                  c_DATA_ID
              ,v_DEFAULT_WORK_STATUS_R1						-- R1 : 1차반려
              ,p_MANAGER_ACCOUNT
              ,v_WORK_ROLE
              ,c_WORKER_ACCOUNT
              ,v_DEFAULT_WORKER_ROLE_W						-- W : 작업자
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')  	-- 액션일자
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              ,p_MANAGER_ACCOUNT
              ,DATE_FORMAT(CURRENT_TIMESTAMP, '%Y-%m-%d %T')
              );

        SET c_LIMIT_COUNT = c_LIMIT_COUNT + 1;

        END LOOP LOOP_INNER;

    END BLOCK_INNER;

    END LOOP LOOP_OUTER;

    SET v_LOGMSG = CONCAT( '[LOG] - 반려대상ID : ', p_WORKER_ACCOUNT,', - 회수자 ID : ', p_MANAGER_ACCOUNT , ', 반려 총건수 : ', c_LIMIT_COUNT);
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_REJECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);

    SET v_LOGMSG = CONCAT( '[END] 종료시간 - ', NOW(), ', Successfully end');
    INSERT INTO TB_PROCEDURE_LOG (PROJECT_ID, FUNCTION_TYPE, RUN_DATE, RUN_TYPE, WORK_TYPE, LOG_MSG) VALUES (p_PROJECT_ID, v_DEFAULT_REJECTION, v_RUNDATE, v_DEFAULT_RUNTYPE, v_DEFAULT_WORKER, v_LOGMSG);

    -- RETURN VALUE
    SET p_RTN_VALUE = 1;


    COMMIT;
END BLOCK_OUTER ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHEC
