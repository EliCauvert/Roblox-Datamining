local ReactModule = require(script:FindFirstAncestor("UserRelationshipModals").Parent.React)
local AnalyticsSetupModule = require(script.Parent.AnalyticsSetup)
local _ = require(script.Parent.RelationshipTypes)

return function(RelationshipType, p1, TargetUserId)
	-- upvalues: ReactModule (copy), AnalyticsSetupModule (copy)
	return (ReactModule.useMemo(function()
		-- upvalues: AnalyticsSetupModule (upval), RelationshipType (copy), TargetUserId (copy)
		return AnalyticsSetupModule({
			infoForAllEvents = {
				relationshipType = RelationshipType,
				targetUserId = TargetUserId
			}
		})
	end, { RelationshipType, p1, TargetUserId }))
end