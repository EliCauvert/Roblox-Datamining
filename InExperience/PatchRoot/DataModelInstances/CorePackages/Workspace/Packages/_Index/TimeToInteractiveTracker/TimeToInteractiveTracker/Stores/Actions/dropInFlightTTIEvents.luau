local _ = require(script.Parent.Parent.types)

return function(Callback)
	return function()
		-- upvalues: Callback (copy)
		Callback(function(List)
			local t = {}
			
			for i, value in List do
				if value and (value.startTime == nil or value.sent == true) then
					t[i] = value
				end
			end
			return t
		end)
	end
end