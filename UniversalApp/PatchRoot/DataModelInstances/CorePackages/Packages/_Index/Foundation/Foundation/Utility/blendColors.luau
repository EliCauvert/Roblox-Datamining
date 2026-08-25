local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return function(p0, p1)
	local var0 = 1 - (p1.Transparency or 0)
	local var1 = 1 - (p0.Transparency or 0)
	
	if var0 == 1 or var1 == 0 or p0.Color3 == nil then
		return p1
	elseif var0 == 0 then
		return p0
	end
	local var2 = 1 - var0
	local var3 = var0 + var1 * var2
	local var4 = if var3 > 0 then 1 / var3 else 0
	
	return {
		Color3 = Color3.new((p1.Color3.R * var0 + p0.Color3.R * (var1 * var2)) * var4, (p1.Color3.G * var0 + p0.Color3.G * (var1 * var2)) * var4, (p1.Color3.B * var0 + p0.Color3.B * (var1 * var2)) * var4),
		Transparency = 1 - var3
	}
end