local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local VirtualizedList = require(Parent1.VirtualizedList).VirtualizedList
local CryoModule = require(Parent1.Cryo)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local config = { selectable = true, size = UDim2.fromScale(1, 1) }

return function(p1) --[[ Line: 39 | Named "ScrollingListTable" ]]
	-- upvalues: WithStyleModule (copy), CryoModule (copy), config (copy), ReactModule (copy), VirtualizedList (copy)
	return WithStyleModule(function(p2) --[[ Line: 40 ]]
		-- upvalues: CryoModule (upval), config (upval), p1 (copy), ReactModule (upval), VirtualizedList (upval)
		local JoinResult = CryoModule.Dictionary.join(config, p1)
		local Data = {}
		local Cells = JoinResult.cells
		
		for LayoutOrder, cell in ipairs(Cells) do
			local Text = "Cell " .. LayoutOrder
			Data[Text] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = LayoutOrder,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Name = Text
			}, {
				Content = cell,
				Divider = LayoutOrder < #Cells and ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 100,
					Size = UDim2.new(1, -24, 0, 1),
					Position = UDim2.new(0, 24, 1, -1),
					BackgroundColor3 = p2.Theme.Divider.Color,
					BackgroundTransparency = p2.Theme.Divider.Transparency
				}) or nil
			})
		end
		return ReactModule.createElement(VirtualizedList, {
			Size = JoinResult.size,
			data = Data,
			renderItem = function(p3) --[[ Line: 70 ]]
				return p3.item
			end,
			getItemCount = function(_): number --[[ Line: 73 ]]
				-- upvalues: Cells (copy)
				return #Cells
			end,
			getItem = function(p3, p4) --[[ Line: 76 ]]
				return p3["Cell " .. tostring(p4)]
			end,
			keyExtractor = function(_, p3): string --[[ Line: 80 ]]
				return "Cell " .. tostring(p3)
			end,
			style = {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				AnchorPoint = JoinResult.anchorPoint,
				Position = JoinResult.position,
				LayoutOrder = JoinResult.layoutOrder,
				Name = JoinResult.Name or "ListTable",
				Selectable = JoinResult.selectable
			},
			contentContainerStyle = { BackgroundTransparency = 1 }
		})
	end)
end