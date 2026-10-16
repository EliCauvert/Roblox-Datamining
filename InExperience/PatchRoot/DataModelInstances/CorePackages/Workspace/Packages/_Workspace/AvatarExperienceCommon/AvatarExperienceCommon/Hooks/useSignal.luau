local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return function(p1, p2) --[[ Line: 13 | Named "useSignal" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 14 ]]
		-- upvalues: SignalsModule (upval), p1 (copy), p2 (copy)
		return SignalsModule.createSignal(p1, p2)
	end, {})
	
	return UseMemoResult, UseMemoResult2
end