--Holyjoey.
--2.0

util.require_natives('2944b')
util.keep_running()

local settings_list = menu.list(menu.my_root(), "Settings", {}, "", function() end)
local customize_list = menu.list(settings_list, "Customize", {}, "", function() end)
local disable_list = menu.list(settings_list, "Disables", {}, "", function() end)

local automsg = false

menu.toggle(menu.my_root(), "Auto Chat", { "helpgifting" }, "Enables a message to give help on gifting cars. It gets triggered by reading gift in chat.", function(on)
    automsg = on
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

local guidemessage = "> 0: Fill up a garage completely (free cars, street cars, be creative). 1: Go to garage, drive any car outside and back inside. 2: Walk outside. 3: Spawn car with !carname e.g. !t20. 4: Get in car and !gift username. 5: Drive car in garage."
menu.text_input(customize_list, "Change Guide Message", { "ChangeGuide" }, "", function(fuck2)
    guidemessage = "> " .. fuck2
end)

local modelmessage = "> Dont use full car names but use the object names. Look on website gtahash.ru/cars for it or ask me."
menu.text_input(customize_list, "Change Model Message", { "ChangeModel" }, "", function(fuck3)
    modelmessage = "> " .. fuck3
end)

local triggerword = "gift"
menu.text_input(customize_list, "Change Chat Triggerword", { "ChangeTrigger" }, "Change the word that triggers the message. Default is one is gift", function(fuck4)
    triggerword = fuck4
end)

chat.on_message(function(pid, unused, content, tc)
    if automsg then
        local lowerContent = content:lower()

        if lowerContent:find(triggerword) then
            if not lowerContent:find('> ') and not lowerContent:find('!') then
                if not intromsg then
                    chat.send_message(intromessage, tc, true, true)
                end
                chat.send_message(guidemessage, tc, true, true)
                if not modelmsg then
                    chat.send_message(modelmessage, tc, true, true)
                end
            end
        end
    end
end)

menu.action(menu.my_root(), "Manually push message", {}, "Put guide in chat", function()
    if not intromsg then
        chat.send_message(intromessage, tc, true, true)
    end
    chat.send_message(guidemessage, tc, true, true)
    if not modelmsg then
        chat.send_message(modelmessage, tc, true, true)
    end
end)
