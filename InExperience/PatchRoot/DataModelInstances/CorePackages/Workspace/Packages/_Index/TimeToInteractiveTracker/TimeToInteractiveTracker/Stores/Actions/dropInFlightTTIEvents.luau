local _ = require(script.Parent.Parent.types)

return function(Callback) --[[ Line: 6 ]]
	return function() --[[ Line: 7 ]]
		-- upvalues: Callback (copy)
		Callback(function(List) --[[ Line: 8 ]]
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