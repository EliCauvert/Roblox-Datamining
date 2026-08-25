local text = "id-" .. tostring(math.random(100000, 1000000))
local var1 = 0

return {
	_TESTING_ONLY_normalize_keys = function()
		-- upvalues: text (write), var1 (write)
		text = "id-"
		var1 = 0
	end,
	generateKey = function()
		-- upvalues: text (write), var1 (write)
		local text_1 = text .. tostring(var1)
		var1 += 1
		
		return text_1
	end
}