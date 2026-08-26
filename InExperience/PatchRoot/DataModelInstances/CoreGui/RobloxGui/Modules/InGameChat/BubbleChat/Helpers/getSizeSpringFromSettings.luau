local otterModule = require(game:GetService("CorePackages").Packages.Otter)

return function(value)
	-- upvalues: otterModule (ref)
	local sizeAnimation = value.SizeAnimation
	
	if sizeAnimation.Enabled then
		local t = {
			dampingRatio = sizeAnimation.SpringDampingRatio,
			frequency = sizeAnimation.SpringFrequency
		}
		
		return function(p1)
			-- upvalues: otterModule (copy), t (ref)
			return otterModule.spring(p1, t)
		end
	end
	return otterModule.instant
end