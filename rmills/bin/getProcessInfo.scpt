FasdUAS 1.101.10   ��   ��    k             l     �� ��      appInfoInTitle:       	  l     �� 
��   
 [ U This AppleScript displays the amount of memory being used by designated applications    	     l     �� ��    / ) in the title of their frontmost windows.         l     �� ��    F @ It also displays the CPU usage of these apps if it exceeds 10%.         l     �� ��    V P And it gives a warning if the memory usage of an app exceeds a specified level.         l     �� ��    P J This was originally designed to keep watch on Safari's memory consumption         l     �� ��    + % but it can be used for various apps.         l     �� ��    U O It is intended to be saved as an application and left running all of the time.         l     �� ��    6 0 Cameron Hayne (macdev@hayne.net)  December 2006        !   l     ������  ��   !  " # " j     �� $�� 0 
scriptname 
scriptName $ m      % %  appInfoInTitle    #  & ' & l      ( ) ( j    �� *�� 0 usedelayloop useDelayLoop * m    ��
�� boovfals ) = 7 set this to true if you want to run from Script Editor    '  + , + l      - . - j    �� /�� 0 usegrowl useGrowl / m    ��
�� boovtrue . F @ set this to true to get warnings via Growl (http://growl.info/)    ,  0 1 0 l      2 3 2 j   	 �� 4�� 0 updatedelay updateDelay 4 m   	 
����  3   seconds    1  5 6 5 l      7 8 7 j    �� 9�� 0 cpufloor cpuFloor 9 m    ���� 
 8 9 3 % above which CPU usage will be shown in the title    6  : ; : l      < = < j    �� >�� .0 warnintervalincrement warnIntervalIncrement > m    ���� x =   seconds    ;  ? @ ? l     ������  ��   @  A B A l      C D C p     E E ������ 0 appinfolist appInfoList��   D : 4 list of AppInfo objects (added to via 'addAppInfo')    B  F G F l     ������  ��   G  H I H l     �� J��   J   registerApps:    I  K L K l     �� M��   M @ : Add a call to 'addAppInfo' for each app you want to watch    L  N O N i     P Q P I      �������� 0 registerapps registerApps��  ��   Q k     # R R  S T S I    ���� U�� 0 
addappinfo 
addAppInfo��   U �� V W�� 0 appname appName V m     X X  Safari    W �� Y Z�� 0 updateperiod updatePeriod Y m    ����  Z �� [���� 0 warnmb warnMB [ m    ���� d��   T  \ ] \ I   ���� ^�� 0 
addappinfo 
addAppInfo��   ^ �� _ `�� 0 appname appName _ m     a a  Terminal    ` �� b c�� 0 updateperiod updatePeriod b m    ���� < c �� d���� 0 warnmb warnMB d m    ���� ��   ]  e�� e I   #���� f�� 0 
addappinfo 
addAppInfo��   f �� g h�� 0 appname appName g m     i i 
 Mail    h �� j k�� 0 updateperiod updatePeriod j m    ���� < k �� l���� 0 warnmb warnMB l m    ���� ��  ��   O  m n m l     ������  ��   n  o p o l     �� q��   q   update:    p  r s r l     �� t��   t = 7 This subroutine is invoked every 'updateDelay' seconds    s  u v u i     w x w I      �������� 
0 update  ��  ��   x X      y�� z y I    �� {���� 0 updateappinfo updateAppInfo {  |�� | o    ���� 0 appinfo appInfo��  ��  �� 0 appinfo appInfo z o    ���� 0 appinfolist appInfoList v  } ~ } l     ������  ��   ~   �  l     �� ���   � 2 , the run handler (invoked at script startup)    �  � � � i     � � � I     ������
�� .aevtoappnull  �   � ****��  ��   � k     B � �  � � � r      � � � J     ����   � o      ���� 0 appinfolist appInfoList �  � � � I    
�������� 0 registerapps registerApps��  ��   �  � � � l   ������  ��   �  � � � Z     � ����� � o    ���� 0 usegrowl useGrowl � I    �������� &0 registerwithgrowl registerWithGrowl��  ��  ��  ��   �  � � � l   ������  ��   �  ��� � Z    B � ����� � o    "���� 0 usedelayloop useDelayLoop � T   % > � � k   * 9 � �  � � � I   * /�������� 
0 update  ��  ��   �  ��� � I  0 9�� ���
�� .sysodelanull��� ��� nmbr � o   0 5���� 0 updatedelay updateDelay��  ��  ��  ��  ��   �  � � � l     ������  ��   �  � � � l     �� ���   � = 7 the idle handler (invoked every 'updateDelay' seconds)    �  � � � i    ! � � � I     ������
�� .miscidlenmbr    ��� null��  ��   � k     $ � �  � � � Z      � ����� � o     ���� 0 usedelayloop useDelayLoop � k     � �  � � � l   �� ���   �   we should never get here    �  � � � I   �� ���
�� .sysodisAaleR        TEXT � m    	 � � F @Internal error: idle handler called even though using delay loop   ��   �  ��� � I   ������
�� .aevtquitnull���    obj ��  ��  ��  ��  ��   �  � � � l   ������  ��   �  � � � I    �������� 
0 update  ��  ��   �  ��� � L    $ � � o    #���� 0 updatedelay updateDelay��   �  � � � l     �����  �   �  � � � l     �~ ��~   �   addAppInfo:    �  � � � l     �} ��}   � B < Creates a new 'appInfo' object and adds it to 'appInfoList'    �  � � � l     �| ��|   � I C 'updatePeriod' is the time in seconds between updates for this app    �  � � � l     �{ ��{   � S M 'warnMB' is the memory usage (in megabytes) at which warnings will be issued    �  � � � i   " % � � � I      �z�y ��z 0 
addappinfo 
addAppInfo�y   � �x � ��x 0 appname appName � o      �w�w 0 	anappname 	anAppName � �v � ��v 0 updateperiod updatePeriod � o      �u�u  0 anupdateperiod anUpdatePeriod � �t ��s�t 0 warnmb warnMB � o      �r�r 0 awarnmb aWarnMB�s   � k      � �  � � � l     �q ��q   � 7 1on addAppInfo(anAppName, anUpdatePeriod, aWarnMB)    �  � � � r     	 � � � \      � � � l     ��p � I    �o�n�m
�o .misccurdldt    ��� null�n  �m  �p   � m    �l�l� � o      �k�k 0 prevtime prevTime �  � � � h   
 �j ��j 0 appinfo appInfo � k       � �  � � � j     �i ��i 0 appname appName � o     �h�h 0 	anappname 	anAppName �  � � � j    �g ��g 0 updateperiod updatePeriod � o    �f�f  0 anupdateperiod anUpdatePeriod �  � � � j    �e ��e 0 warnmb warnMB � o    �d�d 0 awarnmb aWarnMB �  � � � j    �c ��c  0 lastupdatetime lastUpdateTime � o    �b�b 0 prevtime prevTime �  � � � j    "�a ��a 0 lastwarntime lastWarnTime � o    !�`�` 0 prevtime prevTime �  � � � j   # %�_ ��_ 0 numwarnings numWarnings � m   # $�^�^   �  � � � j   & (�] ��] 0 nummb numMB � m   & '�\�\   �  ��[ � j   ) +�Z ��Z 0 
percentcpu 
percentCpu � m   ) *�Y�Y  �[   �  ��X � r     � � � b     � � � o    �W�W 0 appinfolist appInfoList � o    �V�V 0 appinfo appInfo � o      �U�U 0 appinfolist appInfoList�X   �  � � � l     �T�S�T  �S   �    l     �R�R     updateAppInfo:     l     �Q�Q   E ? Displays the amount of memory being used by the app 'appName'      l     �P�P   L F Pops up an alert dialog if the amount of memory used exceeds 'warnMB'    	
	 i   & ) I      �O�N�O 0 updateappinfo updateAppInfo �M o      �L�L 0 appinfo appInfo�M  �N   k     z  r     
 I     �K�J�K 0 secondssince secondsSince �I n     o    �H�H  0 lastupdatetime lastUpdateTime o    �G�G 0 appinfo appInfo�I  �J   o      �F�F 0 elapsed    Z   �E�D A     o    �C�C 0 elapsed   l   �B n      o    �A�A 0 updateperiod updatePeriod  o    �@�@ 0 appinfo appInfo�B   L    �?�?  �E  �D   !"! l   �>�=�>  �=  " #$# r    $%&% I    "�<'�;�< "0 pidofrunningapp pidOfRunningApp' (�:( n    )*) o    �9�9 0 appname appName* o    �8�8 0 appinfo appInfo�:  �;  & o      �7�7 0 pid  $ +,+ Z   % p-.�6/- =  % (010 o   % &�5�5 0 pid  1 m   & '�4�4��. l  + +�32�3  2 + % app is not running, so nothing to do   �6  / k   / p33 454 r   / 7676 I   / 5�28�1�2  0 getprocessinfo getProcessInfo8 9�09 o   0 1�/�/ 0 pid  �0  �1  7 o      �.�. 0 info  5 :;: Z  8 D<=�-�,< =  8 ;>?> o   8 9�+�+ 0 info  ? m   9 :@@      = L   > @�*�*  �-  �,  ; ABA r   E SCDC I  E O�)E�(
�) .sysorondlong        doubE l  E KF�'F c   E KGHG n   E IIJI 4  F I�&K
�& 
cworK m   G H�%�% J o   E F�$�$ 0 info  H m   I J�#
�# 
doub�'  �(  D n      LML o   P R�"�" 0 nummb numMBM o   O P�!�! 0 appinfo appInfoB NON r   T bPQP I  T ^� R�
�  .sysorondlong        doubR l  T ZS�S c   T ZTUT n   T XVWV 4  U X�X
� 
cworX m   V W�� W o   T U�� 0 info  U m   X Y�
� 
doub�  �  Q n      YZY o   _ a�� 0 
percentcpu 
percentCpuZ o   ^ _�� 0 appinfo appInfoO [\[ I   c i�]�� (0 showappinfointitle showAppInfoInTitle] ^�^ o   d e�� 0 appinfo appInfo�  �  \ _�_ I   j p�`�� >0 checkifmemoryusemeritswarning checkIfMemoryUseMeritsWarning` a�a o   k l�� 0 appinfo appInfo�  �  �  , bcb l  q q���  �  c d�d r   q zefe l  q vg�g I  q v�
�	�
�
 .misccurdldt    ��� null�	  �  �  f n      hih o   w y��  0 lastupdatetime lastUpdateTimei o   v w�� 0 appinfo appInfo�  
 jkj l     ���  �  k lml l     �n�  n   showAppInfoInTitle:   m opo l     �q�  q Q K Displays the amount of memory being used by the app 'appName' in the title   p rsr l     �t�  t + % of the frontmost window of that app.   s uvu i   * -wxw I      � y���  (0 showappinfointitle showAppInfoInTitley z��z o      ���� 0 appinfo appInfo��  ��  x k     w{{ |}| r     ~~ l    ���� n     ��� o    ���� 0 appname appName� o     ���� 0 appinfo appInfo��   o      ���� 0 appname appName} ��� r    ��� l   	���� n    	��� o    	���� 0 nummb numMB� o    ���� 0 appinfo appInfo��  � o      ���� 0 nummb numMB� ��� r    ��� l   ���� n    ��� o    ���� 0 
percentcpu 
percentCpu� o    ���� 0 appinfo appInfo��  � o      ���� 0 
percentcpu 
percentCpu� ��� l   ������  ��  � ���� Q    w���� O    n��� Z    m������� ?    %��� l   #���� I   #�����
�� .corecnte****       ****� 2   ��
�� 
cwin��  ��  � m   # $����  � k   ( i�� ��� r   ( 0��� n   ( .��� 1   , .��
�� 
pnam� 4   ( ,���
�� 
cwin� m   * +���� � o      ���� 	0 title  � ��� r   1 4��� m   1 2��   ***    � o      ���� 	0 delim  � ��� r   5 >��� n  5 <��� I   6 <�������  0 removelastpart removeLastPart� ��� o   6 7���� 	0 title  � ���� o   7 8���� 	0 delim  ��  ��  �  f   5 6� o      ���� 0 	origtitle 	origTitle� ��� r   ? H��� b   ? F��� b   ? D��� b   ? B��� o   ? @���� 0 	origtitle 	origTitle� o   @ A���� 	0 delim  � o   B C���� 0 nummb numMB� m   D E�� 	  MB   � o      ���� 	0 title  � ��� Z   I `������� ?   I P��� o   I J���� 0 
percentcpu 
percentCpu� o   J O���� 0 cpufloor cpuFloor� r   S \��� b   S Z��� b   S X��� b   S V��� o   S T���� 	0 title  � m   T U��  ,    � o   V W���� 0 
percentcpu 
percentCpu� m   X Y��  % CPU   � o      ���� 	0 title  ��  ��  � ���� r   a i��� o   a b���� 	0 title  � n      ��� 1   f h��
�� 
pnam� 4   b f���
�� 
cwin� m   d e���� ��  ��  ��  � 4    ���
�� 
capp� o    ���� 0 appname appName� R      ������
�� .ascrerr ****      � ****��  ��  � k   v v�� ��� l  v v�����  � $  there shouldn't be any errors   � ��� l  v v�����  � ; 5 (assuming that the app responds to 'name of window')   � ���� l  v v�����  � + % but if an error occurs, we ignore it   ��  ��  v ��� l     ������  ��  � ��� l     �����  � %  checkIfMemoryUseMeritsWarning:   � ��� l     �����  � = 7 Puts up a warning dialog about 'appName's memory usage   � ��� l     �����  � < 6 but avoids doing this too soon after the last warning   � ��� l     �����  � : 4 (increases the interval between warnings each time)   � ��� i   . 1��� I      ������� >0 checkifmemoryusemeritswarning checkIfMemoryUseMeritsWarning� ���� o      ���� 0 appinfo appInfo��  ��  � k     ��� ��� r     ��� l    ���� n     ��� o    ���� 0 appname appName� o     ���� 0 appinfo appInfo��  � o      ���� 0 appname appName� ��� r    � � l   	�� n    	 o    	���� 0 nummb numMB o    ���� 0 appinfo appInfo��    o      ���� 0 nummb numMB�  r     l   �� n    	
	 o    ���� 0 warnmb warnMB
 o    ���� 0 appinfo appInfo��   o      ���� 0 warnmb warnMB  r     l   �� n     o    ���� 0 lastwarntime lastWarnTime o    ���� 0 appinfo appInfo��   o      ���� 0 lastwarntime lastWarnTime  r     l   �� n     o    ���� 0 numwarnings numWarnings o    ���� 0 appinfo appInfo��   o      ���� 0 numwarnings numWarnings  l   ������  ��    Z    t  ?    !!"! o    ���� 0 nummb numMB" o     ���� 0 warnmb warnMB k   $ `## $%$ r   $ ,&'& I   $ *��(���� 0 secondssince secondsSince( )��) o   % &���� 0 lastwarntime lastWarnTime��  ��  ' o      ���� 0 elapsed  % *+* r   - 6,-, l  - 4.��. ]   - 4/0/ o   - .���� 0 numwarnings numWarnings0 o   . 3���� .0 warnintervalincrement warnIntervalIncrement��  - o      ���� 0 warninterval warnInterval+ 1��1 Z   7 `23����2 ?   7 :454 o   7 8���� 0 elapsed  5 o   8 9���� 0 warninterval warnInterval3 k   = \66 787 r   = F9:9 b   = D;<; b   = B=>= b   = @?@? o   = >���� 0 appname appName@ m   > ?AA   is taking more than    > o   @ A���� 0 warnmb warnMB< m   B CBB 	  MB   : o      ���� 0 msg  8 CDC I   G N��E����  0 displaywarning displayWarningE FGF o   H I���� 0 appname appNameG H��H o   I J���� 0 msg  ��  ��  D IJI r   O VKLK l  O TM��M I  O T������
�� .misccurdldt    ��� null��  ��  ��  L o      ���� 0 lastwarntime lastWarnTimeJ N��N r   W \OPO l  W ZQ��Q [   W ZRSR o   W X���� 0 numwarnings numWarningsS m   X Y���� ��  P o      ���� 0 numwarnings numWarnings��  ��  ��  ��   TUT ?   c hVWV o   c d���� 0 nummb numMBW l  d gX�X ]   d gYZY m   d e[[ ?�ffffffZ o   e f�~�~ 0 warnmb warnMB�  U \�}\ k   k n]] ^_^ l  k k�|`�|  ` F @ avoid continual warnings when oscillating around 'warnMB' level   _ a�{a r   k nbcb m   k l�z�z c o      �y�y 0 numwarnings numWarnings�{  �}    r   q tded m   q r�x�x  e o      �w�w 0 numwarnings numWarnings fgf l  u u�v�u�v  �u  g hih r   u zjkj o   u v�t�t 0 lastwarntime lastWarnTimek n      lml o   w y�s�s 0 lastwarntime lastWarnTimem o   v w�r�r 0 appinfo appInfoi n�qn r   { �opo o   { |�p�p 0 numwarnings numWarningsp n      qrq o   } �o�o 0 numwarnings numWarningsr o   | }�n�n 0 appinfo appInfo�q  � sts l     �m�l�m  �l  t uvu l     �kw�k  w   displayWarning:   v xyx l     �jz�j  z / ) Displays a warning relating to 'appName'   y {|{ i   2 5}~} I      �i�h�i  0 displaywarning displayWarning ��� o      �g�g 0 appname appName� ��f� o      �e�e 0 msg  �f  �h  ~ Z     +���d�� o     �c�c 0 usegrowl useGrowl� Q    !���� I    �b��a�b 00 displaywarningviagrowl displayWarningViaGrowl� ��� o    �`�` 0 appname appName� ��_� o    �^�^ 0 msg  �_  �a  � R      �]�\�[
�] .ascrerr ****      � ****�\  �[  � I    !�Z��Y�Z 00 displaywarningviaalert displayWarningViaAlert� ��� o    �X�X 0 appname appName� ��W� o    �V�V 0 msg  �W  �Y  �d  � I   $ +�U��T�U 00 displaywarningviaalert displayWarningViaAlert� ��� o   % &�S�S 0 appname appName� ��R� o   & '�Q�Q 0 msg  �R  �T  | ��� l     �P�O�P  �O  � ��� l     �N��N  �   displayWarningViaAlert:   � ��� l     �M��M  � 9 3 Displays a warning via an AppleScript alert dialog   � ��� i   6 9��� I      �L��K�L 00 displaywarningviaalert displayWarningViaAlert� ��� o      �J�J 0 appname appName� ��I� o      �H�H 0 msg  �I  �K  � O     ��� I   �G��F
�G .sysodisAaleR        TEXT� o    �E�E 0 msg  �F  � 4     �D�
�D 
capp� o    �C�C 0 appname appName� ��� l     �B�A�B  �A  � ��� l     �@��@  �   displayWarningViaGrowl:   � ��� l     �?��?  � %  Displays a warning via "Growl"   � ��� i   : =��� I      �>��=�> 00 displaywarningviagrowl displayWarningViaGrowl� ��� o      �<�< 0 appname appName� ��;� o      �:�: 0 msg  �;  �=  � O     ��� I   �9�8�
�9 .notifygrnull��� ��� null�8  � �7��
�7 
name� m    ��  MemoryUseWarning   � �6��
�6 
titl� m    	��  Warning   � �5��
�5 
desc� o   
 �4�4 0 msg  � �3��2
�3 
appl� o    �1�1 0 
scriptname 
scriptName�2  � m     ��.null     ߀�� �
GrowlHelperApp.app��h         ��c��������c���ؿ����rhap   alis    �  PowerbookHD                í%�H+   �
GrowlHelperApp.app                                              �D�Ri        ����  	                	Resources     í�j      �Rˍ     �
 � � F$  �+  XPowerbookHD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app  &  G r o w l H e l p e r A p p . a p p    P o w e r b o o k H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  � ��� l     �0�/�0  �/  � ��� l     �.��.  �   registerWithGrowl:   � ��� l     �-��-  � 8 2 Registers our notifications with the "Growl" tool   � ��� i   > A��� I      �,�+�*�, &0 registerwithgrowl registerWithGrowl�+  �*  � k     �� ��� r     ��� J     �� ��)� m     ��  MemoryUseWarning   �)  � o      �(�( 0 	notiflist 	notifList� ��'� O    ��� I  
 �&�%�
�& .registernull��� ��� null�%  � �$��
�$ 
appl� o    �#�# 0 
scriptname 
scriptName� �"��
�" 
anot� o    �!�! 0 	notiflist 	notifList� � ��
�  
dnot� o    �� 0 	notiflist 	notifList�  � m    ��'  � ��� l     ���  �  � ��� l     ���  �   secondsSince:   � ��� l     ���  � 2 , Returns the number of seconds since 'aDate'   � ��� i   B E��� I      ���� 0 secondssince secondsSince� ��� o      �� 0 adate aDate�  �  � k     �� ��� r     ��� l    ��� I    ���
� .misccurdldt    ��� null�  �  �  � o      �� 0 curr  � ��� r    ��� l   ��� \    ��� o    	�� 0 curr  � o   	 
�� 0 adate aDate�  � o      �� 0 elapsed  � ��� L    �� o    �� 0 elapsed  �  �    l     �
�	�
  �	    l     ��     fixLineEndings:     l     ��   4 . returns a string with Unix-style line endings    	 i   F I

 I      ���  0 fixlineendings fixLineEndings � o      �� 0 str  �  �   k     $  r      n     1    �
� 
txdl 1     �
� 
ascr o      � �  0 oldtids oldTIDs  r     n    	 2   	��
�� 
cpar o    ���� 0 str   o      ���� 0 thelines theLines  r     I   ����
�� .sysontocTEXT       shor m    ���� 
��   n      !  1    ��
�� 
txdl! 1    ��
�� 
ascr "#" r    $%$ c    &'& o    ���� 0 thelines theLines' m    ��
�� 
TEXT% o      ���� 0 fixedstr fixedStr# ()( r    !*+* o    ���� 0 oldtids oldTIDs+ n     ,-, 1     ��
�� 
txdl- 1    ��
�� 
ascr) .��. L   " $// o   " #���� 0 fixedstr fixedStr��  	 010 l     ������  ��  1 232 l     ��4��  4   getProcessInfo:   3 565 l     ��7��  7 F @ Returns info about the resource usage of the specified process.   6 898 l     ��:��  : M G It gets this info by invoking the Unix 'ps' command via a Perl script.   9 ;<; l     ��=��  = : 4 The return value gives the number of megabytes used   < >?> l     ��@��  @ - ' followed by the percentage of CPU used   ? ABA i   J MCDC I      ��E����  0 getprocessinfo getProcessInfoE F��F o      ���� 0 pid  ��  ��  D k     GG HIH r     JKJ I     ��L����  0 fixlineendings fixLineEndingsL M��M b    
NON b    PQP b    RSR b    TUT m    VV � �
# This script gets the 'RSS' & '%CPU' of the process with the given 'pid'
# The 'RSS' (resident set size) is a rough measure of how much RAM
# the process is using. The value is converted to megabytes.
open(PS, "/bin/ps -p    U o    ���� 0 pid  S m    WW 8 2 -o pid,rss,%cpu |");
while (<PS>)
{
    if (/^\s*   Q o    ���� 0 pid  O m    	XX � �\s+(\d+)\s+([\d.]+)\s*$/)
    {
        my $rss = $1;
        my $cpu = $2;
        my $rssMB = sprintf("%.1f", $rss / 1024);
        print "$rssMB $cpu";
        last;
    }
}
close(PS);
   ��  ��  K o      ���� 0 perlcode perlCodeI YZY r    [\[ I   ��]��
�� .sysoexecTEXT���     TEXT] b    ^_^ m    ``  perl -e    _ n    aba 1    ��
�� 
strqb o    ���� 0 perlcode perlCode��  \ o      ���� 0 info  Z c��c L    dd o    ���� 0 info  ��  B efe l     ������  ��  f ghg l     ��i��  i   removeLastPart:   h jkj l     ��l��  l K E Returns the string 'str' without the last part starting with 'delim'   k mnm i   N Qopo I      ��q����  0 removelastpart removeLastPartq rsr o      ���� 0 str  s t��t o      ���� 	0 delim  ��  ��  p k     3uu vwv r     xyx n    z{z 1    ��
�� 
txdl{ 1     ��
�� 
ascry o      ���� 0 oldtids oldTIDsw |}| r    ~~ o    ���� 	0 delim   n     ��� 1    
��
�� 
txdl� 1    ��
�� 
ascr} ��� Z    *������� ?    ��� l   ���� I   �����
�� .corecnte****       ****� n   ��� 2   ��
�� 
citm� o    ���� 0 str  ��  ��  � m    ���� � r    &��� n   $��� 7   $����
�� 
ctxt� m    ���� � 4     #���
�� 
citm� m   ! "������� o    ���� 0 str  � o      ���� 0 str  ��  ��  � ��� r   + 0��� o   + ,���� 0 oldtids oldTIDs� n     ��� 1   - /��
�� 
txdl� 1   , -��
�� 
ascr� ���� L   1 3�� o   1 2���� 0 str  ��  n ��� l     ������  ��  � ��� l     �����  �   pidOfRunningApp:   � ��� l     �����  � F @ Returns the pid of the process if the app 'appName' is running,   � ��� l     �����  �   otherwise returns -1   � ��� i   R U��� I      ������� "0 pidofrunningapp pidOfRunningApp� ���� o      ���� 0 appname appName��  ��  � k     �� ��� O     ��� Q    ���� r    ��� l   ���� n    ��� 1    ��
�� 
idux� 4    ���
�� 
prcs� o   	 
���� 0 appname appName��  � o      ���� 0 pid  � R      ������
�� .ascrerr ****      � ****��  ��  � r    ��� m    ������� o      ���� 0 pid  � m     ���null     ߀�� �9System Events.appp��h         � ��!�    �lD   �����sevs   alis    �  PowerbookHD                í%�H+   �9System Events.app                                               ư��)4        ����  	                CoreServices    í�j      ����     �9 �T �R  9PowerbookHD:System:Library:CoreServices:System Events.app   $  S y s t e m   E v e n t s . a p p    P o w e r b o o k H D  -System/Library/CoreServices/System Events.app   / ��  � ���� L    �� o    ���� 0 pid  ��  � ��� l     ������  ��  � ��� l     �����  � 7 1 Copyright 2006  Cameron Hayne - macdev@hayne.net   � ��� l     �����  �      � ��� l     �����  � K E This program is free software; you can redistribute it and/or modify   � ��� l     �����  � K E it under the terms of the GNU General Public License as published by   � ��� l     �����  � H B the Free Software Foundation; either version 2 of the License, or   � ���� l     �����  � * $ (at your option) any later version.   ��       0��� %������������������������������������������������������������������~�}�|��  � .�{�z�y�x�w�v�u�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�{ 0 
scriptname 
scriptName�z 0 usedelayloop useDelayLoop�y 0 usegrowl useGrowl�x 0 updatedelay updateDelay�w 0 cpufloor cpuFloor�v .0 warnintervalincrement warnIntervalIncrement�u 0 registerapps registerApps�t 
0 update  
�s .aevtoappnull  �   � ****
�r .miscidlenmbr    ��� null�q 0 
addappinfo 
addAppInfo�p 0 updateappinfo updateAppInfo�o (0 showappinfointitle showAppInfoInTitle�n >0 checkifmemoryusemeritswarning checkIfMemoryUseMeritsWarning�m  0 displaywarning displayWarning�l 00 displaywarningviaalert displayWarningViaAlert�k 00 displaywarningviagrowl displayWarningViaGrowl�j &0 registerwithgrowl registerWithGrowl�i 0 secondssince secondsSince�h  0 fixlineendings fixLineEndings�g  0 getprocessinfo getProcessInfo�f  0 removelastpart removeLastPart�e "0 pidofrunningapp pidOfRunningApp�d 0 appinfolist appInfoList�c  �b  �a  �`  �_  �^  �]  �\  �[  �Z  �Y  �X  �W  �V  �U  �T  �S  �R  �Q  �P  �O  �N  
�� boovfals
�� boovtrue�� �� 
�� x� �M Q�L�K���J�M 0 registerapps registerApps�L  �K  �  � �I X�H�G�F�E�D�C a�B�A i�@�I 0 appname appName�H 0 updateperiod updatePeriod�G �F 0 warnmb warnMB�E d�D �C 0 
addappinfo 
addAppInfo�B <�A �@ �J $*������� O*������� O*������� � �? x�>�=���<�? 
0 update  �>  �=  � �;�; 0 appinfo appInfo� �:�9�8�7�6�: 0 appinfolist appInfoList
�9 
kocl
�8 
cobj
�7 .corecnte****       ****�6 0 updateappinfo updateAppInfo�<  �[��l kh  *�k+ [OY��� �5 ��4�3���2
�5 .aevtoappnull  �   � ****�4  �3  �  � �1�0�/�.�-�1 0 appinfolist appInfoList�0 0 registerapps registerApps�/ &0 registerwithgrowl registerWithGrowl�. 
0 update  
�- .sysodelanull��� ��� nmbr�2 CjvE�O*j+ Ob   
*j+ Y hOb    hZ*j+ Ob  j [OY��Y h� �, ��+�*���)
�, .miscidlenmbr    ��� null�+  �*  �  �  ��(�'�&
�( .sysodisAaleR        TEXT
�' .aevtquitnull���    obj �& 
0 update  �) %b   �j O*j Y hO*j+ Ob  � �% ��$�#���"�% 0 
addappinfo 
addAppInfo�$  �# �!� ��! 0 appname appName�  0 	anappname 	anAppName� ���� 0 updateperiod updatePeriod�  0 anupdateperiod anUpdatePeriod� ���� 0 warnmb warnMB� 0 awarnmb aWarnMB�  � ������ 0 	anappname 	anAppName�  0 anupdateperiod anUpdatePeriod� 0 awarnmb aWarnMB� 0 prevtime prevTime� 0 appinfo appInfo� ��� ���
� .misccurdldt    ��� null��� 0 appinfo appInfo� �������
� .ascrinit****      � ****� k     +��  ���  ���  ���  ���  ���  ���  ���  ���  �  �  � ���
�	����� 0 appname appName� 0 updateperiod updatePeriod�
 0 warnmb warnMB�	  0 lastupdatetime lastUpdateTime� 0 lastwarntime lastWarnTime� 0 numwarnings numWarnings� 0 nummb numMB� 0 
percentcpu 
percentCpu� ����� ������� 0 appname appName� 0 updateperiod updatePeriod� 0 warnmb warnMB�  0 lastupdatetime lastUpdateTime�  0 lastwarntime lastWarnTime�� 0 numwarnings numWarnings�� 0 nummb numMB�� 0 
percentcpu 
percentCpu� ,b   �Ob  �Ob  �Ob  �Ob  �Oj�Oj�Oj�� 0 appinfolist appInfoList�" *j  �E�O��K S�OŤ%E�� ������������ 0 updateappinfo updateAppInfo�� ����� �  ���� 0 appinfo appInfo��  � ���������� 0 appinfo appInfo�� 0 elapsed  �� 0 pid  �� 0 info  � ������������@������������������  0 lastupdatetime lastUpdateTime�� 0 secondssince secondsSince�� 0 updateperiod updatePeriod�� 0 appname appName�� "0 pidofrunningapp pidOfRunningApp��  0 getprocessinfo getProcessInfo
�� 
cwor
�� 
doub
�� .sysorondlong        doub�� 0 nummb numMB�� 0 
percentcpu 
percentCpu�� (0 showappinfointitle showAppInfoInTitle�� >0 checkifmemoryusemeritswarning checkIfMemoryUseMeritsWarning
�� .misccurdldt    ��� null�� {*��,k+ E�O���, hY hO*��,k+ E�O�i  hY C*�k+ E�O��  hY hO��k/�&j 	��,FO��l/�&j 	��,FO*�k+ O*�k+ O*j ��,F� ��x���� ���� (0 showappinfointitle showAppInfoInTitle�� ����   ���� 0 appinfo appInfo��    ���������������� 0 appinfo appInfo�� 0 appname appName�� 0 nummb numMB�� 0 
percentcpu 
percentCpu�� 	0 title  �� 	0 delim  �� 0 	origtitle 	origTitle �������������������������� 0 appname appName�� 0 nummb numMB�� 0 
percentcpu 
percentCpu
�� 
capp
�� 
cwin
�� .corecnte****       ****
�� 
pnam��  0 removelastpart removeLastPart��  ��  �� x��,E�O��,E�O��,E�O ^*�/ S*�-j j F*�k/�,E�O�E�O)��l+ E�O��%�%�%E�O�b   ��%�%�%E�Y hO�*�k/�,FY hUW X  h� ����������� >0 checkifmemoryusemeritswarning checkIfMemoryUseMeritsWarning�� ����   ���� 0 appinfo appInfo��   	�������������������� 0 appinfo appInfo�� 0 appname appName�� 0 nummb numMB�� 0 warnmb warnMB�� 0 lastwarntime lastWarnTime�� 0 numwarnings numWarnings�� 0 elapsed  �� 0 warninterval warnInterval�� 0 msg   ������������AB����[�� 0 appname appName�� 0 nummb numMB�� 0 warnmb warnMB�� 0 lastwarntime lastWarnTime�� 0 numwarnings numWarnings�� 0 secondssince secondsSince��  0 displaywarning displayWarning
�� .misccurdldt    ��� null�� ���,E�O��,E�O��,E�O��,E�O��,E�O�� A*�k+ E�O�b   E�O�� $��%�%�%E�O*��l+ O*j 	E�O�kE�Y hY ��  kE�Y jE�O���,FO���,F� ��~��������  0 displaywarning displayWarning�� ����   ������ 0 appname appName�� 0 msg  ��   ������ 0 appname appName�� 0 msg   ���������� 00 displaywarningviagrowl displayWarningViaGrowl��  ��  �� 00 displaywarningviaalert displayWarningViaAlert�� ,b    *��l+  W X  *��l+ Y 	*��l+ � �������	
���� 00 displaywarningviaalert displayWarningViaAlert�� ����   ������ 0 appname appName�� 0 msg  ��  	 ������ 0 appname appName�� 0 msg  
 ����
�� 
capp
�� .sysodisAaleR        TEXT�� *�/ �j U� ����������� 00 displaywarningviagrowl displayWarningViaGrowl�� ����   ������ 0 appname appName�� 0 msg  ��   ������ 0 appname appName�� 0 msg   	���������������
�� 
name
�� 
titl
�� 
desc
�� 
appl�� 
�� .notifygrnull��� ��� null�� � *������b   � U� ����������� &0 registerwithgrowl registerWithGrowl��  ��   ���� 0 	notiflist 	notifList ������������
�� 
appl
�� 
anot
�� 
dnot�� 
�� .registernull��� ��� null�� �kvE�O� *�b   ��� U� ����������� 0 secondssince secondsSince�� ����   ���� 0 adate aDate��   ��~�}� 0 adate aDate�~ 0 curr  �} 0 elapsed   �|
�| .misccurdldt    ��� null�� *j  E�O��E�O�� �{�z�y�x�{  0 fixlineendings fixLineEndings�z �w�w   �v�v 0 str  �y   �u�t�s�r�u 0 str  �t 0 oldtids oldTIDs�s 0 thelines theLines�r 0 fixedstr fixedStr �q�p�o�n�m�l
�q 
ascr
�p 
txdl
�o 
cpar�n 

�m .sysontocTEXT       shor
�l 
TEXT�x %��,E�O��-E�O�j ��,FO��&E�O���,FO�� �kD�j�i�h�k  0 getprocessinfo getProcessInfo�j �g�g   �f�f 0 pid  �i   �e�d�c�e 0 pid  �d 0 perlcode perlCode�c 0 info   VWX�b`�a�`�b  0 fixlineendings fixLineEndings
�a 
strq
�` .sysoexecTEXT���     TEXT�h  *�%�%�%�%k+ E�O��,%j E�O�� �_p�^�]�\�_  0 removelastpart removeLastPart�^ �[�[   �Z�Y�Z 0 str  �Y 	0 delim  �]   �X�W�V�X 0 str  �W 	0 delim  �V 0 oldtids oldTIDs �U�T�S�R�Q�P
�U 
ascr
�T 
txdl
�S 
citm
�R .corecnte****       ****
�Q 
ctxt�P���\ 4��,E�O���,FO��-j k �[�\[Zk\��/2E�Y hO���,FO�� �O��N�M�L�O "0 pidofrunningapp pidOfRunningApp�N �K�K   �J�J 0 appname appName�M   �I�H�I 0 appname appName�H 0 pid   ��G�F�E�D
�G 
prcs
�F 
idux�E  �D  �L �  *�/�,E�W 
X  iE�UO�� �C �C    !"#! �B �  $�B 0 appinfo appInfo$ 
%� X�A�@&&�?�>�=%  � X�<�;&!�< �; d& ldt     ����A �@ d�?  �>  �=  " �: �  '�: 0 appinfo appInfo' 
(� a�9�8))�7�6�5(  � a�4�3)"�4 <�3 ) ldt     ����9 <�8 �7  �6  �5  # �2 �  *�2 0 appinfo appInfo* 
+� i�1�0,,�/�.�-+  � i�,�+,#�, <�+ , ldt     ����1 <�0 �/  �.  �-  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �  �~  �}  �|   ascr  ��ޭ