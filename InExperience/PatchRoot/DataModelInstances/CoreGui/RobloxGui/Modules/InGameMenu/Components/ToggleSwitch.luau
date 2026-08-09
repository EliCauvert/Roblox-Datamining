local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local otter = inGameMenuDependenciesModule.Otter
local t = inGameMenuDependenciesModule.t
local withStyle = UIBlox.Core.Style.withStyle
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local divideTransparencyModule = require(script.Parent.Parent.Utility.divideTransparency)
local assetImageModule = require(script.Parent.AssetImage)
local uDim2 = UDim2.new(0, -3, 0.5, 0)
local uDim2_1 = UDim2.new(1, -39, 0.5, 0)
local t_1 = { frequency = 4 }
local toggleSwitch = roact.PureComponent:extend("ToggleSwitch")
toggleSwitch.validateProps = t.strictInterface({
	checked = t.boolean,
	onToggled = t.callback,
	disabled = t.optional(t.boolean),
	buttonRef = t.optional(t.union(t.callback, t.table)),
	AnchorPoint = t.optional(t.Vector2),
	LayoutOrder = t.optional(t.integer),
	Position = t.optional(t.UDim2),
	NextSelectionUp = t.optional(t.union(t.Instance, t.table)),
	onSelectionLost = t.optional(t.callback),
	onSelectionGained = t.optional(t.callback)
})

function toggleSwitch.init(p0) --[[ line: 42 ]]
	-- upvalues: roact (ref), divideTransparencyModule (ref), uDim2 (ref), uDim2_1 (ref), otter (ref)
	local var7 = if p0.props.checked then 1 else 0
	local var8, var9 = roact.createBinding(var7)
	p0.progress = var8
	p0.setProgress = var9
	p0.fillTransparency = p0.progress:map(function(p1) --[[ line: 46 ]]
		-- upvalues: divideTransparencyModule (copy), p0 (ref)
		return divideTransparencyModule(1 - p1, if p0.props.disabled then 4 else 1)
	end)
	p0.knobPosition = p0.progress:map(function(p2) --[[ line: 50 ]]
		-- upvalues: uDim2 (copy), uDim2_1 (copy)
		return uDim2:lerp(uDim2_1, p2)
	end)
	p0.motor = otter.createSingleMotor(var7)
	p0.motor:onStep(p0.setProgress)
end

function toggleSwitch.renderWithSelectionCursor(p3, p4) --[[ line: 58 ]]
	-- upvalues: withStyle (ref), roact (ref), assetImageModule (ref), divideTransparencyModule (ref), cursorKind (ref)
	return withStyle(function(p5) --[[ line: 59 ]]
		-- upvalues: roact (copy), assetImageModule (copy), p3 (ref), divideTransparencyModule (copy), p4 (ref), cursorKind (copy)
		return roact.createElement(assetImageModule.Button, {
			Size = UDim2.new(0, 60, 0, 36),
			BackgroundTransparency = 1,
			Position = p3.props.Position,
			LayoutOrder = p3.props.LayoutOrder,
			imageKey = "ToggleOutline",
			AnchorPoint = p3.props.AnchorPoint,
			ImageColor3 = p5.Theme.SecondaryDefault.Color,
			ImageTransparency = divideTransparencyModule(p5.Theme.SecondaryDefault.Transparency, if p3.props.disabled then 4 else 1),
			NextSelectionUp = p3.props.NextSelectionUp,
			[roact.Event.Activated] = p3.props.onToggled,
			[roact.Ref] = p3.props.buttonRef,
			[roact.Event.SelectionLost] = p3.props.onSelectionLost,
			[roact.Event.SelectionGained] = p3.props.onSelectionGained,
			SelectionImageObject = p4(cursorKind.Toggle)
		}, {
			Fill = roact.createElement(assetImageModule.Label, {
				BackgroundTransparency = 1,
				imageKey = "ToggleFill",
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = p5.Theme.Success.Color,
				ImageTransparency = p3.fillTransparency
			}),
			Knob = roact.createElement(assetImageModule.Label, {
				BackgroundTransparency = 1,
				imageKey = "ToggleKnob",
				ZIndex = 2,
				Size = UDim2.new(0, 42, 0, 42),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = p3.knobPosition,
				ImageTransparency = divideTransparencyModule(0, if p3.props.disabled then 4 else 1)
			})
		})
	end)
end

function toggleSwitch.render(p6) --[[ line: 99 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p7) --[[ line: 100 ]]
		-- upvalues: p6 (ref)
		return p6:renderWithSelectionCursor(p7)
	end)
end

function toggleSwitch.didUpdate(p8) --[[ line: 105 ]]
	-- upvalues: otter (ref), t_1 (ref)
	p8.motor:setGoal(otter.spring(if p8.props.checked then 1 else 0, t_1))
end

function toggleSwitch.willUnmount(p9) --[[ line: 110 ]]
	p9.motor:destroy()
end

return toggleSwitch