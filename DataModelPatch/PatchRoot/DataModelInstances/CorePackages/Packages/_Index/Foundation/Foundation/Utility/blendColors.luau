local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return function(p1, p2)
	local v1 = 1 - (p2.Transparency or 0)
	local v2 = 1 - (p1.Transparency or 0)
	
	if v1 == 1 or v2 == 0 or p1.Color3 == nil then
		return p2
	elseif v1 == 0 then
		return p1
	else
		local v3 = 1 - v1
		local v4 = v1 + v2 * v3
		local v5 = v4 > 0 and 1 / v4 or 0
		
		return {
			Color3 = Color3.new((p2.Color3.R * v1 + p1.Color3.R * (v2 * v3)) * v5, (p2.Color3.G * v1 + p1.Color3.G * (v2 * v3)) * v5, (p2.Color3.B * v1 + p1.Color3.B * (v2 * v3)) * v5),
			Transparency = 1 - v4
		}
	end
end