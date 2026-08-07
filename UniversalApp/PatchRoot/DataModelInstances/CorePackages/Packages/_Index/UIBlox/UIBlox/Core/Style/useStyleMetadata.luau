local parent = script.Parent
local styleContextModule = require(parent.StyleContext)
local reactModule = require(parent.Parent.Parent.Parent.React)

return function() --[[ line: 13 | named "useStyleMetadata" ]]
	-- upvalues: reactModule (ref), styleContextModule (ref)
	local var2 = reactModule.useContext(styleContextModule)
	
	return if var2 then var2.styleMetadata else nil
end