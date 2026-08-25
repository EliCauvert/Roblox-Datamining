local parent = script.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local core = parent_1.Core
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local cryoModule = require(parent_2.Cryo)
local foundationModule = require(parent_2.Foundation)
local interactableModule = require(core.Control.Interactable)
local controlStateModule = require(core.Control.Enum.ControlState)
local withStyleModule = require(core.Style.withStyle)
local useStyleModule = require(parent_1.Core.Style.useStyle)
local withSelectionCursorProviderModule = require(parent.SelectionImage.withSelectionCursorProvider)
local useCursorByTypeModule = require(parent.SelectionCursor.useCursorByType)
local cursorTypeModule = require(parent.SelectionCursor.CursorType)
local cursorKindModule = require(parent.SelectionImage.CursorKind)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local skeleton = foundationModule.Skeleton
local iconSizeModule = require(parent.Constant.IconSize)
local genericTextLabelModule = require(core.Text.GenericTextLabel.GenericTextLabel)
local validateImageModule = require(core.ImageSet.Validator.validateImage)
local getContentStyleModule = require(core.Button.getContentStyle)
local validateTypographyInfoModule = require(core.Style.Validator.validateTypographyInfo)
local validateColorInfoModule = require(core.Style.Validator.validateColorInfo)
local styleDefaultsModule = require(script.Parent.StyleDefaults)
local dropdownMenuCell = roactModule.PureComponent:extend("DropdownMenuCell")

local function getColorFromMap(p0, p1)
	-- upvalues: controlStateModule (ref)
	local var23 = p0[p1] or p0[controlStateModule.Default]
	
	return { Color = var23.Color, Transparency = var23.Transparency }
end

local function _(p2, p3, p4, p5, p6)
	-- upvalues: controlStateModule (ref)
	local var24 = p2(p3, p4, p5)
	
	if p4 ~= controlStateModule.Disabled and p4 ~= controlStateModule.Pressed and p6 then
		var24.Transparency = 0.5 * var24.Transparency + 0.5
	end
	return var24
end

local _ = function(p7, p8, p9, p10, p11, p12)
	-- upvalues: controlStateModule (ref)
	local var25 = p7(p8, p9, p10)
	
	if p9 ~= controlStateModule.Disabled and p9 ~= controlStateModule.Pressed and (p11 or not p12) then
		var25.Transparency = 0.5 * var25.Transparency + 0.5
	end
	return var25
end

function dropdownMenuCell.init(p13)
	-- upvalues: controlStateModule (ref)
	p13:setState({ controlState = controlStateModule.Initialize })
	
	function p13.onStateChanged(p14, p15)
		-- upvalues: p13 (ref)
		p13:setState({ controlState = p15 })
		
		if p13.props.onStateChanged then
			p13.props.onStateChanged(p14, p15)
		end
	end
end

local var22 = tModule.union(tModule.interface({ [controlStateModule.Default] = tModule.string }), tModule.interface({ [controlStateModule.Default] = validateColorInfoModule }))
dropdownMenuCell.validateProps = tModule.interface({
	icon = tModule.optional(validateImageModule),
	text = tModule.optional(tModule.string),
	textFont = tModule.optional(validateTypographyInfoModule),
	buttonImage = validateImageModule,
	buttonStateColorMap = var22,
	contentStateColorMap = var22,
	textStateColorMap = tModule.optional(var22),
	iconStateColorMap = tModule.optional(var22),
	isDisabled = tModule.optional(tModule.boolean),
	isActivated = tModule.optional(tModule.boolean),
	hasContent = tModule.optional(tModule.boolean),
	isLoading = tModule.optional(tModule.boolean),
	onActivated = tModule.callback,
	onStateChanged = tModule.optional(tModule.callback),
	userInteractionEnabled = tModule.optional(tModule.boolean),
	iconSize = tModule.optional(tModule.number),
	containerPadding = tModule.optional(tModule.strictInterface({ left = tModule.number, right = tModule.number })),
	iconTextSpacing = tModule.optional(tModule.number),
	border = tModule.optional(tModule.strictInterface({ cornerRadius = tModule.number, size = tModule.number })),
	enableTokenOverride = tModule.optional(tModule.boolean),
	selectionOrder = tModule.optional(tModule.number),
	selectionCursor = tModule.optional(tModule.any)
})
dropdownMenuCell.defaultProps = {
	isDisabled = false,
	isLoading = false,
	iconTextSpacing = 5,
	enableTokenOverride = false,
	SliceCenter = Rect.new(8, 8, 9, 9),
	iconSize = iconSizeModule.Regular,
	containerPadding = { left = 12, right = 20 },
	border = { cornerRadius = 8, size = 1 }
}

function dropdownMenuCell.render(p16)
	-- upvalues: withStyleModule (ref), withSelectionCursorProviderModule (ref), tModule (ref), cursorKindModule (ref), getColorFromMap (ref), getContentStyleModule (ref), controlStateModule (ref), roactModule (ref), skeleton (ref), genericTextLabelModule (ref), imageSetComponentModule (ref), cryoModule (ref), interactableModule (ref)
	return withStyleModule(function(p17)
		-- upvalues: withSelectionCursorProviderModule (copy), tModule (copy), p16 (ref), cursorKindModule (copy), getColorFromMap (copy), getContentStyleModule (copy), controlStateModule (copy), roactModule (copy), skeleton (copy), genericTextLabelModule (copy), imageSetComponentModule (copy), cryoModule (copy), interactableModule (copy)
		return withSelectionCursorProviderModule(function(p18)
			-- upvalues: tModule (copy), p17 (ref), p16 (copy), cursorKindModule (copy), getColorFromMap (copy), getContentStyleModule (copy), controlStateModule (copy), roactModule (copy), skeleton (copy), genericTextLabelModule (copy), imageSetComponentModule (copy), cryoModule (copy), interactableModule (copy)
			assert(tModule.table(p17), "Style provider is missing.")
			local controlState = p16.state.controlState
			local text = p16.props.text
			local icon = p16.props.icon
			local iconSize = p16.props.iconSize
			local containerPadding = p16.props.containerPadding
			local iconTextSpacing = p16.props.iconTextSpacing
			local isLoading = p16.props.isLoading
			local isDisabled = p16.props.isDisabled
			local buttonStateColorMap = p16.props.buttonStateColorMap
			local contentStateColorMap = p16.props.contentStateColorMap
			local textStateColorMap = p16.props.textStateColorMap or contentStateColorMap
			local iconStateColorMap = p16.props.iconStateColorMap or contentStateColorMap
			
			if isLoading then
				isDisabled = true
			end
			local selectionCursor = p16.props.selectionCursor or p18 and p18(cursorKindModule.RoundedRectNoInset)
			local var29 = if p16.props.enableTokenOverride then getColorFromMap else getContentStyleModule
			local var30 = var29(buttonStateColorMap, controlState, p17)
			
			if controlState ~= controlStateModule.Disabled and controlState ~= controlStateModule.Pressed and p16.props.isActivated then
				var30.Transparency = 0.5 * var30.Transparency + 0.5
			end
			local isActivated
			local var31 = text
			
			if var31 then
				isActivated = p16.props.isActivated
				local var32 = var29(textStateColorMap, controlState, p17)
				
				if controlState ~= controlStateModule.Disabled and controlState ~= controlStateModule.Pressed and (isActivated or not p16.props.hasContent) then
					var32.Transparency = 0.5 * var32.Transparency + 0.5
				end
				var31 = var32
			end
			local var33 = icon
			
			if var33 then
				local var34 = var29(iconStateColorMap, controlState, p17)
				
				if controlState ~= controlStateModule.Disabled and controlState ~= controlStateModule.Pressed and p16.props.isActivated then
					var34.Transparency = 0.5 * var34.Transparency + 0.5
				end
				var33 = var34
			end
			local uDim2, t_1, var39
			local buttonImage = p16.props.buttonImage
			isActivated = if p16.props.enableTokenOverride then p16.props.textFont else p17.Font.Header2
			local _ = nil
			local var35 = if isLoading then {
				isLoadingShimmer = roactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) })
			} else p16.props[roactModule.Children] or {
				TextContainer = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
					UIListLayout = roactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Padding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, containerPadding.left) }),
					Text = if text then roactModule.createElement(genericTextLabelModule, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						TextWrapped = false,
						Text = text,
						fontStyle = isActivated,
						colorStyle = var31,
						Size = UDim2.new(1, -(if icon ~= nil then containerPadding.right else iconSize + iconTextSpacing + containerPadding.right), 1, 0),
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Left
					}) else nil
				}),
				IconContainer = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
					UIListLayout = roactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Padding = roactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, containerPadding.right) }),
					Icon = icon and roactModule.createElement(imageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.fromOffset(iconSize, iconSize),
						Image = icon,
						ImageColor3 = var33.Color,
						ImageTransparency = var33.Transparency
					}) or nil
				})
			}
			local t = {
				isActivated = cryoModule.None,
				hasContent = cryoModule.None,
				icon = cryoModule.None,
				text = cryoModule.None,
				textFont = cryoModule.None,
				buttonImage = cryoModule.None,
				buttonStateColorMap = cryoModule.None,
				contentStateColorMap = cryoModule.None,
				textStateColorMap = cryoModule.None,
				iconStateColorMap = cryoModule.None,
				iconSize = cryoModule.None,
				containerPadding = cryoModule.None,
				iconTextSpacing = cryoModule.None,
				border = cryoModule.None,
				enableTokenOverride = cryoModule.None,
				onActivated = cryoModule.None,
				isLoading = cryoModule.None,
				[roactModule.Children] = cryoModule.None,
				isDisabled = isDisabled,
				onStateChanged = p16.onStateChanged,
				userInteractionEnabled = p16.props.userInteractionEnabled,
				ScaleType = Enum.ScaleType.Slice,
				BackgroundTransparency = 1,
				AutoButtonColor = false,
				selectionCursor = cryoModule.None,
				SelectionImageObject = selectionCursor,
				SelectionOrder = p16.props.selectionOrder,
				[roactModule.Event.Activated] = p16.props.onActivated
			}
			local _ = nil
			local _ = nil
			local _ = nil
			
			if p16.props.enableTokenOverride then
				local size = p16.props.border.size
				uDim2 = UDim2.new(1, -2 * size, 1, -2 * size)
				t_1 = {
					UIStroke = roactModule.createElement("UIStroke", {
						Color = var30.Color,
						Transparency = var30.Transparency,
						Thickness = size
					}),
					UICorner = roactModule.createElement("UICorner", {
						CornerRadius = UDim.new(0, p16.props.border.cornerRadius)
					})
				}
				var39 = cryoModule.Dictionary.join(p16.props, t)
			else
				uDim2 = UDim2.new(1, 0, 1, 0)
				t_1 = {}
				var39 = cryoModule.Dictionary.join(p16.props, {
					Image = buttonImage,
					ImageColor3 = var30.Color,
					ImageTransparency = var30.Transparency
				}, t)
			end
			return roactModule.createElement(interactableModule, var39, {
				ButtonContent = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = uDim2 }, cryoModule.Dictionary.join(t_1, var35))
			})
		end)
	end)
end

return function(p19)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), cryoModule (ref), useStyleModule (ref), styleDefaultsModule (ref), roactModule (ref), dropdownMenuCell (ref)
	return roactModule.createElement(dropdownMenuCell, if p19.enableTokenOverride then cryoModule.Dictionary.join(styleDefaultsModule.getDropdownMenuCellDefaultTokens(useStyleModule()), p19) else cryoModule.Dictionary.join(p19, {
		selectionCursor = useCursorByTypeModule(cursorTypeModule.RoundedRectNoInset)
	}))
end