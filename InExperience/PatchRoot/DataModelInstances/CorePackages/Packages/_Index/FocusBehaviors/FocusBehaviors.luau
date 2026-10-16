local _ = require(script.Parent.FocusNavigation)
local ComposeFocusBehaviorsModule = require(script.composeFocusBehaviors)

local function mostRecentDescendantBehavior() --[[ Line: 16 ]]
	local v1 = nil
	
	return {
		onDescendantFocusChanged = function(p1) --[[ Line: 20 ]]
			-- upvalues: v1 (ref)
			v1 = if p1 then p1 else v1
		end,
		getTargets = function() --[[ Line: 23 ]]
			-- upvalues: v1 (ref)
			return if v1 then { v1 } else {}
		end
	}
end

return {
	default = function(p1) --[[ Line: 8 ]]
		return {
			getTargets = function() --[[ Line: 10 ]]
				-- upvalues: p1 (copy)
				return if p1 then { p1 } else {}
			end
		}
	end,
	mostRecent = mostRecentDescendantBehavior,
	mostRecentOrDefault = function(p1) --[[ Line: 29 ]]
		-- upvalues: ComposeFocusBehaviorsModule (copy), mostRecentDescendantBehavior (copy)
		return ComposeFocusBehaviorsModule(mostRecentDescendantBehavior(), {
			getTargets = function() --[[ Line: 10 ]]
				-- upvalues: p1 (copy)
				return if p1 then { p1 } else {}
			end
		})
	end,
	composeFocusBehaviors = ComposeFocusBehaviorsModule
}