local otterModule = require(game:GetService("CorePackages").Packages.Otter)

return function(value) --[[ line: 5 | named "getSizeSpringFromSettings" ]]
	-- upvalues: otterModule (ref)
	local sizeAnimation = value.SizeAnimation
	
	if sizeAnimation.Enabled then
		local t = {
			dampingRatio = sizeAnimation.SpringDampingRatio,
			frequency = sizeAnimation.SpringFrequency
		}
		
		return function(p0) --[[ line: 15 ]]
			-- upvalues: otterModule (copy), t (ref)
			return otterModule.spring(p0, t)
		end
	end
	return otterModule.instant
end