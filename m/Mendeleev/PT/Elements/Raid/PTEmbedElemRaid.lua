
local setname, coremajor = "Raid Loot", "1"
local vmajor, vminor = "Raid Loot 1", tonumber(string.sub("$Revision: 666 $", 12, -3))


-- Check to see if an update is needed
-- if not then just return out now before we do anything
if not TekLibStub or not PeriodicTableEmbed or not PeriodicTableEmbed:NeedsUpgraded(vmajor, vminor) then return end

local mem = gcinfo()
local t = {

	---------------------
	--      Zones      --
	---------------------

	raidzones = {"moltencore", "onyxiaslair", "blackwinglair", "zulgurub"},

	["blackwinglair"] = "19375 19379 19387 19391 19395 19399 19403 19407 19431 19435 19439 16897 16905 16913 16917 16925 16933 16937 16941 16945 16949 16953 16957 16961 16965 19336 19340 19344 19348 19352 19356 19360 19364 16818 19372 19376 19380 19388 19392 19396 19400 19432 19436 16898 16902 16906 16910 16918 16926 16934 16942 16950 16958 19002 16966 19337 19341 19345 19349 19353 19357 19361 19365 19369 19373 19377 19381 19385 19389 19393 19397 19401 19405 19433 19437 16899 16903 16907 16911 16919 16923 16927 16931 16935 16943 16951 16959 19003 19334 19342 19346 19350 19354 19358 19362 19370 19374 19378 19382 19386 19390 19394 19398 19402 19406 19430 19434 19438 16904 16912 16916 16920 16924 16928 16932 16936 16940 16944 16948 16952 16956 16960 16964 19368 18562 20383 19335 19339 19343 19347 19351 19355 19363 19367 19371 16832",
	["moltencore"] = "16867 16845 16825 16829 16833 16837 16841 19140 16849 16853 16857 18646 16865 16901 3475 16909 17204 19017 18260 18264 18292 18806 18810 18814 18563 18822 16798 16802 16806 16810 16814 17073 17077 16826 16830 16834 16838 16842 16846 16850 17109 16858 16862 16866 18703 16922 16930 16938 16946 16954 16962 18257 18265 17010 18803 18811 18815 18564 18823 16795 16799 16803 16807 17066 16815 16819 16823 16827 16831 16835 18879 19138 19142 17106 16855 16859 16863 16915 17011 18870 18861 18808 18812 18816 18820 18824 16811 18832 16796 16800 16804 16808 16812 16816 16820 16824 16828 18872 16836 16840 16844 17103 16852 16856 16860 16864 16868 18252 16861 16843 19146 21371 16817 16821 17074 16848 18842 17104 16847 18203 17082 17110 18875 19144 17203 19145 17107 19136 19137 16822 19147 16851 16839 18259 17065 19143 18878 17071 17069 17063 16854 18291 18805 18809 19139 18817 18821 17982 18829 17105 16797 16801 16805 16809 16813 17072 17076 17102",
	["onyxiaslair"] = "16963 16908 18422 18423 18488 16914 17064 16921 18813 16939 17067 17068 18205 16947 17075 18705 17078 16900 16955 15410 16929",
	["zulgurub"] = "19918 19920 19922 19928 19930 19944 19946 19962 19710 19712 19714 19716 19718 19720 19722 19724 19853 19855 19857 19859 19861 19863 19865 19867 19869 19871 19873 19875 20258 20260 20262 20264 19885 19887 19889 19891 19893 19895 19897 19899 19901 19903 19905 19907 19909 20038 19913 19915 19919 19921 19923 19925 19927 19929 19877 20266 20032 19968 19708 19884 19945 19947 19964 19876 20259 19854 19713 19961 19963 19711 19967 19715 19717 19719 19721 19723 19852 19727 19856 19709 19965 19862 19864 19993 19870 19872 19874 20257 19878 20261 20263 20265 19886 19888 19890 19892 19894 19896 19898 19900 19902 19904 19906 19908 19910 19912 19802 19866 19707",


	----------------------
	--      Bosses      --
	----------------------

	raidbosses = {
		"majordomoexecutus", "ragnaros", "barongeddon", "golemaggtheincinerator",
		"garr", "sulfuronharbinger", "shazzrah", "lucifron", "gehennas", "magmadar",
		"broodlordlashlayer", "ebonroc", "firemaw", "razorgoretheuntamed",
		"vaelastraszthecorrupt", "nefarian", "chromaggus", "flamegor",
		"onyxia", "azuregos", "lordkazzak", "ysondre", "emeriss", "taerar", "lethon",
		"highpriestessjeklik", "highpriestvenoxis", "highpriestthekal", "highpriestessarlokk",
		"highpriestessmarli", "jindothehexxer", "bloodlordmandokir",
		"gahzranka", "grilek", "hazzarah", "renataki", "wushoolay", "hakkar",
		"baronkazum", "lordskwol", "highmarshalwhirlaxis", "princeskaldrenox",
	},

	blackwinglairbosses = {"nefarian", "vaelastraszthecorrupt", "razorgoretheuntamed", "broodlordlashlayer", "chromaggus", "ebonroc", "firemaw", "flamegor"},
	moltencorebosses = {"majordomoexecutus", "magmadar", "ragnaros", "barongeddon", "garr", "golemaggtheincinerator", "sulfuronharbinger", "shazzrah", "lucifron", "gehennas"},
	outdoorbosses = {"azuregos", "lordkazzak"},
	thefourdragons = {"ysondre", "emeriss", "taerar", "lethon"},
	zulgurubbosses = {"highpriestessjeklik", "highpriestvenoxis", "highpriestthekal", "highpriestessarlokk", "highpriestessmarli", "jindothehexxer", "bloodlordmandokir", "gahzranka", "grilek", "hazzarah", "renataki", "wushoolay", "hakkar"},

	["azuregos"] = "18704 18547 17070 19132 18541 19130 18202 18208 18542 19131 18545",
	["barongeddon"] = "18252 19136 18563 16797 16844 17110 18829 18291 18861 18257 18820 18821 19142 18259 19143 18260 19144 18292 18265 16836 21371 16837 18264 18822 16807 18823 17010 18824 16856 16859",
	["bloodlordmandokir"] = "19724:1259 19895:1336 19866:302 19727:2 19867:595 20038:616 19869:1362 19870:1335 19716:303 19717:238 19718:283 19873:1233 19719:616 19872:36 19720:691 19874:649 19721:622 19878:1290 19877:1262 19893:1394 19723:1403 19863:1278 19722:1140",
	["broodlordlashlayer"] = "16965 16919 16906 19341 19373 19374 16941 16957 20383 16927 16912 16898 19350 19351 16949 19342",
	["chromaggus"] = "19352 19385 19386 16953 19387 19388 16924 19389 16832 19390 19391 19392 19393 19347 16945 16961 19349 16932 16917 16902 19361 16937",
	["ebonroc"] = "19368 19353 16920 19355 16907 19403 16940 16956 19406 19407 16928 16913 15416 19394 16899 19395 19396 16948 19397 16964 19345 19405",
	["emeriss"] = "20579 20644 20617 20621 20580 20599 20618 20622 20581 20615 20619 20623 20582 20616 20624",
	["firemaw"] = "19399 19353 19400 19401 19355 19402 16907 16940 16956 19344 19343 16928 16913 15416 19394 16899 19395 19396 19365 19397 16948 16964 19398 16920",
	["flamegor"] = "19430 19353 16920 19432 19355 19433 16907 19357 16940 16956 16928 16913 15416 19394 16899 19395 19396 19431 19397 16964 19367 16948",
	["gahzranka"] = "19944:90 19945:892 19946:3234 19947:3023",
	["garr"] = "16834 18291 18292 18861 16846 17105 16854 16795 18564 16866 18820 18821 18822 18823 18824 18259 19142 19143 19144 17066 18264 18832 17071 16821 17011 18257 18265 18252 16808 16842 19136 18260 18829 16813 16807 16814",
	["gehennas"] = "18252 16812 18872 18875 21371 18878 18861 18257 16803 16801 17077 18879 16849 18291 18265 18292 19145 18259 19146 18260 19147 18264 16823 16839 18870 16826 16860 16862",
	["golemaggtheincinerator"] = "16834 16841 18291 18292 16847 16848 17103 16853 16798 16800 16865 18252 18820 18821 18822 18823 16808 16809 18259 19142 19143 18829 16815 18265 16820 17011 18257 18824 17203 18842 18264 18260 19136 19144 18861 16842 16833 17072",
	["grilek"] = "19961:4085 19962:4745",
	["hakkar"] = "19855:1270 20264:828 19852:689 19856:1315 19876:1139 19864:796 19853:701 19857:1260 19861:780 19865:192 19854:703 19859:828 19802:6781 20257:446 19862:1165",
	["hazzarah"] = "19967:4973 19968:3324",
	["highpriestessarlokk"] = "19720:1351 19724:271 19717:630 19721:1546 19718:637 19909:456 19913:1497 19722:284 19912:1480 19910:189 19719:1273 19723:308 19922:1463 19716:740 19914:1446",
	["highpriestessjeklik"] = "19724:231 19928:259 19915:1173 19716:1065 19918:295 19717:1132 19718:1063 19920:1236 19719:542 20262:444 19720:604 19721:588 19923:1299 19722:209 20265:705 19723:243",
	["highpriestessmarli"] = "19720:1393 19919:1506 19927:352 19721:1433 19871:1417 19724:226 19718:655 19722:250 20032:370 19925:1368 19719:1302 19723:235 19717:657 19716:646 19930:1573",
	["highpriestthekal"] = "19724:270 19896:312 19897:547 19898:1452 19899:1488 19901:1404 19716:595 19717:634 20260:499 19718:644 19719:1394 19720:1657 19721:1381 19722:243 19723:193 20266:830 19902:75",
	["highpriestvenoxis"] = "19720:615 19724:225 19717:1034 19721:524 19905:1210 19904:268 19718:1059 19722:217 19906:1231 19903:252 19719:562 19723:189 19907:1298 19716:1105 19900:1222",
	["jindothehexxer"] = "19724:1191 19929:1170 19884:753 19885:595 19886:1319 19716:310 19887:1287 19717:297 19888:1426 19718:187 19889:1119 19719:658 19890:779 19875:1462 19891:618 19721:707 19892:1359 19722:1453 19723:1366 19894:1381 19720:602",
	["lethon"] = "20625 20579 20626 20580 20627 20581 20628 20582 20629 20630 20615 20616 20617 20618 20619 20644",
	["lordkazzak"] = "19135 18543 21371 18544 19133 17112 18665 19134 17113 17111 18546 18204",
	["lucifron"] = "18872 16811 16859 18875 21371 17109 18861 18257 18252 18878 18291 18879 16863 18260 16665 18292 19145 16805 19146 16837 19147 18264 18259 18265 18870 17077 16800 16829",
	["magmadar"] = "16835 18291 18292 18861 16847 16855 16796 16798 18252 18821 18822 18823 18824 18259 19142 19143 17065 16814 18264 18265 17069 17073 16822 18257 21371 18829 16810 19136 16829 16843 18260 18820 18203 19144",
	["majordomoexecutus"] = "18805 18809 18806 19140 18803 18811 18810 19139 18703 18812 18808 18646",
	["nefarian"] = "16950 16966 16905 19356 16923 19375 16942 19376 19377 16958 19378 19363 19379 19364 16931 16916 19381 19360 19382 16897 19380",
	["onyxia"] = "18422 18423 17075 16921 18813 18488 17078 16908 16955 17064 17067 17068 16929 16914 16900 16947 16963 15410 18705 18205 16939",
	["ragnaros"] = "17106 19137 17107 19138 16922 16938 18814 17063 18815 16909 18816 18817 17082 17982 17076 16954 16930 16946 16962 17102 16901 19017 17204 17104 16915",
	["razorgoretheuntamed"] = "16904 19335 16926 19334 16935 19369 16943 16951 19336 19370 16959 16918 19337 16911 16934",
	["renataki"] = "19963:4701 19964:4024",
	["shazzrah"] = "18872 16811 18875 21371 18861 16831 18257 16801 18259 18879 16804 18291 16824 18292 19145 19146 16852 18252 19147 18264 18260 18265 18870 16803 17077 18878",
	["sulfuronharbinger"] = "17077 16848 19147 16823 18870 17074 16868 19146 16816 18875 18879 19145 18872 18861 18878",
	["taerar"] = "20579 20616 20617 20619 20580 20644 20633 20577 20581 20615 20634 20632 20582 20631 20618",
	["vaelastraszthecorrupt"] = "16960 16818 19372 19346 19348 19339 19340 16903 16936 16925 16944 16933 16952 19371 16910",
	["wushoolay"] = "199933874 19965:4702",
	["ysondre"] = "20639 20578 20579 20580 20581 20582 20615 20616 20617 20618 20619 20635 20636 20637 20638 20644",

	silithislords = {"baronkazum", "lordskwol", "highmarshalwhirlaxis", "princeskaldrenox"},
	baronkazum = "20151:4824 20688:2442 20687:2925 20868:2533",
	lordskwol = "20515:4631 20685:2949 20684:3157 20683:2477",
	highmarshalwhirlaxis = "20515:4150 20691:2514 20630:2709 20689:2615",
	princeskaldrenox = "20515:4769 20682:2322 20681:2932 20680:2707",
}


local lib = {}


-- Return the library's current version
function lib:GetLibraryVersion()
	return vmajor, vminor
end


-- Activate a new instance of this library
function lib:LibActivate(stub, oldLib, oldList)
	self.dataset = t
	t = nil
	PeriodicTableEmbed:GetInstance(coremajor):AddModule(setname, self.dataset, self.memuse)
end

lib.memuse = gcinfo() - mem


--------------------------------
--      Load this bitch!      --
--------------------------------
PeriodicTableEmbed:Register(lib)