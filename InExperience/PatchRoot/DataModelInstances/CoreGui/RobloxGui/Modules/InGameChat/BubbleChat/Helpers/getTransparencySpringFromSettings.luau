local otterModule = require(game:GetService("CorePackages").Packages.Otter)

return function(value)
	-- upvalues: otterModule (ref)
	local transparencyAnimation = value.TransparencyAnimation
	
	if transparencyAnimation.Enabled then
		local t = {
			dampingRatio = transparencyAnimation.SpringDampingRatio,
			frequency = transparencyAnimation.SpringFrequency
		}
		
		return function(p1)
			-- upvalues: otterModule (copy), t (ref)
			return otterModule.spring(p1, t)
		end
	end
	return otterModule.instant
end