--delcare variables
local termWidth, termHeight = term.getSize()
local mOption = 1
local running = false

-- menu methods
function Choice_1()
    
end

function Choice_2()
    
end

function Exit()
    running = false
end

-- menu definition
MainMenu = {
    [1] = {text = "choice 1", handler = Choice_1},
    [2] = {text = "choice 2", handler = Choice_2},
    [3] = {text = "Exit",handler = Exit}
}

-- printing methods
function Print_menu(menu)
    for i = 1, #menu do
        if i == mOption then
                print(">> "..menu[i].text)
            else
                print("   "..menu[i].text)
        end
    end
end

-- handler method
function On_key_pressed(key, menu)
    if key == keys.enter then
        On_mOption(menu)
    elseif key == keys.up or keys.w then
        if mOption >1 then
            mOption = mOption - 1
        end
    elseif key == keys.down or keys.s then
        if mOption < #menu then
            mOption = mOption + 1
        end
    end
end

function On_mOption(menu)
    menu[mOption].handler()
end

-- main method

function Main()
    while running == true do
        term.clear()
        term.setCursorPos(1,1)
        Print_menu(MainMenu)

        local event, key = os.pullEvent("key")
        On_key_pressed(event, key)
    end
end

Main()