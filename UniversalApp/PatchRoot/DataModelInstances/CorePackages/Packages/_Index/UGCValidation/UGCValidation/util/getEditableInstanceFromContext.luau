local _ = require(script.Parent.Parent.util.Types)

return function(p1, p2, p3, p4) --[[ Line: 5 ]]
	if not p3 then
		if not p4.isServer then
			return false
		end
		error(string.format("Failed to load texture data"))
	end
	local v1 = p3[p1]
	
	if not v1 then
		local v2 = p1[p2]
		
		if not v2 or v2 == "" then
			return false
		end
		if p4.isServer then
			error(string.format("Failed to load texture data"))
		end
	end
	local v3 = v1[p2]
	
	if not v3 or not v3.instance then
		local v4 = p1[p2]
		
		if not v4 or v4 == "" then
			return false
		end
		if not p4.isServer then
			return false
		end
		error(string.format("Failed to load texture data"))
	end
	return true, v3.instance
end