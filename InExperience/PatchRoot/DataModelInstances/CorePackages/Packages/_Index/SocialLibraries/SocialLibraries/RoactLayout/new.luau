local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact

return function(p1, p2)
	-- upvalues: roact (ref)
	local t = { blockLayout = p1 }
	
	for i, v in ipairs(p2 or {}) do
		t[i .. "-block"] = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = v.size,
			LayoutOrder = i
		}, { child = v.element })
	end
	return t
end