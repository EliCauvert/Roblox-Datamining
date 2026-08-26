local roact = require(script:FindFirstAncestor("FriendsLanding").dependencies).Roact

return function(p1, p2)
	-- upvalues: roact (ref)
	local var1 = p1
	
	for i, v in p2 do
		var1 = roact.createElement(v[1], v[2], { var1 })
	end
	return var1
end