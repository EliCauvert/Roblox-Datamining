local setUserTypingModule = require(script.Parent.SetUserTyping)
local var1 = 0

return function(p0, p1) --[[ line: 7 ]]
	-- upvalues: var1 (write), setUserTypingModule (ref)
	return function(p2) --[[ line: 8 ]]
		-- upvalues: var1 (copy), setUserTypingModule (copy), p0 (ref), p1 (ref)
		spawn(function() --[[ line: 9 ]]
			-- upvalues: var1 (copy), p2 (ref), setUserTypingModule (copy), p0 (copy), p1 (copy)
			var1 += 1
			local var2 = var1
			p2:dispatch(setUserTypingModule(p0, p1, true))
			wait(8)
			
			if var1 == var2 then
				p2:dispatch(setUserTypingModule(p0, p1, false))
			end
		end)
	end
end