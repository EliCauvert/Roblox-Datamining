local Parent = script:FindFirstAncestor("AvatarExperienceModel").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

local function createEmptyLastSavedSort()
	return {}
end

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy), createEmptyLastSavedSort (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(createEmptyLastSavedSort)
	
	return {
		getLastSavedSort = SessionScopedSignal,
		setLastSavedSort = function(p1)
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(p1)
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2({})
		end
	}
end