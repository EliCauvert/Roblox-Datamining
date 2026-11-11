local Parent = script:FindFirstAncestor("DetailsPageComponents").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Cell = UIBloxModule.App.Table.Cell
local CellHeadDetail = UIBloxModule.App.Table.CellHeadDetail
local CellTailDescription = UIBloxModule.App.Table.CellTailDescription
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return ReactModule.memo(function(p1)
	-- upvalues: UseStyleFunction (copy), UseTokensFunction (copy), ReactModule (copy), Cell (copy), CellHeadDetail (copy), CellTailDescription (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Cell, {
		head = ReactModule.createElement(CellHeadDetail, {
			labelText = p1.infoName,
			labelTextColor = UseStyleResult.Theme.TextDefault,
			labelTextFont = UseTokensResult.Typography.TitleLarge
		}),
		horizontalPadding = p1.horizontalPadding,
		size = UDim2.new(1, 0, 0, 56),
		tail = ReactModule.createElement(CellTailDescription, {
			text = p1.infoData,
			textColor = UseStyleResult.Theme.TextEmphasis,
			textFont = UseTokensResult.Typography.TitleLarge
		}),
		userInteractionEnabled = p1.userInteractionEnabled or false
	})
end)