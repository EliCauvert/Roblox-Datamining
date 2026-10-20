local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetNativeRobuxProductsModule = require(Modules.LuaApp.Actions.SetNativeRobuxProducts)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)

return function(p1, p2)
	-- upvalues: RetrievalStatusModule (copy), SetNativeRobuxProductsModule (copy)
	local P0 = p1 or {
		Products = nil,
		FetchingStatus = RetrievalStatusModule.NotStarted
	}
	assert(P0, "")
	
	return if p2.type == SetNativeRobuxProductsModule.name then {
		Products = p2.nativeRobuxProducts,
		FetchingStatus = RetrievalStatusModule.Done
	} else P0
end