local TextService = game:GetService("TextService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local UIBloxConfigModule = require(Parent.UIBloxConfig)
local StateLayerModule = require(Parent.Core.Control.StateLayer)
local UseStyleModule = require(Parent.Core.Style.useStyle)
local Label = require(Parent.Core.ImageSet.ImageSetComponent).Label
local NavigationTabLayoutModule = require(Parent.App.Navigation.Enum.NavigationTabLayout)
local _ = require(Parent.App.ImageSet.ImagesTypes)
local _ = require(Parent.App.Style.StyleTypes)
local StatusIndicator = require(Parent1.Foundation).StatusIndicator
local MigrateBadgeVariantModule = require(Parent.Utility.migrateBadgeVariant)
local _Vector2 = Vector2.new(1e999, 1e999)
local config = {
	hasLabel = false,
	isChecked = false,
	badgeValue = nil,
	layout = NavigationTabLayoutModule.Stacked
}

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: CryoModule (copy), config (copy), UseStyleModule (copy), ReactModule (copy), TextService (copy), _Vector2 (copy), Label (copy), NavigationTabLayoutModule (copy), StatusIndicator (copy), MigrateBadgeVariantModule (copy), UIBloxConfigModule (copy), StateLayerModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Tokens = UseStyleModule().Tokens
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.new())
	local UseResult = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(UDim2.fromOffset(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y))
	end, {})
	local FontSize = nil
	
	if JoinResult.labelTypography then
		FontSize = JoinResult.labelTypography.FontSize
		
		if FontSize ~= nil and typeof(FontSize) ~= "number" then
			FontSize = FontSize:getValue()
		end
	end
	local UseMemoResult = ReactModule.useMemo(function(): UDim2?
		-- upvalues: JoinResult (copy), TextService (upval), FontSize (ref), _Vector2 (upval)
		if JoinResult.hasLabel and JoinResult.labelText and JoinResult.labelTypography then
			local TextSize = TextService:GetTextSize(JoinResult.labelText, FontSize, JoinResult.labelTypography.Font, _Vector2)
			
			return UDim2.new(0, TextSize.X + 2, 0, TextSize.Y + 2)
		else
			return nil
		end
	end, {
		JoinResult.hasLabel,
		JoinResult.labelText,
		JoinResult.labelTypography,
		FontSize
	})
	local _UDim2 = UDim2.fromOffset(Tokens.Global.Size_350, Tokens.Global.Size_350)
	local RenderIconResult = nil
	
	if JoinResult.renderIcon then
		RenderIconResult = JoinResult.renderIcon(JoinResult.isChecked)
	else
		local Emphasis = if JoinResult.isChecked then Tokens.Semantic.Color.Icon.Emphasis else Tokens.Semantic.Color.Icon.Default
		RenderIconResult = ReactModule.createElement(Label, {
			BackgroundTransparency = 1,
			Size = _UDim2,
			Image = if JoinResult.isChecked and JoinResult.iconCheckedImage then JoinResult.iconCheckedImage else JoinResult.iconImage,
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
		local Emphasis = if JoinResult.isChecked then Tokens.Semantic.Color.Text.Emphasis else Tokens.Semantic.Color.Text.Default
		Label1 = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = false,
			AutomaticSize = if UseMemoResult then nil else Enum.AutomaticSize.XY,
			Size = UseMemoResult,
			TextXAlignment = Enum.TextXAlignment.Center,
			Text = JoinResult.labelText,
			Font = if JoinResult.labelTypography then JoinResult.labelTypography.Font else nil,
			TextSize = if JoinResult.labelTypography then JoinResult.labelTypography.FontSize else nil,
			LineHeight = if JoinResult.labelTypography then JoinResult.labelTypography.LineHeight else nil,
			TextColor3 = Emphasis.Color3,
			TextTransparency = Emphasis.Transparency
		})
	end
	local Frame = nil
	local CornerRadius: UDim? = nil
	
	if JoinResult.layout == NavigationTabLayoutModule.Stacked then
		CornerRadius = UDim.new(0, Tokens.Semantic.Radius.Medium)
		Frame = ReactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(Tokens.Global.Space_600, Tokens.Global.Space_600),
			[ReactModule.Change.AbsoluteSize] = UseResult
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, Tokens.Global.Space_100),
				PaddingBottom = UDim.new(0, Tokens.Global.Space_100)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = if UIBloxConfigModule.removeStackedNavigationTabIconLabelSpacing then nil else UDim.new(0, Tokens.Global.Space_50)
			}),
			Icon = RenderIconResult,
			Label = Label1
		})
	elseif JoinResult.layout == NavigationTabLayoutModule.Inline then
		CornerRadius = UDim.new(0, Tokens.Semantic.Radius.Large)
		local Pressed = if JoinResult.isChecked then Tokens.Semantic.Color.State.Standard.Pressed else { Transparency = 1, Color3 = nil }
		Frame = ReactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = Pressed.Transparency,
			BackgroundColor3 = Pressed.Color3,
			Size = UDim2.fromOffset(Tokens.Global.Space_600, Tokens.Global.Space_500),
			[ReactModule.Change.AbsoluteSize] = UseResult
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, Tokens.Global.Space_50),
				PaddingBottom = UDim.new(0, Tokens.Global.Space_50),
				PaddingLeft = UDim.new(0, Tokens.Global.Space_150),
				PaddingRight = UDim.new(0, Tokens.Global.Space_150)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, Tokens.Global.Space_150)
			}),
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = CornerRadius }),
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
		Size = UseBindingResult,
		AnchorPoint = JoinResult.anchorPoint,
		Position = JoinResult.position,
		LayoutOrder = JoinResult.layoutOrder
	}, {
		Contents = Frame,
		StateLayer = ReactModule.createElement(StateLayerModule, {
			affordance = "Background",
			zIndex = 10,
			cornerRadius = CornerRadius,
			onActivated = JoinResult.onActivated,
			onStateChanged = JoinResult.onStateChanged
		})
	})
end))