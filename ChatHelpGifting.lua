--Holyjoey.
--1.0

util.require_natives('2944b')
util.keep_running()

-- Define a variable to store the state of the help gifting feature
local automsg = false

-- Function to toggle the help gifting feature
menu.toggle(menu.my_root(), "Help Gifting", { "helpgifting" }, "Enables a message to give help on gifting cars. It gets triggered by reading gift in chat.", function(on)
    automsg = on
end)

-- Function to handle incoming chat messages
chat.on_message(function(pid, unused, content, tc)
    -- Check if the help gifting feature is enabled
    if automsg then
        -- Convert the message content to lowercase for case-insensitive matching
        local lowerContent = content:lower()

        -- Check if the message contains the word 'gift' and does not start with '>' or '!'
        if lowerContent:find('gift') and not lowerContent:find('> ') and not lowerContent:find('!') then
            -- Send a help message about gifting cars
            chat.send_message('> Guide on gifting cars:', tc, true, true)
            chat.send_message('> 0: Fill up a garage completely (free cars, street cars, be creative). 1: Go to garage, drive any car outside and back inside. 2: Walk outside. 3: Spawn car with "!carname" e.g. "!t20". 4: Get in car and "!gift username". 5: Drive car in garage.', tc, true, true)
            chat.send_message('> Dont use full car names but use the object names. Look on website gtahash.ru/cars for it or ask me.', tc, true, true)        end
    end
end)

menu.action(menu.my_root(), "Manually push message", {}, "Put guide in chat", function()
    chat.send_message('> Guide on gifting cars:', tc, true, true)
    chat.send_message('> 0: Fill up a garage completely (free cars, street cars, be creative). 1: Go to garage, drive any car outside and back inside. 2: Walk outside. 3: Spawn car with "!carname" e.g. "!t20". 4: Get in car and "!gift username". 5: Drive car in garage.', tc, true, true)
    chat.send_message('> Dont use full car names but use the object names. Look on website gtahash.ru/cars for it or ask me.', tc, true, true)
end)