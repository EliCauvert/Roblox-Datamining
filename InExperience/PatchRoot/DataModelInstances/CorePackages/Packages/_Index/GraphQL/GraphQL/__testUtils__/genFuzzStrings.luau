return {
	genFuzzStrings = function(p0) --[[ line: 13 ]]
		return coroutine.wrap(function() --[[ line: 14 | named "getFuzzStrings" ]]
			-- upvalues: p0 (ref)
			local allowedChars = p0.allowedChars
			local maxLength = p0.maxLength
			local allowedCharsCount = #allowedChars
			local var1 = 0
			
			for i = 1, maxLength do
				var1 += allowedCharsCount ^ i
			end
			coroutine.yield("")
			
			for i_1 = 0, var1 - 1 do
				local var2 = ""
				local var3 = i_1
			end
		end)
	end
}