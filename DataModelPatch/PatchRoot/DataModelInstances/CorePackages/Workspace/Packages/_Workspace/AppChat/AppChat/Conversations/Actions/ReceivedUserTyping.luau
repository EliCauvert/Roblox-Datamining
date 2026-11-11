local SetUserTypingModule = require(script.Parent.SetUserTyping)
local Count = 0

return function(p1, p2)
	-- upvalues: Count (ref), SetUserTypingModule (copy)
	return function(p3)
		-- upvalues: Count (upval), SetUserTypingModule (upval), p1 (copy), p2 (copy)
		spawn(function()
			-- upvalues: Count (upval), p3 (copy), SetUserTypingModule (upval), p1 (upval), p2 (upval)
			Count += 1
			local Count1: number = Count
			p3:dispatch(SetUserTypingModule(p1, p2, true))
			wait(8)
			
			if Count == Count1 then
				p3:dispatch(SetUserTypingModule(p1, p2, false))
			end
		end)
	end
end