local _ = require(script.Parent.Parent.RegExp)

local function matchAllRegex(p1, p2)
	-- upvalues: matchAllRegex (ref)
	local var1 = p2:exec(p1)
	
	if not var1 then
		return {}
	end
	local index = var1.index
	local var2 = var1[1]
	local t = {}
	
	if #var1 > 1 then
		for i = 2, #var1 do
			table.insert(t, var1[i])
		end
	end
	local byteOffset = utf8.offset(p1, index)
	
	return {
		{
			index = byteOffset,
			input = p1,
			matchedText = var2,
			capturedGroups = t
		},
		unpack(matchAllRegex(p1:sub(byteOffset + #var2), p2))
	}
end

return matchAllRegex