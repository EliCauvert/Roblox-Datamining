local Roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local SortedList = Roact.PureComponent:extend("SortedList")
SortedList.defaultProps = {
	renderEntry = nil,
	entryHeight = 48,
	LayoutOrder = 0,
	entries = {},
	sortComparator = function(_, _): boolean --[[ Line: 12 ]]
		return true
	end
}

function SortedList.sortEntries(p1) --[[ Line: 19 ]]
	local List = {}
	
	for _, entry in pairs(p1.props.entries) do
		table.insert(List, entry)
	end
	table.sort(List, p1.props.sortComparator)
	
	return List
end

function SortedList.render(p2) --[[ Line: 31 ]]
	-- upvalues: Roact (copy)
	local SortEntriesResult = p2:sortEntries()
	local config = {
		layout = Roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for LayoutOrder, value in pairs(SortEntriesResult) do
		table.insert(config, Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, p2.props.entryHeight),
			LayoutOrder = LayoutOrder
		}, {
			entry = p2.props.renderEntry(value, LayoutOrder == #SortEntriesResult)
		}))
	end
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, #p2.props.entries * p2.props.entryHeight),
		LayoutOrder = p2.props.LayoutOrder
	}, config)
end

return SortedList