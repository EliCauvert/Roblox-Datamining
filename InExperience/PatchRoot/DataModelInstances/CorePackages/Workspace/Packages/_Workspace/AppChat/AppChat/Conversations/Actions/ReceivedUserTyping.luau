local setUserTypingModule = require(script.Parent.SetUserTyping)
local var1 = 0

return function(p1, p2)
	-- upvalues: var1 (write), setUserTypingModule (ref)
	return function(p3)
		-- upvalues: var1 (copy), setUserTypingModule (copy), p1 (ref), p2 (ref)
		spawn(function()
			-- upvalues: var1 (copy), p3 (ref), setUserTypingModule (copy), p1 (copy), p2 (copy)
			var1 += 1
			local var2 = var1
			p3:dispatch(setUserTypingModule(p1, p2, true))
			wait(8)
			
			if var1 == var2 then
				p3:dispatch(setUserTypingModule(p1, p2, false))
			end
		end)
	end
end