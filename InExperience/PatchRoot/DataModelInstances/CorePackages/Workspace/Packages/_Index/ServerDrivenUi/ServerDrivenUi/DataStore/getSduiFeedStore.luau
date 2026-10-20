local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local _ = require(ServerDrivenUi.Parent.RobloxAppEnums)
local _ = require(ServerDrivenUi.DataStore.SduiFeedStoreTypes)
local CreateSduiFeedStoreModule = require(ServerDrivenUi.DataStore.createSduiFeedStore)
local t = {}

return function(Key)
	-- upvalues: t (copy), CreateSduiFeedStoreModule (copy)
	local Entry = t[Key]
	
	if Entry == nil then
		t[Key] = CreateSduiFeedStoreModule()
		Entry = t[Key]
	end
	return Entry
end