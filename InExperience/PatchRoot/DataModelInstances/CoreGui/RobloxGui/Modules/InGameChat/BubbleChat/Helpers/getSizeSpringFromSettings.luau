local OtterModule = require(game:GetService("CorePackages").Packages.Otter)

return function(p1) --[[ Line: 5 | Named "getSizeSpringFromSettings" ]]
	-- upvalues: OtterModule (copy)
	local SizeAnimation = p1.SizeAnimation
	
	if SizeAnimation.Enabled then
		local config = {
			dampingRatio = SizeAnimation.SpringDampingRatio,
			frequency = SizeAnimation.SpringFrequency
		}
		
		return function(p2) --[[ Line: 15 ]]
			-- upvalues: OtterModule (upval), config (copy)
			return OtterModule.spring(p2, config)
		end
	else
		return OtterModule.instant
	end
end