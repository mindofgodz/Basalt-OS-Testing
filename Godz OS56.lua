local basalt = require("basalt") -- we need basalt here

local main = basalt.createFrame():setTheme({FrameBG = colors.lightBlue, FrameFG = colors.blue}) -- we change the default bg and fg color for frames

local mFrame = basalt.createFrame():setMonitor("left"):setTheme({FrameBG = colors.lightBlue, FrameFG = colors.blue})

local sub = { -- here we create a table where we gonna add some frames
    mFrame:addFrame():setPosition(1, 2):setSize("parent.w", "parent.h - 1"), -- obviously the first one should be shown on program start
    mFrame:addFrame():setPosition(1, 2):setSize("parent.w", "parent.h - 1"):hide(),
    mFrame:addFrame():setPosition(1, 2):setSize("parent.w", "parent.h - 1"):hide(),
}

local function openSubFrame(id) -- we create a function which switches the frame for us
    if(sub[id]~=nil)then
        for k,v in pairs(sub)do
            v:hide()
        end
        sub[id]:show()
    end
end

local menubar = mFrame:addMenubar():setScrollable() -- we create a menubar in our main frame.
    :setSize("parent.w")
    :onChange(function(self, val)
        openSubFrame(self:getItemIndex()) -- here we open the sub frame based on the table index
    end)
    :addItem("Example 1")
    :addItem("Example 2")
    :addItem("Example 3")

-- Now we can change our sub frames, if you want to access a sub frame just use sub[subid], some examples:
sub[1]:addButton():setPosition(2, 2)

sub[2]:addLabel():setText("Hello World!"):setPosition(2, 2)

sub[3]:addLabel():setText("Now we're on example 3!"):setPosition(2, 2)
sub[3]:addButton():setText("No functionality"):setPosition(2, 4):setSize(18, 3)

basalt.autoUpdate()
