local roact = require(script:FindFirstAncestor("FriendsLanding").dependencies).Roact

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: roact (ref)
	local var0 = p0
	
	for i, v in p1 do
		var0 = roact.createElement(v[1], v[2], { var0 })
	end
	return var0
end