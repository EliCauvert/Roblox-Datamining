local _ = require(script.Parent.Types)

return function(List, Callback) --[[ Line: 16 | Named "collectSet" ]]
	local t = {}
	
	for i, value in List do
		local CallbackResult = if Callback == nil then value else Callback(i, value)
		
		if CallbackResult ~= nil then
			t[CallbackResult] = true
		end
	end
	return t
end