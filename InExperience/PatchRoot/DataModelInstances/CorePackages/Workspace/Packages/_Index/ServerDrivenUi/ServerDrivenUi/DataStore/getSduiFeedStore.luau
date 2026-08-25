local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local _ = require(serverDrivenUi.Parent.RobloxAppEnums)
local _ = require(serverDrivenUi.DataStore.SduiFeedStoreTypes)
local createSduiFeedStoreModule = require(serverDrivenUi.DataStore.createSduiFeedStore)
local t = {}

return function(p0)
	-- upvalues: t (ref), createSduiFeedStoreModule (ref)
	local var3 = t[p0]
	
	if var3 == nil then
		t[p0] = createSduiFeedStoreModule()
		var3 = t[p0]
	end
	return var3
end