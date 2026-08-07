local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local sortedList = roact.PureComponent:extend("SortedList")
sortedList.defaultProps = {
	renderEntry = nil,
	entryHeight = 48,
	LayoutOrder = 0,
	entries = {},
	sortComparator = function(_, _) --[[ line: 12 ]]
		return true
	end
}

function sortedList.sortEntries(p0) --[[ line: 19 ]]
	local t = {}
	
	for i, v in pairs(p0.props.entries) do
		table.insert(t, v)
	end
	table.sort(t, p0.props.sortComparator)
	
	return t
end

function sortedList.render(p1) --[[ line: 31 ]]
	-- upvalues: roact (ref)
	local var2 = p1:sortEntries()
	local t = {
		layout = roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for i, v in pairs(var2) do
		table.insert(t, roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, p1.props.entryHeight),
			LayoutOrder = i
		}, { entry = p1.props.renderEntry(v, i == #var2) }))
	end
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, #p1.props.entries * p1.props.entryHeight),
		LayoutOrder = p1.props.LayoutOrder
	}, t)
end

return sortedList