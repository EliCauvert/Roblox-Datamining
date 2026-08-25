local otterModule = require(script:FindFirstAncestor("ExpChat").Parent.Otter)

return function(value, p0)
	-- upvalues: otterModule (ref)
	local var1 = if p0 == "size" then value.SizeAnimation else value.TransparencyAnimation
	
	if var1.Enabled == false then
		return otterModule.instant
	end
	local t = {
		dampingRatio = var1.SpringDampingRatio,
		frequency = var1.SpringFrequency
	}
	
	return function(p1)
		-- upvalues: otterModule (copy), t (ref)
		return otterModule.spring(p1, t)
	end
end