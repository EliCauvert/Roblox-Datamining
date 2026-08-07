local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local _ = require(parent_1.App.Style.StyleTypes)
local styleContextModule = require(parent.StyleContext)
local reactModule = require(parent_2.React)

return function() --[[ line: 15 | named "useStyle" ]]
	-- upvalues: reactModule (ref), styleContextModule (ref)
	return reactModule.useContext(styleContextModule).style
end