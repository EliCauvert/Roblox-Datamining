local _ = require(script.Parent.Types)

return function(List, Callback) --[[ Line: 16 | Named "collect" ]]
	local t = {}
	
	for i, value in List do
		local CallbackResult, CallbackResult2 = Callback(i, value)
		
		if CallbackResult ~= nil then
			t[CallbackResult] = CallbackResult2
		end
	end
	return t
end