local _ = require(script.Parent.Parent.util.Types)

return function(p1, p2, p3, p4)
	if not p3 then
		if p4.isServer then
			error(string.format("Failed to load texture data"))
		else
			return false
		end
	end
	local var1
	local var2 = p3[p1]
	
	if not var2 then
		var1 = p1[p2]
		
		if not var1 or var1 == "" then
			return false
		elseif p4.isServer then
			error(string.format("Failed to load texture data"))
		end
	end
	var1 = var2[p2]
	
	if not var1 or not var1.instance then
		local var3 = p1[p2]
		
		if not var3 or var3 == "" then
			return false
		elseif p4.isServer then
			error(string.format("Failed to load texture data"))
		else
			return false
		end
	end
	return true, var1.instance
end