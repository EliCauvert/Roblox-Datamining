local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, Callback) --[[ Line: 22 ]]
	local v1 = nil
	for i = 1, #p1 do
		v1 = p1[i]
		
		if Callback(v1, i, p1) then
			return v1
		end
	end
	return nil
end