-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:53 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local core = parent.Core
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local cryoModule = require(parent_1.Cryo)
local foundationModule = require(parent_1.Foundation)
local interactableModule = require(core.Control.Interactable)
local controlStateModule = require(core.Control.Enum.ControlState)
local getContentStyleModule = require(core.Button.getContentStyle)
local withStyleModule = require(parent.Core.Style.withStyle)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local skeleton = foundationModule.Skeleton
local iconSizeModule = require(parent.App.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent.App.ImageSet.getIconSize)
local genericTextLabelModule = require(core.Text.GenericTextLabel.GenericTextLabel)
local validateFontInfoModule = require(parent.Core.Style.Validator.validateFontInfo)
local validateImageModule = require(core.ImageSet.Validator.validateImage)
local segmentedControlTabName = roactModule.PureComponent:extend("SegmentedControlTabName")

function segmentedControlTabName.init(p0) --[[ line: 32 ]]
	-- upvalues: controlStateModule (ref)
	p0.state = { controlState = controlStateModule.Initialize }
	
	function p0.onStateChanged(p1, p2) --[[ line: 37 ]]
		-- upvalues: p0 (ref)
		p0:setState({ controlState = p2 })
		
		if p0.props.onStateChanged then
			p0.props.onStateChanged(p1, p2)
		end
	end
end

local var15 = tModule.interface({ [controlStateModule.Default] = tModule.string })
segmentedControlTabName.validateProps = tModule.interface({
	icon = tModule.optional(validateImageModule),
	text = tModule.optional(tModule.string),
	fontStyle = tModule.optional(validateFontInfoModule),
	textStateColorMap = tModule.optional(var15),
	iconStateColorMap = tModule.optional(var15),
	isDisabled = tModule.optional(tModule.boolean),
	isLoading = tModule.optional(tModule.boolean),
	onActivated = tModule.callback,
	onStateChanged = tModule.optional(tModule.callback),
	userInteractionEnabled = tModule.optional(tModule.boolean),
	isSelectedStyle = tModule.optional(tModule.boolean)
})
segmentedControlTabName.defaultProps = {
	isDisabled = false,
	isLoading = false,
	isSelectedStyle = false,
	SliceCenter = Rect.new(8, 8, 9, 9),
	textStateColorMap = {
		[controlStateModule.Default] = "TextDefault",
		[controlStateModule.Hover] = "TextEmphasis"
	},
	buttonStateColorMap = { [controlStateModule.Default] = "SecondaryContent" }
}

function segmentedControlTabName.render(p3) --[[ line: 101 ]]
	-- upvalues: withStyleModule (ref), controlStateModule (ref), getContentStyleModule (ref), roactModule (ref), skeleton (ref), imageSetComponentModule (ref), getIconSizeModule (ref), iconSizeModule (ref), genericTextLabelModule (ref), interactableModule (ref), cryoModule (ref)
	return withStyleModule(function(p4) --[[ line: 102 ]]
		-- upvalues: p3 (ref), controlStateModule (copy), getContentStyleModule (copy), roactModule (copy), skeleton (copy), imageSetComponentModule (copy), getIconSizeModule (copy), iconSizeModule (copy), genericTextLabelModule (copy), interactableModule (copy), cryoModule (copy)
		local controlState = p3.state.controlState
		local text = p3.props.text
		local icon = p3.props.icon
		local isLoading = p3.props.isLoading
		local isDisabled = p3.props.isDisabled
		local buttonStateColorMap = p3.props.buttonStateColorMap
		local contentStateColorMap = p3.props.contentStateColorMap
		local textStateColorMap = p3.props.textStateColorMap or contentStateColorMap
		local iconStateColorMap = p3.props.iconStateColorMap or contentStateColorMap
		
		if isLoading then
			isDisabled = true
		end
		local var18 = controlState
		
		if p3.props.isDisabled then
			var18 = controlStateModule.Disabled
		elseif p3.props.isSelectedStyle then
			var18 = controlStateModule.Hover
		end
		local var19 = getContentStyleModule(buttonStateColorMap, controlState, p4)
		local var20 = text and getContentStyleModule(textStateColorMap, var18, p4)
		local var21 = icon and getContentStyleModule(iconStateColorMap, controlState, p4)
		local _ = nil
		
		return roactModule.createElement(interactableModule, cryoModule.Dictionary.join(p3.props, {
			icon = cryoModule.None,
			text = cryoModule.None,
			buttonStateColorMap = cryoModule.None,
			contentStateColorMap = cryoModule.None,
			textStateColorMap = cryoModule.None,
			iconStateColorMap = cryoModule.None,
			onActivated = cryoModule.None,
			isLoading = cryoModule.None,
			isSelectedStyle = cryoModule.None,
			[roactModule.Children] = cryoModule.None,
			isDisabled = isDisabled,
			onStateChanged = p3.onStateChanged,
			userInteractionEnabled = p3.props.userInteractionEnabled,
			Image = cryoModule.None,
			ScaleType = Enum.ScaleType.Slice,
			ImageColor3 = var19.Color,
			ImageTransparency = var19.Transparency,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			[roactModule.Event.Activated] = p3.props.onActivated
		}), {
			ButtonContent = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, if isLoading then {
				isLoadingShimmer = roactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) })
			} else p3.props[roactModule.Children] or {
				UIListLayout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 5)
				}),
				Icon = icon and roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(0, getIconSizeModule(iconSizeModule.Medium), 0, getIconSizeModule(iconSizeModule.Medium)),
					Image = icon,
					ImageColor3 = var21.Color,
					ImageTransparency = var21.Transparency
				}) or nil,
				Text = text and roactModule.createElement(genericTextLabelModule, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.X,
					TextTruncate = Enum.TextTruncate.AtEnd,
					Text = text,
					fontStyle = p3.props.fontStyle or p4.Font.Header2,
					colorStyle = var20
				}) or nil
			})
		})
	end)
end

return segmentedControlTabName