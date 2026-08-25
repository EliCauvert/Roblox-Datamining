local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local toggleSwitchModule = require(parent.Components.ToggleSwitch)
local inputLabelModule = require(script.Parent.InputLabel)
local developerLockLabelModule = require(script.Parent.DeveloperLockLabel)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local withLocalizationModule = require(parent.Localization.withLocalization)
local toggleEntry = roact.PureComponent:extend("ToggleEntry")
toggleEntry.validateProps = t.strictInterface({
	LayoutOrder = t.integer,
	labelKey = t.string,
	lockedToOff = t.optional(t.boolean),
	isDisabled = t.optional(t.boolean),
	subtextEnabled = t.optional(t.boolean),
	subtextKey = t.optional(t.string),
	checked = t.boolean,
	onToggled = t.callback,
	buttonRef = t.optional(t.table),
	NextSelectionUp = t.optional(t.union(t.Instance, t.table))
})

function toggleEntry.init(p0)
	p0.state = { isSelectable = true }
end

function toggleEntry.render(p1)
	-- upvalues: roact (ref), guiService (ref), inputLabelModule (ref), developerLockLabelModule (ref), withLocalizationModule (ref), themedTextLabelModule (ref), toggleSwitchModule (ref)
	local buttonRef = p1.props.buttonRef or roact.createRef()
	
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.props.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 56),
		Selectable = p1.state.isSelectable,
		[roact.Event.SelectionGained] = function()
			-- upvalues: guiService (copy), buttonRef (ref), p1 (ref)
			guiService.SelectedCoreObject = buttonRef:getValue()
			p1:setState({ isSelectable = false })
		end
	}, {
		Padding = roact.createElement("UIPadding", {
			PaddingRight = UDim.new(0, 30),
			PaddingLeft = UDim.new(0, 24)
		}),
		ControlLabel = roact.createElement(inputLabelModule, { localizationKey = p1.props.labelKey }),
		LockedLabel = p1.props.lockedToOff and roact.createElement(developerLockLabelModule, {
			Size = UDim2.new(1, -72, 0.25, 0),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1)
		}),
		SubtextLabel = p1.props.subtextEnabled and withLocalizationModule({ text = p1.props.subtextKey })(function(p2)
			-- upvalues: roact (copy), themedTextLabelModule (copy)
			return roact.createElement(themedTextLabelModule, {
				themeKey = "TextDefault",
				fontKey = "CaptionBody",
				TextTransparency = 0.5,
				Text = p2.text,
				Size = UDim2.new(1, -72, 0.25, 0),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Bottom
			})
		end),
		Toggle = roact.createElement(toggleSwitchModule, {
			Position = UDim2.new(1, 0, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			checked = p1.props.checked and not p1.props.lockedToOff,
			onToggled = p1.props.onToggled,
			disabled = p1.props.lockedToOff or p1.props.isDisabled,
			buttonRef = buttonRef,
			onSelectionLost = function()
				-- upvalues: p1 (ref)
				p1:setState({ isSelectable = true })
			end,
			onSelectionGained = function()
				-- upvalues: p1 (ref)
				p1:setState({ isSelectable = false })
			end,
			NextSelectionUp = p1.props.NextSelectionUp
		})
	})
end

return toggleEntry