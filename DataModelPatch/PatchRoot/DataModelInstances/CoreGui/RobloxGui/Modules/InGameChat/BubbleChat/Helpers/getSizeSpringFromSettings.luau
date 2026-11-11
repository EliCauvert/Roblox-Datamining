local OtterModule = require(game:GetService("CorePackages").Packages.Otter)

return function(p1)
	-- upvalues: OtterModule (copy)
	local SizeAnimation = p1.SizeAnimation
	
	if SizeAnimation.Enabled then
		local config = {
			dampingRatio = SizeAnimation.SpringDampingRatio,
			frequency = SizeAnimation.SpringFrequency
		}
		
		return function(p2)
			-- upvalues: OtterModule (upval), config (copy)
			return OtterModule.spring(p2, config)
		end
	else
		return OtterModule.instant
	end
end