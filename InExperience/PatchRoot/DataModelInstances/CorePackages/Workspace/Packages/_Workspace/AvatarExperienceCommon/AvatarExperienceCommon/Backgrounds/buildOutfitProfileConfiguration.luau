local SelectActiveBackgroundModule = require(script.Parent.selectActiveBackground)
local NOBACKGROUNDASSETID = require(script.Parent.constants).NO_BACKGROUND_ASSET_ID

return function(p1) --[[ Line: 15 | Named "buildOutfitProfileConfiguration" ]]
	-- upvalues: SelectActiveBackgroundModule (copy), NOBACKGROUNDASSETID (copy)
	local SelectActiveBackgroundModuleResult = SelectActiveBackgroundModule(p1)
	
	return {
		BackgroundAssetId = if SelectActiveBackgroundModuleResult == nil then NOBACKGROUNDASSETID else SelectActiveBackgroundModuleResult
	}
end