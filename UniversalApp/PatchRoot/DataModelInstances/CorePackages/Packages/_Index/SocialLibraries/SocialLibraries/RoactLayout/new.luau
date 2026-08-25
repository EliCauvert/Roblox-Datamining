local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact

return function(p0, p1)
	-- upvalues: roact (ref)
	local t = { blockLayout = p0 }
	
	for i, v in ipairs(p1 or {}) do
		t[i .. "-block"] = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = v.size,
			LayoutOrder = i
		}, { child = v.element })
	end
	return t
end