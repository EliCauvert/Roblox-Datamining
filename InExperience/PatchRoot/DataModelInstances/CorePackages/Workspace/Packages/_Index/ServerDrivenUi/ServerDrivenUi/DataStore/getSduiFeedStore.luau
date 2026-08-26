local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local _ = require(serverDrivenUi.Parent.RobloxAppEnums)
local _ = require(serverDrivenUi.DataStore.SduiFeedStoreTypes)
local createSduiFeedStoreModule = require(serverDrivenUi.DataStore.createSduiFeedStore)
local t = {}

return function(p1)
	-- upvalues: t (ref), createSduiFeedStoreModule (ref)
	local var1 = t[p1]
	
	if var1 == nil then
		t[p1] = createSduiFeedStoreModule()
		var1 = t[p1]
	end
	return var1
end