local parent = script.Parent
local styleContextModule = require(parent.StyleContext)
local reactModule = require(parent.Parent.Parent.Parent.React)

return function()
	-- upvalues: reactModule (ref), styleContextModule (ref)
	local var1 = reactModule.useContext(styleContextModule)
	
	return if var1 then var1.styleMetadata else nil
end