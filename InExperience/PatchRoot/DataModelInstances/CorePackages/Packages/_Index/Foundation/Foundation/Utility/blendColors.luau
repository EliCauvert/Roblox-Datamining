local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return function(p1, p2)
	local var1 = 1 - (p2.Transparency or 0)
	local var2 = 1 - (p1.Transparency or 0)
	
	if var1 == 1 or var2 == 0 or p1.Color3 == nil then
		return p2
	elseif var1 == 0 then
		return p1
	end
	local var3 = 1 - var1
	local var4 = var1 + var2 * var3
	local var5 = if var4 > 0 then 1 / var4 else 0
	
	return {
		Color3 = Color3.new((p2.Color3.R * var1 + p1.Color3.R * (var2 * var3)) * var5, (p2.Color3.G * var1 + p1.Color3.G * (var2 * var3)) * var5, (p2.Color3.B * var1 + p1.Color3.B * (var2 * var3)) * var5),
		Transparency = 1 - var4
	}
end