local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local sortedList = roact.PureComponent:extend("SortedList")
sortedList.defaultProps = {
	renderEntry = nil,
	entryHeight = 48,
	LayoutOrder = 0,
	entries = {},
	sortComparator = function(_, _)
		return true
	end
}

function sortedList.sortEntries(p1)
	local t = {}
	
	for i, v in pairs(p1.props.entries) do
		table.insert(t, v)
	end
	table.sort(t, p1.props.sortComparator)
	
	return t
end

function sortedList.render(p2)
	-- upvalues: roact (ref)
	local var1 = p2:sortEntries()
	local t = {
		layout = roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for i, v in pairs(var1) do
		table.insert(t, roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, p2.props.entryHeight),
			LayoutOrder = i
		}, { entry = p2.props.renderEntry(v, i == #var1) }))
	end
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, #p2.props.entries * p2.props.entryHeight),
		LayoutOrder = p2.props.LayoutOrder
	}, t)
end

return sortedList