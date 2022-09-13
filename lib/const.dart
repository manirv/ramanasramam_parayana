getSongIndex(dayNo, songNo) {
  if (dayNo == 0 && songNo <= 0) {
    return 0;
  } else if (songNo > songIndex[dayNo - 1].length) {
    return songIndex[dayNo - 1][songIndex[dayNo - 1].length - 1];
  } else {
    return songIndex[dayNo - 1][songNo - 1];
  }
}

getIndexList() {
  return songIndex;
}

var tamilLyric = [];

final transLyric = """[ti:Arunachala Mahatmiyam]""";

final tamil_mp3_parent_url =
    "https://www.sriramana.org/music/7daytamilparayana/";
final mp3_tamil_list = [
  "11arunachala_mahatmiyam.mp3",
  "12arunachala_aksharamanamalai.mp3",
  "13arunachala_navamanimalai.mp3",
  "14arunachala_pathigam.mp3",
  "15arunachala_ashtakam.mp3",
  "16arunachala_pancharatnam.mp3",
  "17arunachala_ramanan.mp3",
  "18vazhthu.mp3", // 8
  "21upadesa_undiyar.mp3",
  "22ulladhu_narpadhu.mp3",
  "23ulladhu_narpadhu_anubandham.mp3",
  // "24arunachala_pancharatnam.mp3",
  // "25sri_arunachala_ramana.mp3",
  // "26vazhthu.mp3", // 14
  "31eganma_panchakam.mp3",
  "32appalappattu.mp3",
  "33anma_vidya_keerthanam.mp3",
  "34devikalothram.mp3",
  // "35arunachala_pancharatnam.mp3",
  // "36arunachala_ramanan.mp3",
  // "37vazhthu.mp3", // 21
  "41athma_sakshatkaraprakaranam.mp3",
  "42bhagavath_geetha_saram.mp3",
  // "43arunachala_pancharatnam.mp3",
  // "44arunachala_ramanan.mp3",
  // "45vazhthu.mp3", // 26
  "51sri_dakshinamoorthy_thothiram.mp3",
  "52anma_bodham.mp3",
  "53gurusthuthi.mp3",
  "54aththamalagam.mp3",
  // "55arubachala_pancharathnam.mp3",
  // "56arunachala_ramanan.mp3",
  // "57vazhthu.mp3", // 33
  "61kalai_pattu.mp3",
  "62gummi_pattu.mp3",
  "63ponnolir_pathu.mp3",
  "64ponnaiyoththa_pattu.mp3",
  "65sri_ramana_sathguru.mp3",
  "001_vazhga_swayam_prakasam.mp3", //39
  "004_punarvasu_vannam.mp3",
  "005_vendar_pathigam.mp3"
];

final tamil_daystext_list = [
  "திங்கட்கிழமை பாடல்கள்", //Monday songs
  "செவ்வாய்க்கிழமை பாடல்கள்", //Tuesday songs
  "புதன்கிழமை பாடல்கள்", //Wednesday songs
  "வியாழக்கிழமை பாடல்கள்", //Thursday songs
  "வெள்ளிக்கிழமை பாடல்கள்", //Friday songs
  "சனிக்கிழமை பாடல்கள்", //Saturday songs
  "பிற பாடல்கள்", //other songs
];

final tamil_days_names = [
  "திங்கட்கிழமை", //Monday
  "செவ்வாய்க்கிழமை", //Tuesday
  "புதன்கிழமை", //Wednesday
  "வியாழக்கிழமை", //Thursday
  "வெள்ளிக்கிழமை", //Friday
  "சனிக்கிழமை", //Saturday
];

final tamil_songs_list = [
  [
    "1. அருணாசல மாகாத்மியம்",
    "2. அருணாசல அக்ஷரமணமாலை",
    "3. அருணாசல நவமணிமாலை",
    "4. அருணாசல பதிகம்",
    "5. அருணாசல அஷ்டகம்",
    "6. அருணாசல பஞ்சரத்னம்",
    "7. அருணாசல ரமணன்",
    "8. வாழ்த்து"
  ],
  [
    "1. உபதேசவுந்தியார்",
    "2. உள்ளது நாற்பது",
    "3. உள்ளது நாற்பது அனுபந்தம்",
    "4. அருணாசல பஞ்சரத்னம்",
    "5. அருணாசல ரமணன்",
    "6. வாழ்த்து"
  ],
  [
    "1. ஏகான்ம விவேகம்",
    "2. அப்பளப்பாட்டு",
    "3. ஆன்மவித்தை",
    "4. தேவிகாலோத்ரம்",
    "5. அருணாசல பஞ்சரத்னம்",
    "6. அருணாசல ரமணன்",
    "7. வாழ்த்து"
  ],
  [
    "1. ஆன்ம சாட்சாத்காரம் பிரகரணம்",
    "2. பகவத் கீதா சாரம்",
    "3. அருணாசல பஞ்சரத்னம்",
    "4. அருணாசல ரமணன்",
    "5. வாழ்த்து"
  ],
  [
    "1. தக்ஷிணாமூர்த்தி தோத்திரம்",
    "2. ஆன்மபோதம்",
    "3. குருஸ்துதி",
    "4. அத்தாமலகம்",
    "5. அருணாசல பஞ்சரத்னம்",
    "6. அருணாசல ரமணன்",
    "7. வாழ்த்து"
  ],
  [
    "1. காலைப்பாட்டு",
    "2. கும்மிப்பாட்டு",
    "3. பொன்னொளிர் பத்து",
    "4. பொன்னையொத்த பத்து",
    "5. ரமணஸத்குரு"
  ],
  ["வாழ்க ஸ்வயம் ப்ரகாசம்", "புனர்வசு வண்ணம்", "வேண்டற் பதிகம்"]
];

final eng_songs_list = [
  [
    "1. Sri Arunachala Mahatmyam",
    "2. Sri Arunachala Akshara Mana Malai",
    "3. Sri Arunachala Nava Mani Malai",
    "4. Sri Arunachala Padikam",
    "5. Sri Arunachala Ashtakam",
    "6. Sri Arunachala Pancharatnam",
    "7. Arunachala Ramanan",
    "8. Vazhthu"
  ],
  [
    "1. Upadesa Undiyar",
    "2. Ulladu Narpadu",
    "3. Ulladu Narpadu Anubandam",
    "4. Sri Arunachala Pancharatnam",
    "5. Arunachala Ramanan",
    "6. Vazhthu"
  ],
  [
    "1. Ekanma Panchakam",
    "2. Appalap Pattu",
    "3. Anma Viddai",
    "4. Devikalottaram Jnanachara Vichara Patalam",
    "5. Sri Arunachala Pancharatnam",
    "6. Arunachala Ramanan",
    "7. Vazhthu"
  ],
  [
    "1. Sarva Jnanottaram: Anma Sakshatkara Prakaranam",
    "2. Bhagavat Gita Saram",
    "3. Sri Arunachala Pancharatnam",
    "4. Arunachala Ramanan",
    "5. Vazhthu"
  ],
  [
    "1. Sri Dhakinamurti Stotram",
    "2. Anma Bhodam",
    "3. Sri Guri Studi",
    "4. Sri Hastamalaka Stotram",
    "5. Sri Arunachala Pancharatnam",
    "6. Arunachala Ramanan",
    "7. Vazhthu"
  ],
  [
    "1. Kalai Pattu",
    "2. Kummi Pattu",
    "3. Ponnolir Pathu",
    "4. Ponnaiyotha Pathu",
    "5. Sri Ramana Sadguru",
  ]
];

var songIndex = [
  [0, 1, 2, 3, 4, 5, 6, 7],
  [8, 9, 10, 5, 6, 7],
  [11, 12, 13, 14, 5, 6, 7],
  [15, 16, 5, 6, 7],
  [17, 18, 19, 20, 5, 6, 7],
  [21, 22, 23, 24, 25],
];

var history =
    """கந்தாச்ரம நாட்களிலிருந்தே நடைபெற்ற புனித நூல்களின் பாராயணமே தமிழ்ப் பாராயண ஆரம்பகாலமாகும். பண்டைய அத்வைதக் கிரந்தமான ரிபுகீதையும் (சிவரஹஸ்யத்திலுள்ளது) மற்றைய வேதாந்த மரபு சார்ந்த அத்வைத பரமான முக்கிய நூல்களும் ஸ்ரீபகவானால் பாராயணக் கிரமத்தில் கொண்டு வரப்பட்டன. சைவ சமயக் குரவர்களான அப்பர், சுந்தரர், ஞானசம்பந்தர் ஆகியோருடைய தேவாரப் பாடல்களும், முக்கியமாக மாணிக்கவாசகருடைய திருவாசகமும் பகவானால் பெரிதும் மதிக்கப்பட்டதுடன் அவையாவும் தாயார் அழகம்மாளது மஹா சமாதி தினத்தன்று இரவு முழுவதும் (மே மாதம் 19ஆம் தேதி 1922) பாடப்பெற்றன. பகவான் இயற்றிய பாடல்களின் பாராயணமும் பெரிதும் ஊக்குவிக்கப் பட்டது.\n\nபகவானது கவிதைத் தொகுப்புகளை மனம் ஊன்றிப் படித்தலுடன் பாராயணம் செய்வதனால் அடையும் ஆன்மிக லாபத்தை நன்குணர்ந்த அடியார்கள் பாராயண க்ரமத்தை முறையாக ஆரம்பித்தனர். 1920லேயே பகவானிடம் வந்தவரும் பகவானது நீண்டநாள் அடியவரும் அவரது அணுக்கத் தொண்டருமான ஸ்ரீகுஞ்சு சுவாமிகள் தனது அனுபவங்களை நினைவுகூறும் எனது நினைவுகள் புத்தகத்தின் மூலம் ஸ்ரீபகவானது தாயார் தினமும் காலை 4 மணியிலிருந்து 5 மணிவரை பக்திப் பாடல்களைப் பாராயணம் செய்யும் வழக்கத்தைக் கைக்கொண்டிருந்தார் என்பதை அறிகிறோம். அன்னையார் தனது பாராயணத்தை முடித்தவுடன் ஸ்ரீபகவானது பக்தர்கள், ஸ்ரீ பகவானருளிய அருணாசல அக்ஷரமணமாலை, அப்பளப்பாட்டு முதலியவற்றுடன் விசேடமாக ஸ்ரீபகவானால் தமிழாக்கப் பட்ட ஸ்ரீதக்ஷிணாமூர்த்தி ஸ்தோத்திரத்தையும் பாராயணம் செய்வதை தினசரி வழக்கமாகக் கொண்டிருந்தனர். பகவான் அவ்வப்போது இயற்றிய புதிய பாடல்களையும் அந்தப் பாராயண முறையில் அவ்வப்போது உள்ளடக்கி வந்தனர். இவ்வாறாக 1940-லேயே 15 நாள் பாராயணக் கிரமமாக தமிழ்ப் பாராயணம் விரிவுற்றது.\n\nநாள் 1 : அண்ணாமலையைப் போற்றி மூவர் பாடிய தேவாரத் தொகுப்பு \n\nநாள் 2 : ஸ்ரீ அருணாசல தத்துவம், ஸ்ரீ அருணாசல மாகாத்மியம், ஸ்ரீ அருணாசல அக்ஷரமணமாலை\n\nநாள் 3 : ஸ்ரீ அருணாசல நவமணிமாலை, ஸ்ரீ அருணாசல பதிகம், ஸ்ரீ அருணாசல ஷ்டகம், அப்பளப்பாட்டு, ஆன்ம வித்தை\n\nநாள் 4 : உபதேச உந்தியார் மற்றும் மலையாள, தெலுங்கு, வடமொழிகளில் உபதேச சாரம்\n\nநாள் 5 : உள்ளது நாற்பது, உள்ளது நாற்பது - அனுபந்தம்\n\nநாள் 6 : சத்தர்சனம் (உள்ளது நாற்பது அனுபந்தத்துடன் மலையாளத்தில்)\n\nநாள் 7 : தேவிகாலோத்தரம் \n\nநாள் 8 : ஆன்ம சாக்ஷாத்காரம், குரு ஸ்துதி, அத்தாமலகம்\n\nநாள் 9 : பகவத் கீதாசாரம் (தமிழ், மலையாளம், வடமொழி மூன்றிலும்)\n\nநாள் 10 : ஆன்மபோதம், ஏகான்ம பஞ்சகம்\n\nநாள் 11 : தக்ஷிணாமூர்த்தி ஸ்தோத்திரம், விவேக சூடாமணி, சிவானந்த லஹரி இவற்றிலிருந்து ஸ்ரீ பகவானால் தேர்ந்து எடுக்கப்பெற்ற சில பாடல்கள் (தமிழிலும் சமஸ்கிருதத்திலும்) இவற்றுடன் தாயுமானவரின் பாடல்கள் சில\n\nநாள் 12 : சத்தியமங்கலம் வேங்கடரமண ஐயர் இயற்றிய ஸ்ரீ ரமண ஸ்துதி பஞ்சகம்\n\n  நாள் 13 : சிவப்பிரகாசம் பிள்ளையவர்கள் இயற்றிய ஸ்ரீ ரமண சத்குரு மாலை, ஸ்ரீ ரமண தேவமாலை (1-28)\n\nநாள் 14 : பிள்ளையவர்களின் ஸ்ரீ ரமண தேவமாலை, (29-42), விண்ணப்பம்\n\nநாள் 15 : பிள்ளையவர்களின் ஸ்ரீ ரமண பாதமாலை, மணிவாசகரது திருக்கோவையார் (ஒரு பாடல்), சுந்தரமூர்த்தி நாயனாரது திருச்சுழி தேவாரம்\n\nஇந்தப் பாராயண முறை தமிழ், தெலுங்கு, மலையாளப் பாடல்களைக் கொண்டிருப்பினும், 1935இல் துவங்கிய வேதபாராயணத்திலிருந்து தனிப்படுத்திக் காட்டும் வகையில் தமிழ்ப் பாராயணம் என அழைக்கப்பட்டது. இத்தோத்திரத் தொகுப்பு நான்கு வகைத் துதிகளை உள்ளடக்கியதாக இருந்தது. அவை:\n\nபகவான் இயற்றிய தமிழ், தெலுங்கு, மலையாள சம்ஸ்க்ருத பாடல்கள்\n\nஸ்ரீ பகவானால் வடமொழியிலிருந்து தமிழிலும் மலையாளத்திலும் மொழிமாற்றம் செய்யப்பட்ட பாடல்கள்\n\nபண்டைய தமிழ் மற்றும் வடமொழி நூல்களிலிருந்து ஸ்ரீ பகவானால் தேர்ந்தெடுக்கப்பட்ட பாடல்கள்\n\nஅன்பர்களால் ஸ்ரீ பகவான் மீது பாடப்பெற்ற பாடல்கள்\n\nமாலை 6.30 மணிக்குத் துவங்கும் இவற்றின் அன்றாட பாராயண வழக்கம் அன்றுமுதல் இன்றுவரை ஆச்ரமத்தில் (சில மாறுதல்களுடன்) நடைபெறுகின்றது.\n\nஆச்ரம இன்றைய பாராயண முறை:\n\nதமிழ்ப் பாராயணத்தின் ஆரம்பகாலத்தில், பாராயணத்திற் குரிய பாடல்கள் ஓர் குறிப்பேட்டில் எழுதி வைக்கப்பட்டு, பாராயணம் செய்ய விரும்புவோரால் அவரவர் கையேட்டில் அவர்களாலேயே பிரதி எடுத்துக் கொள்ளப்பட்டன. சிற்சில சமயங்களில் ஸ்ரீபகவானே அவற்றை எழுதித் தந்தருள வேண்டுமென்று விண்ணப்பிக்கும் அடியவர்களின் வேண்டுகோட்கட்கு செவிசாய்த்து ஸ்ரீபகவானே அவையனைத்தையும் எழுதியருளியதும் உண்டு. சுவாமி சிவானந்தா என்ற ஸ்ரீ பகவானது அணுக்கத் தொண்டர் ஒருவரிடமிருந்து அத்தகைய கையேடு ஒன்று 1987இல் கண்வாச்ரம அறக்கட்டளையால் பெறப்பட்டு முதன்முறையாக அச்சேற்றப்பட்டது.\n  ஸ்ரீபகவானது சந்நிதியில் குஞ்சு சுவாமிகள் வழிகாட்டுதலில் முறையான தமிழ்ப் பாராயணம், மீண்டும் 1985இல் துவங்கப்பட்டது. ஸ்ரீ ரமண நூல் திரட்டில் உள்ள பாடல் வரிசைக்கிரமப்படி திங்கள் முதல் வெள்ளி வரையிலும், சனிக்கிழமை ஸ்ரீ ரமண ஸ்துதி பஞ்சகமும் தற்போது பாடப்பெற்று வருகின்றன. """;

var engHistory =
    """The recitation of sacred texts at Sri Ramanasramam goes back to the early days at Skandasramam. Bhagavan regularly initiated chanting of the Ribhu Gita, an ancient advaitic text (taken from the Siva Rahasya) as well as other classical advaitic texts. He esteemed the hymns of the legendary Tamil poets,such as Sundarar, Appar, Jnanasambandar and, not least of all, Manikkavachagar, whose Tiruvachagam, for example, devotees recited throughout the night on the occasion of the mahasamadhi of Bhagavan’s mother in May, 1922. Bhagavan also encouraged the recitation of his own works.\n\nRealising the spiritual benefit of the study and repetition of Bhagavan’s poetical works, devotees started regular parayana1. Kunjuswami, a long-time devotee and attendant of Bhagavan, records in his Tamil reminiscences, Enadu Ninaivugal, that when he first came to Sri Bhagavan in 1920, Bhagavan’s mother was in the habit of reciting devotional songs each morning between four and five. When she completed her recitation, other devotees would chant Sri Arunachala Aksharamanamalai, Appalap Paattu and Bhagavan’s Tamil rendering of Sri Dakshinamurti Stotram among others. In the course of time, Bhagavan composed new works, which were incorporated into the daily chanting repertoire. By the late 1940s the parayana cycle had grown to 15 days and consisted of more than thirty works. The recitation was as follows:\n\nDay 1: Tiruvannamalai Devaram, verses in praise of Arunachala by the Saints Jnanasambandar, Navukkarasu and Sundaramurti.\n\nDay 2: Sri Arunachala Tattuvam, Sri Arunachala Mahatmyam, and Akshara Mana Malai.\n\nDay 3: Sri Arunacala Nava Mani Malai, Sri Arunachala Padikam, Sri Arunachala Ashtakam, Appalap Paattu, and Anma Viddai.\n\nDay 4: Upadesa Undiyar and Upadesa Saram in Malayalam, Telugu and Sanskrit.\n\nDay 5: Ulladu Narpadu and Supplement to Ulladu Narpadu.\n\nDay 6: Sat Darshanam (the Malayalam version of Ulladu Narpadu and its Supplement).\n\nDay 7: Devikalottaram.\n\nDay 8: Anma Sakshatkaram, Sri Guru Stuti, and Sri Hastamalakam.\n\nDay 9: Bhagavat Gita Saram in Tamil, Malayalam and Sanskrit.\n\nDay 10: Anma Bhodam and Ekanma Panchakam.\n\nDay 11: Sri Dakshinamurti Stotram in Sanskrit and Tamil as well as selected verses in Sanskrit and Tamil from Vivekachudamani, Sivananda Lahari2 and works of Saint Thayumanavar.\n\nDay 12: Sri Ramana Stuti Panchakam by Satyamangalam Venkataramayyar.\n\nDay 13: Sri Ramana Deva Malai and Satguru Malai by Sri Sivaprakasam Pilli.\n\nDay 14: Sri Ramana Deva Malai and Vinnapam by Sivaprakasam Pillai.\n\nDay 15: Sri Ramana Pada Malai by Sivaprakasam Pillai and verses in praise of Tiruchuzhi by Manikkavachagar and Sundaramurti.\n\n This recitation corpus was called ‘Tamil Parayana’ (though a number of the hymns were written in Sanskrit, Telugu and Malayalam) to distinguish it from the ‘Vedaparayana’ which began at the Ashram in 1935. The liturgical corpus can be divided into four main categories:\n1. The original works of Bhagavan in Tamil, Telugu, Sanskrit and Malayalam.\n2. Works translated by Bhagavan from Sanskrit into Tamil and Malayalam.\n3. Verses selected by Bhagavan from ancient Tamil/Sanskrit texts.\n4. Works on Sri Bhagavan by devotees.\n\nReciting these verses each evening at 6:30 became a regular practice and, with a few modifications4, continues to the present day at the Ashram. Venba and Other Metres. Most of Bhagavan’s verses and translations utilise the venba metre. Venba is a metrical form common in Tamil poetics and consists of two couplets connected through a link word. A venba contains four lines, the first three of which contain four words each and the last, three words. Bhagavan also wrote kalivenba versions of his verses whereby the ordinary venba verse is connected to the next verse with a link word5 to facilitate rote learning. Thus Ulladu Narpadu, Ekanma Panchakam, Devikalottaram, Anma Sakshatkaram, Anma Bhodam and selections from The Bhagavat Gita Saram are available in both metrical formats. The Supplement to Ulladu Narpadu contains 28 venbas and other assorted metrical forms, which include viruttam, a metre having from four to six words per line. """;

var about =
    """ஓர் ஞானியினால் அருளப்பெறும் ஓரோர் சொல்லும் ஒப்பற்ற வேதவாக்கே. ஆத்மானுபூதியையே பிரமாணமாய்க் கொண்டு வெளிவருவதால் அவ்வருண்மொழிகள் சத்தியத்திலும் மகிமையிலும் பிரமாணத்திலும் வேதத்திற்குச் சமமானவை என்பது தொன்றுதொட்டு வழக்கிலிருக்கும் ஓர் கருத்து. இளம்பிராயமான பதினாறு வயதினிலேயே முழுமையான முடிவை, முக்தியை அடையப்பெற்ற பகவான் ஸ்ரீ ரமண மகரிஷிகள் தாமாகவே அருளிச் செய்த பாடல்களும் அன்னாரது மொழிபெயர்ப்பில் மிளிரும் வடமொழிப் பாடல்களும் அக்கருத்தினைப் பறைசாற்றி மெய்ப்பிக்கின்றன. தனது ஆத்மசாக்ஷாத்காரத்தின் பரிணாமம் அனைத்தையும் குறுகிய பாவினங்களில் பூர்ணமாக அடக்கி வெளிக்கொணரும் அசாதாரண வல்லமை பிற்காலத்தில் ஸ்ரீபகவானிடத்தில் விசேஷமாகப் பரிணமித்தது. சக்தி வாய்ந்த மந்திரங்களை ஒக்கும் இப்பாடல்கள் நேர்த்தியாகச் செதுக்கப்பட்டு, செலுத்தப் பெறும் இலக்கு தவிரா அம்புகள்போல் ஒளிக்கணைகளென உள்ளங்களில் பாய்ந்து மனவாக்குக்கெட்டாத அதிமர்மப் பாங்கில் மனத்தை ஈர்த்துச் செல்லும் அருட்சக்தி வாய்ந்தவை. ஊன்றிப் படிப்போரின் உள்ளங்களில் தெளிவையும் ஞானத்தையும் புகட்டும் ஆற்றல் படைத்தவை.\n\nபெரும்பாலும் மோனநிலையில் அமர்ந்து மௌன உபதேசமே அருளிய பகவான் எழுத்தில் வடித்தது சிறிதேயாயினும், வினவப்படும் வினாக்களுக்கு வார்த்தையாலோ எழுத்து வடிவிலோ விடையளிக்கத் தயங்கியதேயில்லை. சிரத்தையுடன் இதயபூர்வமாகக் கேட்கப்பட்ட வினாக்கள் அனைத்திற்கும் விரிவான, தெளிவான விளக்கங்கள் அளிக்கப்பட்டன. தானே பாடல்களை இயற்றிச் சரிபார்த்ததுடன் சிற்சில சந்தர்ப்பங்களில் பிறரால் இயற்றப்பட்ட பாடல்களையும் நேர்த்தியாகத் திருத்தியதுமுண்டு. முறையாகப் பயிலாத தெலுங்கு, மலையாளம் போன்ற பிற மொழிகளிலும் அவருக்கு இயல்பாகவே தேர்ச்சி அமைந்திருந்தது வியப்பே. ஸ்ரீ பகவான் இயற்றிய, மரபிலிருந்து சற்றும் பிறழாத ஸம்ஸ்கிருதப் பாடல்களின் இலக்கணத் துல்லியத்தை மட்டுமன்றி வடமொழிப் புலமையையும் அதன் அழகையும் கோர்வையையும் கண்டு வியக்காத பண்டிதர்களே இல்லை எனலாம். ஸ்ரீபகவானின் இனிய தமிழ்ப் பாக்களும், அவை தோன்றிய நாள்முதல் இன்றுவரை தமிழ் இலக்கிய வல்லுநர்களால் ஓர் இலக்கிய மேதையின் படைப்புகளெனப் போற்றி மதிக்கப் பெறுகின்றன. இப்பாடல்கள் வெளிவர ஏதுவாய் இருந்த சந்தர்ப்பங்கள், அன்று நேரில் கண்டோரை பிரமிக்க வைத்ததைப் போன்றே இன்றும் அனைவரையும் வியப்பில் ஆழ்த்த வல்லன.\n\nஸ்ரீபகவான் விரூபாக்ஷ குகையில் இருந்த காலத்திலிருந்தே ஸ்ரீபகவானது அடியார்களால் செய்யப் பெற்றுவந்த இப்பாடல்களின் பாராயணத்தால் மனமலம் நீங்கப்பெற்று, உள்ளத்தூய்மையும் அமைதியும் பெற்றது பங்கு பெற்றோர் அனைவரின் அனுபவமாய்த் திகழ்ந்தது. """;

var engAbout =
    """It is said the words of a jnani are equal in power, stature and authority to the cherished Vedas themselves. Indeed this applies to the compositions and translations of Bhagavan Sri Ramana Maharshi who at the age of sixteen attained complete and final liberation. Subsequently Bhagavan Ramana exhibited the extraordinary ability to compress the full breadth of his realization into terse poetic verses. Like mantras, these skilfully crafted arrows of light work on the mind of the reader in a mysterious and powerfully transformative way, bestowing understanding and wisdom on all who encounter them.\n\nWhile Bhagavan wrote very little, having taught mainly through the power of silence, he was not unwilling to answer questions, either verbally or in writing. As long as he felt inquiries were sincere, he responded fully. He composed and corrected his own writings and on occasion reviewed the compositions of others. Moreover he had a gift for languages, even those he had never formally studied (e.g., Malayalam and Telugu). The greatest Sanskrit pandits of his day and since have marvelled at Bhagavan’s Sanskrit compositions, not merely for their grammatical accuracy but their beauty and cogency. Likewise his Tamil compositions are revered by scholars of Tamil literature as works of literary genius. Numerous stories abound surrounding the circumstances in which his compositions came into being. These events still intrigue students of Bhagavan’s works, as they did those who directly witnessed them.\n\nSince the days at Virupaksha Cave, Bhagavan’s devotees have chanted these works and testified time and again to the purifying effect they have on heart, mind and soul. It is these verses that are chanted today at Sri Ramanasramam and comprise the present volume. """;
