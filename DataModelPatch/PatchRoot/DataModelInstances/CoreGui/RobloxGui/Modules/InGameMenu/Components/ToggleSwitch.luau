local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Otter = InGameMenuDependenciesModule.Otter
local T = InGameMenuDependenciesModule.t
local WithSelectionCursorProviderFunction = UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBlox.App.SelectionImage.CursorKind
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local DivideTransparencyModule = require(script.Parent.Parent.Utility.divideTransparency)
local AssetImageModule = require(script.Parent.AssetImage)
local _UDim2 = UDim2.new(0, -3, 0.5, 0)
local _UDim2_1 = UDim2.new(1, -39, 0.5, 0)
local config = { frequency = 4 }
local ToggleSwitch = Roact.PureComponent:extend("ToggleSwitch")
ToggleSwitch.validateProps = T.strictInterface({
	checked = T.boolean,
	onToggled = T.callback,
	disabled = T.optional(T.boolean),
	buttonRef = T.optional(T.union(T.callback, T.table)),
	AnchorPoint = T.optional(T.Vector2),
	LayoutOrder = T.optional(T.integer),
	Position = T.optional(T.UDim2),
	NextSelectionUp = T.optional(T.union(T.Instance, T.table)),
	onSelectionLost = T.optional(T.callback),
	onSelectionGained = T.optional(T.callback)
})

function ToggleSwitch.init(p1)
	-- upvalues: Roact (copy), DivideTransparencyModule (copy), _UDim2 (copy), _UDim2_1 (copy), Otter (copy)
	local v1: number = if p1.props.checked then 1 else 0
	p1.progress, p1.setProgress = Roact.createBinding(v1)
	p1.fillTransparency = p1.progress:map(function(p2: number)
		-- upvalues: DivideTransparencyModule (upval), p1 (copy)
		return DivideTransparencyModule(1 - p2, if p1.props.disabled then 4 else 1)
	end)
	p1.knobPosition = p1.progress:map(function(p2)
		-- upvalues: _UDim2 (upval), _UDim2_1 (upval)
		return _UDim2:lerp(_UDim2_1, p2)
	end)
	p1.motor = Otter.createSingleMotor(v1)
	p1.motor:onStep(p1.setProgress)
end

function ToggleSwitch.renderWithSelectionCursor(p1, Callback)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), AssetImageModule (copy), DivideTransparencyModule (copy), CursorKind (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Theme = {
				SecondaryDefault = {
					Color = p2.Color.Extended.White.White_70.Color3,
					Transparency = p2.Color.Extended.White.White_70.Transparency
				},
				Success = {
					Color = p2.Color.System.Success.Color3,
					Transparency = p2.Color.System.Success.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: Roact (upval), AssetImageModule (upval), p1 (copy), DivideTransparencyModule (upval), Callback (copy), CursorKind (upval)
		return Roact.createElement(AssetImageModule.Button, {
			Size = UDim2.new(0, 60, 0, 36),
			BackgroundTransparency = 1,
			Position = p1.props.Position,
			LayoutOrder = p1.props.LayoutOrder,
			imageKey = "ToggleOutline",
			AnchorPoint = p1.props.AnchorPoint,
			ImageColor3 = p2.Theme.SecondaryDefault.Color,
			ImageTransparency = DivideTransparencyModule(p2.Theme.SecondaryDefault.Transparency, if p1.props.disabled then 4 else 1),
			NextSelectionUp = p1.props.NextSelectionUp,
			[Roact.Event.Activated] = p1.props.onToggled,
			[Roact.Ref] = p1.props.buttonRef,
			[Roact.Event.SelectionLost] = p1.props.onSelectionLost,
			[Roact.Event.SelectionGained] = p1.props.onSelectionGained,
			SelectionImageObject = Callback(CursorKind.Toggle)
		}, {
			Fill = Roact.createElement(AssetImageModule.Label, {
				BackgroundTransparency = 1,
				imageKey = "ToggleFill",
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = p2.Theme.Success.Color,
				ImageTransparency = p1.fillTransparency
			}),
			Knob = Roact.createElement(AssetImageModule.Label, {
				BackgroundTransparency = 1,
				imageKey = "ToggleKnob",
				ZIndex = 2,
				Size = UDim2.new(0, 42, 0, 42),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = p1.knobPosition,
				ImageTransparency = DivideTransparencyModule(0, if p1.props.disabled then 4 else 1)
			})
		})
	end)
end

function ToggleSwitch.render(p1)
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function ToggleSwitch.didUpdate(p1)
	-- upvalues: Otter (copy), config (copy)
	p1.motor:setGoal(Otter.spring(if p1.props.checked then 1 else 0, config))
end

function ToggleSwitch.willUnmount(p1)
	p1.motor:destroy()
end

return ToggleSwitch