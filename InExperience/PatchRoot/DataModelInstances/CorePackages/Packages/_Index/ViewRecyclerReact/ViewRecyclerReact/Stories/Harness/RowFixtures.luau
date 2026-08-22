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
	SimpleRow = unknownModule.createRecyclableView(function(p0) --[[ line: 28 | named "SimpleRowView" ]]
		-- upvalues: unknownModule (ref), recyclingStatsModule (ref), createElement (ref)
		local var6 = unknownModule.useItemValue(p0.valueSignal)
		local var7 = recyclingStatsModule.useAssignment(var6.id)
		
		return createElement("TextLabel", {
			BorderSizePixel = 0,
			TextSize = 17,
			BackgroundColor3 = Color3.fromHSV((tonumber(var6.id) or 1) % 17 / 17, 0.25, 0.9),
			Font = Enum.Font.BuilderSans,
			Size = UDim2.fromScale(1, 1),
			Text = if var7 == 0 then var6.label else `[mount {var7}] {var6.label}`,
			TextColor3 = Color3.fromRGB(24, 25, 30)
		})
	end, { readiness = "ReadyOnCommit", hideWhilePending = true }),
	MeasuredRow = unknownModule.createRecyclableView(function(p1) --[[ line: 43 | named "MeasuredRowView" ]]
		-- upvalues: unknownModule (ref), recyclingStatsModule (ref), createElement (ref)
		local var8 = unknownModule.useItemValue(p1.valueSignal)
		local var9 = recyclingStatsModule.useAssignment(var8.id)
		
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
				Text = if var9 == 0 then var8.label else `[mount {var9}] {var8.label}`,
				TextColor3 = Color3.fromRGB(24, 25, 30),
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Padding = createElement("UIPadding", { PaddingBottom = UDim.new(0, var8.gap or 0) })
		})
	end, { readiness = "ReadyOnCommit", hideWhilePending = true }),
	ImmediateSimpleRow = unknownModule.createRecyclableView(function(p2) --[[ line: 70 | named "ImmediateSimpleRowView" ]]
		-- upvalues: unknownModule (ref), createElement (ref)
		return createElement("TextLabel", {
			BorderSizePixel = 0,
			TextSize = 17,
			BackgroundColor3 = unknownModule.useItemBinding(p2.valueSignal, function(p3) --[[ line: 71 ]]
				return Color3.fromHSV((tonumber(p3.id) or 1) % 17 / 17, 0.25, 0.9)
			end),
			Font = Enum.Font.BuilderSans,
			Size = UDim2.fromScale(1, 1),
			Text = unknownModule.useItemBinding(p2.valueSignal, function(p4) --[[ line: 74 ]]
				return p4.label
			end),
			TextColor3 = Color3.fromRGB(24, 25, 30)
		})
	end, { readiness = "ReadyOnAssignment" }),
	ImmediateMeasuredRow = unknownModule.createRecyclableView(function(p5) --[[ line: 89 | named "ImmediateMeasuredRowView" ]]
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
				Text = unknownModule.useItemBinding(p5.valueSignal, function(p6) --[[ line: 90 ]]
					return p6.label
				end),
				TextColor3 = Color3.fromRGB(24, 25, 30),
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Padding = createElement("UIPadding", {
				PaddingBottom = unknownModule.useItemBinding(p5.valueSignal, function(p7) --[[ line: 93 ]]
					return UDim.new(0, p7.gap or 0)
				end)
			})
		})
	end, { readiness = "ReadyOnAssignment" }),
	buildSimpleRows = function(p8, p9) --[[ line: 137 ]]
		local list = table.create(p8)
		
		for i = 1, p8 do
			list[i] = { id = tostring(i), label = `{p9 or "Item"} #{i}` }
		end
		return list
	end,
	buildLogRows = function(p10) --[[ line: 148 ]]
		-- upvalues: list (ref)
		local list_1 = table.create(p10)
		
		for i = 1, p10 do
			list_1[i] = {
				id = tostring(i),
				label = `#{string.format("%06d", i)}   {list[(i - 1) % #list + 1]}`
			}
		end
		return list_1
	end,
	buildKnownVariableRows = function(p11, p12, p13) --[[ line: 159 ]]
		local list = table.create(p11)
		
		for i = 1, p11 do
			list[i] = {
				id = tostring(i),
				label = `Item #{i} \226\128\148 exact {if i % 2 == 1 then p12 else p13}px row`
			}
		end
		return list
	end,
	buildMeasuredRows = function(p14, p15) --[[ line: 171 ]]
		-- upvalues: parts (ref)
		local random = Random.new(1337)
		local list = table.create(p14)
		
		for i_1 = 1, p14 do
			local var15 = random:NextInteger(8, 45)
			local list_1 = table.create(var15)
			
			for i = 1, var15 do
				list_1[i] = parts[random:NextInteger(1, #parts)]
			end
			list[i_1] = {
				id = tostring(i_1),
				label = `Item #{i_1}: ` .. table.concat(list_1, " "),
				gap = p15
			}
		end
		return list
	end,
	getItemKey = function(p16) --[[ line: 189 ]]
		return p16.id
	end
}