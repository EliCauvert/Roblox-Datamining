return {
	genFuzzStrings = function(p1)
		return coroutine.wrap(function()
			-- upvalues: p1 (copy)
			local AllowedChars = p1.allowedChars
			local CountAllowedChars = #AllowedChars
			local Total = 0
			
			for i = 1, p1.maxLength do
				Total += CountAllowedChars ^ i
			end
			coroutine.yield("")
			
			for i1 = 0, Total - 1 do
				local v1 = ""
				local i2: number = i1
				while i2 >= 0 do
					local IRemainder = i2 % CountAllowedChars
					v1 = AllowedChars[IRemainder + 1] .. v1
					i2 = (i2 - IRemainder) / CountAllowedChars - 1
				end
				coroutine.yield(v1)
			end
		end)
	end
}