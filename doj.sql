SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = '+08:00';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

/* DROP DATABASE IF EXISTS `doj`; */
CREATE DATABASE IF NOT EXISTS `doj` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `doj`;

DROP TABLE IF EXISTS `contest`;
CREATE TABLE `contest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `problems` text NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `problems`;
CREATE TABLE `problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `input` text NOT NULL,
  `output` text NOT NULL,
  `hint` text NOT NULL,
  `time` int(11) NOT NULL,
  `memory` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `tags` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `problems` (`id`, `name`, `description`, `input`, `output`, `hint`, `time`, `memory`, `create_time`, `tags`) VALUES
(1000,	'A+B Problem',	'给你两个数 $a$ 和 $b$，请输出他们的和。',	'一行，两个用空格隔开的整数 $a$ 和 $b$。',	'一个整数，表示 $a+b$。',	'对于100%的数据，有 $0 \\leq a, b \\leq 10^9$。\n\n此处放出各种语言代码：\n\n#### C\n\n>```c\n#include <stdio.h>\nint main()\n{\n	int a, b;\n	scanf(\"%d%d\", &a, &b);\n	printf(\"%d\", a + b);\n	return 0;\n}\n```\n\n#### C++\n\n>```cpp\n#include <iostream>\nusing namespace std;\nint main()\n{\n	int a, b;\n	cin >> a >> b;\n	cout << a + b;\n	return 0;\n}\n```\n\n#### Pascal\n\n>```delphi\nprogram P1000;\nvar a, b: longint;\nbegin\n	read(a, b);\n	writeln(a + b);\nend.\n```\n\n#### Python 2.x\n\n>```python\na, b = raw_input().split(\" \")\nprint int(a) + int(b)\n```',	1000,	64000,	'2015-08-30 20:23:46',	'水题'),
(1001,	'Hello World !',	'同样是一道水题，和A+B Problem一样，为初学者而设，用于熟悉评测环境。\n你只需要输出 `Hello World !` 即可。',	'此题没有输入格式。',	'输出一行，一个字符串 `Hello World !` 。',	'和上一题一样，放出各种语言代码，以供参考：\n\n#### C\n\n>```c\n#include <stdio.h>\nint main()\n{\n	printf(\"Hello World !\");\n}\n```\n\n#### C++\n\n>```cpp\n#include <iostream>\nusing namespace std;\nint main()\n{\n	cout << \"Hello World !\";\n}\n```\n\n#### Pascal\n\n>```delphi\nprogram P1001;\nbegin\n	write(\'Hello World !\');\nend.\n```\n\n#### Python 2.x\n\n>```python\nprint \"Hello World !\"\n```',	1000,	64000,	'2015-08-30 20:39:30',	'水题');

DROP TABLE IF EXISTS `submit`;
CREATE TABLE `submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `submit_time` datetime NOT NULL,
  `language` int(10) unsigned NOT NULL,
  `res` smallint(6) NOT NULL,
  `result` text NOT NULL,
  `code` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `language` (`language`),
  KEY `result` (`res`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `group` varchar(20) NOT NULL,
  `set` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `tags` (`group`, `set`) VALUES
('比赛',	'NOIP|APIO|CTSC|NOI|IOI|WC|省选'),
('年份',	'2001|2002|2003|2004|2005|2006|2007|2008|2009|2010|2011|2012|2013|2014|2015'),
('地区',	'上海|四川|安徽|山东|广东|江苏|浙江|湖南|重庆'),
('基础算法',	'枚举|贪心|递归|递推|模拟|排序|哈希'),
('图论',	'最短路|差分约束|网络流|费用流|二分图|拓扑排序|强连通分量|割点和桥|欧拉回路|2-SAT'),
('计算几何',	'凸包|半平面交|最远点对|最小圆覆盖|坐标离散|扫描线算法'),
('树结构',	'树的遍历|生成树|公共祖先|树上倍增|树链剖分'),
('动态规划',	'背包DP|线性DP|环形DP|树形DP|斜率DP|插头DP|状态压缩'),
('数学',	'GCD&LCM|素数判定|扩展欧几里德|排列组合|生成函数|容斥原理|康托展开|Polya定理|Fibonacci数列|Catalan数列|博弈论|高斯消元|矩阵乘法'),
('字符串',	'KMP|Trie树|AC自动机|Manacher|正则表达式'),
('数据结构',	'栈|队列|链表|并查集|堆|线段树|左偏树|平衡树|树状数组|树套树|KD-Tree|块状链表|后缀树'),
('搜索',	'DFS|BFS|剪枝|启发式搜索|记忆化搜索'),
('其它',	'二分查找|高精度|FFT|水题');

DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `time` datetime NOT NULL,
  `top` tinyint(4) NOT NULL DEFAULT '0',
  `main` tinyint(4) NOT NULL,
  KEY `id` (`id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `topics` (`id`, `uid`, `title`, `content`, `time`, `top`, `main`) VALUES
(1,	1,	'FAQ - DOJ - 新用户必读',	'欢迎大家注册DOJ，希望大家能在这里玩得愉快！\n\n下面是关于DOJ一些基本的问题：\n\n-----\n\n**Q**：OJ的运行环境、编译环境是什么？\n\n**A**：OJ运行于Ubuntu操作系统，各语言编译/运行命令如下：\n\n|语言|编译命令|运行命令|\n|:---:|:---:|:---:|\n|C|gcc main.c -o main -fno-asm -O2 -lm -DONLINE_JUDGE|./main|\n|C++|g++ main.cpp -o main -fno-asm -O2 -lm -DONLINE_JUDGE|./main|\n|Pascal|fpc main.pas -O2|./main|\n|Python 2.x|python -O -m py_compile main.py|python main.pyo|\n\n-----\n\n**Q**：为什么我不能更改自己的头像？\n\n**A**：DOJ本身并不提供头像储存服务，DOJ使用Gravatar这个全球通用的头像服务，你只需要在Gravatar上注册一个账号（和DOJ个人信息中的邮箱相同），并在Gravatar中上传自己的头像，DOJ就可以显示你的自定义头像了！\n\nGravatar中文网的地址是：[https://cn.gravatar.com/](https://cn.gravatar.com/)\n\n-----\n\n**Q**：如何让自己的话题内容可读性更强？\n\n**A**：DOJ支持Markdown语言，在编辑话题/回复时可以直接使用，关于Markdown的基础语法，你可以在另一个置顶话题中找到。\n\n-----\n\n**Q**：我有一些对于DOJ的建议该怎么提？\n\n**A**：你可以将你对DOJ的建议发送至下面任何一个邮箱：\n\n> [i@doveccl.com](mailto:i@doveccl.com)\n> \n> [idoveccl@gmail.com](mailto:idoveccl@gmail.com)\n>\n> [idoveccl@outlook.com](mailto:idoveccl@outlook.com)\n\n	',	'2015-09-05 14:26:38',	1,	1),
(2,	1,	'Markdown 语法简介',	'# 概述\n\nMarkdown 是一种轻量级的标记语言，相对于繁杂的HTML代码，Markdown 天生简短，具有极强的优势。\n\n下面将会用一些例子来说明 Markdown 的基础语法\n\n-----\n\n# 1. 标题\n\n标题是每篇文章都需要也是最常用的格式，在 Markdown 中，如果一段文字被定义为标题，只要在这段文字前加 `#` 号即可。\n\n例如：\n\n	# 一级标题\n\n	## 二级标题\n\n	### 三级标题\n\n将会得到以下显示效果：\n\n# 一级标题\n\n\n## 二级标题\n\n### 三级标题\n\n\n以此类推，总共六级标题，井号后加应该有一个空格，这是最标准的 Markdown 语法。\n\n-----\n\n# 2. 列表\n\n熟悉 HTML 的同学肯定知道有序列表与无序列表的区别，在 Markdown 下，列表的显示只需要在文字前加上 `-` 或 `*` 即可变为无序列表，有序列表则直接在文字前加 `1.` `2.` `3.` 符号要和文字之间加上一个字符的空格。\n\n例如：\n\n	### 无序\n	- 无序列表\n\n	- 无序列表\n\n	### 有序\n\n	1. 有序列表\n\n	2. 有序列表\n\n将会得到以下显示效果：\n\n### 无序\n- 无序列表\n\n- 无序列表\n\n### 有序\n\n1. 有序列表\n\n2. 有序列表\n\n-----\n\n\n# 3. 引用\n\n如果你需要引用一小段别处的句子，那么就要用引用的格式。\n\n例如：\n\n	> 这是一段引用的句子\n\n将会得到以下显示效果：\n\n> 这是一段引用的句子\n\n只需要在文本前加入 `>` 这种尖括号（大于号）即可，注意 `>` 后仍应有空格。\n\n# 4. 图片与链接\n\n插入链接与插入图片的语法很像，区别在一个 `!` 号\n\n我们不为普通用户提供图片上传服务，如果想要上传图片请使用图片外链网站，例如 [CloudApp](https://www.getcloudapp.com/), [贴图库](http://tietuku.com/), [POCO相册](http://tu.poco.cn/)。\n\n当你获取了一个正确的图片或链接之后，便可以使用如下方法：\n\n	[点击这里访问example.com](http://www.example.com/)\n\n	![这里是图片介绍文字，当图片无法加载时会显示这些文字](http://i11.tietuku.com/2159301a9bbd9ca7.png)\n\n将会得到以下显示效果：\n\n[点击这里访问example.com](http://www.example.com/)\n\n![这里是图片介绍文字，当图片无法加载时会显示这些文字](http://i11.tietuku.com/2159301a9bbd9ca7.png)\n\n# 5. 粗体与斜体\n\nMarkdown 的粗体和斜体也非常简单，用两个 `*` 包含一段文本就是粗体的语法，用一个 `*` 包含一段文本就是斜体的语法。\n\n例如：\n\n	**这里是粗体**\n	\n	*这里是斜体*\n\n将会得到以下显示效果：\n\n**这里是粗体**\n	\n*这里是斜体*\n\n# 6. 表格\n\n表格是 Markdown 比较累人的地方，例子如下：\n\n	|表头1|表头2|表头3|\n	|:---|:---:|---:|\n	|左对齐|居中对齐|右对齐|\n	|A|B|C|\n	|a|b|c|\n	|1|2|3|\n\n将会得到以下显示效果：\n\n|表头1|表头2|表头3|\n|:---|:---:|---:|\n|左对齐|居中对齐|右对齐|\n|A|B|C|\n|a|b|c|\n|1|2|3|\n\n# 7. 代码框\n如果你是个程序猿，需要在文章里优雅的引用代码框，在 Markdown 下实现也非常简单。\n\n在头尾各使用三个 ` ` ` 或选择每行4个空格或一个Tab缩进，其中插入的代码支持代码高亮。\n\n例如：\n\n	```\n	#当没有指定语言时会自动识别\n	str = \"Hellow World !\"\n	print(str)\n	```\n	\n	```cpp\n	//可以自己指定语言\n	#include <iostream>\n	int main()\n	{\n		return 0;\n	}\n	```\n\n		#这里使用缩进实现\n		str = \"Hellow World !\"\n		print(str)\n		\n将会得到以下显示效果：\n	\n```\n#当没有指定语言时会自动识别\nstr = \"Hellow World !\"\nprint(str)\n```\n	\n```cpp\n//可以自己指定语言\n#include <iostream>\nint main()\n{\n	return 0;\n}\n```\n\n	#这里使用缩进实现\n	str = \"Hellow World !\"\n	print(str)\n	\n# 8. 数学公式\n\nMarkdown 本身没有定义数学公式的语法，在这里为了方便大家引入了 LaTeX 来书写数学公式，由于语法众多所以请戳[这里](http://blog.163.com/goldman2000@126/blog/static/167296895201221242646561/)查看完整的使用方法，以下是显示效果：\n\n单行公式请在两边加上`$`,多行公式请在首尾加上`$$`\n\n	\\sum_{i=0}^n i^2 = \\frac{(n^2+n)(2n+1)}{6}\n	\n	\\cos x \\leq \\sin y \\leq \\tan z\n\n显示效果如下：\n\n$$\n\\sum_{i=0}^n i^2 = \\frac{(n^2+n)(2n+1)}{6}\n$$\n\n$$\n\\cos x \\leq \\sin y \\leq \\tan z\n$$\n\n注意，由于 LaTeX 和 Markdown 语法本身有冲突，所以请在书写时尽量避免。',	'2015-09-05 21:31:10',	1,	1);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `mail` varchar(40) NOT NULL,
  `password` varchar(200) NOT NULL,
  `reg_time` datetime NOT NULL,
  `bg` tinyint(4) NOT NULL DEFAULT '1',
  `sex` tinyint(4) NOT NULL DEFAULT '1',
  `sign` varchar(100) NOT NULL DEFAULT '我是大神犇！',
  `school` varchar(100) NOT NULL DEFAULT '清华大学',
  `birth` date NOT NULL DEFAULT '2000-01-01',
  `admin` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `name`, `mail`, `password`, `reg_time`, `bg`, `sex`, `sign`, `school`, `birth`, `admin`) VALUES
(1,	'Admin',	'admin@doj.com',	'kethkrswkocljrspkntnkcsyjetujhsdkgytkdypkppcjizrjqtwjfkljpasjjevkhdlklcyjlrvjdxnkmsykfwbkqaojnxnkiwpkkjq',	'2000-01-01 00:00:00',	1,	1,	'',	'',	'2000-01-01',	1);
