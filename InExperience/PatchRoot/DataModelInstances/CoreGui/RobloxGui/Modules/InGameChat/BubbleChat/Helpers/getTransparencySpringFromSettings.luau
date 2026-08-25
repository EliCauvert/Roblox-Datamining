local otterModule = require(game:GetService("CorePackages").Packages.Otter)

return function(value)
	-- upvalues: otterModule (ref)
	local transparencyAnimation = value.TransparencyAnimation
	
	if transparencyAnimation.Enabled then
		local t = {
			dampingRatio = transparencyAnimation.SpringDampingRatio,
			frequency = transparencyAnimation.SpringFrequency
		}
		
		return function(p0)
			-- upvalues: otterModule (copy), t (ref)
			return otterModule.spring(p0, t)
		end
	end
	return otterModule.instant
end