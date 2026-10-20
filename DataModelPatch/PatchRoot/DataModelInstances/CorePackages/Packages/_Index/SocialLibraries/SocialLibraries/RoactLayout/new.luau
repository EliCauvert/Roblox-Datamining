local Roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact

return function(BlockLayout, p1)
	-- upvalues: Roact (copy)
	local config = { blockLayout = BlockLayout }
	
	for LayoutOrder, value in ipairs(p1 or {}) do
		config[LayoutOrder .. "-block"] = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = value.size,
			LayoutOrder = LayoutOrder
		}, { child = value.element })
	end
	return config
end