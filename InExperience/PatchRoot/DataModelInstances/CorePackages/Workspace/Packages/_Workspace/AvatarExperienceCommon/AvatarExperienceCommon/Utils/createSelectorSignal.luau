local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local signalsModule = require(avatarExperienceCommon.Parent.Signals)
local _ = require(avatarExperienceCommon.Hooks.useSelectorSignal)

local var2 = function(p0, p1)
	return p0 == p1
end

return function(value, p2, p3)
	-- upvalues: signalsModule (ref), var2 (ref)
	local var3, var4 = signalsModule.createSignal(value:getState())
	value.changed:connect(var4)
	
	return signalsModule.createComputed(function(p4)
		-- upvalues: p2 (ref), var3 (ref)
		return p2(var3(p4))
	end, p3 or var2)
end