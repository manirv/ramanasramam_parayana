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

//   """[00:00.00]அருணாசல மஹாத்மியம்
// [00:00.05]கருணார் ணவமாய்க் கருதக் கதிநல்கும்
// [00:07.00]அருணாசல சிவமீதாம்
// [00:12.50]
// [00:13.00]அருணாசல தத்துவம்
// [00:13.00]புத்தியகங் காரம் புலம்பெய்த வோங்கு
// [00:20.00]மத்தியித யந்தான் மறையவனு மாலு
// [00:25.00]நத்தவறி யாது நலங்குலைய வன்னார்
// [00:31.00]மத்தியொளி ரண்ணா மலையினது மெய்யே.
// [00:36.20]
// [00:36.50]தீபதர்சன தத்துவம்
// [00:36.50]இத்தனுவே நானா மெனுமதியை நீத்தப்
// [00:43.30]புத்தியித யத்தே பொருந்தியக நோக்கா
// [00:49.00]லத்துவித மாமெய் யகச்சுடர்காண் கைபூ
// [00:54.80]மத்தியெனு மண்ணா மலைச்சுடர்காண் மெய்யே.
// [01:00.50]
// [01:00.50]நந்திவாக்கு:-
// [01:00.50](விருத்தம்)
// [01:00.50]
// [01:00.50]அதுவேதல மருணாசலந் தலம்யாவிலு மதிக
// [01:11.00]மதுபூமியி னிதயம்மறி யதுவேசிவ னிதயப்
// [01:20.00]பதியாமொரு மருமத்தலம் பதியாமவ னதிலே
// [01:29.80]வதிவானொளி மலையாநித மருணாசல மெனவே.
// [01:39.70]                                    (1)
// [01:39.70]
// [01:39.70]ஆதியரு ணாசலப்பே ரற்புதலிங் கத்துருக்கொ
// [01:47.00]ளாதிநாண் மார்கழியி லாதிரையச்  சோதியெழு
// [01:54.00]மீசனைமான் முன்னமர ரேத்திவழி பட்டநாண்
// [02:00.00]மாசிசிவ ராத்திரியா மற்று.
// [02:06.00]                                     (2)
// [02:06.00]
// [02:06.00]அங்கியுரு வாயுமொளி மங்குகிரி யாகத்
// [02:11.00]தங்கலரு ளாலுலகந் தாங்குவதற் கன்றி
// [02:18.00]யிங்குறைவன் சித்தனென வென்றுமென துள்ளே
// [02:23.00]பொங்கியொளி ருங்குகைபல் போகமொடென் றுள்ளே.
// [02:31.00]                                     (3)
// [02:31.00]
// [02:31.00]எல்லா வுலகுந் தகையவ் வியலாற்
// [02:36.00]பொல்லா வினைகள் ருணமாம் புகலீ
// [02:42.00]தில்லா ததுவா மெதுகண் ணுறலா
// [02:46.80]லெல்லா ரருணா சலமா மிதுவே.
// [02:54.00]                                     (4)
// [02:54.00]
// [02:54.00]உருத்தெரி யெல்லை யுற்றுகண் ணுற்றாற்
// [02:59.00]கருத்தினாற் றூரக் கருதினா லும்மே
// [03:04.00]வருத்த முறாது வராதவே தாந்த
// [03:09.50]வருத்தவிஞ் ஞான மார்க்குமுண் டாமே.
// [03:16.00]                                     (5)
// [03:16.00]
// [03:16.00]யோசனை மூன்றா மித்தல வாசர்க்
// [03:21.00]காசறு தீக்கை யாதியின் றியுமென்
// [03:26.00]பாசமில் சாயுச் சியம்பயக் கும்மே
// [03:31.00]யீசனா மென்ற னாணையி னானே.
// [03:37.00]                                     (6)
// [03:37.00]
// [03:37.00]என்றுமே யறவோ ரன்பர்க் கிருப்பிட மித்த லந்தான்
// [03:44.00]பொன்றுவார் பிறர்க்கின் னாவுன் புன்மையர் பன்னோய் துன்னி
// [03:51.30]யொன்றுறா தொழியுந் தீயோ ருரனொரு கணத்திங் கங்கிக்
// [03:58.00]குன்றுரு வருணை யீசன் கோபவெந் தழல்வி ழாதே.
// [04:07.50]                                     (7)""",
//   """
// [00:00.00]தருணா ருணமணி கிரணா வலிநிகர்
// [00:06.00]தரும க்ஷரமண மகிழ்மாலை
// [00:12.00]தெருணா டியதிரு வடியார் தெருமரல்
// [00:17.00]தெளியப் பரவுதல் பொருளாகக்
// [00:24.00]கருணா கரமுனி ரமணா ரியனுவ
// [00:30.00]கையினாற் சொலியது கதியாக
// [00:35.00]வருணா சலமென வகமே யறிவொடு
// [00:41.00]மாழ்வார் சிவனுல காள்வாரே.
// [00:47.00]அருணாசல வரற்கேற்ற
// [00:52.00]வக்ஷரமண மாலைசாற்றக்
// [00:57.00]கருணாகர கணபதியே
// [01:02.00]கரமருளிக் காப்பாயே.
// [01:01.00]அருணா சலசிவ அருணா சலசிவ
// [01:01.00]அருணா சலசிவ அருணாசலா!
// [01:01.00]அருணா சலசிவ அருணா சலசிவ
// [01:01.00]அருணா சலசிவ அருணாசலா!
// [01:33.00]அருணா சலமென வகமே நினைப்பவ
// [01:38.00]ரகத்தைவே ரறுப்பா யருணாசலா (அ)
// [01:44.00]அழகுசுந் தரம்போ லகமும் நீயுமுற்
// [01:49.00]றபின்னமா யிருப்போ மருணாசலா(அ)
// [01:55.00]அகம்புகுந் தீர்த்துன் னககுகை சிறையா
// [01:59.00]யமர்வித்த தென்கொ லருணாசலா(அ)
// [02:05.00]ஆருக் காவெனை யாண்டனை யகற்றிடி
// [02:10.00]லகிலம் பழித்திடு மருணாசலா(அ)
// [02:16.00]இப்பழி தப்புனை யேனினைப் பித்தா
// [02:21.00]யினியார் விடுவா ரருணாசலா(அ)
// [02:26.00]ஈன்றிடு மன்னையிற் பெரிதருள் புரிவோ
// [02:32.00]யிதுவோ வுனதரு ளருணாசலா(அ)
// [02:37.00]உனையே மாற்றி யோடா துளத்தின்மே
// [02:42.00]லுறுதியா யிருப்பா யருணாசலா(அ)
// [02:48.00]ஊர்சுற் றுளம்விடா துனைக்கண் டடங்கிட
// [02:53.00]வுன்னழ கைக்காட் டருணாசலா(அ)
// [02:58.00]எனையழித் திப்போ தெனைக்கல வாவிடி
// [03:03.00]லிதுவோ வாண்மை யருணாசலா(அ)
// [03:09.00]ஏனிந்த வுறக்க மெனைப்பிற ரிழுக்க
// [03:14.00]விதுவுனக் கழகோ வருணாசலா(அ)
// [03:20.00]ஐம்புலக் கள்வ ரகத்தினிற் புகும்போ
// [03:24.00]தகத்தினீ யிலையோ வருணாசலா(அ)
// [03:30.00]ஒருவனா முன்னை யொளித்தெவர் வருவா
// [03:36.00]ருன்சூ தேயிது வருணாசலா(அ)
// [03:41.00]ஓங்கா ரப்பொரு ளொப்புயர் வில்லோ
// [03:46.00]யுனையா ரறிவா ரருணாசலா(அ)
// [03:51.00]ஒளவைபோ லெனக்குன் னருளைத் தந்தெனை
// [03:56.00]யாளுவ துன்கட னருணாசலா(அ)
// [04:02.00]கண்ணுக்குக் கண்ணாய்க் கண்ணின்றிக் காணுனைக்
// [04:07.00]காணுவ தெவர்பா ரருணாசலா(அ)
// [04:12.00]காந்த மிரும்புபோற் கவர்ந்தெனை விடாமற்
// [04:17.00]கலந்தெனோ டிருப்பா யருணாசலா(அ)
// [04:22.00]கிரியுரு வாகிய கிருபைக் கடலே
// [04:27.00]கிருபைகூர்ந் தருளுவா யருணாசலா(அ)
// [04:32.00]கீழ்மே லெங்குங் கிளரொளி மணியென்
// [04:38.00]கீழ்மையைப் பாழ்செய் யருணாசலா(அ)
// [04:43.00]குற்றமுற் றறுத்தெனைக் குணமாய்ப் பணித்தாள்
// [04:48.00]குருவுரு வாயொளி ரருணாசலா(அ)
// [04:53.00]கூர்வாட் கண்ணியர் கொடுமையிற் படாதருள்
// [04:58.00]கூர்ந்தெனைச் சேர்ந்தரு ளருணாசலா(அ)
// [05:03.00]கெஞ்சியும் வஞ்சியாய்க் கொஞ்சமு மிரங்கிலை
// [05:08.00]யஞ்சலென் றேயரு ளருணாசலா(அ)
// [05:14.00]கேளா தளிக்குமுன் கேடில் புகழைக்
// [05:19.00]கேடுசெய் யாதரு ளருணாசலா(அ)
// [05:24.00]கையினிற் கனியுன் மெய்ரசங் கொண்டுவ
// [05:31.00]கைவெறி கொளவரு ளருணாசலா(அ)
// [05:35.00]கொடியிட் டடியரைக் கொல்லுனைக் கட்டிக்
// [05:40.00]கொண்டெஙன் வாழ்வே னருணாசலா(அ)
// [05:45.00]கோபமில் குணத்தோய் குறியா யெனைக்கொளக்
// [05:51.00]குறையென் செய்தே னருணாசலா(அ)
// [05:56.00]கௌதமர் போற்றுங் கருணைமா மலையே
// [06:01.00]கடைக்கணித் தாள்வா யருணாசலா(அ)
// [06:06.00]சகலமும் விழுங்குங் கதிரொளி யினமன
// [06:11.00]சலச மலர்த்தியி டருணாசலா(அ)
// [06:16.00]சாப்பா டுன்னைச் சார்ந்துண வாயான்
// [06:21.00]சாந்தமாய்ப் போவ னருணாசலா(அ)
// [06:26.00]சித்தங் குளிரக்கதி ரத்தம்வைத் தமுதவா
// [06:32.00]யைத்திற வருண்மதி யருணாசலா(அ)
// [06:36.00]சீரை யழித்துநிர் வாணமாச் செய்தருட்
// [06:41.00]சீரை யளித்தரு ளருணாசலா(அ)
// [06:47.00]சுகக்கடல் பொங்கச் சொல்லுணர் வடங்கச்
// [06:52.00]சும்மா பொருந்திடங் கருணாசலா(அ)
// [06:57.00]சூதுசெய் தென்னைச் சோதியா தினியுன்
// [07:02.00]சோதி யுருக்காட் டருணாசலா(அ)
// [07:07.00]செப்படி வித்தைகற் றிப்படி மயக்குவிட்
// [07:12.00]டுருப்படு வித்தைகாட் டருணாசலா(அ)
// [07:17.00]சேரா யெனின்மெய் நீரா யுருகிக்கண்
// [07:22.00]ணீராற் றழிவே னருணாசலா(அ)
// [07:27.00]சையெனத் தள்ளிற் செய்வினை சுடுமலா
// [07:32.00]லுய்வகை யேதுரை யருணாசலா(அ)
// [07:37.00]சொல்லாது சொலிநீ சொல்லற நில்லென்று
// [07:43.00]சும்மா விருந்தா யருணாசலா(அ)
// [07:47.00]சோம்பியாய்ச் சும்மா சுகமுண் டுறங்கிடிற்
// [07:53.00]சொல்வே றென்கதி யருணாசலா(அ)
// [07:57.00]சௌரியங் காட்டினை சழக்கற்ற தென்றே
// [08:03.00]சலியா திருந்தா யருணாசலா(அ)
// [08:08.00]ஞமலியிற் கேடா நானென் னுறுதியா
// [08:12.00]னாடிநின் னுறுவே னருணாசலா(அ)
// [08:18.00]ஞானமில் லாதுன் னாசையாற் றளர்வற
// [08:23.00]ஞானந் தெரித்தரு ளருணாசலா(அ)
// [08:28.00]ஞிமிறுபோ னீயு மலர்ந்திலை யென்றே
// [08:33.00]நேர்நின் றனையென் னருணாசலா(அ)
// [08:38.00].தத்துவந் தெரியா தத்தனை யுற்றாய்
// [08:43.00]தத்துவ மிதுவென் னருணாசலா(அ)
// [08:48.00]தானே தானே தத்துவ மிதனைத்
// [08:53.00]தானே காட்டுவா யருணாசலா(அ)
// [08:58.00]திரும்பி யகந்தனைத் தினமகக் கண்காண்
// [09:03.00]டெரியுமென் றனையென் னருணாசலா(அ)
// [09:08.00]தீரமி லகத்திற் றேடியுந் தனையான்
// [09:13.00]றிரும்பவுற் றேனரு ளருணாசலா(அ)
// [09:19.00]துப்பறி வில்லா விப்பிறப் பென்பய
// [09:23.00]னொப்பிட வாயே னருணாசலா(அ)
// [09:28.00]தூய்மன மொழியர் தோயுமுன் மெய்யகந்
// [09:33.00]தோயவே யருளென் னருணாசலா(அ)
// [09:38.00]தெய்வமென் றுன்னைச் சாரவே யென்னைச்
// [09:43.00]சேர வொழித்தா யருணாசலா(அ)
// [09:48.00]தேடா துற்றநற் றிருவரு ணிதியகத்
// [09:53.00]தியக்கந் தீர்த்தரு ளருணாசலா(அ)
// [09:58.00]தைரிய மோடுமுன் மெய்யக நாடயான்
// [10:03.00]றட்டழிந் தேனரு ளருணாசலா(அ)
// [10:08.00]தொட்டருட் கைமெய் கட்டிடா யெனிலியா
// [10:13.00]னட்டமா வேனரு ளருணாசலா(அ)
// [10:18.00]தோடமி னீயகத் தோடொன்றி யென்றுஞ்சந்
// [10:23.00]தோடமொன் றிடவரு ளருணாசலா(அ)
// [10:28.00]நகைக்கிட மிலைநின் னாடிய வெனையரு
// [10:32.00]ணகையிட்டுப் பார்நீ யருணாசலா(அ)
// [10:38.00]நாணிலை நாடிட நானா யொன்றிநீ
// [10:43.00]தாணுவா நின்றனை யருணாசலா(அ)
// [10:48.00]நின்னெரி யெரித்தெனை நீறாக் கிடுமுன்
// [10:53.00]னின்னருண் மழைபொழி யருணாசலா(அ)
// [10:58.00]நீநா னறப்புலி நிதங்களி மயமா
// [11:03.00]நின்றிடு நிலையரு ளருணாசலா(அ)
// [11:08.00]நுண்ணுரு வுனையான் விண்ணுரு நண்ணிட
// [11:13.00]வெண்ணலை யிறுமென் றருணாசலா(அ)
// [11:18.00]நூலறி வறியாப் பேதைய னென்றன்
// [11:23.00]மாலறி வறுத்தரு ளருணாசலா(அ)
// [11:27.00]நெக்குநெக் குருகியான் புக்கிட வுனைப்புக
// [11:32.00]னக்கனா நின்றனை யருணாசலா(அ)
// [11:37.00]நேசமி லெனக்குன் னாசையைக் காட்டிநீ
// [11:42.00]மோசஞ் செயாதரு ளருணாசலா(அ)
// [11:47.00]நைந்தழி கனியா னலனிலை பதத்தி
// [11:52.00]னாடியுட் கொள்நல மருணாசலா(அ)
// [11:57.00]நொந்திடா துன்றனைத் தந்தெனைக் கொண்டிலை
// [12:03.00]யந்தக னீயெனக் கருணாசலா(அ)
// [12:07.00]நோக்கியே கருதிமெய் தாக்கியே பக்குவ
// [12:12.00]மாக்கிநீ யாண்டரு ளருணாசலா(அ)
// [12:17.00]பற்றிமால் விடந்தலை யுற்றிறு முனமருள்
// [12:22.00]பற்றிட வருள்புரி யருணாசலா(அ)
// [12:27.00]பார்த்தருண் மாலறப் பார்த்திலை யெனினருள்
// [12:32.00]பாருனக் கார்சொல்வ ரருணாசலா(அ)
// [12:37.00]பித்துவிட் டுனைநேர் பித்தனாக் கினையருள்
// [12:41.00]பித்தந் தெளிமருந் தருணாசலா(அ)
// [12:47.00]பீதியி லுனைச்சார் பீதியி லெனைச்சேர்
// [12:51.00]பீதியுன் றனக்கே னருணாசலா(அ)
// [12:56.00]புல்லறி வேதுரை நல்லறி வேதுரை
// [13:01.00]புல்லிட வேயரு ளருணாசலா(அ)
// [13:07.00]பூமண மாமனம் பூரண மணங்கொளப்
// [13:12.00]பூரண மணமரு ளருணாசலா(அ)
// [13:17.00]பெயர்நினைத் திடவே பிடித்திழுத் தனையுன்
// [13:22.00]பெருமையா ரறிவா ரருணாசலா(அ)
// [13:26.00]பேய்த்தனம் விடவிடாப் பேயாப் பிடித்தெனைப்
// [13:31.00]பேயனாக் கினையென் னருணாசலா(அ)
// [13:36.00]பைங்கொடி யாநான் பற்றின்றி வாடாமற்
// [13:41.00]பற்றுக்கோ டாய்க்கா வருணாசலா(அ)
// [13:46.00]பொடியான் மயக்கியென் போதத்தைப் பறித்துன்
// [13:52.00]போதத்தைக் காட்டினை யருணாசலா(அ)
// [13:56.00]போக்கும் வரவுமில் பொதுவெளி யினிலருட்
// [14:01.00]போராட் டங்காட் டருணாசலா(அ)
// [14:06.00]பௌதிக மாமுடற் பற்றற்று நாளுமுன்
// [14:11.00]பவிசுகண் டுறவரு ளருணாசலா(அ)
// [14:16.00]மலைமருந் திடநீ மலைத்திட வோவருண்
// [14:21.00]மலைமருந் தாயொளி ரருணாசலா(அ)
// [14:26.00]மானங்கொண் டுறுபவர் மானத்தை யழித்தபி
// [14:31.00]மானமில் லாதொளி ரருணாசலா(அ)
// [14:36.00]மிஞ்சிடிற் கெஞ்சிடுங் கொஞ்ச வறிவனியான்
// [14:41.00]வஞ்சியா தருளெனை யருணாசலா(அ)
// [14:46.00]மீகாம னில்லாமன் மாகாற் றலைகல
// [14:51.00]மாகாமற் காத்தரு ளருணாசலா(அ)
// [14:56.00]முடியடி காணா முடிவிடுத் தனைநேர்
// [15:01.00]முடிவிடக் கடனிலை யருணாசலா(அ)
// [15:06.00]மூக்கிலன் முன்காட்டு முகுரமா காதெனைத்
// [15:10.00]தூக்கி யணைந்தரு ளருணாசலா(அ)
// [15:16.00]மெய்யகத் தின்மன மென்மல ரணையினா
// [15:21.00]மெய்கலந் திடவரு ளருணாசலா(அ)
// [15:26.00]மேன்மேற் றாழ்ந்திடு மெல்லியர்ச் சேர்ந்துநீ
// [15:31.00]மேன்மையுற் றனையென் னருணாசலா(அ)
// [15:36.00]மைமய னீத்தருண் மையினா லுனதுண்
// [15:41.00]மைவச மாக்கினை யருணாசலா(அ)
// [15:45.00]மொட்டை யடித்தெனை வெட்ட வெளியினீ
// [15:50.00]நட்டமா டினையென் னருணாசலா(அ)
// [15:55.00]மோகந் தவிர்த்துன் மோகமா வைத்துமென்
// [16:00.00]மோகந்தீ ராயென் னருணாசலா(அ)
// [16:05.00]மௌனியாய்க் கற்போன் மலரா திருந்தான்
// [16:10.00]மௌனமி தாமோ வருணாசலா(அ)
// [16:15.00]யவனென் வாயின் மண்ணினை யட்டி
// [16:20.00]யென்பிழைப் பொழித்த தருணாசலா(அ)
// [16:25.00]யாருமறி யாதென் மதியினை மருட்டி
// [16:30.00]யெவர்கொளை கொண்ட தருணாசலா (அ)
// [16:34.00]ரமணனென் றுரைத்தேன் ரோசங் கொளாதெனை
// [16:39.00]ரமித்திடச் செயவா வருணாசலா(அ)
// [16:44.00]ராப்பக லில்லா வெறுவெளி வீட்டில்
// [16:49.00]ரமித்திடு வோம்வா வருணாசலா(அ)
// [16:54.00]லட்சியம் வைத்தரு ளஸ்திரம் விட்டெனைப்
// [16:59.00]பட்சித்தாய் பிராணனோ டருணாசலா(அ)
// [17:04.00]லாபநீ யிகபர லாபமி லெனையுற்று
// [17:09.00]லாபமென் னுற்றனை யருணாசலா(அ)
// [17:14.00]வரும்படி சொலிலை வந்தென் படியள
// [17:18.00]வருந்திடுன் றலைவிதி யருணாசலா(அ)
// [17:24.00]வாவென் றகம்புக்குன் வாழ்வரு ளன்றேயென்
// [17:28.00]வாழ்விழந் தேனரு ளருணாசலா(அ)
// [17:34.00]விட்டிடிற் கட்டமாம் விட்டிடா துனையுயிர்
// [17:38.00]விட்டிட வருள்புரி யருணாசலா(அ)
// [17:43.00]வீடுவிட் டீர்த்துள வீடுபுக்குப் பையவுன்
// [17:48.00]வீடுகாட் டினையரு ளருணாசலா(அ)
// [17:53.00]வெளிவிட்டே னுன்செயல் வெறுத்திடா துன்னருள்
// [17:58.00]வெளிவிட் டெனைக்கா வருணாசலா(அ)
// [18:03.00]வேதாந் தத்தே வேறற விளங்கும்
// [18:07.00]வேதப் பொருளரு ளருணாசலா(அ)
// [18:13.00]வைதலை வாழ்த்தா வைத்தருட் குடியா
// [18:17.00]வைத்தெனை விடாதரு ளருணாசலா(அ)
// [18:22.00]அம்புவி லாலிபோ லன்புரு வுனிலெனை
// [18:27.00]யன்பாக் கரைத்தரு ளருணாசலா(அ)
// [18:32.00]அருணையென் றெண்ணயா னருட்கண்ணி பட்டேனுன்
// [18:37.00]னருள்வலை தப்புமோ வருணாசலா(அ)
// [18:42.00]சிந்தித் தருட்படச் சிலந்திபோற் கட்டிச்
// [18:46.00]சிறையிட் டுண்டனை யருணாசலா(அ)
// [18:51.00]அன்பொடுன் னாமங்கே ளன்பர்த மன்பருக்
// [18:56.00]கன்பனா யிடவரு ளருணாசலா(அ)
// [19:01.00]என்போலுந் தீனரை யின்புறக் காத்துநீ
// [19:06.00]யெந்நாளும் வாழ்ந்தரு ளருணாசலா(அ)
// [19:11.00]என்புரு கன்பர்த மின்சொற்கொள் செவியுமென்
// [19:16.00]புன்மொழி கொளவரு ளருணாசலா(அ)
// [19:21.00]பொறுமையாம் பூதர புன்சொலை நன்சொலாப்
// [19:25.00]பொறுத்தரு ளிஷ்டம்பின் னருணாசலா(அ)
// [19:30.00]மாலை யளித்தரு ணாசல ரமணவென்
// [19:35.00]மாலை யணிந்தரு ளருணாசலா
// [19:40.00]மாலை யளித்தரு ணாசல ரமணவென்
// [19:45.00]மாலை யணிந்தரு ளருணாசலா  (அ)
// [19:51.00]அருணா சலசிவ அருணா சலசிவ
// [20:11.00]அருணா சலசிவ அருணாசலா!
// [20:11.00]அருணா சலசிவ அருணா சலசிவ
// [20:11.00]அருணா சலசிவ அருணாசலா!
// [20:11.00]அருணா சலம்வாழி யன்பர் களும்வாழி
// [20:11.00]அக்ஷர மணமாலை வாழி.
// """,
//   """[00:00.00]அருணாசல மஹாத்மியம்
// [00:00.05]கருணார் ணவமாய்க் கருதக் கதிநல்கும்
// [00:07.00]அருணாசல சிவமீதாம்
// [00:12.50]
// [00:13.00]புத்தியகங் காரம் புலம்பெய்த வோங்கு
// [00:20.00]மத்தியித யந்தான் மறையவனு மாலு
// [00:25.00]நத்தவறி யாது நலங்குலைய வன்னார்
// [00:31.00]மத்தியொளி ரண்ணா மலையினது மெய்யே.
// [00:36.50]
// [00:36.50]இத்தனுவே நானா மெனுமதியை நீத்தப்
// [00:43.30]புத்தியித யத்தே பொருந்தியக நோக்கா
// [00:49.00]லத்துவித மாமெய் யகச்சுடர்காண் கைபூ
// [00:54.80]மத்தியெனு மண்ணா மலைச்சுடர்காண் மெய்யே.
// [01:00.50]
// [01:01.00]அதுவேதல மருணாசலந் தலம்யாவிலு மதிக
// [01:03:00]மதுபூமியி னிதயம்மறி யதுவேசிவ னிதயப்
// [01:12:00]பதியாமொரு மருமத்தலம் பதியாமவ னதிலே
// [01:21:00]வதிவானொளி மலையாநித மருணாசல மெனவே.
// [01:39.70]
// [01:39.70]ஆதியரு ணாசலப்பே ரற்புதலிங் கத்துருக்கொ
// [01:47.00]ளாதிநாண் மார்கழியி லாதிரையச் சோதியெழு
// [01:54.00]மீசனைமான் முன்னமர ரேத்திவழி பட்டநாண்
// [02:00.00]மாசிசிவ ராத்திரியா மற்று.
// [02:05.50](3)
// [02:06.00]அங்கியுரு வாயுமொளி மங்குகிரி யாகத்
// [02:11.00]தங்கலரு ளாலுலகந் தாங்குவதற் கன்றி
// [02:18.00]யிங்குறைவன் சித்தனென வென்றுமென துள்ளே
// [02:23.00]பொங்கியொளி ருங்குகைபல் போகமொடென் றுள்ளே.
// [02:30.10](4)
// [02:31.00]எல்லா வுலகுந் தகையவ் வியலாற்
// [02:36.00]பொல்லா வினைகள் ருணமாம் புகலீ
// [02:42.70]தில்லா ததுவா மெதுகண் ணுறலா
// [02:46.80]லெல்லா ரருணா சலமா மிதுவே.
// [02:53.50](5)
// [02:54.00]உருத்தெரி யெல்லை யுற்றுகண் ணுற்றாற்
// [02:59.00]கருத்தினாற் றூரக் கருதினா லும்மே
// [03:04.00]வருத்த முறாது வராதவே தாந்த
// [03:09.50]வருத்தவிஞ் ஞான மார்க்குமுண் டாமே.
// [03:15.50](6)
// [03:16.00]யோசனை மூன்றா மித்தல வாசர்க்
// [03:21.00]காசறு தீக்கை யாதியின் றியுமென்
// [03:26.00]பாசமில் சாயுச் சியம்பயக் கும்மே
// [03:31.00]யீசனா மென்ற னாணையி னானே.
// [03:36.50](7)
// [03:37.00]என்றுமே யறவோ ரன்பர்க் கிருப்பிட மித்த லந்தான்
// [03:44.00]பொன்றுவார் பிறர்க்கின் னாவுன் புன்மையர் பன்னோய் துன்னி
// [03:51.30]யொன்றுறா தொழியுந் தீயோ ருரனொரு கணத்திங் கங்கிக்
// [03:58.00]குன்றுரு வருணை யீசன் கோபவெந் தழல்வி ழாதே.
// [04:07.50]

// """
// ];

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
