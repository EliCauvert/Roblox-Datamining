local _ = require(script.Parent.Parent.util.Types)

return function(p0, p1, p2, p3)
	if not p2 then
		if p3.isServer then
			error(string.format("Failed to load texture data"))
		else
			return false
		end
	end
	local var1
	local var0 = p2[p0]
	
	if not var0 then
		var1 = p0[p1]
		
		if not var1 or var1 == "" then
			return false
		elseif p3.isServer then
			error(string.format("Failed to load texture data"))
		end
	end
	var1 = var0[p1]
	
	if not var1 or not var1.instance then
		local var2 = p0[p1]
		
		if not var2 or var2 == "" then
			return false
		elseif p3.isServer then
			error(string.format("Failed to load texture data"))
		else
			return false
		end
	end
	return true, var1.instance
end