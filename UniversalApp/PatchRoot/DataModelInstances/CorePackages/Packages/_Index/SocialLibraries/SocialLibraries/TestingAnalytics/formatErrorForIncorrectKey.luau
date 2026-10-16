return function(Callback) --[[ Line: 1 ]]
	return function(p1, Text) --[[ Line: 2 ]]
		-- upvalues: Callback (copy)
		local CallbackResult, CallbackResult2 = Callback(p1)
		
		if CallbackResult == false then
			return CallbackResult, CallbackResult2 .. ". Issue with: " .. Text
		else
			return CallbackResult
		end
	end
end