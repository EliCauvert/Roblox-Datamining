local DetailsPageComponents = script:FindFirstAncestor("DetailsPageComponents")
local Parent = DetailsPageComponents.Parent
local DetailsInfoTableRowModule = require(DetailsPageComponents.DetailsInfoTableRow)
local ReactModule = require(Parent.React)
local ListTable = require(Parent.UIBlox).App.Table.ListTable

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), DetailsInfoTableRowModule (copy), ListTable (copy)
	return ReactModule.createElement(ListTable, {
		automaticSize = Enum.AutomaticSize.Y,
		cells = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), ReactModule (upval), DetailsInfoTableRowModule (upval)
			local Elements = {}
			
			for _, row in p1.rows do
				table.insert(Elements, ReactModule.createElement(DetailsInfoTableRowModule, {
					horizontalPadding = p1.horizontalPadding,
					infoData = row.infoData,
					infoName = row.infoName
				}))
			end
			return Elements
		end, { p1.horizontalPadding, p1.rows }),
		dividerStartOffset = p1.dividerStartOffset
	})
end)