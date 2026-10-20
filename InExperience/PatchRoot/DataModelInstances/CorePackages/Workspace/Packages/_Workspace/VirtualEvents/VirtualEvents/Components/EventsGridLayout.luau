local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local CryoModule = require(VirtualEvents.Parent.Cryo)
local ReactModule = require(VirtualEvents.Parent.React)
local config = { numItemsShown = 1e999, itemPadding = UDim.new(0, 12) }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: JoinResult (copy), ReactModule (upval)
		local Frames = {}
		
		for i = 1, JoinResult.numItemsShown do
			Frames[i] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = i,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { Content = JoinResult.items[i] })
		end
		return Frames
	end, { JoinResult.items, JoinResult.numItemsShown })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			Padding = JoinResult.itemPadding,
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		}),
		Rows = ReactModule.createElement(ReactModule.Fragment, nil, (ReactModule.useMemo(function()
			-- upvalues: UseMemoResult (copy), ReactModule (upval), JoinResult (copy)
			local Frames = {}
			
			for i = 1, #UseMemoResult, 2 do
				local UseMemoResultEntry = UseMemoResult[i + 1]
				Frames["Row" .. math.ceil(i / 2)] = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = i
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						Padding = JoinResult.itemPadding,
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Left
					}),
					CellFrame1 = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(0.5, -JoinResult.itemPadding.Offset / 2, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Item = ReactModule.createElement(ReactModule.Fragment, nil, UseMemoResult[i])
					}),
					CellFrame2 = UseMemoResultEntry and ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(0.5, -JoinResult.itemPadding.Offset / 2, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Item = ReactModule.createElement(ReactModule.Fragment, nil, UseMemoResultEntry)
					})
				})
			end
			return Frames
		end, { JoinResult.items, UseMemoResult })))
	})
end