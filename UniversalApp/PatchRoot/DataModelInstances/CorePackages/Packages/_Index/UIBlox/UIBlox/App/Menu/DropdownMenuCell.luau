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

local function getColorFromMap(p1, p2)
	-- upvalues: controlStateModule (ref)
	local var1 = p1[p2] or p1[controlStateModule.Default]
	
	return { Color = var1.Color, Transparency = var1.Transparency }
end

local function _(p1, p2, p3, p4, p5)
	-- upvalues: controlStateModule (ref)
	local var1 = p1(p2, p3, p4)
	
	if p3 ~= controlStateModule.Disabled and p3 ~= controlStateModule.Pressed and p5 then
		var1.Transparency = 0.5 * var1.Transparency + 0.5
	end
	return var1
end

local _ = function(p1, p2, p3, p4, p5, p6)
	-- upvalues: controlStateModule (ref)
	local var1 = p1(p2, p3, p4)
	
	if p3 ~= controlStateModule.Disabled and p3 ~= controlStateModule.Pressed and (p5 or not p6) then
		var1.Transparency = 0.5 * var1.Transparency + 0.5
	end
	return var1
end

function dropdownMenuCell.init(p1)
	-- upvalues: controlStateModule (ref)
	p1:setState({ controlState = controlStateModule.Initialize })
	
	function p13.onStateChanged(p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p3 })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, p3)
		end
	end
end

local var1 = tModule.union(tModule.interface({ [controlStateModule.Default] = tModule.string }), tModule.interface({ [controlStateModule.Default] = validateColorInfoModule }))
dropdownMenuCell.validateProps = tModule.interface({
	icon = tModule.optional(validateImageModule),
	text = tModule.optional(tModule.string),
	textFont = tModule.optional(validateTypographyInfoModule),
	buttonImage = validateImageModule,
	buttonStateColorMap = var1,
	contentStateColorMap = var1,
	textStateColorMap = tModule.optional(var1),
	iconStateColorMap = tModule.optional(var1),
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

function dropdownMenuCell.render(p1)
	-- upvalues: withStyleModule (ref), withSelectionCursorProviderModule (ref), tModule (ref), cursorKindModule (ref), getColorFromMap (ref), getContentStyleModule (ref), controlStateModule (ref), roactModule (ref), skeleton (ref), genericTextLabelModule (ref), imageSetComponentModule (ref), cryoModule (ref), interactableModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: withSelectionCursorProviderModule (copy), tModule (copy), p1 (ref), cursorKindModule (copy), getColorFromMap (copy), getContentStyleModule (copy), controlStateModule (copy), roactModule (copy), skeleton (copy), genericTextLabelModule (copy), imageSetComponentModule (copy), cryoModule (copy), interactableModule (copy)
		return withSelectionCursorProviderModule(function(p3)
			-- upvalues: tModule (copy), p2 (ref), p1 (copy), cursorKindModule (copy), getColorFromMap (copy), getContentStyleModule (copy), controlStateModule (copy), roactModule (copy), skeleton (copy), genericTextLabelModule (copy), imageSetComponentModule (copy), cryoModule (copy), interactableModule (copy)
			assert(tModule.table(p2), "Style provider is missing.")
			local controlState = p1.state.controlState
			local text = p1.props.text
			local icon = p1.props.icon
			local iconSize = p1.props.iconSize
			local containerPadding = p1.props.containerPadding
			local iconTextSpacing = p1.props.iconTextSpacing
			local isLoading = p1.props.isLoading
			local isDisabled = p1.props.isDisabled
			local buttonStateColorMap = p1.props.buttonStateColorMap
			local contentStateColorMap = p1.props.contentStateColorMap
			local textStateColorMap = p1.props.textStateColorMap or contentStateColorMap
			local iconStateColorMap = p1.props.iconStateColorMap or contentStateColorMap
			
			if isLoading then
				isDisabled = true
			end
			local selectionCursor = p1.props.selectionCursor or p3 and p3(cursorKindModule.RoundedRectNoInset)
			local var2 = if p1.props.enableTokenOverride then getColorFromMap else getContentStyleModule
			local var3 = var2(buttonStateColorMap, controlState, p2)
			
			if controlState ~= controlStateModule.Disabled and controlState ~= controlStateModule.Pressed and p1.props.isActivated then
				var3.Transparency = 0.5 * var3.Transparency + 0.5
			end
			local isActivated
			local var4 = text
			
			if var4 then
				isActivated = p1.props.isActivated
				local var5 = var2(textStateColorMap, controlState, p2)
				
				if controlState ~= controlStateModule.Disabled and controlState ~= controlStateModule.Pressed and (isActivated or not p1.props.hasContent) then
					var5.Transparency = 0.5 * var5.Transparency + 0.5
				end
				var4 = var5
			end
			local var6 = icon
			
			if var6 then
				local var7 = var2(iconStateColorMap, controlState, p2)
				
				if controlState ~= controlStateModule.Disabled and controlState ~= controlStateModule.Pressed and p1.props.isActivated then
					var7.Transparency = 0.5 * var7.Transparency + 0.5
				end
				var6 = var7
			end
			local uDim2, t_1, var8
			local buttonImage = p1.props.buttonImage
			isActivated = if p1.props.enableTokenOverride then p1.props.textFont else p2.Font.Header2
			local _ = nil
			local var9 = if isLoading then {
				isLoadingShimmer = roactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) })
			} else p1.props[roactModule.Children] or {
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
						colorStyle = var4,
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
						ImageColor3 = var6.Color,
						ImageTransparency = var6.Transparency
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
				onStateChanged = p1.onStateChanged,
				userInteractionEnabled = p1.props.userInteractionEnabled,
				ScaleType = Enum.ScaleType.Slice,
				BackgroundTransparency = 1,
				AutoButtonColor = false,
				selectionCursor = cryoModule.None,
				SelectionImageObject = selectionCursor,
				SelectionOrder = p1.props.selectionOrder,
				[roactModule.Event.Activated] = p1.props.onActivated
			}
			local _ = nil
			local _ = nil
			local _ = nil
			
			if p1.props.enableTokenOverride then
				local size = p1.props.border.size
				uDim2 = UDim2.new(1, -2 * size, 1, -2 * size)
				t_1 = {
					UIStroke = roactModule.createElement("UIStroke", {
						Color = var3.Color,
						Transparency = var3.Transparency,
						Thickness = size
					}),
					UICorner = roactModule.createElement("UICorner", {
						CornerRadius = UDim.new(0, p1.props.border.cornerRadius)
					})
				}
				var8 = cryoModule.Dictionary.join(p1.props, t)
			else
				uDim2 = UDim2.new(1, 0, 1, 0)
				t_1 = {}
				var8 = cryoModule.Dictionary.join(p1.props, {
					Image = buttonImage,
					ImageColor3 = var3.Color,
					ImageTransparency = var3.Transparency
				}, t)
			end
			return roactModule.createElement(interactableModule, var8, {
				ButtonContent = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = uDim2 }, cryoModule.Dictionary.join(t_1, var9))
			})
		end)
	end)
end

return function(p1)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), cryoModule (ref), useStyleModule (ref), styleDefaultsModule (ref), roactModule (ref), dropdownMenuCell (ref)
	return roactModule.createElement(dropdownMenuCell, if p1.enableTokenOverride then cryoModule.Dictionary.join(styleDefaultsModule.getDropdownMenuCellDefaultTokens(useStyleModule()), p1) else cryoModule.Dictionary.join(p1, {
		selectionCursor = useCursorByTypeModule(cursorTypeModule.RoundedRectNoInset)
	}))
end