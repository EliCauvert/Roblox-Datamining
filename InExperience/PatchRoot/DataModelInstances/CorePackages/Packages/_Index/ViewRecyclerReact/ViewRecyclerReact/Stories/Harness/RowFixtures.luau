local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(viewRecyclerReact ~= nil, "RowFixtures must be mounted under view-recycler-react")
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclingStatsModule = require(script.Parent.RecyclingStats)
local unknownModule = require(viewRecyclerReact)
local createElement = reactModule.createElement
local parts = string.split("measurement correction keeps visible content anchored while variable wrapped rows replace estimated geometry", " ")
local list = {
	"Route match resolved",
	"Background task complete",
	"Virtual range measured",
	"Query cache updated",
	"Render batch committed"
}

return {
	SimpleRow = unknownModule.createRecyclableView(function(p1)
		-- upvalues: unknownModule (ref), recyclingStatsModule (ref), createElement (ref)
		local var1 = unknownModule.useItemValue(p1.valueSignal)
		local var2 = recyclingStatsModule.useAssignment(var1.id)
		
		return createElement("TextLabel", {
			BorderSizePixel = 0,
			TextSize = 17,
			BackgroundColor3 = Color3.fromHSV((tonumber(var1.id) or 1) % 17 / 17, 0.25, 0.9),
			Font = Enum.Font.BuilderSans,
			Size = UDim2.fromScale(1, 1),
			Text = if var2 == 0 then var1.label else `[mount {var2}] {var1.label}`,
			TextColor3 = Color3.fromRGB(24, 25, 30)
		})
	end, { readiness = "ReadyOnCommit", hideWhilePending = true }),
	MeasuredRow = unknownModule.createRecyclableView(function(p1)
		-- upvalues: unknownModule (ref), recyclingStatsModule (ref), createElement (ref)
		local var1 = unknownModule.useItemValue(p1.valueSignal)
		local var2 = recyclingStatsModule.useAssignment(var1.id)
		
		return createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			Content = createElement("TextLabel", {
				BorderSizePixel = 0,
				TextSize = 17,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Color3.fromRGB(238, 238, 243),
				Font = Enum.Font.BuilderSans,
				Size = UDim2.fromScale(1, 0),
				Text = if var2 == 0 then var1.label else `[mount {var2}] {var1.label}`,
				TextColor3 = Color3.fromRGB(24, 25, 30),
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Padding = createElement("UIPadding", { PaddingBottom = UDim.new(0, var1.gap or 0) })
		})
	end, { readiness = "ReadyOnCommit", hideWhilePending = true }),
	ImmediateSimpleRow = unknownModule.createRecyclableView(function(p1)
		-- upvalues: unknownModule (ref), createElement (ref)
		return createElement("TextLabel", {
			BorderSizePixel = 0,
			TextSize = 17,
			BackgroundColor3 = unknownModule.useItemBinding(p1.valueSignal, function(p2)
				return Color3.fromHSV((tonumber(p2.id) or 1) % 17 / 17, 0.25, 0.9)
			end),
			Font = Enum.Font.BuilderSans,
			Size = UDim2.fromScale(1, 1),
			Text = unknownModule.useItemBinding(p1.valueSignal, function(p2)
				return p2.label
			end),
			TextColor3 = Color3.fromRGB(24, 25, 30)
		})
	end, { readiness = "ReadyOnAssignment" }),
	ImmediateMeasuredRow = unknownModule.createRecyclableView(function(p1)
		-- upvalues: unknownModule (ref), createElement (ref)
		return createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			Content = createElement("TextLabel", {
				BorderSizePixel = 0,
				TextSize = 17,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Color3.fromRGB(238, 238, 243),
				Font = Enum.Font.BuilderSans,
				Size = UDim2.fromScale(1, 0),
				Text = unknownModule.useItemBinding(p1.valueSignal, function(p2)
					return p2.label
				end),
				TextColor3 = Color3.fromRGB(24, 25, 30),
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Padding = createElement("UIPadding", {
				PaddingBottom = unknownModule.useItemBinding(p1.valueSignal, function(p2)
					return UDim.new(0, p2.gap or 0)
				end)
			})
		})
	end, { readiness = "ReadyOnAssignment" }),
	buildSimpleRows = function(p1, p2)
		local list = table.create(p1)
		
		for i = 1, p1 do
			list[i] = { id = tostring(i), label = `{p2 or "Item"} #{i}` }
		end
		return list
	end,
	buildLogRows = function(p3)
		-- upvalues: list (ref)
		local list_1 = table.create(p3)
		
		for i = 1, p3 do
			list_1[i] = {
				id = tostring(i),
				label = `#{string.format("%06d", i)}   {list[(i - 1) % #list + 1]}`
			}
		end
		return list_1
	end,
	buildKnownVariableRows = function(p4, p5, p6)
		local list = table.create(p4)
		
		for i = 1, p4 do
			list[i] = {
				id = tostring(i),
				label = `Item #{i} \226\128\148 exact {if i % 2 == 1 then p5 else p6}px row`
			}
		end
		return list
	end,
	buildMeasuredRows = function(p7, p8)
		-- upvalues: parts (ref)
		local random = Random.new(1337)
		local list = table.create(p7)
		
		for i_1 = 1, p7 do
			local var1 = random:NextInteger(8, 45)
			local list_1 = table.create(var1)
			
			for i = 1, var1 do
				list_1[i] = parts[random:NextInteger(1, #parts)]
			end
			list[i_1] = {
				id = tostring(i_1),
				label = `Item #{i_1}: ` .. table.concat(list_1, " "),
				gap = p8
			}
		end
		return list
	end,
	getItemKey = function(p9)
		return p9.id
	end
}