local ConstantsModule = require(script.Parent.Constants)
local DEFAULTBACKGROUNDASSETID = ConstantsModule.DEFAULT_BACKGROUND_ASSET_IDS[1]
local DEFAULTBACKGROUNDASSETID1 = ConstantsModule.DEFAULT_BACKGROUND_ASSET_IDS[2]

return {
	getDisplayBackgroundId = function(p1, p2)
		-- upvalues: DEFAULTBACKGROUNDASSETID (copy), DEFAULTBACKGROUNDASSETID1 (copy)
		return if p1 and p1 ~= -1 then p1 elseif p2 == "dark" then DEFAULTBACKGROUNDASSETID else DEFAULTBACKGROUNDASSETID1
	end
}