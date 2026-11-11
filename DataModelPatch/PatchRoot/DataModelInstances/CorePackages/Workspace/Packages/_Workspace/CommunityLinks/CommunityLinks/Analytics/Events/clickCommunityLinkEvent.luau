local Parent = script:FindFirstAncestor("CommunityLinks").Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local TModule = require(Parent.t)
local ConstantsModule = require(script.Parent.Parent.constants)
local StrictInterfaceResult = TModule.strictInterface({
	guildedServerId = TModule.string,
	entityType = TModule.string,
	entityId = TModule.union(TModule.string, TModule.number)
})

return function(p1, p2, p3)
	-- upvalues: StrictInterfaceResult (copy), MutedErrorFunction (copy), ConstantsModule (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p3)
	
	if not StrictInterfaceResultResult then
		MutedErrorFunction(StrictInterfaceResultResult2)
	end
	p1:sendEventDeferred(p2, ConstantsModule.EventNames.ClickCommunityLink, {
		guildedServerId = p3.guildedServerId,
		entityType = p3.entityType,
		entityId = p3.entityId
	})
end