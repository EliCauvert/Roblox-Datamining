local _ = require(script.Parent.Parent.Types)

return function(p1)
	if type(p1) ~= "table" then
		return nil, nil
	end
	local var1, var2 = next(p1)
	
	if type(var1) == "string" and var2 ~= nil and next(p1, var1) == nil then
		return var1, var2
	end
	return nil, nil
end