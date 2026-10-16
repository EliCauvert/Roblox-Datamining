local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local SignalsModule = require(AvatarExperienceCommon.Parent.Signals)
local _ = require(AvatarExperienceCommon.Hooks.useSelectorSignal)

local function v3(p1, p2): boolean --[[ Line: 9 ]]
	return p1 == p2
end

return function(p1, Callback, p2) --[[ Line: 14 | Named "createSelectorSignal" ]]
	-- upvalues: SignalsModule (copy), v3 (copy)
	local Signal, Signal2 = SignalsModule.createSignal((p1:getState()))
	p1.changed:connect(Signal2)
	
	return SignalsModule.createComputed(function(p3) --[[ Line: 20 ]]
		-- upvalues: Callback (copy), Signal (copy)
		return Callback(Signal(p3))
	end, p2 or v3)
end