return function(Callback) --[[ Line: 2 ]]
	return function(p1, Text) --[[ Line: 3 ]]
		-- upvalues: Callback (copy)
		local CallbackResult, CallbackResult2 = Callback(p1)
		
		if CallbackResult == false then
			return CallbackResult, CallbackResult2 .. ". Issue with: " .. Text
		else
			return CallbackResult
		end
	end
end