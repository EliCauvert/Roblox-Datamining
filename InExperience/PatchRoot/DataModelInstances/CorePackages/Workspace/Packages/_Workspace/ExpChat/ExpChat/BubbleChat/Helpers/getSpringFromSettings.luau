local OtterModule = require(script:FindFirstAncestor("ExpChat").Parent.Otter)

return function(p1, p2) --[[ Line: 7 | Named "getSpringFromSettings" ]]
	-- upvalues: OtterModule (copy)
	local SizeAnimation = if p2 == "size" then p1.SizeAnimation else p1.TransparencyAnimation
	
	if SizeAnimation.Enabled == false then
		return OtterModule.instant
	else
		local config = {
			dampingRatio = SizeAnimation.SpringDampingRatio,
			frequency = SizeAnimation.SpringFrequency
		}
		
		return function(p3) --[[ Line: 25 ]]
			-- upvalues: OtterModule (upval), config (copy)
			return OtterModule.spring(p3, config)
		end
	end
end