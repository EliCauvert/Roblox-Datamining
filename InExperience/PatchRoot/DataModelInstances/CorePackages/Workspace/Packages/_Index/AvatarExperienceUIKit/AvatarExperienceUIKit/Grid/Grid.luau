local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local mutedError = require(parent.Loggers).mutedError
local AXDebugGridShouldErrorOnInvalidRowCount = game:DefineFastFlag("AXDebugGridShouldErrorOnInvalidRowCount", false)

local function GridRow(p1)
	-- upvalues: reactModule (ref)
	local t = {
		GridRowLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for i, v in p1.items do
		t[`item-{p1.getItemId(v)}-{i}`] = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(UDim.new(1 / p1.itemsPerRow, 0), UDim.new(0, 0)),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = i
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, p1.gapHorizontal / 2),
				PaddingRight = UDim.new(0, p1.gapHorizontal / 2)
			}),
			Content = p1.renderItem({
				item = v,
				index = (p1.rowIndex - 1) * p1.itemsPerRow + i,
				gridInformation = { row = p1.rowIndex, column = (i - 1) % p1.itemsPerRow + 1 }
			})
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.LayoutOrder
	}, t)
end

return reactModule.forwardRef(function(p2, p3)
	-- upvalues: AXDebugGridShouldErrorOnInvalidRowCount (ref), mutedError (ref), reactModule (ref), GridRow (ref)
	local var1 = if p2.itemsPerRow <= 0 then 1 else p2.itemsPerRow
	
	if AXDebugGridShouldErrorOnInvalidRowCount and p2.itemsPerRow <= 0 then
		mutedError(`itemsPerRow must be a positive number greater than 0, received {var1}`)
	end
	local gapHorizontal = p2.gapHorizontal or 0
	local t = {
		GridLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p2.gapVertical or 0)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, -gapHorizontal / 2),
			PaddingRight = UDim.new(0, -gapHorizontal / 2)
		})
	}
	
	for i = 1, math.ceil(#p2.items / var1) do
		local var2 = (i - 1) * var1 + 1
		local t_1 = {}
		table.move(p2.items, var2, var2 + var1 - 1, var2, t_1)
		t["row-" .. tostring(i)] = reactModule.createElement(GridRow, {
			items = t_1,
			itemsPerRow = var1,
			renderItem = p2.renderItem,
			getItemId = p2.getItemId,
			LayoutOrder = i,
			gapHorizontal = gapHorizontal,
			rowIndex = i
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p2.Size or UDim2.fromScale(1, 1),
		AutomaticSize = p2.AutomaticSize,
		LayoutOrder = p2.LayoutOrder,
		ref = p3
	}, t)
end)