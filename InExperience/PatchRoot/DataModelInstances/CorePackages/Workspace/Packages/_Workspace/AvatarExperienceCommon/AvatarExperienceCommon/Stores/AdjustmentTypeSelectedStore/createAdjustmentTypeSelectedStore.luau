local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local Position = require(AvatarExperienceCommon.Enums.AdjustmentType).Position

return function() --[[ Line: 19 | Named "createAdjustmentTypeSelectedStore" ]]
	-- upvalues: CreateSessionScopedSignalFunction (copy), Position (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(Position)
	
	return {
		getAdjustmentTypeSelected = SessionScopedSignal,
		setAdjustmentType = function(p1) --[[ Line: 22 ]]
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(p1)
		end,
		reset = function() --[[ Line: 26 ]]
			-- upvalues: SessionScopedSignal2 (copy), Position (upval)
			SessionScopedSignal2(Position)
		end
	}
end