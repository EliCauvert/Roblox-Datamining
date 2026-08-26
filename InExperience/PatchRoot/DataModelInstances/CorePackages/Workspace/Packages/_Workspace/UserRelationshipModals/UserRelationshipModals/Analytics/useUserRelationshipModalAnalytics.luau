local reactModule = require(script:FindFirstAncestor("UserRelationshipModals").Parent.React)
local analyticsSetupModule = require(script.Parent.AnalyticsSetup)
local _ = require(script.Parent.RelationshipTypes)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), analyticsSetupModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: analyticsSetupModule (copy), p1 (ref), p3 (ref)
		return analyticsSetupModule({
			infoForAllEvents = { relationshipType = p1, targetUserId = p3 }
		})
	end, { p1, p2, p3 })
end