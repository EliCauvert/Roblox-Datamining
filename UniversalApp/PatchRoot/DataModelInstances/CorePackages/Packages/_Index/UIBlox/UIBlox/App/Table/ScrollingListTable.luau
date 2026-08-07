local parent = script.Parent.Parent.Parent
local core = parent.Core
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local virtualizedList = require(parent_1.VirtualizedList).VirtualizedList
local cryoModule = require(parent_1.Cryo)
local withStyleModule = require(core.Style.withStyle)
local t = { selectable = true, size = UDim2.fromScale(1, 1) }

return function(p0) --[[ line: 39 | named "ScrollingListTable" ]]
	-- upvalues: withStyleModule (ref), cryoModule (ref), t (ref), reactModule (ref), virtualizedList (ref)
	return withStyleModule(function(p1) --[[ line: 40 ]]
		-- upvalues: cryoModule (copy), t (copy), p0 (ref), reactModule (copy), virtualizedList (copy)
		local var4 = cryoModule.Dictionary.join(t, p0)
		local t_1 = {}
		local cells = var4.cells
		
		for i, v in ipairs(cells) do
			local text = "Cell " .. i
			t_1[text] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = i,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Name = text
			}, {
				Content = v,
				Divider = i < #cells and reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 100,
					Size = UDim2.new(1, -24, 0, 1),
					Position = UDim2.new(0, 24, 1, -1),
					BackgroundColor3 = p1.Theme.Divider.Color,
					BackgroundTransparency = p1.Theme.Divider.Transparency
				}) or nil
			})
		end
		return reactModule.createElement(virtualizedList, {
			Size = var4.size,
			data = t_1,
			renderItem = function(p2) --[[ line: 70 ]]
				return p2.item
			end,
			getItemCount = function(_) --[[ line: 73 ]]
				-- upvalues: cells (ref)
				return #cells
			end,
			getItem = function(p3, p4) --[[ line: 76 ]]
				return p3["Cell " .. tostring(p4)]
			end,
			keyExtractor = function(_, p5) --[[ line: 80 ]]
				return "Cell " .. tostring(p5)
			end,
			style = {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				AnchorPoint = var4.anchorPoint,
				Position = var4.position,
				LayoutOrder = var4.layoutOrder,
				Name = var4.Name or "ListTable",
				Selectable = var4.selectable
			},
			contentContainerStyle = { BackgroundTransparency = 1 }
		})
	end)
end