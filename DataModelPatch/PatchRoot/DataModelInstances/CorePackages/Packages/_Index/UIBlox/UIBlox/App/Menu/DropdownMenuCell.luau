local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Core = Parent1.Core
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local CryoModule = require(Parent2.Cryo)
local InteractableModule = require(Core.Control.Interactable)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local WithStyleModule = require(Core.Style.withStyle)
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local WithSelectionCursorProviderModule = require(Parent.SelectionImage.withSelectionCursorProvider)
local UseCursorByTypeModule = require(Parent.SelectionCursor.useCursorByType)
local CursorTypeModule = require(Parent.SelectionCursor.CursorType)
local CursorKindModule = require(Parent.SelectionImage.CursorKind)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local Skeleton = require(Parent2.Foundation).Skeleton
local IconSizeModule = require(Parent.Constant.IconSize)
local GenericTextLabelModule = require(Core.Text.GenericTextLabel.GenericTextLabel)
local ValidateImageModule = require(Core.ImageSet.Validator.validateImage)
local GetContentStyleModule = require(Core.Button.getContentStyle)
local ValidateTypographyInfoModule = require(Core.Style.Validator.validateTypographyInfo)
local ValidateColorInfoModule = require(Core.Style.Validator.validateColorInfo)
local StyleDefaultsModule = require(script.Parent.StyleDefaults)
local DropdownMenuCell = RoactModule.PureComponent:extend("DropdownMenuCell")

local function getColorFromMap(p1, p2)
	-- upvalues: ControlStateModule (copy)
	local ColorFromMap = p1[p2] or p1[ControlStateModule.Default]
	
	return {
		Color = ColorFromMap.Color,
		Transparency = ColorFromMap.Transparency
	}
end

local function _(Callback, p1, Disabled, p2, p3)
	-- upvalues: ControlStateModule (copy)
	local CallbackResult = Callback(p1, Disabled, p2)
	
	if Disabled ~= ControlStateModule.Disabled and Disabled ~= ControlStateModule.Pressed and p3 then
		CallbackResult.Transparency = 0.5 * CallbackResult.Transparency + 0.5
	end
	return CallbackResult
end

local _ = function(Callback, p1, Disabled, p2, p3, p4)
	-- upvalues: ControlStateModule (copy)
	local CallbackResult = Callback(p1, Disabled, p2)
	
	if Disabled ~= ControlStateModule.Disabled and Disabled ~= ControlStateModule.Pressed and (p3 or not p4) then
		CallbackResult.Transparency = 0.5 * CallbackResult.Transparency + 0.5
	end
	return CallbackResult
end

function DropdownMenuCell.init(p1)
	-- upvalues: ControlStateModule (copy)
	p1:setState({ controlState = ControlStateModule.Initialize })
	
	function p1.onStateChanged(p2, ControlState)
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, ControlState)
		end
	end
end

local UnionResult = TModule.union(TModule.interface({ [ControlStateModule.Default] = TModule.string }), TModule.interface({ [ControlStateModule.Default] = ValidateColorInfoModule }))
DropdownMenuCell.validateProps = TModule.interface({
	icon = TModule.optional(ValidateImageModule),
	text = TModule.optional(TModule.string),
	textFont = TModule.optional(ValidateTypographyInfoModule),
	buttonImage = ValidateImageModule,
	buttonStateColorMap = UnionResult,
	contentStateColorMap = UnionResult,
	textStateColorMap = TModule.optional(UnionResult),
	iconStateColorMap = TModule.optional(UnionResult),
	isDisabled = TModule.optional(TModule.boolean),
	isActivated = TModule.optional(TModule.boolean),
	hasContent = TModule.optional(TModule.boolean),
	isLoading = TModule.optional(TModule.boolean),
	onActivated = TModule.callback,
	onStateChanged = TModule.optional(TModule.callback),
	userInteractionEnabled = TModule.optional(TModule.boolean),
	iconSize = TModule.optional(TModule.number),
	containerPadding = TModule.optional(TModule.strictInterface({ left = TModule.number, right = TModule.number })),
	iconTextSpacing = TModule.optional(TModule.number),
	border = TModule.optional(TModule.strictInterface({ cornerRadius = TModule.number, size = TModule.number })),
	enableTokenOverride = TModule.optional(TModule.boolean),
	selectionOrder = TModule.optional(TModule.number),
	selectionCursor = TModule.optional(TModule.any)
})
DropdownMenuCell.defaultProps = {
	isDisabled = false,
	isLoading = false,
	iconTextSpacing = 5,
	enableTokenOverride = false,
	SliceCenter = Rect.new(8, 8, 9, 9),
	iconSize = IconSizeModule.Regular,
	containerPadding = { left = 12, right = 20 },
	border = { cornerRadius = 8, size = 1 }
}

function DropdownMenuCell.render(p1)
	-- upvalues: WithStyleModule (copy), WithSelectionCursorProviderModule (copy), TModule (copy), CursorKindModule (copy), getColorFromMap (copy), GetContentStyleModule (copy), ControlStateModule (copy), RoactModule (copy), Skeleton (copy), GenericTextLabelModule (copy), ImageSetComponentModule (copy), CryoModule (copy), InteractableModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: WithSelectionCursorProviderModule (upval), TModule (upval), p1 (copy), CursorKindModule (upval), getColorFromMap (upval), GetContentStyleModule (upval), ControlStateModule (upval), RoactModule (upval), Skeleton (upval), GenericTextLabelModule (upval), ImageSetComponentModule (upval), CryoModule (upval), InteractableModule (upval)
		return WithSelectionCursorProviderModule(function(Callback)
			-- upvalues: TModule (upval), p2 (copy), p1 (upval), CursorKindModule (upval), getColorFromMap (upval), GetContentStyleModule (upval), ControlStateModule (upval), RoactModule (upval), Skeleton (upval), GenericTextLabelModule (upval), ImageSetComponentModule (upval), CryoModule (upval), InteractableModule (upval)
			assert(TModule.table(p2), "Style provider is missing.")
			local ControlState = p1.state.controlState
			local Text = p1.props.text
			local Icon = p1.props.icon
			local IconSize = p1.props.iconSize
			local ContainerPadding = p1.props.containerPadding
			local IconTextSpacing = p1.props.iconTextSpacing
			local IsLoading = p1.props.isLoading
			local IsDisabled = p1.props.isDisabled
			local ButtonStateColorMap = p1.props.buttonStateColorMap
			local ContentStateColorMap = p1.props.contentStateColorMap
			local TextStateColorMap = p1.props.textStateColorMap or ContentStateColorMap
			local IconStateColorMap = p1.props.iconStateColorMap or ContentStateColorMap
			
			if IsLoading then
				IsDisabled = true
			end
			local SelectionCursor = p1.props.selectionCursor or Callback and Callback(CursorKindModule.RoundedRectNoInset)
			local GetColorFromMap = if p1.props.enableTokenOverride then getColorFromMap else GetContentStyleModule
			local IsActivated = p1.props.isActivated
			local ColorFromMap = GetColorFromMap(ButtonStateColorMap, ControlState, p2)
			
			if ControlState ~= ControlStateModule.Disabled and ControlState ~= ControlStateModule.Pressed and IsActivated then
				ColorFromMap.Transparency = 0.5 * ColorFromMap.Transparency + 0.5
			end
			local ColorStyle = Text
			
			if ColorStyle then
				local IsActivated1 = p1.props.isActivated
				local HasContent = p1.props.hasContent
				local ColorFromMap1 = GetColorFromMap(TextStateColorMap, ControlState, p2)
				
				if ControlState ~= ControlStateModule.Disabled and ControlState ~= ControlStateModule.Pressed and (IsActivated1 or not HasContent) then
					ColorFromMap1.Transparency = 0.5 * ColorFromMap1.Transparency + 0.5
				end
				ColorStyle = ColorFromMap1
			end
			local ColorFromMap2 = Icon
			
			if ColorFromMap2 then
				local IsActivated2 = p1.props.isActivated
				local ColorFromMap3 = GetColorFromMap(IconStateColorMap, ControlState, p2)
				
				if ControlState ~= ControlStateModule.Disabled and ControlState ~= ControlStateModule.Pressed and IsActivated2 then
					ColorFromMap3.Transparency = 0.5 * ColorFromMap3.Transparency + 0.5
				end
				ColorFromMap2 = ColorFromMap3
			end
			local ButtonImage = p1.props.buttonImage
			local TextFont = if p1.props.enableTokenOverride then p1.props.textFont else p2.Font.Header2
			local Right = if Icon == nil then ContainerPadding.right else IconSize + IconTextSpacing + ContainerPadding.right
			local Config = if IsLoading then {
				isLoadingShimmer = RoactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1) })
			} else p1.props[RoactModule.Children] or {
				TextContainer = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Padding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, ContainerPadding.left) }),
					Text = if Text then RoactModule.createElement(GenericTextLabelModule, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						TextWrapped = false,
						Text = Text,
						fontStyle = TextFont,
						colorStyle = ColorStyle,
						Size = UDim2.new(1, -Right, 1, 0),
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Left
					}) else nil
				}),
				IconContainer = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Padding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, ContainerPadding.right) }),
					Icon = Icon and RoactModule.createElement(ImageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.fromOffset(IconSize, IconSize),
						Image = Icon,
						ImageColor3 = ColorFromMap2.Color,
						ImageTransparency = ColorFromMap2.Transparency
					}) or nil
				})
			}
			local config = {
				isActivated = CryoModule.None,
				hasContent = CryoModule.None,
				icon = CryoModule.None,
				text = CryoModule.None,
				textFont = CryoModule.None,
				buttonImage = CryoModule.None,
				buttonStateColorMap = CryoModule.None,
				contentStateColorMap = CryoModule.None,
				textStateColorMap = CryoModule.None,
				iconStateColorMap = CryoModule.None,
				iconSize = CryoModule.None,
				containerPadding = CryoModule.None,
				iconTextSpacing = CryoModule.None,
				border = CryoModule.None,
				enableTokenOverride = CryoModule.None,
				onActivated = CryoModule.None,
				isLoading = CryoModule.None,
				[RoactModule.Children] = CryoModule.None,
				isDisabled = IsDisabled,
				onStateChanged = p1.onStateChanged,
				userInteractionEnabled = p1.props.userInteractionEnabled,
				ScaleType = Enum.ScaleType.Slice,
				BackgroundTransparency = 1,
				AutoButtonColor = false,
				selectionCursor = CryoModule.None,
				SelectionImageObject = SelectionCursor,
				SelectionOrder = p1.props.selectionOrder,
				[RoactModule.Event.Activated] = p1.props.onActivated
			}
			local _UDim2 = nil
			local config1 = nil
			local JoinResult = nil
			
			if p1.props.enableTokenOverride then
				local Size: number = p1.props.border.size
				_UDim2 = UDim2.new(1, -2 * Size, 1, -2 * Size)
				config1 = {
					UIStroke = RoactModule.createElement("UIStroke", {
						Color = ColorFromMap.Color,
						Transparency = ColorFromMap.Transparency,
						Thickness = Size
					}),
					UICorner = RoactModule.createElement("UICorner", {
						CornerRadius = UDim.new(0, p1.props.border.cornerRadius)
					})
				}
				JoinResult = CryoModule.Dictionary.join(p1.props, config)
			else
				_UDim2 = UDim2.new(1, 0, 1, 0)
				config1 = {}
				JoinResult = CryoModule.Dictionary.join(p1.props, {
					Image = ButtonImage,
					ImageColor3 = ColorFromMap.Color,
					ImageTransparency = ColorFromMap.Transparency
				}, config)
			end
			return RoactModule.createElement(InteractableModule, JoinResult, {
				ButtonContent = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = _UDim2 }, CryoModule.Dictionary.join(config1, Config))
			})
		end)
	end)
end

return function(p1)
	-- upvalues: UseCursorByTypeModule (copy), CursorTypeModule (copy), CryoModule (copy), UseStyleModule (copy), StyleDefaultsModule (copy), RoactModule (copy), DropdownMenuCell (copy)
	return RoactModule.createElement(DropdownMenuCell, if p1.enableTokenOverride then CryoModule.Dictionary.join(StyleDefaultsModule.getDropdownMenuCellDefaultTokens((UseStyleModule())), p1) else CryoModule.Dictionary.join(p1, {
		selectionCursor = UseCursorByTypeModule(CursorTypeModule.RoundedRectNoInset)
	}))
end