local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local SignalsModule = require(AvatarExperienceCommon.Parent.Signals)
local _ = require(AvatarExperienceCommon.Hooks.useSelectorSignal)

local function v3(p1, p2): boolean
	return p1 == p2
end

return function(p1, Callback, p2)
	-- upvalues: SignalsModule (copy), v3 (copy)
	local Signal, Signal2 = SignalsModule.createSignal((p1:getState()))
	p1.changed:connect(Signal2)
	
	return SignalsModule.createComputed(function(p3)
		-- upvalues: Callback (copy), Signal (copy)
		return Callback(Signal(p3))
	end, p2 or v3)
end