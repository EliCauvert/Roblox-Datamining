local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

return function() --[[ Line: 19 | Named "createApplyingLayeredClothingStore" ]]
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(false)
	
	return {
		getApplyingLayeredClothing = SessionScopedSignal,
		startedApplyingLayeredClothing = function() --[[ Line: 22 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(true)
		end,
		finishedApplyingLayeredClothing = function() --[[ Line: 26 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(false)
		end,
		reset = function() --[[ Line: 30 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(false)
		end
	}
end