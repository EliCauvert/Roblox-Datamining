local reactModule = require(script:FindFirstAncestor("UserRelationshipModals").Parent.React)
local analyticsSetupModule = require(script.Parent.AnalyticsSetup)
local _ = require(script.Parent.RelationshipTypes)

return function(p0, p1, p2) --[[ line: 14 | named "useUserRelationshipModalAnalytics" ]]
	-- upvalues: reactModule (ref), analyticsSetupModule (ref)
	return reactModule.useMemo(function() --[[ line: 19 ]]
		-- upvalues: analyticsSetupModule (copy), p0 (ref), p2 (ref)
		return analyticsSetupModule({
			infoForAllEvents = { relationshipType = p0, targetUserId = p2 }
		})
	end, { p0, p1, p2 })
end