--Holyjoey.
--4.0

util.require_natives("3095a")

local settings_list = menu.list(menu.my_root(), "Settings", {}, "", function() end)
local customize_list = menu.list(settings_list, "Customize", {}, "", function() end)
local disable_list = menu.list(settings_list, "Disables", {}, "", function() end)

-- i know this is cancer but i hate needing to use multiple files so ¯\_(ツ)_/¯
local vehicleNamesAndCommands = {    ["maxwell asbo"] = "!asbo",    ["bf weevil"] = "!weevil",    ["bf injection"] = "!bfinjection",    ["oppressor mk2"] = "!oppressor2",    ["bf club"] = "!club",    ["weeny issi"] = "!issi",    ["weeny nightmare issi"] = "!issi6",    ["grotti brioso 300 widebody"] = "!brioso3",    ["grotti brioso 300"] = "!brioso2",    ["bollokan prairie"] = "!prairie",    ["karin dilettante"] = "!dilettante",    ["grotti brioso r/a"] = "!brioso",    ["weeny issi classic"] = "!issi3",    ["benefactor panto"] = "!panto",    ["declasse rhapsody"] = "!rhapsody",    ["weeny future shock issi"] = "!issi5",    ["weeny apocalypse issi"] = "!issi4",    ["dinka blista"] = "!blista",    ["dinka blista kanjo"] = "!kanjo",    ["bravado rumpo custom"] = "!rumpo3",    ["bravado bison"] = "!bison",    ["bravado rumpo"] = "!rumpo",    ["bravado paradise"] = "!paradise",    ["vapid bobcat xl"] = "!bobcat3",    ["zirconium journey ii"] = "!journey2",    ["bf surfer"] = "!surfer",    ["bf surfer custom"] = "!surfer3",    ["vapid minivan custom"] = "!minivan3",    ["bravado yoga classic 4x4"] = "!youga3",    ["bravado yoga classic"] = "!youga2",    ["vapid speedo"] = "!speedo",    ["bravado yoga"] = "!youga",    ["vapid speedo custom"] = "!speedo3",    ["declasse gang burrito"] = "!gburrito2",    ["declasse bugstar burrito"] = "!burrito2",    ["brute boxville (ldss)"] = "!boxville3",    ["vapid minivan"] ="!minivan",    ["vapid yoga custom"] = "!youga4",    ["hvy insurgent pick-up custom"] = "!insurgent3",    ["ubermacht rhinehart"] = "!rhinehart",    ["declasse asea"] = "!asea",    ["vulcar ingot"] = "!ingot",    ["albany emperor"] = "!emperor",    ["cheval fugitive"] = "!fugitive",    ["karin intruder"] = "!intruder",    ["declasse impaler sz"] = "!impaler5",    ["lampadati cinquemila"] = "!cinquemila",    ["vapid stanier"] = "!stanier",    ["albany primo custom"] = "!primo2",    ["benefactor schafter lwb (armored)"] = "!schafter6",    ["enus deity"] = "!deity",    ["karin asterope gz"] = "!asterope2",    ["chevall surge"] = "!surge",    ["obey tailgater s"] = "!tailgater2",    ["enus cognoscenti 55"] = "!cog55",    ["dundereary regina"] = "!regina",    ["enus stafford"] = "!stafford",    ["enus cognoscenti (armored)"] = "!cognoscenti2",    ["enus cognoscenti 55 (armored)"] = "!cog552",    ["enus cognoscenti"] = "!cognoscenti",    ["declasse premier"] = "!premier",    ["benefactor schafter v12 (armored)"] = "!schafter5",    ["vulcar warner"] = "!warrener",    ["zirconium stratum"] = "!stratum",    ["vulcar warner hkr"] = "!warrener2",    ["chariot romero hearse"] = "!romero",    ["benefactor glendale custom"] = "!glendale2",    ["benefactor glendale"] = "!glendale",    ["obey tailgater"] = "!tailgater",    ["albany primo"] = "!primo",    ["benefactor schafter"] = "!schafter2",    ["enus super diamond"] = "!superd",    ["albany washington"] = "!washington",    ["karin asterope"] = "!asterope",    ["shitzu defiler"] = "!defiler",    ["western future shock deathbike"] = "!deathbike2",    ["western reever"] = "!reever",    ["maibuatsu manchez scout"] = "!manchez2",    ["western nightmare deathbike"] = "!deathbike3",    ["dinka akuma"] = "!akuma",    ["western gargoyle"] = "!gargoyle",    ["dinka thrust"] = "!thrust",    ["maibuatsu sanchez"] = "!sanchez2",    ["shitzu pcj 600"] = "!pcj",    ["lcc innovation"] = "!innovation",    ["pegassi bati 801"] = "!bati",    ["pegassi vortex"] = "!vortex",    ["western wolfsbane"] = "!wolfsbane",    ["dinka double-t"] = "!double",    ["western daemon"] = "!daemon2",    ["pegassi faggio mod"] = "!faggio3",    ["pegassi bati 801rr"] = "!bati2",    ["pegassi oppressor mk ii"] = "!oppressor2",    ["lcc hexer"] = "!hexer",    ["dinka enduro"] = "!enduro",    ["principe lectro"] = "!lectro",    ["pegassi fcr 1000 custom"] = "!fcr2",    ["western powersurge"] = "!powersurge",    ["pegassi essekey"] = "!esskey",    ["nagasaki stryder"] = "!stryder",    ["pegassi oppressor"] = "!oppressor",    ["western rampant rocket"] = "!rrocket",    ["pegassi faggio"] = "!faggio2",    ["pegassi fcr 1000"] = "!fcr",    ["shitzu hakuchou drag"] = "!hakuchou2",    ["nagasaki carbon rs"] = "!carbonrs",    ["western zombie bobber"] = "!zombiea",    ["shitzu hakuchou"] = "!hakuchou",    ["nagasaki bf400"] = "!bf400",    ["nagasaki shotaro"] = "!shotaro",    ["principe diabolus"] = "!diablous",    ["principe diabolus custom"] = "!diablous2",    ["maibatsu sanchez (livery)"] = "!sanchez",    ["western cliffhanger"] = "!cliffhanger",    ["principe nemesis"] = "!nemesis",    ["western rat bike"] = "!ratbike",    ["western apocalypse deathbike"] = "!deathbike",    ["western bagger"] = "!bagger",    ["pegassi faggio sport"] = "!faggio",    ["maibuatsu manchez"] = "!manchez",    ["dinka vindicator"] = "!vindicator",    ["western zombie chopper"] = "!zombieb",    ["western sovereign"] = "!sovereign",    ["western nightblade"] = "!nightblade",    ["lcc avaru"] = "!avarus",    ["nagasaki shinobi"] = "!shinobi",    ["shitzu vader"] = "!vader",    ["lcc sanctus"] = "!sanctus",    ["pegassi ruffian"] = "!ruffian",    ["nagasaki chimera"] = "!chimera",    ["pegassi zorrusso"] = "!zorrusso",    ["progen itali gtb"] = "!italigtb",    ["vigilante"] = "!vigilante",    ["overflod entity mt"] = "!entity3",    ["ocelot virtue"] = "!virtue",    ["pegassi torero xo"] = "!torero2",    ["pegassi osiris"] = "!osiris",    ["progen tyrus"] = "!tyrus",    ["ocelot penetrator"] = "!penetrator",    ["pegassi tempesta"] = "!tempesta",    ["grotti cheetah"] = "!cheetah",    ["overflod autarch"] = "!autarch",    ["declasse scramjet"] = "!scramjet",    ["lampadati tigon"] = "!tigon",    ["pegassi vacca"] = "!vacca",    ["overflod zeno"] = "!zeno",    ["truffade thrax"] = "!thrax",    ["coil voltic"] = "!voltic",    ["progen t20"] = "!t20",    ["vapid bullet"] = "!bullet",    ["pfister 811"] = "!pfister811",    ["bravado banshee 900r"] = "!banshee2",    ["truffade nero custom"] = "!nero2",    ["pegassi infernus"] = "!infernus",    ["pegassi tezeract"] = "!tezeract",    ["overflod entity xxr"] = "!entity2",    ["principe deveste eight"] = "!deveste",    ["benefactor lm87"] = "!lm87",    ["truffade adder"] = "!adder",    ["vapid fmj"] = "!fmj",    ["overflod tyrant"] = "!tyrant",    ["progen emerus"] = "!emerus",    ["dewbauchee champion"] = "!champion",    ["progen itali gtb custom"] = "!italigtb2",    ["karin sultan rs"] = "!sultanrs",    ["dewbauchee vagner"] = "!vagner",    ["benefactor krieger"] = "!krieger",    ["pegassi reaper"] = "!reaper",    ["grotti turismo omaggio"] = "!turismo3",    ["emperor etr1"] = "!sheava",    ["progen gp1"] = "!gp1",    ["annis s80rr"] = "!s80",    ["ubermacht sc1"] = "!sc1",    ["grotti turismo r"] = "!turismor",    ["truffade nero"] = "!nero",    ["chevall taipan"] = "!taipan",    ["pegassi zentorno"] = "!zentorno",    ["overflod entity xf"] = "!entityxf",    ["grotti furia"] = "!furia",    ["grotti visione"] = "!visione",    ["grotti x80 proto"] = "!prototipo",    ["pegassi ignis"] = "!ignus",    ["coil cyclone"] = "!cyclone",    ["ocelot xa-21"] = "!xa21",    ["annis re-7b"] = "!le7b",    ["pfister astron"] = "!astron",    ["albany cavalcade"] = "!cavalcade2",    ["lampadati novak"] = "!novak",    ["karin beejay xl"] = "!bjxl",    ["mammoth patriot stretch"] = "!patriot2",    ["vapid radius"] = "!radi",    ["benefactor serrano"] = "!serrano",    ["mammoth patriot"] = "!patriot",    ["obey rocoto"] = "!rocoto",    ["declasse granger"] = "!granger",    ["karin vivanite"] = "!vivanite",    ["gallivater baller le"] = "!baller3",    ["enus jubilee"] = "!jubilee",    ["pegassi toros"] = "!toros",    ["dundeary landstalker xl"] = "!landstalker2",    ["bravado dorado"] = "!dorado",    ["canis seminole"] = "!seminole",    ["gallivater baller st"] = "!baller7",    ["fathom fq 2"] = "!fq2",    ["gallivater baller le (armored)"] = "!baller5",    ["gallivater baller le lwb (armored)"] = "!baller6",    ["vapid aleutian"] = "!aleutian",    ["vapid contender"] = "!contender",    ["gallivater baller"] = "!baller2",    ["canis mesa"] = "!mesa3",    ["dundeary landstalker"] = "!landstalker",    ["benefactor dubsta"] = "!dubsta",    ["emperor habanero"] = "!habanero",    ["declasse granger 3600lx"] = "!granger2",    ["gallivater baller le lwb"] = "!baller4",    ["albany cavalcade xl"] = "!cavalcade3",    ["gallivater baller st-d"] = "!baller8",    ["obey i-wagen"] = "!iwagen",    ["mammoth squaddie"] = "!squaddie",    ["ubermacht rebla gts"] = "!rebla",    ["bravado gresley"] = "!gresley",    ["benefactor xls"] = "!xls",    ["benefactor xls (armored)"] = "!xls2",    ["enus huntley s"] = "!huntley",    ["canis seminole frontier"] = "!seminole2",    ["weeny issi rally"] = "!issi8",    ["dewbauchee exemplar"] = "!exemplar",    ["karin previon"] = "!previon",    ["enus cognoscenti cabrio"] = "!cogcabrio",    ["enus windsor drop"] = "!windsor2",    ["ubermacht sentinel"] = "!sentinel2",    ["dinka postlude"] = "!postlude",    ["fathom fr36 drift"] = "!driftfr36",    ["ubermacht zion"] = "!zion",    ["ubermacht oracle"] = "!oracle2",    ["ocelot jackal"] = "!jackal",    ["ubermacht zion cabrio"] = "!zion2",    ["ocelot f620"] = "!f620",    ["ubermacht oracle xs"] = "!oracle",    ["ubermacht sentinel xs"] = "!sentinel",    ["enus windsor"] = "!windsor",    ["dinka kanjo sj"] = "!kanjosj",    ["lampadati felon gt"] = "!felon2",    ["fathom fr36"] = "!fr36",    ["lampadati felon"] = "!felon",    ["dewbauchee rapid gt classic"] = '!rapidgt3',    ["vapid retinue mk ii"] = '!retinue2',    ["ocelot ardent"] = '!ardent',    ["grotti turismo classic"] = '!turismo2',    ["lampadati casco"] = '!casco',    ["benefactor stirling gt"] = '!feltzer3',    ["declasse tornado rat rod"] = '!tornado6',    ["dewbauchee jb 700"] = '!jb700',    ["lampadati michelli gt"] = '!michelli',    ["grotti stinger"] = '!stinger',    ["ocelot stromberg"] = '!stromberg',    ["vapid peyote custom"] = '!peyote3',    ["grotti stinger gt"] = '!stingergt',    ["grotti gt500"] = '!gt500',    ["rune cheburek"] = '!cheburek',    ["karin 190z"] = '!z190',    ["declasse tornado custom"] = '!tornado5',    ["weeny dynasty"] = '!dynasty',    ["truffade z-type"] = '!ztype',    ["albany frankén stange"] = '!btype2',    ["vulcar fagaloa"] = '!fagaloa',    ["pegassi toreador"] = '!toreador',    ["vapid retinue"] = '!retinue',    ["ubermacht zion classic"] = '!zion3',    ["invetero coquette classic"] = '!coquette2',    ["imponde deluxo"] = '!deluxo',    ["albany roosevelt"] = '!btype',    ["declasse mamba"] = '!mamba',    ["lampadati pigalle"] = '!pigalle',    ["grotti cheetah classic"] = '!cheetah2',    ["dewbauchee jb 700w"] = '!jb7002',    ["pegassi infernus classic"] = '!infernus2',    ["declasse tornado"] = '!tornado',    ["albany manana"] = '!manana',    ["pegassi monroe"] = '!monroe',    ["albany roosevelt valor"] = '!btype3',    ["pegassi torero"] = '!torero',    ["annis savestra"] = '!savestra',    ["vapid peyote"] = '!peyote',    ["vulcar nebula turbo"] = '!nebula',    ["lampadati viseris"] = '!viseris',    ["ocelot swinger"] = '!swinger',    ["nagasaki blazer lifeguard"] = "!blazer2",    ["karin rebel"] = "!rebel2",    ["bravado duneloader"] = "!dloader",    ["vapid caracara"] = "!caracara",    ["hvy nightshark"] = "!nightshark",    ["declasse walton l35"] = "!l35",    ["canis kalahari"] = "!kalahari",    ["benefactor dubsta 6x6"] = "!dubsta3",    ["bf dune fav"] = "!dune3",    ["vapid sandking swb"] = "!sandking2",    ["canis freecrawler"] = "!freecrawler",    ["hvy insurgent"] = "!insurgent2",    ["coil brawler"] = "!brawler",    ["declasse draugur"] = "!draugur",    ["declasse future shock brutus"] = "!brutus2",    ["nagasaki hot rod blazer"] = "!blazer3",    ["bf bifta"] = "!bifta",    ["nagasaki street blazer"] = "!blazer4",    ["vapid sandking xl"] = "!sandking",    ["vapid ratel"] = "!ratel",    ["canis kamacho"] = "!kamacho",    ["mammoth patriot mil-spec"] = "!patriot3",    ["declasse apocalypse brutus"] = "!brutus",    ["nagasaki outlaw"] = "!outlaw",    ["dinka verus"] = "!verus",    ["vapid riata"] = "!riata",    ["karin rusty rebel"] = "!rebel",    ["karin everon"] = "!everon",    ["bf dune buggy"] = "!dune",    ["canis bodhi"] = "!bodhi2",    ["vapid desert raid"] = "!trophytruck2",    ["canis terminus"] = "!terminus",    ["declasse nightmare brutus"] = "!brutus3",    ["declasse yosemite rancher"] = "!yosemite3",    ["rune zhaba"] = "!zhaba",    ["karin boor"] = "!boor",    ["hvy menacer"] = "!menacer",    ["vapid trophy truck"] = "!trophytruck",    ["annis hellion"] = "!hellion",    ["vapid wink"] = "!winky",    ["maxwell vagrant"] = "!vagrant",    ["nagasaki blazer"] = "!blazer",    ["declasse rancher xl"] = "!rancherxl",    ["vapid caracara 4x4"] = "!caracara2",    ["maibatsu monstrociti"] = "!monstrociti",    ["karin technical custom"] = "!technical3",    ["imponent nightshade"] = "!nightshade",    ["declasse tulip"] = "!tulip",    ["vapid hustler"] = "!hustler",    ["declasse moonbeam custom"] = "!moonbeam2",    ["bravado rat-truck"] = "!ratloader2",    ["declasse moonbeam"] = "!moonbeam",    ["vapid slamvan custom"] = "!slamvan3",    ["declasse sabre turbo"] = "!sabregt",    ["vapid hotknife"] = "!hotknife",    ["classique broadway"] = "!broadway",    ["declasse yosemite"] = "!yosemite",    ["bravado buffalo stx"] = "!buffalo4",    ["bravado gauntlet"] = "!gauntlet",    ["declasse tulip m-100"] = "!tulip2",    ["imponente phoenix"] = "!phoenix",    ["vapid clique"] = "!clique",    ["vapid dominator gtx"] = "!dominator3",    ["chevall picador"] = "!picador",    ["bf weevil custom"] = "!weevil2",    ["vapid nightmare imperator"] = "!imperator3",    ["invetero coquette blackfin"] = "!coquette3",    ["bravado redwood gauntlet"] = "!gauntlet2",    ["declasse nightmare impaler"] = "!impaler4",    ["albany virgo"] = "!virgo",    ["imponente ruiner"] = "!ruiner",    ["imponente duke o'death"] = "!dukes2",    ["albany lurcher"] = "!lurcher",    ["bravado greenwood"] = "!greenwood",    ["vapid dominator gtt"] = "!dominator8",    ["vapid dominator"] = "!dominator",    ["vapid ellie"] = "!ellie",    ["declasse vamos"] = "!vamos",    ["imponente ruiner zz-8"] = "!ruiner4",    ["albany buccaneer"] = "!buccaneer",    ["declasse vigero zx"] = "!vigero2",    ["vapid pisswasser dominator"] = "!dominator2",    ["dundeary virgo classic"] = "!virgo3",    ["vapid dominator asp"] = "!dominator7",    ["declasse vigero"] = "!vigero",    ["declasse weaponized tampa"] = "!tampa3",    ["imponente beater dukes"] = "!dukes3",    ["albany buccaneer custom"] = "!buccaneer2",    ["bravado gauntlet hellfire"] = "!gauntlet4",    ["imponente dukes"] = "!dukes",    ["vapid apocalypse imperator"] = "!imperator",    ["vapid future shock dominator"] = "!dominator5",    ["rat-loader"] = "!ratloader",    ["schyster deviant"] = "!deviant",    ["albany hermes"] = "!hermes",    ["vapid nightmare dominator"] = "!dominator6",    ["vapid future shock imperator"] = "!imperator2",    ["vapid dominator gt"] = "!dominator9",    ["declasse voodoo"] = "!voodoo2",    ["declasse future shock impaler"] = "!impaler3",    ["willard faction custom donk"] = "!faction3",    ["vapid clique wagon"] = "!clique2",    ["bravado gauntlet classic custom"] = "!gauntlet5",    ["vapid nightmare slamvan"] = "!slamvan6",    ["declasse voodoo custom"] = "!voodoo",    ["albany brigham"] = "!brigham",    ["vapid apocalypse dominator"] = "!dominator4",    ["bravado gauntlet classic"] = "!gauntlet3",    ["vapid chino custom"] = "!chino2",    ["vapid slamvan"] = "!slamvan",    ["vapid lost slamvan"] = "!slamvan2",    ["willard faction"] = "!faction",    ["vapid chino"] = "!chino",    ["vapid future shock slamvan"] = "!slamvan5",    ["declasse burger shot stallion"] = "!stalion2",    ["declasse drift yosemite drift"] = "!driftyosemite",    ["willard faction custom"] = "!faction2",    ["bravado buffalo evx"] = "!buffalo5",    ["declasse tampa"] = "!tampa",    ["vapid blade"] = "!blade",    ["willard eudora"] = "!eudora",    ["declasse impaler lx"] = "!impaler6",    ["albany manana custom"] = "!manana2",    ["vapid apocalypse slamvan"] = "!slamvan4",    ["declasse tahoma coupe"] = "!tahoma",    ["declasse apocalypse impaler"] = "!impaler2",    ["declasse sabre turbo custom"] = "!sabregt2",    ["declasse drift yosemite"] = "!yosemite2",    ["dundeary virgo classic custom"] = "!virgo2",    ["declasse vigero zx convertible"] = "!vigero3",    ["declasse stallion"] = "!stalion",    ["declasse impaler"] = "!impaler",    ["vapid peyote gasser"] = "!peyote2",    ["annis zr350 drift"] = "!driftzr350",    ["karin sultan"] = "!sultan",    ["obey 8f drafter"] = "!drafter",    ["benefactor schwarzer"] = "!schwarzer",    ["pfister comet"] = "!comet2",    ["dinka jester rr"] = "!jester4",    ["dinka jester"] = "!jester",    ["karin futo"] = "!futo",    ["bravado hotring hellfire"] = "!gauntlet6",    ["karin kuruma (armored)"] = "!kuruma2",    ["grotti itali gts stinger tt"] = "!stingertt",    ["dinka go go monkey blista"] = "!blista3",    ["invetero coquette d10"] = "!coquette4",    ["ocelot locust"] = "!locust",    ["annis nightmare zr380"] = "!zr3803",    ["albany alpha"] = "!alpha",    ["grotti bestia gts"] = "!bestiagts",    ["obey 10f widebody"] = "!tenf2",    ["hijak khameleon"] = "!khamelion",    ["bravado banshee"] = "!banshee",    ["annis elegy retro custom"] = "!elegy",    ["dinka blista compact"] = "!blista2",    ["dewbauchee specter"] = "!specter",    ["invetero coquette"] = "!coquette",    ["penaud la coureuse"] = "!coureur",    ["dewbauchee specter custom"] = "!specter2",    ["pfister growler"] = "!growler",    ["benefactor streicher"] = "!streiter",    ["bf raptor"] = "!raptor",    ["annis remus drift"] = "!driftremus",    ["obey omnis"] = "!omnis",    ["overflod imorgon"] = "!imorgon",    ["lampadati corsita"] = "!corsita",    ["annis euros drift"] = "!drifteuros",    ["karin calico gtf"] = "!calico",    ["ocelot jugular"] = "!jugular",    ["karin sultan rs classic"] = "!sultan3",    ["jester rr"] = "!driftjester",    ["dinka jester classic"] = "!jester3",    ["hijak ruston"] = "!ruston",    ["maibatsu penumbra ff"] = "!penumbra2",    ["grotti itali rsx"] = "!italirsx",    ["obey omnis e-gt"] = "!omnisegt",    ["karin futo gtx"] = "!futo2",    ["obey 9f cabrio"] = "!ninef2",    ["benefactor sm722"] = "!sm722",    ["ubermacht revolter"] = "!revolter",    ["ocelot lynx"] = "!lynx",    ["benefactor feltzer"] = "!feltzer2",    ["vapid flash gt"] = "!flashgt",    ["benefactor schafter v12"] = "!schafter3",    ["annis future shock zr380"] = "!zr3802",    ["lampadati tropos rallye"] = "!tropos",    ["karin kuruma"] = "!kuruma",    ["benefactor schlagen gt"] = "!schlagen",    ["ubermacht sentinel classic widebody"] = "!sentinel4",    ["annis 300r"] = "!r300",    ["ubermacht cypher"] = "!cypher",    ["karin hotring everon"] = "!everon2",    ["ocelot pariah"] = "!pariah",    ["bravado sprunk buffalo"] = "!buffalo3",    ["dewbauchee rapid gt"] = "!rapidgt",    ["declasse drift tampa"] = "!tampa2",    ["lampadati furore gt"] = "!furoregt",    ["coil raiden"] = "!raiden",    ["dewbauchee massacro (racecar)"] = "!massacro2",    ["dewbauchee massacro"] = "!massacro",    ["grotti itali gto"] = "!italigto",    ["benefactor surano"] = "!surano",    ["annis remus"] = "!remus",    ["annis zr350"] = "!zr350",    ["pfister comet retro custom"] = "!comet3",    ["ubermacht sentinel classic"] = "!sentinel3",    ["obey 10f"] = "!tenf",    ["pfister comet sr"] = "!comet5",    ["declasse drift tampa drift"] = "!drifttampa",    ["dewbauchee seven-70"] = "!seven70",    ["bravado verlierer"] = "!verlierer2",    ["albany v-str"] = "!vstr",    ["emperor vectre"] = "!vectre",    ["annis elegy rh8"] = "!elegy2",    ["lampadati komoda"] = "!komoda",    ["grotti carbonizzare"] = "!carbonizzare",    ["dinka rt3000"] = "!rt3000",    ["dinka veto classic"] = "!veto",    ["maibatsu penumbra"] = "!penumbra",    ["karin sultan classic"] = "!sultan2",    ["benefactor schafter lwb"] = "!schafter4",    ["declasse hotring sabre"] = "!hotring",    ["bravado buffalo"] = "!buffalo",    ["schyster fusilade"] = "!fusilade",    ["annis euros"] = "!euros",    ["obey 9f"] = "!ninef",    ["vapid gb200"] = "!gb200",    ["enus paragon r"] = "!paragon",    ["dinka jester (racecar)"] = "!jester2",    ["weeny issi sport"] = "!issi7",    ["bravado buffalo s"] = "!buffalo2",    ["dinka sugoi"] = "!sugoi",    ["toundra panthere"] = "!panthere",    ["pfister neon"] = "!neon",    ["pfister comet s2 cabrio"] = "!comet7",    ["enus paragon r (armored)"] = "!paragon2",    ["vysser neo"] = "!neo",    ["pfister comet s2"] = "!comet6",    ["annis apocalypse zr380"] = "!zr380",    ["pfister comet safari"] = "!comet4",    ["karin futo gxt"] = "!driftfuto",    ["dinka veto modern"] = "!veto2",    ["benefactor br8"] = "!openwheel1",    ["progen pr4"] = "!formula",    ["classe dr1"] = "!openwheel2",    ["ocelot r88"] = "!formula2",    ["mtl dune"] = "!rallytruck",    ["vapid guardian"] = "!guardian",    ["vapid slamtruck"] = "!slamtruck",    ["vapid sadler"] = "!sadler",    ["vapid stanier le cruiser"] = "!police5",    ["classe lifeguard"] = "!lguard",    ["vapid unmarked cruiser"] = "!police4",    ["bravado gauntlet interceptor"] = "!polgauntlet",    ["bravado half-track"] = "!halftrack",    ["hvy apc"] = "!apc",    ["hvy apocalypse scarab"] = "!scarab",    ["hvy future shock scarab"] = "!scarab2",    ["hvy nightmare scarab"] = "!scarab3"  }

local message_method = 1
settings_list:list_select("Message Method", {"messagemethod"}, "Cycle between different methods of saying stuff in chat. Try using a different one if people cant read your messages", {
    "chat.send_message()", "say", "sendpm"
}, 1, function(index, name)
    message_method = index
    if message_method == 1 then
        util.toast("Message method set to: chat.send_message()")
    end
    if message_method == 2 then
        util.toast("Message method set to: say")
    end
    if message_method == 3 then
        util.toast("Message method set to: sendpm")
    end
end)

menu.toggle(menu.my_root(), "Auto Chat", { "helpgifting" }, "Enables a message to give help on gifting cars. It gets triggered by reading gift in chat.", function(on)
    automsg = on
end)

menu.toggle(disable_list, "Disable ModelNameAssistant", { "modelnameassistant" }, "Disables a message to give help on how to spawn cars based on the full car name.", function(on)
    modelnameassistance = on
end)

menu.toggle(disable_list, "Disable message introduction", { "intromessage" }, "Disables a message introducting the guide.", function(cancer)
    intromsg = cancer
end)

menu.toggle(disable_list, "Disable message model names", { "modelmessage" }, "Disables a message telling people to use model names instead of full car names.", function(aids)
    modelmsg = aids
end)

local intromessage = "> Guide on gifting cars:"
menu.text_input(customize_list, "Change Intro Message", { "ChangeIntro" }, "", function(fuck)
    intromessage = "> " .. fuck
end)

local guidemessage = "> 0: Fill up a garage completely (free cars, street cars, be creative). 1: Go to garage, drive any car outside and back inside. 2: Walk outside. 3: Spawn car with !carmodelname e.g. '!t20'. 4: Get in car and '!gift username'. 5: Drive car in garage."
menu.text_input(customize_list, "Change Guide Message", { "ChangeGuide" }, "", function(fuck2)
    guidemessage = "> " .. fuck2
end)

local modelmessage = "> If you dont know how to spawn in a specific car due not knowing the model name, type in 'modelname', followed by the full car name including brand e.g. 'modelname progen t20'. This should auto suggest the model."
menu.text_input(customize_list, "Change Model Message", { "ChangeModel" }, "", function(fuck3)
    modelmessage = "> " .. fuck3
end)

local triggerword = "gift"
menu.text_input(customize_list, "Change Chat Triggerword", { "ChangeTrigger" }, "Change the word that triggers the message. Default is one is gift", function(fuck4)
    triggerword = fuck4
end)

local chatdelay = 200
customize_list:slider("Change Chat Delay", {"chatdelay"}, "Change the delay between the messages in ms", 0, 1000, chatdelay, 5, function(kys)
    chatdelay = kys
end)

-- If you are wondering about the yields, i added them cuz ive noticed my messages not always being able to be read so thats why.
chat.on_message(function(pid, unused, content, tc)
    local lowerContent = content:lower()
    if automsg then
        if lowerContent:find(triggerword) then
            if not lowerContent:find("> ") and not lowerContent:find("!") and not lowerContent:find("*") then
                util.yield(chatdelay)
                if not intromsg then
                    if message_method == 1 then
                        chat.send_message(intromessage, tc, true, true)
                    end
                    if message_method == 2 then
                        menu.trigger_commands("say " .. intromessage)
                    end
                    if message_method == 3 then
                        menu.trigger_commands("sendpm ".. players.get_name(pid).. " " .. intromessage)
                    end
                end
                util.yield(chatdelay)
                if message_method == 1 then
                    chat.send_message(guidemessage, tc, true, true)
                end
                if message_method == 2 then
                    menu.trigger_commands("say " .. guidemessage)
                end
                if message_method == 3 then
                    menu.trigger_commands("sendpm ".. players.get_name(pid).. " " .. guidemessage)
                end
                util.yield(chatdelay)
                if not modelmsg then
                    if message_method == 1 then
                        chat.send_message(modelmessage, tc, true, true)
                    end
                    if message_method == 2 then
                        menu.trigger_commands("say " .. modelmessage)
                    end
                    if message_method == 3 then
                        menu.trigger_commands("sendpm ".. players.get_name(pid).. " " .. modelmessage)
                    end
                end
                util.yield(chatdelay)
            end
        end
    end
    if not modelnameassistance then
        for vehicleName, spawnCommand in pairs(vehicleNamesAndCommands) do
            if lowerContent:find("modelname " .. vehicleName) and not lowerContent:find(">") and not lowerContent:find("*") then
                if message_method == 1 then
                    chat.send_message("> If you are trying to spawn the '" .. vehicleName .. "', try use '" .. spawnCommand.."'", tc, true, true)
                end
                if message_method == 2 then
                    menu.trigger_commands("say > If you are trying to spawn the '" .. vehicleName .. "', try use '" .. spawnCommand.."'")
                end
                if message_method == 3 then
                    menu.trigger_commands("sendpm ".. players.get_name(pid) .. " If you are trying to spawn the '" .. vehicleName .. "', try use '" .. spawnCommand.."'")
                end
            end
        end
    end
end)

menu.action(menu.my_root(), "Manually push message", {"how2gift"}, "Put guide in chat", function()
    if not intromsg then
        if message_method == 1 then
            chat.send_message(intromessage, tc, true, true)
        end
        if message_method == 2 then
            menu.trigger_commands("say " .. intromessage)
        end
        if message_method == 3 then
            util.toast("Cant broadcast with message method PM. Will use 'say' instead")
            menu.trigger_commands("say " .. intromessage)
        end
    end
    util.yield(chatdelay)
    if message_method == 1 then
        chat.send_message(guidemessage, tc, true, true)
    end
    if message_method == 2 then
        menu.trigger_commands("say " .. guidemessage)
    end
    if message_method == 3 then
        menu.trigger_commands("say " .. guidemessage)
    end
    util.yield(chatdelay)
    if not modelmsg then
        if message_method == 1 then
            chat.send_message(modelmessage, tc, true, true)
        end
        if message_method == 2 then
            menu.trigger_commands("say " .. modelmessage)
        end
        if message_method == 3 then
            menu.trigger_commands("say " .. modelmessage)
        end
    end
    util.yield(chatdelay)
end)

util.keep_running()
