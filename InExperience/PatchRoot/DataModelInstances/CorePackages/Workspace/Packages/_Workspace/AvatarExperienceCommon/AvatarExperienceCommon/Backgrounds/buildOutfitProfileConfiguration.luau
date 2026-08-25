local selectActiveBackgroundModule = require(script.Parent.selectActiveBackground)
local nOBACKGROUNDASSETID = require(script.Parent.constants).NO_BACKGROUND_ASSET_ID

return function(p0)
	-- upvalues: selectActiveBackgroundModule (ref), nOBACKGROUNDASSETID (ref)
	local var1 = selectActiveBackgroundModule(p0)
	
	return {
		BackgroundAssetId = if var1 ~= nil then nOBACKGROUNDASSETID else var1
	}
end