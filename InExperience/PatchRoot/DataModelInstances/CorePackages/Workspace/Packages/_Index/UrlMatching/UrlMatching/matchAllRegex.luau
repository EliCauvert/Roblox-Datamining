local _ = require(script.Parent.Parent.RegExp)

local function matchAllRegex(p0, p1)
	-- upvalues: matchAllRegex (ref)
	local var1 = p1:exec(p0)
	
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
	local byteOffset = utf8.offset(p0, index)
	
	return {
		{
			index = byteOffset,
			input = p0,
			matchedText = var2,
			capturedGroups = t
		},
		unpack(matchAllRegex(p0:sub(byteOffset + #var2), p1))
	}
end

return matchAllRegex