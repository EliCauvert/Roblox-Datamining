local OtterModule = require(game:GetService("CorePackages").Packages.Otter)

return function(p1)
	-- upvalues: OtterModule (copy)
	local TransparencyAnimation = p1.TransparencyAnimation
	
	if TransparencyAnimation.Enabled then
		local config = {
			dampingRatio = TransparencyAnimation.SpringDampingRatio,
			frequency = TransparencyAnimation.SpringFrequency
		}
		
		return function(p2)
			-- upvalues: OtterModule (upval), config (copy)
			return OtterModule.spring(p2, config)
		end
	else
		return OtterModule.instant
	end
end