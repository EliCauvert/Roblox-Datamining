local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local mutedError = require(parent.Loggers).mutedError
local AXDebugGridShouldErrorOnInvalidRowCount = game:DefineFastFlag("AXDebugGridShouldErrorOnInvalidRowCount", false)

local function GridRow(p0)
	-- upvalues: reactModule (ref)
	local t = {
		GridRowLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	for i, v in p0.items do
		t[`item-{p0.getItemId(v)}-{i}`] = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(UDim.new(1 / p0.itemsPerRow, 0), UDim.new(0, 0)),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = i
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, p0.gapHorizontal / 2),
				PaddingRight = UDim.new(0, p0.gapHorizontal / 2)
			}),
			Content = p0.renderItem({
				item = v,
				index = (p0.rowIndex - 1) * p0.itemsPerRow + i,
				gridInformation = { row = p0.rowIndex, column = (i - 1) % p0.itemsPerRow + 1 }
			})
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.LayoutOrder
	}, t)
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: AXDebugGridShouldErrorOnInvalidRowCount (ref), mutedError (ref), reactModule (ref), GridRow (ref)
	local var4 = if p1.itemsPerRow <= 0 then 1 else p1.itemsPerRow
	
	if AXDebugGridShouldErrorOnInvalidRowCount and p1.itemsPerRow <= 0 then
		mutedError(`itemsPerRow must be a positive number greater than 0, received {var4}`)
	end
	local gapHorizontal = p1.gapHorizontal or 0
	local t = {
		GridLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p1.gapVertical or 0)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, -gapHorizontal / 2),
			PaddingRight = UDim.new(0, -gapHorizontal / 2)
		})
	}
	
	for i = 1, math.ceil(#p1.items / var4) do
		local var7 = (i - 1) * var4 + 1
		local t_1 = {}
		table.move(p1.items, var7, var7 + var4 - 1, var7, t_1)
		t["row-" .. tostring(i)] = reactModule.createElement(GridRow, {
			items = t_1,
			itemsPerRow = var4,
			renderItem = p1.renderItem,
			getItemId = p1.getItemId,
			LayoutOrder = i,
			gapHorizontal = gapHorizontal,
			rowIndex = i
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.Size or UDim2.fromScale(1, 1),
		AutomaticSize = p1.AutomaticSize,
		LayoutOrder = p1.LayoutOrder,
		ref = p2
	}, t)
end)