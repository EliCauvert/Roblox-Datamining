local constantsModule = require(script.Parent.Constants)
local var1 = constantsModule.DEFAULT_BACKGROUND_ASSET_IDS[1]
local var2 = constantsModule.DEFAULT_BACKGROUND_ASSET_IDS[2]

return {
	getDisplayBackgroundId = function(value, p0)
		-- upvalues: var1 (ref), var2 (ref)
		return if value and value ~= -1 then value elseif p0 == "dark" then var1 else var2
	end
}