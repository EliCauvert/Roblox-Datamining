return {
	genFuzzStrings = function(p1)
		return coroutine.wrap(function()
			-- upvalues: p1 (ref)
			local allowedChars = p1.allowedChars
			local maxLength = p1.maxLength
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