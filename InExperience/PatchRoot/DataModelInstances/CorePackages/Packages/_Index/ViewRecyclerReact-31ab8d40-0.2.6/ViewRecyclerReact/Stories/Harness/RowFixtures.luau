local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
assert(ViewRecyclerReact ~= nil, "RowFixtures must be mounted under view-recycler-react")
local SignalsReactModule = require(ViewRecyclerReact.Parent.SignalsReact)
local RecyclingStatsModule = require(script.Parent.RecyclingStats)
local Module = require(ViewRecyclerReact)
local CreateElementFunction = require(ViewRecyclerReact.Parent.React).createElement
local Parts = string.split("measurement correction keeps visible content anchored while variable wrapped rows replace estimated geometry", " ")
local list = {
	"Route match resolved",
	"Background task complete",
	"Virtual range measured",
	"Query cache updated",
	"Render batch committed"
}

return {
	SimpleRow = Module.createRecyclableView(function(p1)
		-- upvalues: SignalsReactModule (copy), RecyclingStatsModule (copy), CreateElementFunction (copy)
		local UseSignalStateResult = SignalsReactModule.useSignalState(p1.itemSignal)
		local UseAssignmentResult = RecyclingStatsModule.useAssignment(UseSignalStateResult.id)
		
		return CreateElementFunction("TextLabel", {
			BorderSizePixel = 0,
			TextSize = 17,
			BackgroundColor3 = Color3.fromHSV((tonumber(UseSignalStateResult.id) or 1) % 17 / 17, 0.25, 0.9),
			Font = Enum.Font.BuilderSans,
			Size = UDim2.fromScale(1, 1),
			Text = if UseAssignmentResult == 0 then UseSignalStateResult.label else `[mount {UseAssignmentResult}] {UseSignalStateResult.label}`,
			TextColor3 = Color3.fromRGB(24, 25, 30)
		})
	end, {
		hideWhilePending = true,
		readiness = Module.RecyclableViewReadiness.ReadyOnCommit
	}),
	MeasuredRow = Module.createRecyclableView(function(p1)
		-- upvalues: SignalsReactModule (copy), RecyclingStatsModule (copy), CreateElementFunction (copy)
		local UseSignalStateResult = SignalsReactModule.useSignalState(p1.itemSignal)
		local UseAssignmentResult = RecyclingStatsModule.useAssignment(UseSignalStateResult.id)
		
		return CreateElementFunction("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			Content = CreateElementFunction("TextLabel", {
				BorderSizePixel = 0,
				TextSize = 17,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Color3.fromRGB(238, 238, 243),
				Font = Enum.Font.BuilderSans,
				Size = UDim2.fromScale(1, 0),
				Text = if UseAssignmentResult == 0 then UseSignalStateResult.label else `[mount {UseAssignmentResult}] {UseSignalStateResult.label}`,
				TextColor3 = Color3.fromRGB(24, 25, 30),
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Padding = CreateElementFunction("UIPadding", {
				PaddingBottom = UDim.new(0, UseSignalStateResult.gap or 0)
			})
		})
	end, {
		hideWhilePending = true,
		readiness = Module.RecyclableViewReadiness.ReadyOnCommit
	}),
	ImmediateSimpleRow = Module.createRecyclableView(function(p1)
		-- upvalues: SignalsReactModule (copy), CreateElementFunction (copy)
		return CreateElementFunction("TextLabel", {
			BorderSizePixel = 0,
			TextSize = 17,
			BackgroundColor3 = SignalsReactModule.useSignalBinding(function(p2): Color3
				-- upvalues: p1 (copy)
				return Color3.fromHSV((tonumber(p1.itemSignal(p2).id) or 1) % 17 / 17, 0.25, 0.9)
			end),
			Font = Enum.Font.BuilderSans,
			Size = UDim2.fromScale(1, 1),
			Text = SignalsReactModule.useSignalBinding(function(p2)
				-- upvalues: p1 (copy)
				return p1.itemSignal(p2).label
			end),
			TextColor3 = Color3.fromRGB(24, 25, 30)
		})
	end, {
		readiness = Module.RecyclableViewReadiness.ReadyOnAssignment
	}),
	ImmediateMeasuredRow = Module.createRecyclableView(function(p1)
		-- upvalues: SignalsReactModule (copy), CreateElementFunction (copy)
		return CreateElementFunction("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			Content = CreateElementFunction("TextLabel", {
				BorderSizePixel = 0,
				TextSize = 17,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Color3.fromRGB(238, 238, 243),
				Font = Enum.Font.BuilderSans,
				Size = UDim2.fromScale(1, 0),
				Text = SignalsReactModule.useSignalBinding(function(p2)
					-- upvalues: p1 (copy)
					return p1.itemSignal(p2).label
				end),
				TextColor3 = Color3.fromRGB(24, 25, 30),
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Padding = CreateElementFunction("UIPadding", {
				PaddingBottom = SignalsReactModule.useSignalBinding(function(p2): UDim
					-- upvalues: p1 (copy)
					return UDim.new(0, p1.itemSignal(p2).gap or 0)
				end)
			})
		})
	end, {
		readiness = Module.RecyclableViewReadiness.ReadyOnAssignment
	}),
	buildSimpleRows = function(p1, p2)
		local Buffer = table.create(p1)
		
		for i = 1, p1 do
			Buffer[i] = { id = tostring(i), label = `{p2 or "Item"} #{i}` }
		end
		return Buffer
	end,
	buildLogRows = function(p3)
		-- upvalues: list (copy)
		local Buffer = table.create(p3)
		
		for i = 1, p3 do
			Buffer[i] = {
				id = tostring(i),
				label = `#{string.format("%06d", i)}   {list[(i - 1) % #list + 1]}`
			}
		end
		return Buffer
	end,
	buildKnownVariableRows = function(p4, p5, p6)
		local Buffer = table.create(p4)
		
		for i = 1, p4 do
			Buffer[i] = {
				id = tostring(i),
				label = `Item #{i} — exact {if i % 2 == 1 then p5 else p6}px row`
			}
		end
		return Buffer
	end,
	buildMeasuredRows = function(p7, Gap)
		-- upvalues: Parts (copy)
		local _Random = Random.new(1337)
		local Buffer = table.create(p7)
		
		for i = 1, p7 do
			local NextIntegerResult = _Random:NextInteger(8, 45)
			local Buffer1 = table.create(NextIntegerResult)
			
			for i1 = 1, NextIntegerResult do
				Buffer1[i1] = Parts[_Random:NextInteger(1, #Parts)]
			end
			Buffer[i] = {
				id = tostring(i),
				label = `Item #{i}: ` .. table.concat(Buffer1, " "),
				gap = Gap
			}
		end
		return Buffer
	end,
	getItemKey = function(p8)
		return p8.id
	end
}