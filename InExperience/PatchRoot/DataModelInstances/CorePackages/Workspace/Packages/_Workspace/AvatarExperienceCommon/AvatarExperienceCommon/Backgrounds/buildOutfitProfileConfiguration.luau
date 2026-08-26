local selectActiveBackgroundModule = require(script.Parent.selectActiveBackground)
local nOBACKGROUNDASSETID = require(script.Parent.constants).NO_BACKGROUND_ASSET_ID

return function(p1)
	-- upvalues: selectActiveBackgroundModule (ref), nOBACKGROUNDASSETID (ref)
	local var1 = selectActiveBackgroundModule(p1)
	
	return {
		BackgroundAssetId = if var1 ~= nil then nOBACKGROUNDASSETID else var1
	}
end