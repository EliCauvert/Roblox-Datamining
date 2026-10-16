local _ = require(script.Parent.Parent.Types)

return function(p1) --[[ Line: 9 | Named "unpackContent" ]]
	if type(p1) ~= "table" then
		return nil, nil
	end
	local Key, Value = next(p1)
	
	if type(Key) == "string" and Value ~= nil and next(p1, Key) == nil then
		return Key, Value
	else
		return nil, nil
	end
end