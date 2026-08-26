local _ = require(script.Parent.FocusNavigation)
local composeFocusBehaviorsModule = require(script.composeFocusBehaviors)

local function mostRecentDescendantBehavior()
	local var1 = nil
	
	return {
		onDescendantFocusChanged = function(p1)
			-- upvalues: var1 (write)
			var1 = p1 or var1
		end,
		getTargets = function()
			-- upvalues: var1 (write)
			return if var1 then { var1 } else {}
		end
	}
end

return {
	default = function(p1)
		return {
			getTargets = function()
				-- upvalues: p1 (ref)
				return if p1 then { p1 } else {}
			end
		}
	end,
	mostRecent = mostRecentDescendantBehavior,
	mostRecentOrDefault = function(p1)
		-- upvalues: composeFocusBehaviorsModule (ref), mostRecentDescendantBehavior (ref)
		return composeFocusBehaviorsModule(mostRecentDescendantBehavior(), {
			getTargets = function()
				-- upvalues: p1 (ref)
				return if p1 then { p1 } else {}
			end
		})
	end,
	composeFocusBehaviors = composeFocusBehaviorsModule
}