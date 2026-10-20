local TextService = game:GetService("TextService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local FoundationModule = require(Parent1.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UIBloxConfigModule = require(Parent.UIBloxConfig)
local LoggerModule = require(Parent.Logger)
local ControlStateModule = require(Parent.Core.Control.Enum.ControlState)
local StateLayerModule = require(Parent.Core.Control.StateLayer)
local UseStyleModule = require(Parent.Core.Style.useStyle)
local Label = require(Parent.Core.ImageSet.ImageSetComponent).Label
local NavigationTabLayoutModule = require(Parent.App.Navigation.Enum.NavigationTabLayout)
local _ = require(Parent.App.ImageSet.ImagesTypes)
local _ = require(Parent.App.Style.StyleTypes)
local GetTextSizeModule = require(Parent.Core.Text.GetTextSize)
local IsBuilderIconFunction = FoundationModule.Utility.isBuilderIcon
local InputSize = FoundationModule.Enums.InputSize
local Radius = FoundationModule.Enums.Radius
local Icon = FoundationModule.Icon
local Popover = FoundationModule.Popover
local StatusIndicator = FoundationModule.StatusIndicator
local Text = FoundationModule.Text
local View = FoundationModule.View
local MigrateBadgeVariantModule = require(Parent.Utility.migrateBadgeVariant)
local _Vector2 = Vector2.new(1e999, 1e999)
local config = {
	hasLabel = false,
	isChecked = false,
	badgeValue = nil,
	layout = NavigationTabLayoutModule.Stacked,
	tooltipSide = FoundationModule.Enums.PopoverSide.Right,
	tooltipAlign = FoundationModule.Enums.PopoverAlign.Center
}

local function NavigationTabTooltip(p1)
	-- upvalues: UseStyleModule (copy), ReactModule (copy), Popover (copy), Radius (copy), View (copy), Text (copy)
	local Tokens = UseStyleModule().Tokens
	
	return ReactModule.createElement(Popover.Root, { isOpen = p1.isOpen }, {
		Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = ReactModule.createElement(Popover.Content, {
			hasArrow = false,
			selectionGroup = false,
			align = p1.align,
			side = {
				position = p1.side,
				offset = p1.offset or Tokens.Size.Size_200
			},
			radius = Radius.Small,
			backgroundStyle = Tokens.Inverse.Surface.Surface_0
		}, ReactModule.createElement(View, { tag = "auto-xy padding-x-small padding-y-xsmall" }, {
			Title = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-small content-inverse-emphasis",
				Text = p1.labelText
			})
		}))
	})
end

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: CryoModule (copy), config (copy), UseStyleModule (copy), UIBloxConfigModule (copy), NavigationTabLayoutModule (copy), ReactModule (copy), LoggerModule (copy), ControlStateModule (copy), FoundationFontFaceMigration (copy), GetTextSizeModule (copy), _Vector2 (copy), TextService (copy), IsBuilderIconFunction (copy), View (copy), Icon (copy), InputSize (copy), Label (copy), StatusIndicator (copy), MigrateBadgeVariantModule (copy), NormalizeFontFaceFunction (copy), StateLayerModule (copy), NavigationTabTooltip (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Tokens = UseStyleModule().Tokens
	local HasWidth: boolean = UIBloxConfigModule.addNavigationTabTooltipAndTruncation and (JoinResult.layout == NavigationTabLayoutModule.Stacked and (JoinResult.width ~= nil or JoinResult.fillWidth == true))
	local Scale = if JoinResult.width then JoinResult.width.Scale else 0
	local Offset = if JoinResult.width then JoinResult.width.Offset else 0
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult (copy), HasWidth (copy), UseBindingResult2 (copy)
		local AbsoluteSize = Frame.AbsoluteSize
		local Value = UseBindingResult:getValue()
		
		if if HasWidth then Value.Y ~= AbsoluteSize.Y else Value ~= AbsoluteSize then
			UseBindingResult2(AbsoluteSize)
		end
	end, { HasWidth })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult (copy), HasWidth (copy), Scale (copy), Offset (copy)
		return UseBindingResult:map(function(Vector): UDim2
			-- upvalues: HasWidth (upval), Scale (upval), Offset (upval)
			return if HasWidth then UDim2.new(Scale, Offset, 0, Vector.Y) else UDim2.fromOffset(Vector.X, Vector.Y)
		end)
	end, { HasWidth, Scale, Offset })
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local HasLabelText: boolean = UIBloxConfigModule.addNavigationTabTooltipAndTruncation and (JoinResult.enableTooltip and (JoinResult.layout == NavigationTabLayoutModule.Stacked and (JoinResult.hasLabel and JoinResult.labelText ~= nil)))
	
	if UIBloxConfigModule.addNavigationTabTooltipAndTruncation and JoinResult.enableTooltip and (not JoinResult.hasLabel or JoinResult.labelText == nil) then
		LoggerModule:warning("NavigationTab enableTooltip requires hasLabel and labelText")
	end
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy)
		if UseRefResult1.current then
			task.cancel(UseRefResult1.current)
			UseRefResult1.current = nil
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy)
		return UseResult1
	end, { UseResult1 })
	local UseResult2 = ReactModule.useCallback(function(p2, Hover)
		-- upvalues: JoinResult (copy), HasLabelText (copy), UseResult1 (copy), ControlStateModule (upval), UseStateResult2 (copy), Tokens (copy), UseRefResult1 (copy)
		if JoinResult.onStateChanged then
			JoinResult.onStateChanged(p2, Hover)
		end
		if not HasLabelText then return end
		UseResult1()
		
		if Hover == ControlStateModule.Hover or Hover == ControlStateModule.Selected or Hover == ControlStateModule.SelectedPressed then
			local Current = nil
			Current = task.delay(Tokens.Time.Time_500, function()
				-- upvalues: UseRefResult1 (upval), Current (ref), UseStateResult2 (upval)
				if UseRefResult1.current == Current then
					UseRefResult1.current = nil
					UseStateResult2(true)
					
					return
				end
			end)
			UseRefResult1.current = Current
			
			return
		else
			UseStateResult2(false)
		end
	end, {
		JoinResult.onStateChanged,
		HasLabelText,
		UseResult1,
		Tokens.Time.Time_500
	})
	local FontSize = nil
	
	if JoinResult.labelTypography then
		FontSize = JoinResult.labelTypography.FontSize
		
		if FontSize ~= nil and typeof(FontSize) ~= "number" then
			FontSize = FontSize:getValue()
		end
	end
	local UseMemoResult1 = ReactModule.useMemo(function(): UDim2?
		-- upvalues: JoinResult (copy), FoundationFontFaceMigration (upval), GetTextSizeModule (upval), FontSize (ref), _Vector2 (upval), TextService (upval)
		if JoinResult.hasLabel and JoinResult.labelText and JoinResult.labelTypography then
			local TextSizeModule = if FoundationFontFaceMigration then GetTextSizeModule(JoinResult.labelText, FontSize, JoinResult.labelTypography.Font, _Vector2) else TextService:GetTextSize(JoinResult.labelText, FontSize, JoinResult.labelTypography.Font, _Vector2)
			
			return UDim2.new(0, TextSizeModule.X + 2, 0, TextSizeModule.Y + 2)
		else
			return nil
		end
	end, {
		JoinResult.hasLabel,
		JoinResult.labelText,
		JoinResult.labelTypography,
		FontSize
	})
	local _UDim2 = UDim2.fromOffset(Tokens.Size.Size_700, Tokens.Size.Size_700)
	local RenderIconResult = nil
	
	if JoinResult.renderIcon then
		RenderIconResult = JoinResult.renderIcon(JoinResult.isChecked)
	else
		local IconCheckedImage = if JoinResult.isChecked and JoinResult.iconCheckedImage then JoinResult.iconCheckedImage else JoinResult.iconImage
		local Emphasis = if JoinResult.isChecked then Tokens.Color.Content.Emphasis else Tokens.Color.Content.Default
		local Name = nil
		local Variant = nil
		
		if UIBloxConfigModule.addFoundationNavigationTabIcon then
			if typeof(IconCheckedImage) == "string" then
				if IsBuilderIconFunction(IconCheckedImage) then
					Name = IconCheckedImage
				end
			elseif typeof(IconCheckedImage) == "table" and IconCheckedImage.name ~= nil and IsBuilderIconFunction(IconCheckedImage.name) then
				Name = IconCheckedImage.name
				Variant = IconCheckedImage.variant
			end
		end
		RenderIconResult = if UIBloxConfigModule.addFoundationNavigationTabIcon and Name ~= nil then ReactModule.createElement(View, { tag = "size-0-0 auto-xy padding-xxsmall" }, {
			Icon = ReactModule.createElement(Icon, {
				name = Name,
				size = InputSize.Large,
				variant = Variant,
				style = Emphasis
			})
		}) else ReactModule.createElement(Label, {
			BackgroundTransparency = 1,
			Size = _UDim2,
			Image = IconCheckedImage,
			ScaleType = Enum.ScaleType.Fit,
			ImageColor3 = Emphasis.Color3,
			ImageTransparency = Emphasis.Transparency
		})
	end
	if JoinResult.layout == NavigationTabLayoutModule.Stacked and JoinResult.badgeValue ~= nil then
		RenderIconResult = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = _UDim2
		}, {
			Icon = RenderIconResult,
			Badge = ReactModule.createElement(StatusIndicator, {
				Position = UDim2.fromScale(1, 0),
				AnchorPoint = Vector2.new(0.6, 0.35),
				value = tonumber(JoinResult.badgeValue),
				variant = MigrateBadgeVariantModule(JoinResult.badgeVariant),
				max = if tonumber(JoinResult.badgeValue) then 99 else nil
			})
		})
	end
	local Label1 = nil
	
	if JoinResult.hasLabel and JoinResult.labelText then
		local Emphasis = if JoinResult.isChecked then Tokens.Color.Content.Emphasis else Tokens.Color.Content.Default
		Label1 = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = false,
			AutomaticSize = if HasWidth then Enum.AutomaticSize.Y elseif UseMemoResult1 then nil else Enum.AutomaticSize.XY,
			Size = if HasWidth then UDim2.fromScale(1, 0) else UseMemoResult1,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextTruncate = if HasWidth then Enum.TextTruncate.AtEnd else nil,
			Text = JoinResult.labelText,
			Font = if FoundationFontFaceMigration or JoinResult.labelTypography == nil then nil else JoinResult.labelTypography.Font,
			FontFace = if FoundationFontFaceMigration and JoinResult.labelTypography then NormalizeFontFaceFunction(JoinResult.labelTypography.Font) else nil,
			TextSize = if JoinResult.labelTypography then JoinResult.labelTypography.FontSize else nil,
			LineHeight = if JoinResult.labelTypography then JoinResult.labelTypography.LineHeight else nil,
			TextColor3 = Emphasis.Color3,
			TextTransparency = Emphasis.Transparency
		}, {
			UITextSizeConstraint = if UIBloxConfigModule.addNavigationTabTooltipAndTruncation and JoinResult.labelMaxTextSize then ReactModule.createElement("UITextSizeConstraint", { MaxTextSize = JoinResult.labelMaxTextSize }) else nil
		})
	end
	local Frame = nil
	local _UDim: UDim? = nil
	
	if JoinResult.layout == NavigationTabLayoutModule.Stacked then
		_UDim = UDim.new(0, Tokens.Radius.Medium)
		local Size1200 = Tokens.Size.Size_1200
		Frame = ReactModule.createElement("Frame", {
			AutomaticSize = if HasWidth then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			Size = if HasWidth then UDim2.new(1, 0, 0, Size1200) else UDim2.fromOffset(Size1200, Size1200),
			ref = if UIBloxConfigModule.addNavigationTabTooltipAndTruncation then UseRefResult else nil,
			[ReactModule.Change.AbsoluteSize] = UseResult
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, Tokens.Size.Size_200),
				PaddingBottom = UDim.new(0, Tokens.Size.Size_200)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = if UIBloxConfigModule.removeStackedNavigationTabIconLabelSpacing then nil else UDim.new(0, Tokens.Size.Size_100)
			}),
			Icon = RenderIconResult,
			Label = Label1
		})
	elseif JoinResult.layout == NavigationTabLayoutModule.Inline then
		_UDim = UDim.new(0, Tokens.Size.Size_300)
		local Press = if JoinResult.isChecked then Tokens.Color.State.Press else { Transparency = 1, Color3 = nil }
		Frame = ReactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = Press.Transparency,
			BackgroundColor3 = Press.Color3,
			Size = UDim2.fromOffset(Tokens.Size.Size_1200, Tokens.Size.Size_1000),
			[ReactModule.Change.AbsoluteSize] = UseResult
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, Tokens.Size.Size_100),
				PaddingBottom = UDim.new(0, Tokens.Size.Size_100),
				PaddingLeft = UDim.new(0, Tokens.Size.Size_300),
				PaddingRight = UDim.new(0, Tokens.Size.Size_300)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, Tokens.Size.Size_300)
			}),
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim }),
			Icon = RenderIconResult,
			Label = Label1,
			Badge = if JoinResult.badgeValue == nil then nil else ReactModule.createElement(StatusIndicator, {
				LayoutOrder = 3,
				value = tonumber(JoinResult.badgeValue),
				variant = MigrateBadgeVariantModule(JoinResult.badgeVariant),
				max = if tonumber(JoinResult.badgeValue) then 99 else nil
			})
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = Ref,
		Size = UseMemoResult,
		AnchorPoint = JoinResult.anchorPoint,
		Position = JoinResult.position,
		LayoutOrder = JoinResult.layoutOrder
	}, {
		UIFlexItem = if UIBloxConfigModule.addNavigationTabTooltipAndTruncation and JoinResult.layout == NavigationTabLayoutModule.Stacked and JoinResult.fillWidth then ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
		Contents = Frame,
		StateLayer = ReactModule.createElement(StateLayerModule, {
			affordance = "Background",
			zIndex = 10,
			cornerRadius = _UDim,
			onActivated = JoinResult.onActivated,
			onStateChanged = if UIBloxConfigModule.addNavigationTabTooltipAndTruncation then UseResult2 else JoinResult.onStateChanged
		}),
		Tooltip = if UIBloxConfigModule.addNavigationTabTooltipAndTruncation and HasLabelText then ReactModule.createElement(NavigationTabTooltip, {
			isOpen = UseStateResult,
			anchorRef = UseRefResult,
			labelText = JoinResult.labelText,
			side = JoinResult.tooltipSide,
			align = JoinResult.tooltipAlign,
			offset = JoinResult.tooltipOffset
		}) else nil
	})
end))