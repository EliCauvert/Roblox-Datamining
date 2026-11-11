local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local AXDebugGridShouldErrorOnInvalidRowCount = game:DefineFastFlag("AXDebugGridShouldErrorOnInvalidRowCount", false)

local function GridRow(Frame)
	-- upvalues: ReactModule (copy)
	local config = {
		GridRowLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for LayoutOrder, item in Frame.items do
		config[`item-{Frame.getItemId(item)}-{LayoutOrder}`] = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(UDim.new(1 / Frame.itemsPerRow, 0), UDim.new(0, 0)),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = LayoutOrder
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Frame.gapHorizontal / 2),
				PaddingRight = UDim.new(0, Frame.gapHorizontal / 2)
			}),
			Content = Frame.renderItem({
				item = item,
				index = (Frame.rowIndex - 1) * Frame.itemsPerRow + LayoutOrder,
				gridInformation = {
					row = Frame.rowIndex,
					column = (LayoutOrder - 1) % Frame.itemsPerRow + 1
				}
			})
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, config)
end

return (ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: AXDebugGridShouldErrorOnInvalidRowCount (copy), MutedErrorFunction (copy), ReactModule (copy), GridRow (copy)
	local ItemsPerRow = if Frame.itemsPerRow <= 0 then 1 else Frame.itemsPerRow
	
	if AXDebugGridShouldErrorOnInvalidRowCount and Frame.itemsPerRow <= 0 then
		MutedErrorFunction(`itemsPerRow must be a positive number greater than 0, received {ItemsPerRow}`)
	end
	local GapHorizontal = Frame.gapHorizontal or 0
	local config = {
		GridLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, Frame.gapVertical or 0)
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, -GapHorizontal / 2),
			PaddingRight = UDim.new(0, -GapHorizontal / 2)
		})
	}
	
	for i = 1, math.ceil(#Frame.items / ItemsPerRow) do
		local NewI = (i - 1) * ItemsPerRow + 1
		local Items = {}
		table.move(Frame.items, NewI, NewI + ItemsPerRow - 1, NewI, Items)
		config["row-" .. tostring(i)] = ReactModule.createElement(GridRow, {
			items = Items,
			itemsPerRow = ItemsPerRow,
			renderItem = Frame.renderItem,
			getItemId = Frame.getItemId,
			LayoutOrder = i,
			gapHorizontal = GapHorizontal,
			rowIndex = i
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = Frame.Size or UDim2.fromScale(1, 1),
		AutomaticSize = Frame.AutomaticSize,
		LayoutOrder = Frame.LayoutOrder,
		ref = Ref
	}, config)
end))