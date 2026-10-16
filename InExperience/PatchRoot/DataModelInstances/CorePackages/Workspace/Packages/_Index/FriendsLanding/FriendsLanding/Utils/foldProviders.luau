local Roact = require(script:FindFirstAncestor("FriendsLanding").dependencies).Roact

return function(Element, List) --[[ Line: 6 ]]
	-- upvalues: Roact (copy)
	local Element1 = Element
	
	for _, value in List do
		Element1 = Roact.createElement(value[1], value[2], { Element1 })
	end
	return Element1
end