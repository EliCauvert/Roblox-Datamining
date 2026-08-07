local _ = require(script.Parent.FocusNavigation)
local composeFocusBehaviorsModule = require(script.composeFocusBehaviors)

local function mostRecentDescendantBehavior() --[[ line: 16 ]]
	local var2 = nil
	
	return {
		onDescendantFocusChanged = function(p0) --[[ line: 20 ]]
			-- upvalues: var2 (write)
			var2 = p0 or var2
		end,
		getTargets = function() --[[ line: 23 ]]
			-- upvalues: var2 (write)
			return if var2 then { var2 } else {}
		end
	}
end

return {
	default = function(p1) --[[ line: 8 ]]
		return {
			getTargets = function() --[[ line: 10 ]]
				-- upvalues: p1 (ref)
				return if p1 then { p1 } else {}
			end
		}
	end,
	mostRecent = mostRecentDescendantBehavior,
	mostRecentOrDefault = function(p2) --[[ line: 29 ]]
		-- upvalues: composeFocusBehaviorsModule (ref), mostRecentDescendantBehavior (ref)
		return composeFocusBehaviorsModule(mostRecentDescendantBehavior(), {
			getTargets = function() --[[ line: 10 ]]
				-- upvalues: p2 (ref)
				return if p2 then { p2 } else {}
			end
		})
	end,
	composeFocusBehaviors = composeFocusBehaviorsModule
}