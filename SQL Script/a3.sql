USE a3;

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id`           BIGINT(20)                 NOT NULL AUTO_INCREMENT,
  `title`        VARCHAR(100)
                 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description`  VARCHAR(255)
                 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author`       VARCHAR(100)
                 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isbn`         VARCHAR(20)
                 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `print_year`   INT(11)                    DEFAULT NULL,
  `read_already` TINYINT(1)                 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_id_uindex` (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 67
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

LOCK TABLES `book` WRITE;
INSERT INTO `book`
VALUES (38, 'Java Concurrency in Practice', 'просто хорошая книга', 'Brian Goetz', '0-321-34960-1', 2006, 0),
  (39, 'Head First Design Patterns', 'This book will load patterns into your brain in a way that sticks. In a way that lets you put them to work immediately. In a way that makes you better at solving software design problems.', 'Eric Freeman, Elisabeth Robson, Bert Bates, Kathy Sierra', '978-0-596-00712-6', 2004, 0),
  (40, 'Algorithms', 'Essential Information about Algorithms and Data Structures', 'Robert Sedgewick, Kevin Wayne', '978-0-321-57351-3', 2011, 0),
  (41, 'Linux System Programming', 'Talking Directly to the Kernel and C Library', 'Robert Love', '978-1-44933-953-1', 2013, 0),
  (42, 'Linux Kernel Development', 'A thorough guide to the design and implementation of the Linux kernel', 'Robert Love', '978-0-6723-2946-3', 2010, 0),
  (43, 'Effective Java', 'This book brings together seventy-eight indispensable programmer\'s rules of thumb: working, best-practice solutions for the programming challenges you encounter every day.', 'Joshua Bloch', '978-0-321-35668-0', 2008, 0),
  (44, 'Java Generics and Collections', 'This book covers everything from the most basic uses of generics to the strangest corner cases.', 'Philip Wadler, Maurice Naftalin', '978-0-596-52775-4', 2009, 0),
  (45, 'Java: The Complete Reference', 'This book explains how to develop, compile, debug, and run Java programs.', 'Herbert Schildt', '978-0071808552', 2015, 0),
  (46, 'Java Puzzlers: Traps, Pitfalls, and Corner Cases', 'This lively book reveals oddities of the Java programming language through entertaining and thought-provoking programming puzzles.', 'Joshua Bloch, Neal Gafter', '978-0321336781', 2005, 0),
  (47, 'Java 8 Lambdas', 'You\'ll learn through code examples, exercises, and fluid explanations how these anonymous functions will help you write simple, clean, library-level code that solves business problems.', 'Richard Warburton', '978-1-44937-077-0', 2014, 0),
  (48, 'Head First Servlets and JSP', 'Learn how to write servlets and JSPs, what makes a web container tick (and what ticks it off), how to use JSP\'s Expression Language (EL for short), and how to write deployment descriptors for your web applications.', 'Bryan Basham, Kathy Sierra, Bert Bates', '978-0-596-51668-0', 2008, 0),
  (49, 'Spring in Action', 'You\'ll move between short snippets and an ongoing example as you learn to build simple and efficient JEE applications.', 'Craig Walls', '978-1-61729-120-3', 2014, 0),
  (50, 'Spring Persistence with Hibernate', 'You will see how to use the core Hibernate APIs and tools as part of the Spring Framework. This book illustrates how these two frameworks can be best utilized.', 'Paul Fisher, Brian D. Murphy', '978-1-4842-0268-5', 2016, 1),
  (51, 'Alice\'s Adventures in Wonderland', 'The story is deeply but gently satiric, enlivened with an imaginative plot and brilliant use of nonsense.', 'Lewis Carroll', '978-0486275437', 1865, 0),
  (54, 'Title1', 'Description1', 'Author1', 'ISBN1', 1990, 0),
  (55, 'Title2', 'Description2', 'Author2', 'ISBN2', 1991, 0),
  (56, 'Title3', 'Description3', 'Author3', 'ISBN3', 1992, 0),
  (57, 'Title4', 'Description4', 'Author4', 'ISBN4', 1993, 0),
  (58, 'Title5', 'Description5', 'Author5', 'ISBN5', 1994, 0),
  (59, 'Title6', 'Description6', 'Author6', 'ISBN6', 1995, 0),
  (60, 'Title7', 'Description7', 'Author7', 'ISBN7', 1996, 0),
  (63, 'Title9', 'Description9', 'Author9', 'ISBN9', 1998, 1),
  (64, 'Title8', 'Description8', 'Author8', 'ISBN8', 1997, 0),
  (65, 'Title10', 'Description10', 'Author10', 'ISBN10', 1999, 0),
  (66, 'Title11', 'Description11', 'Author11', 'ISBN11', 2000, 0);

UNLOCK TABLES;