local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local otter = inGameMenuDependenciesModule.Otter
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
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

function toggleSwitch.init(p1)
	-- upvalues: roact (ref), divideTransparencyModule (ref), uDim2 (ref), uDim2_1 (ref), otter (ref)
	local var3 = if p1.props.checked then 1 else 0
	local var4, var5 = roact.createBinding(var3)
	p1.progress = var4
	p1.setProgress = var5
	p1.fillTransparency = p1.progress:map(function(p2)
		-- upvalues: divideTransparencyModule (copy), p1 (ref)
		return divideTransparencyModule(1 - p2, if p1.props.disabled then 4 else 1)
	end)
	p1.knobPosition = p1.progress:map(function(p2)
		-- upvalues: uDim2 (copy), uDim2_1 (copy)
		return uDim2:lerp(uDim2_1, p2)
	end)
	p1.motor = otter.createSingleMotor(var3)
	p1.motor:onStep(p1.setProgress)
end

function toggleSwitch.renderWithSelectionCursor(p1, p2)
	-- upvalues: withFoundationOrUIBloxStyle (ref), roact (ref), assetImageModule (ref), divideTransparencyModule (ref), var2 (ref)
	return withFoundationOrUIBloxStyle(function(p3)
		return {
			Theme = {
				SecondaryDefault = {
					Color = p3.Color.Extended.White.White_70.Color3,
					Transparency = p3.Color.Extended.White.White_70.Transparency
				},
				Success = {
					Color = p3.Color.System.Success.Color3,
					Transparency = p3.Color.System.Success.Transparency
				}
			}
		}
	end, function(p3)
		-- upvalues: roact (copy), assetImageModule (copy), p1 (ref), divideTransparencyModule (copy), p2 (ref), var2 (copy)
		return roact.createElement(assetImageModule.Button, {
			Size = UDim2.new(0, 60, 0, 36),
			BackgroundTransparency = 1,
			Position = p1.props.Position,
			LayoutOrder = p1.props.LayoutOrder,
			imageKey = "ToggleOutline",
			AnchorPoint = p1.props.AnchorPoint,
			ImageColor3 = p3.Theme.SecondaryDefault.Color,
			ImageTransparency = divideTransparencyModule(p3.Theme.SecondaryDefault.Transparency, if p1.props.disabled then 4 else 1),
			NextSelectionUp = p1.props.NextSelectionUp,
			[roact.Event.Activated] = p1.props.onToggled,
			[roact.Ref] = p1.props.buttonRef,
			[roact.Event.SelectionLost] = p1.props.onSelectionLost,
			[roact.Event.SelectionGained] = p1.props.onSelectionGained,
			SelectionImageObject = p2(var2.Toggle)
		}, {
			Fill = roact.createElement(assetImageModule.Label, {
				BackgroundTransparency = 1,
				imageKey = "ToggleFill",
				Size = UDim2.new(1, 0, 1, 0),
				ImageColor3 = p3.Theme.Success.Color,
				ImageTransparency = p1.fillTransparency
			}),
			Knob = roact.createElement(assetImageModule.Label, {
				BackgroundTransparency = 1,
				imageKey = "ToggleKnob",
				ZIndex = 2,
				Size = UDim2.new(0, 42, 0, 42),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = p1.knobPosition,
				ImageTransparency = divideTransparencyModule(0, if p1.props.disabled then 4 else 1)
			})
		})
	end)
end

function toggleSwitch.render(p1)
	-- upvalues: var1 (ref)
	return var1(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

function toggleSwitch.didUpdate(p1)
	-- upvalues: otter (ref), t_1 (ref)
	p1.motor:setGoal(otter.spring(if p1.props.checked then 1 else 0, t_1))
end

function toggleSwitch.willUnmount(p1)
	p1.motor:destroy()
end

return toggleSwitch