local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local signalsModule = require(avatarExperienceCommon.Parent.Signals)
local _ = require(avatarExperienceCommon.Hooks.useSelectorSignal)

local var1 = function(p1, p2)
	return p1 == p2
end

return function(value, p1, p2)
	-- upvalues: signalsModule (ref), var1 (ref)
	local var2, var3 = signalsModule.createSignal(value:getState())
	value.changed:connect(var3)
	
	return signalsModule.createComputed(function(p3)
		-- upvalues: p1 (ref), var2 (ref)
		return p1(var2(p3))
	end, p2 or var1)
end