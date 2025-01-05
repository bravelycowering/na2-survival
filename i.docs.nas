// Welcome to the documentation for /script and /oss.
// This file was generated from script source code on 2025-01-01

// Below you will find the following sections:
//     Action section
//     If Statement section
//     Preset packages section
//     Special Labels section
//     Click Label section
//     Important Notes section
//     Top Level Statements section
//     Staff (non OS) section


// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|
//     Welcome to the Action section.
// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|


// msg [message]
//     sends a message to the player.
//     Use @p to substitute the player's name (includes the +)
//     Use @nick to subtitute for a more natural version of player's name (e.g. Mike_30+ becomes Mike)
//     Use @color to substitute for the player's currently set color code

// cpemsg [cpe message field] <message>
//     same as msg, but allows you to send to the other special chat fields in top right, bottom right, or center.
//     valid cpe message fields are: top1, top2, top3, bot1, bot2, bot3, announce, bigannounce, smallannounce
//     However, unlike msg, these are limited to 64 characters at most. Remember, color codes count as 2 characters!
//     The "announce" fields automatically disappear after 5 seconds.",
//     The rest stay forever unless you reset them by sending a completely blank message (or the player leaves the map).
//     Blank example: "cpemsg bot3"

// menumsg [cpe message field] <message>
//     same as cpemsg for announcements, but stays on the screen instead of disappearing after 5 seconds.
//     valid cpe message fields are: announce, bigannounce, smallannounce

// delay [number or package]
//     Makes the script pause for the amount of milliseconds specified.

// jump [#label]
//     Makes the script go to the specified label and keep running from there.

// goto [#label]
//     This is the same as jump, but with a big exception:
//     If you use "goto" in a label that you called with the "call" Action, then the script will not come back to run what was after the call.
//     In other words, this performs a jump and clears the call stack

// call [#label]
//     Like jump, but once it reaches a "quit" in the [#label] called, instead of quitting, it will come back and run what comes after the call.
//     This is useful because it lets you repeat a set of actions many times without copy pasting the actions all over the place.

// quit 
//     Typically this tells the script to stop running.
//     If we are in a label ran with the "call" Action, this causes the script to return to where it was called from.
//     Be careful not to forget this. Without a "quit", the script will keep running and do actions from other labels below.

// terminate 
//     This tells the script to stop running completely, even if we are in a nested label that was called from somewhere else using "call"

// newthread [#label]
//     Like call, but allows the script to continue running without taking into account any of the delays in the label you called.
//     This action may take a little bit of time to start up. If you want to make sure it always occurs BEFORE the actions you put next,
//     you should add a little bit of delay (around 500 perhaps) after doing a newthread action.

// cmd [command] <command arguments>
//     Runs the given command with the given arguments.
//     You can use @p and @nick to substitute player names just like in msg.

// set [package] [value]
//     Sets the [value] of [package]. If you want to set the value of a package to the value of another package, you have to unwrap it in the value argument with { }.
//     For example:
          set maxHealth 10
          set myHealth {maxHealth}
//     This results in myHealth with a value of "10".
//     If you fail to unwrap maxHealth you would be left with a text value of "maxHealth" for myHealth, which is definitely not what you want in this case.

// setadd [package] [number or package]
//     Adds the second argument to the first argument.
//     For example:
          set healthPotionBoost 5
          set maxHealth 10
          set myHealth {maxHealth}
          setadd myHealth healthPotionBoost
//     This results in myHealth with a value of "15".
//     Or use a literal number:
          setadd myHealth 3
//     This results in myHealth with a value of "13" (assuming it was 10 to begin with).

// setsub [package] [number or package]
//     Same as setadd, but subtracts.

// setmul [package] [number or package]
//     Same as setadd, but multiplies.

// setdiv [package] [number or package]
//     Same as setadd, but divides.

// setmod [package] [number or package]
//     Sets the first argument to the remainder of an integer division between the first argument and the second argument.
//     This is the equivalent of "firstArg = firstArg % secondArg;" in c-like languages.

// setpow [package] [number or package]
//     Performs a math "power of" operation on [package] and sets that as its new value.
//     For instance, with 3 as the second arg, you can calculate the 3D volume of a number.

// setsin [package] [number or package]
//     Calculates sine of [number or package] and inserts it into [package]

// setcos [package] [number or package]
//     Calculates cosine of [number or package] and inserts it into [package]

// settan [package] [number or package]
//     Calculates the tangent of [number or package] and inserts it into [package].
//     The specified angle will be treated as radians.

// setsqrt [package] [number or package]
//     Calculates the square root of [number or package] and inserts it into [package].

// setrandrange [package] [number or package] [number or package]
//     Sets the first argument to a random integer that is within the range of the second and third args.
//     For example:
          setrandrange attackDamage 1 5
//     attackDamage can have the value of 1, 2, 3, 4, or 5, randomly chosen.

// setrandrangedecimal [package] [number or package] [number or package]
//     Sets the first argument to a random number that is within the range of the second and third args.
//     This is identical to setrandrange, except this time the range can truly result in any number, and will most often be something fractional with a decimal place.
//     For example:
          setrandrangedecimal attackDamage 1 5
//     attackDamage could have a value of 0.306, 2.4553, 4.853, etc.

// setrandlist [package] [value1]|[value2]|[value3] etc...
//     Sets the first argument to one of the given values that are separated by the | symbol.
//     For example:
          setrandlist myWarriorName Zog the Destroyer|Kron the Cunning|Dunidas of Kas
//     myWarriorName could be "Zog the Destroyer", "Kron the Cunning", or "Dunidas of Kas", chosen randomly.
//     Note that if you want to use a package as one or more of the values you must unwrap it, just like the set action.

// setround [package]
//     Rounds the value of the package to the nearest integer.
//     For example, 1.2 rounds to 1 and 1.6 rounds to 2. If the number ends with .5, it will round up.

// setroundup [package]
//     Rounds the value of the package up to the next integer. For example, 1.1 becomes 2.

// setrounddown [package]
//     Rounds the value of the package down to the next integer. For example, 1.9 becomes 1.

// setfromhexcolor [package] [hexColor]
//     Converts [hexColor] into integer red, green, and blue components such that:
          setfromhexcolor myColor FF00FF
//     gives you the color structure:
//         myColor[0] = 255
//         myColor[1] = 0
//         myColor[2] = 255
//         myColor.Length = 3
//     Indices 0 1 2 correspond to Red Green and Blue respectively.

// settohexcolor [package] [colorStructure]
//     Calculates the hex code based on the given [colorStructure] and inserts it into [package].
//     [colorStructure] represents a group of packages that are unified with a given prefix.
//     For example, if you run
          settohexcolor hexCode myColor
//     Then it is expected that you have 3 different packages like:
//         myColor[0] = 255
//         myColor[1] = 0
//         myColor[2] = 250.3
//     Indices 0 1 2 correspond to Red Green and Blue respectively.
//     hexCode will be set to FF00FA

// show [package] <another package> <another package> etc...
//     Displays the value of all the packages given, for testing and debug purposes.
//     All but the first argument is optional.
// show every single package
//     Displays every single non-saved package

// kill <message>
//     Kills the player with an optional public death message.
//     The <message> is shown to everyone who is playing on the map.
//     Because of this, it's highly recommended to not use the <message> argument, and instead use msg to tell the player directly why they died.

// resetdata [type] <pattern>
//     Used to reset data.
//     [type] can be
//         "packages" - resets packages
//         "items" - resets items
//         "saved" - resets saved packages related to the current script (staff only)
//     <pattern> is an optional search pattern that only resets matching names. If not specified, everything is reset.
//         Use the special characters * and ? to specify the search pattern.
//         * is a substitute for 0 or more characters, and ? is a substitute for 1 character.
//         For example:
              resetdata packages oldman_*
//             This resets all packages that have a name that starts with the word "oldman_"
              resetdata packages *_oldman
//             This resets all packages that have a name that ends with the word "_oldman"
//         If you do not use either * or ?, it will reset all packages which contain the pattern you specify.
//         For example:
              resetdata packages old
//             This resets all packages which have "old" anywhere in the name.
//             Note: this is actually identical to
              resetdata packages *old*

// item [get/take] [ITEM_NAME]
//     Gives an item to the player or takes an item from the player.
//     You must use underscores instead of spaces for the item name, especially when checking if the player has an item (see "Conditions" further down).
//     This is silent if you "get" an item when the player already has said item, and silent if you "take" an item when the player doesn't have said item.

// freeze 
//     Freezes the player in place. They can still fall if mid-air or swim up and down in liquid or ladders, though.

// unfreeze 
//     Unfreezes the player.

// look [block coordinates]
//     Makes the player look at the given coordinates. They can move their camera afterwards.

// stare <block coordinates>
//     Forces the player to continually stare at the given coordinates. You can free their camera by not providing any coordinates to this action.

// env [property] [value]
//     Temporarily changes env values for the player who runs the script.
//     Valid properties are currently:
//         sky [hex color]
//         cloud [hex color]
//         cloudspeed [speed]
//         cloudheight [height]
//         fog [hex color]
//         shadow [hex color]
//         sun [hex color]
//         skybox [hex color]
//         lavalight [hex color]
//         lamplight [hex color]
//         weather [sun/rain/snow]
//         maxfog [distance in blocks]
//         expfog [on/off]

// motd [motd arguments]
//     Sends an MOTD to the player to control hacks using hacks flags.
//     To see a list of flags you can use, type /help map motd
//     2021/12/11: jumpheight works too now
// motd ignore
//     Resets to the default MOTD of the map.

// setspawn [block coords]
//     Sets the spawn of the player to the coordinates provided.
//     Decimal values are supported.

// setdeathspawn [block coords]
//     Changes where the player will spawn after dying.

// allowmbrepeat 
//     Allows the next walk-through MB to be triggered, even if it's the same as the previously touched MB.

// reply [option number]|[text shown to player]|[#label to call if chosen]
//     Sets up a reply option, which can be chosen by the player by typing [option number] in chat
//     For example:
          reply 1|You: Sure thing.|#replyYes
          reply 2|You: No thanks.|#replyNo
          reply 3|You: Can you elaborate?|#replyElaborate
//     After these actions happen, saying "1" will call #replyYes, and so on.
//     The maximum amount of replies you can setup at once is 6.
//     !!! However !!!, it is recommended not to use 4, 5, 6, because they appear at the top of the screen where they are hard to find and read
//     (especially if the sky is bright).
//     Hot tip: use the freeze action if you want to force the player to choose before moving on.
// reply clear
//     Clears all current replies from being visible and useable (this includes silent replies)

// replysilent 
//     Identical to reply, with two exceptions:
//         Does not notify the player that they should choose a response
//         Does not remind the player to choose a response if they chat while silent replies are active.
// replysilent clear
//     Clears all current replies from being visible and useable (this includes non-silent replies)

// tempblock [args]
//     Shortcut for "cmd tempblock [args]". See /help tempblock for more info.
//     Has faster performance than calling the command with the cmd Action.

// tempchunk [args]
//     Shortcut for "cmd tempchunk [args]". See /help tempchunk for more info.
//     Has faster performance than calling the command with the cmd Action.

// boost [args]
//     Shortcut for "cmd boost [args]". See /help boost for more info.
//     Has faster performance than calling the command with the cmd Action.

// effect [args]
//     Shortcut for "cmd effect [args]". See /help effect for more info.
//     Has faster performance than calling the command with the cmd Action.

// reach [distance]
//     Temporarily sets the player's reach distance, in blocks.
//     A change in MOTD will reset this. For example, switching maps, switching zones, being frozen or unfrozen.

// setblockid [package] [block coordinates]
//     Sets the value of [package] to the ID of the block at the given [block coordinates]
//     IMPORTANT: this action does *not* see blocks that have been changed with tempblock or tempchunk!
//     It only gets the ID of the block that was there in the original map.
//     The ID of the block retrieved is the same as the ID of the block *clientside*, meaning something like hot_lava will be read as "11" from setblockid.

// definehotkey [input args]|[key name]|<list of space separated modifiers>
//     This feature allows the player to run the #input label by pressing a key.
//     [input args] will be sent as an automatic command /input [input args]
//     [key name] must match a key name from the LWJGL keycode specification.
//     You can find the names here: https://notawesome.cc/docs/nas/keycodes.txt
//     <list of space separated modifiers> is optional and can be any combination of "ctrl" "shift" "alt" and "async"
//     async is a unique modifier that doesn't change what keys must be pressed, but allows the input to run repeatedly before the previous input is finished.
//     async will call the label #inputAsync instead of the label #input.
//     For example:
          definehotkey lose|L
//         If the player presses the L key, the script will run #input with runArg1 as "lose"
          definehotkey superjump wow|EQUALS|ctrl shift
//         If the player presses the equals key while holding ctrl and shift, the script will run #input with runArg1 as "superjump" and runArg2 as "wow"
//     See "special labels section" for more information on how the special label #input works.
//     IMPORTANT: for technical reasons, underscore will always be converted to space in the hotkey args,
//                so you cannot rely on checking for underscores in the runArgs it sends to #input because they will be spaces.

// undefinehotkey [key name]|<list of space separated modifiers> 
//     This Action compliments definehotkey by allowing you to remove hotkeys.
//     Note that you must include matching modifiers to undefine a hotkey that has those modifiers.
//     For example:
//         undefinehotkey L
//         undefinehotkey L|shift
//         If you have L and L with shift defined, you must also undefine L and L with shift to remove everything from the L key.
//     As a final note, all defined hotkeys are removed when the player switches maps, so undefining is not required if you want them to stay for the duration of the map.

// placeblock [block] [block coordinates]
//     Used to place blocks in the map.
//     Unlike tempblock, these are permanently placed just like editing the map for real, so caution should be taken when using this Action.
//     ANYONE who runs the script in your map can potentially place blocks if the script runs this Action.

// changemodel <model>
//     This Action allows you to temporarily change what model people have for the current world.
//     Run this Action with no arguments to set the player's model back to what it was before.
//     This Action only works if the MOTD of the level has one or more models forced with model=[something]

// award [award]
//     Gives the player [award]

// setsplit [package] <splitter>
//     Copies the contents of [package], then splits them up into a new set of packages such that
          set myPackage Hey
          setsplit myPackage
//     gives you:
//         myPackage[0] = H
//         myPackage[1] = e
//         myPackage[2] = y
//         myPackage.Length = 3
//     <splitter> is optional and determines what character(s) the package is split up by. You can use quotes to specify a space.
//     For example:
          set mySentence Good morning!
          setsplit mySentence " "
//     gives you:
//         mySentence[0] = Good
//         mySentence[1] = morning!
//         mySentence.Length = 2

// setlength [package] <splitter>
//     Like setsplit, but just inserts the resulting length into [package].Length
//     This is useful if you want to get the length of a string without wasting the memory
//     and performance incurred by setsplit

// setdirvector [xPackage] [yPackage] [zPackage] [yaw number or package] [pitch number or package]
//     Sets the value of x y and z packges to a 3D direction vector based on yaw and pitch in degrees.
//     You can use this to get a direction (e.g. for /boost) based on where the player is looking if you use playerYaw and playerPitch packages as yaw and pitch.

// clickevent [async or sync] register [#label]
//     Registers a label that will be called whenever the player clicks.
//     async means the label can be ran again before the previous event is finished running.
//     You can use a different label for both async or sync and they will both be called.
//     Only works when map buildable and deletable are OFF.
//     To get information about the player click, see the Click Label section.
// clickevent [async or sync] unregister
//     Unregisteres the previously registered [label] for async or sync.

// chatevent sync register [#cancelLogic] [#onChat] [phrase]|<phrase2>|<etc>
//     This Action is not allowed in os scripts.
//     Registers two labels that will be called whenever the player chats.
//     [#cancelLogic] is used to determine if the chat message should be cancelled by setting "cancelchat" package to true.
//     [#cancelLogic] must contain no delays, otherwise the player will experience server lag.
//     [#onChat] will be called directly after [#cancelLogic] and may contain delay without issues.
//     [phrase] is the target phrase that the chat message will be compared to.
//     At minimum, two runArgs are passed to [#cancelLogic].
//     runArg1 is the chat message;
//     runArg2 and onward is a number between 0 and 1 that shows how closely the chat message caselessly equals the [phrase].
//     For example, passing phrases foo|bar will give runArg2 for how much the message matches foo and runArg3 for matches bar.
// chatevent sync unregister
//     Unregisters the previously registered chat event.

// error [message]
//     Force the script to error with [message] as the reason.
//     This is intended to be called if data or args haven't been setup correctly
//     or if something happening was meant to be impossible.
//     This is more useful than a simple msg because errors provide trace information that
//     can help you debug where the issue came from.
//     Note that this will also terminate the script.

// gui [option] [value]
//     Change properties of the player's gui to achieve cinematic effects.
//     Valid properties are:
//        crosshair [true/false]
//        hand [true/false]
//        hotbar [true/false]
//        barSize [decimal from 0 to 1]
//        barColor [hex color] <alpha>
//    Bar size works like widescreen or cutscene bars. You can use 1 to completely cover the screen.
//    <alpha> for bar color is an optional value from 0 to 1 that determines bar transparency.
//    0 means completely transparent and 1 means solid.
// gui reset
//     Resets the player's gui to default.




// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|
//     Welcome to the If Statement section.
// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|


// if [package] [Action]
//     The [Action] will only be performed if [package] has a value of "true".

// if [package]|=|[package to compare to] [Action]
//     The [Action] will only be performed if [package] has the same value as [package to compare to].
//     Note the usage of the pipe symbol | to separate the arguments.
//     This comparison is not case sensitive.
//     For example:
          set password fittelsnof
          if runArg2|=|password msg Drow: Okay, you can enter.
//     You can surround [package to compare to] with quotes to compare to a literal value instead of a package.
//     However, be aware that spaces cannot be used.
//     For example:
          if runArg1|=|"keypad" msg You check the keypad...
//     The advantage of using a literal is you don't have to setup a package to compare to.

// if [package]|[operator]|[number or package] [Action]
//     The [Action] will only be performed if the statement is true.
//     Valid operators are =, >, >=, <, <=
//     For example:
          if myGemCount|<|bowGemPrice msg Sorry, you don't have enough gems to afford this bow.
          if myGemCount|>=|2 msg Prospector: Well I'll be; you did manage to find more than one...!

// if item [ITEM_NAME] [Action]
//     The [Action] will only be performed if the player has the given item.

// if label [#label] [Action]
//     The [Action] will only be performed if the [#label] exists in the script.
//     For convenience's sake, runArgs passed along with [#label] are ignored when checking.

// For any of the above, "if" can be substituted for "ifnot" to reverse the logic.
//     For example:
          ifnot recognized msg Shady dude: I don't know you.



// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|
//     Welcome to the Preset packages section.
// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|


// The space-separated x y z coordinates of the message block that the script is ran from.
//     MBCoords
// The x y and z coordinates of the message block that the script ran from.
//     MBX
//     MBY
//     MBZ
// The space-separated block coordinates of the player.
//     PlayerCoords
// The x y and z block coordinates of the player.
//     PlayerX
//     PlayerY
//     PlayerZ
// The space-separated precise block coordinates of the player (32 per-block, for /tp -precise).
//     PlayerCoordsPrecise
// The precise x y and z coordinates of the player (32 per-block, for /tp -precise).
//     PlayerPX
//     PlayerPY
//     PlayerPZ
// The space-separated block coordinates of the player (decimal numbers, like used in /tempbot add).
//     PlayerCoordsDecimal
// The player's camera yaw (left and right) in degrees.
//     PlayerYaw
// The player's camera pitch (up and down) in degrees.
//     PlayerPitch
// The name of the pronouns the player selected with /pronouns (default, they/them, etc).
//     PlayerPronouns
// A number used for the delay Action that is automatically scaled based on how many characters the previous msg Action had.
//     msgDelay
// The number of milliseconds that have passed since 1970-01-01
//     epochMS
// Has a value of "true" if the player has cef installed (https://github.com/SpiralP/classicube-cef-loader-plugin)
//     cef
// Has a value of "true" if the player is playing on the web client.
//     webclient
// Has a value of "true" if the player is playing on a mobile device.
//     mobile
// The integer number of how many actions have ran so far (not counting the action this value is retrieved in).
//     actionCount
// The integer number of how many actions this script can run before it automatically terminates.
//     actionLimit
// The arguments that are passed along with the #label when the script is run.
//     runArg[number]
// The 0th runArg is always the name of the label the script started from.
// The following runArgs are optional and will be given the value of the extra arguments you pass along with a label.
//     For example: /oss #entryDenied|The_Club|you're_not_cool.
          #entryDenied
              msg You can't enter {runArg1} because {runArg2}
              kill
              // result: The player is murdered and recieves the message "You can't enter The Club because you're not cool."
          quit
// This is extremely useful if you want to have reuseable macros that perform some set of actions many times but with only slightly different details
// (like a name or number difference).
// If you use a runArg that has not been specified, it will have no value or count as 0 if used as a number.
//     For example, running the above script but with just "/oss #entryDenied" would result in "You can't enter  because  "
// As a final note, you can change runArgs when you specify labels with goto, jump, call, newthread, and reply actions.
//     For example:
          #clubEntrance
              msg You approach the bouncer...
              delay 2000
              ifnot item SUNGLASSES jump #entryDenied|The_Club|you're_not_cool.
              
              msg You're always welcome here, cool cat.
          quit



// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|
//     Welcome to the Special Labels section.
// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|


// #input
//     If it exists, this label will be called every time the player does the command /input.
//     The arguments the player give to /input will be passed to the packages runArg1 and runArg2. runArg1 is always the very first word, and runArg2 contains all of the rest of the words.
//     For example, "/input password king of kings" will result in:
//     runArg1 = password
//     runArg2 = king of kings
//     This label is also called by hotkeys defined with the definehotkey Action.
//     As a side note, as usual with runArgs, underscores cannot be used because they are automatically converted to spaces.

// #accessControl
//     This only works for staff scripts.
//     Before the player joins a map, the server checks if a script matching the map name exists.
//     If that script exists and has the label #accessControl, that label will be ran.
//     If the package "denyAccess" is set to "true" when the script quits, then the player will be denied access to the map.
//     It's important to note that this runs /before/ player joins the map, so it cannot act as a spawn MB that initializes temporary packages or whatnot, since joining a map resets packages.

// #onJoin
//     Once the player joins a map this label will be run automatically.

// #onExit
//     This only works for staff scripts.
//     When the player leaves a map, this label will be run automatically.
//     It will run while the player is in the new map, after packages are reset.
//     It will also run if the player disconnects from the server while on a map utilising it.



// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|
//     Welcome to the Click Label section.
// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|


// When a script is ran from clickevent,
// there is a special group of packages that give you information about the click.
//     click.button
//         This can have the value of Left, Right, or Middle
//     click.coords
//         This is the block coordinates the player clicked. Any out-of-map coordinate means no block was targeted.
//     click.yaw
//     click.pitch
//         The yaw and pitch of the player when they clicked. This is more precise than typical PlayerYaw and PlayerPitch
//     click.face
//         The side of the block the player clicked. This can have the value of:
//         None, AwayX, TowardsX, AwayY, TowardsY, AwayZ, or TowardsZ



// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|
//     Welcome to the Important Notes section.
// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|


// All Action names are case sensitive.
// All labels are case sensitive.
// All packages are NOT case sensitive, even if they appear to use very consistent case rules in the examples and documentation.

// You can unwrap packages into any text of the script except for the names of Actions, "if", "ifnot", and "#labels" that begin a line.
//     THIS IS INCREDIBLY POWERFUL:
//     You can dynamically change what the script is going to do by using the values of packages to modify Action arguments or names of other packages.
//     (programming folks: can you figure out how to do arrays?)



// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|
//     Welcome to the Top Level Statements section.
// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|


// Top level statements are like option toggles for the entire script.
//     To activate any given statement, write it *once* somewhere in your script (at the top is standard practice).
//     If you do not write them, they will not be activated (false) by default.

// "using" statements:
      using cef
//         This allows you to send cef commands to the user through the msg Action. These are normally disallowed because
//         Youtube, which people have historically used for cef soundtracks, is very unreliable now and will give a poor user experience.
      using quit_resets_runargs
//         This makes it so that whenever script runs a "quit" action, all runArgs (except 0) will be reset.
      using allow_include
//         Allows this script's contents to be included in another script.

// "include" statement:
      include [scriptname]
//         This is similar to C "#include".
//         All of the contents of [scriptname] will be copy-pasted into your script when it is compiled.
//         For example:
              include libs/advlib
//             This is useful because it allows you to use other scripts as a library of reuseable functions.
//             In this example, you'd now be able to call advlib's "#Text.print" label from within your script.
//             (docs relating to libs can be found here: https://notawesome.cc/docs/nas/)
//         To include a script from an OS map, use the map named prefixed with "os/".
//         For example:
              include os/goodlyay+24
//         It should be noted that any Actions that run from an included script will
//         respect the "using" statements of the script they originally came from.



// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|
//     Welcome to the Staff (non OS) section.
// |-------------------------------------------------------------------------------------------------------------------------------------------|
// |-------------------------------------------------------------------------------------------------------------------------------------------|


// For a package to be "saved", its name should end with a period. For example, imagine we wanted to save how many eggs were collected in egg2022.
// We could do:
      set eggCount. 20
// And this package would persist even if you left the map or logged out.
// We can access this package in other scripts by prefixing the package with "@scriptname_". For example:
      show @egg2022_eggCount.
// IMPORTANT: The period is *part of the package name* as well as marking that it is permanently saved.
// For example, if you are using eggCount. to save the eggs, "eggCount" (no period) will not give you the correct egg count,
// because it is a different package once the period is removed.


