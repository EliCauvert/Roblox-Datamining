local Parent = script:FindFirstAncestor("Groups").Parent
local _ = require(Parent.Signals)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)

return function(p1, p2)
	-- upvalues: SduiSharedUtilitiesModule (copy)
	local SduiApiStore = SduiSharedUtilitiesModule.getSduiApiStore()
	
	return if SduiApiStore.getRootConfig(p1, p2, `{p1}_groupSidebar`) == nil and SduiApiStore.getRootConfig(p1, p2, p1) ~= nil then nil else "groupSidebar"
end