local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local ToggleSwitchModule = require(Parent.Components.ToggleSwitch)
local InputLabelModule = require(script.Parent.InputLabel)
local DeveloperLockLabelModule = require(script.Parent.DeveloperLockLabel)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local ToggleEntry = Roact.PureComponent:extend("ToggleEntry")
ToggleEntry.validateProps = T.strictInterface({
	LayoutOrder = T.integer,
	labelKey = T.string,
	lockedToOff = T.optional(T.boolean),
	isDisabled = T.optional(T.boolean),
	subtextEnabled = T.optional(T.boolean),
	subtextKey = T.optional(T.string),
	checked = T.boolean,
	onToggled = T.callback,
	buttonRef = T.optional(T.table),
	NextSelectionUp = T.optional(T.union(T.Instance, T.table))
})

function ToggleEntry.init(p1) --[[ Line: 31 ]]
	p1.state = { isSelectable = true }
end

function ToggleEntry.render(p1) --[[ Line: 37 ]]
	-- upvalues: Roact (copy), GuiService (copy), InputLabelModule (copy), DeveloperLockLabelModule (copy), WithLocalizationModule (copy), ThemedTextLabelModule (copy), ToggleSwitchModule (copy)
	local ButtonRef = p1.props.buttonRef or Roact.createRef()
	
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.props.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 56),
		Selectable = p1.state.isSelectable,
		[Roact.Event.SelectionGained] = function() --[[ Line: 45 ]]
			-- upvalues: GuiService (upval), ButtonRef (copy), p1 (copy)
			GuiService.SelectedCoreObject = ButtonRef:getValue()
			p1:setState({ isSelectable = false })
		end
	}, {
		Padding = Roact.createElement("UIPadding", {
			PaddingRight = UDim.new(0, 30),
			PaddingLeft = UDim.new(0, 24)
		}),
		ControlLabel = Roact.createElement(InputLabelModule, { localizationKey = p1.props.labelKey }),
		LockedLabel = p1.props.lockedToOff and Roact.createElement(DeveloperLockLabelModule, {
			Size = UDim2.new(1, -72, 0.25, 0),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1)
		}),
		SubtextLabel = p1.props.subtextEnabled and WithLocalizationModule({ text = p1.props.subtextKey })(function(p2) --[[ Line: 66 ]]
			-- upvalues: Roact (upval), ThemedTextLabelModule (upval)
			return Roact.createElement(ThemedTextLabelModule, {
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
		Toggle = Roact.createElement(ToggleSwitchModule, {
			Position = UDim2.new(1, 0, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			checked = p1.props.checked and not p1.props.lockedToOff,
			onToggled = p1.props.onToggled,
			disabled = p1.props.lockedToOff or p1.props.isDisabled,
			buttonRef = ButtonRef,
			onSelectionLost = function() --[[ Line: 86 ]]
				-- upvalues: p1 (copy)
				p1:setState({ isSelectable = true })
			end,
			onSelectionGained = function() --[[ Line: 91 ]]
				-- upvalues: p1 (copy)
				p1:setState({ isSelectable = false })
			end,
			NextSelectionUp = p1.props.NextSelectionUp
		})
	})
end

return ToggleEntry