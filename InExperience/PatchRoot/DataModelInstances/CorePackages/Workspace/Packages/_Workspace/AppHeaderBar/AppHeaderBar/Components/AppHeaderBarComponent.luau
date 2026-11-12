local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local TextService = game:GetService("TextService")
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local CryoModule = require(Parent1.Cryo)
local FoundationModule = require(Parent1.Foundation)
local GetTextSizeFunction = require(Parent1.Style).GetTextSize
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local UtilityActionIcon = UIBloxModule.App.Button.UtilityActionIcon
local SharedFlagsModule = require(Parent1.SharedFlags)
local FFlagEnableConsoleRobloxLogo = SharedFlagsModule.FFlagEnableConsoleRobloxLogo
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local AppHeaderBarUseSizeFull = game:DefineFastFlag("AppHeaderBarUseSizeFull", false)
local FFlagEnableClassicThemeHeaderBackground = SharedFlagsModule.FFlagEnableClassicThemeHeaderBackground
local AppHeaderBarClassicThemeBackgroundModule = if FFlagEnableClassicThemeHeaderBackground then require(script.Parent.AppHeaderBarClassicThemeBackground) else nil
local UseClassicThemeHeaderBackgroundConfigModule = if FFlagEnableClassicThemeHeaderBackground then require(script.Parent.Parent.Hooks.useClassicThemeHeaderBackgroundConfig) else nil
local _ = require(Parent.Types)
local config = {
	automaticHeight = false,
	hasDivider = false,
	onMedia = false,
	isTitleCentered = false,
	enableHeaderImageBackground = not FFlagEnableClassicThemeHeaderBackground and nil,
	utilitiesGap = UDim.new(0, 0)
}

local function BarTitle(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), NormalizeFontFaceFunction (copy), CryoModule (copy)
	local Tokens = UseStyleFunction().Tokens
	local Title = p1.title
	local TitleFont = p1.titleFont or Tokens.Typography.HeadingLarge
	local White100 = if p1.onMedia then Tokens.Color.Extended.White.White_100 else Tokens.Color.Content.Emphasis
	
	return ReactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextWrapped = true,
		LayoutOrder = p1.layoutOrder,
		Size = ReactModule.useMemo(function(): UDim2
			-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), Title (copy), TitleFont (copy), TextService (upval), Tokens (copy)
			local _Vector2 = Vector2.new(1e999, 1e999)
			local TextSize = if FoundationFontFaceMigration then GetTextSizeFunction(Title, TitleFont.FontSize, TitleFont.Font, _Vector2, { addTemporaryPadding = false }) else TextService:GetTextSize(Title, TitleFont.FontSize, TitleFont.Font, _Vector2)
			
			return UDim2.fromOffset(TextSize.X + 2, TextSize.Y + Tokens.Size.Size_50 * 2)
		end, { Title, TitleFont.FontSize, TitleFont.Font, Tokens }),
		Text = Title,
		Font = if FoundationFontFaceMigration then nil else TitleFont.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(TitleFont.Font) else nil,
		TextSize = TitleFont.FontSize,
		LineHeight = TitleFont.LineHeight,
		TextColor3 = White100.Color3,
		TextTransparency = White100.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left
	}, CryoModule.Dictionary.join(p1.children or {}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, Tokens.Size.Size_50),
			PaddingBottom = UDim.new(0, Tokens.Size.Size_50)
		})
	}))
end

local function useRenderLeft(JoinResult)
	-- upvalues: ReactModule (copy), BarTitle (copy)
	local RenderNavigationFunction = JoinResult.renderNavigation
	local Title = JoinResult.title
	local OnMedia = JoinResult.onMedia
	local TitleFontStyle = JoinResult.titleFontStyle
	local IsTitleCentered = JoinResult.isTitleCentered
	local GroupTransparencyLeft = JoinResult.groupTransparencyLeft
	
	return ReactModule.useCallback(function(p1)
		-- upvalues: ReactModule (upval), GroupTransparencyLeft (copy), RenderNavigationFunction (copy), Title (copy), IsTitleCentered (copy), BarTitle (upval), TitleFontStyle (copy), OnMedia (copy)
		return ReactModule.createElement(if GroupTransparencyLeft then "CanvasGroup" else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = if GroupTransparencyLeft then GroupTransparencyLeft.transparency else nil,
			ref = if GroupTransparencyLeft then GroupTransparencyLeft.guiObjectRef else nil,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Navigation = if RenderNavigationFunction then RenderNavigationFunction({ layoutOrder = 1 }) else nil,
			Title = if Title and not IsTitleCentered then ReactModule.createElement(BarTitle, {
				layoutOrder = 2,
				title = Title,
				titleFont = TitleFontStyle,
				onMedia = OnMedia
			}, if p1 then p1.children else nil) else nil
		})
	end, {
		RenderNavigationFunction, Title, TitleFontStyle, GroupTransparencyLeft,
		OnMedia, IsTitleCentered
	})
end

local function useRenderCenter(JoinResult)
	-- upvalues: FFlagEnableConsoleRobloxLogo (copy), ReactModule (copy), AppHeaderBarUseSizeFull (copy), BarTitle (copy)
	local RenderCenterFunction = JoinResult.renderCenter
	local Title = JoinResult.title
	local OnMedia = JoinResult.onMedia
	local TitleFontStyle = JoinResult.titleFontStyle
	local IsTitleCentered = JoinResult.isTitleCentered
	local GroupTransparencyCenter = if FFlagEnableConsoleRobloxLogo then JoinResult.groupTransparencyCenter else nil
	
	return ReactModule.useCallback(function()
		-- upvalues: RenderCenterFunction (copy), FFlagEnableConsoleRobloxLogo (upval), ReactModule (upval), GroupTransparencyCenter (copy), AppHeaderBarUseSizeFull (upval), Title (copy), IsTitleCentered (copy), BarTitle (upval), TitleFontStyle (copy), OnMedia (copy)
		return if RenderCenterFunction then if FFlagEnableConsoleRobloxLogo then ReactModule.createElement(if GroupTransparencyCenter then "CanvasGroup" else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = if GroupTransparencyCenter then GroupTransparencyCenter.transparency else nil,
			ref = if GroupTransparencyCenter then GroupTransparencyCenter.guiObjectRef else nil,
			Size = if AppHeaderBarUseSizeFull then UDim2.fromScale(1, 1) else nil,
			AutomaticSize = if AppHeaderBarUseSizeFull then nil else Enum.AutomaticSize.XY
		}, { CenterContent = RenderCenterFunction() }) else RenderCenterFunction() elseif Title and IsTitleCentered then ReactModule.createElement(BarTitle, {
			title = Title,
			titleFont = TitleFontStyle,
			onMedia = OnMedia
		}) else nil
	end, {
		RenderCenterFunction, Title, TitleFontStyle, IsTitleCentered, OnMedia,
		GroupTransparencyCenter
	})
end

local function useRenderRight(JoinResult)
	-- upvalues: ReactModule (copy), UtilityActionIcon (copy)
	local RenderUserInfoFunction = JoinResult.renderUserInfo
	local AvatarActionIcon = JoinResult.avatarActionIcon
	local SearchActionIcon = JoinResult.searchActionIcon
	local RenderUtilitiesFunction = JoinResult.renderUtilities
	local UtilitiesGap = JoinResult.utilitiesGap
	local GroupTransparencyRight = JoinResult.groupTransparencyRight
	
	return ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), GroupTransparencyRight (copy), UtilitiesGap (copy), RenderUserInfoFunction (copy), AvatarActionIcon (copy), UtilityActionIcon (upval), SearchActionIcon (copy), RenderUtilitiesFunction (copy)
		return ReactModule.createElement(if GroupTransparencyRight then "CanvasGroup" else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(0, 1),
			GroupTransparency = if GroupTransparencyRight then GroupTransparencyRight.transparency else nil,
			ref = if GroupTransparencyRight then GroupTransparencyRight.guiObjectRef else nil,
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UtilitiesGap
			}),
			UserInfo = if RenderUserInfoFunction then RenderUserInfoFunction({ layoutOrder = 1, itemsGap = UtilitiesGap }) else nil,
			Avatar = if AvatarActionIcon then ReactModule.createElement(UtilityActionIcon, {
				layoutOrder = 2,
				icon = AvatarActionIcon.icon,
				iconColor = {},
				onActivated = AvatarActionIcon.onActivated
			}) else nil,
			SearchIcon = if SearchActionIcon then ReactModule.createElement(UtilityActionIcon, {
				layoutOrder = 3,
				icon = SearchActionIcon.icon,
				onActivated = SearchActionIcon.onActivated
			}) else nil,
			Utilities = if RenderUtilitiesFunction then RenderUtilitiesFunction({ layoutOrder = 4, itemsGap = UtilitiesGap }) else nil
		})
	end, {
		RenderUserInfoFunction, AvatarActionIcon, SearchActionIcon,
		RenderUtilitiesFunction, UtilitiesGap, GroupTransparencyRight
	})
end

local function _(p1): boolean
	local AvatarActionIcon = p1.avatarActionIcon
	local SearchActionIcon = p1.searchActionIcon
	local RenderUtilities = p1.renderUtilities
	
	return if p1.renderUserInfo or AvatarActionIcon or SearchActionIcon or RenderUtilities then true else false
end

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), useRenderLeft (copy), useRenderCenter (copy), useRenderRight (copy), FFlagEnableClassicThemeHeaderBackground (copy), UseClassicThemeHeaderBackgroundConfigModule (copy), ReactModule (copy), AppHeaderBarClassicThemeBackgroundModule (copy), HeaderBar (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local BarHeight = JoinResult.barHeight
	local ZIndex = JoinResult.zIndex
	local AutomaticHeight = JoinResult.automaticHeight
	local GroupTransparency = JoinResult.groupTransparency
	local BackgroundStyle = JoinResult.backgroundStyle
	local HasDivider = JoinResult.hasDivider
	local OnMedia = JoinResult.onMedia
	local OnHeaderActivated = JoinResult.onHeaderActivated
	local PaddingLeft = JoinResult.paddingLeft
	local PaddingTop = JoinResult.paddingTop
	local PaddingRight = JoinResult.paddingRight
	local PaddingBottom = JoinResult.paddingBottom
	local Tag = JoinResult.tag
	local UseRenderLeftResult = useRenderLeft(JoinResult)
	local UseRenderCenterResult = useRenderCenter(JoinResult)
	local UseRenderRightResult = useRenderRight(JoinResult)
	local AvatarActionIcon = JoinResult.avatarActionIcon
	local SearchActionIcon = JoinResult.searchActionIcon
	local RenderUtilities = JoinResult.renderUtilities
	local v1: boolean = if JoinResult.renderUserInfo or AvatarActionIcon or SearchActionIcon or RenderUtilities then true else false
	local UseClassicThemeHeaderBackgroundConfigModuleResult = if FFlagEnableClassicThemeHeaderBackground then UseClassicThemeHeaderBackgroundConfigModule() else nil
	local HasUseClassicThemeHeaderBackgroundConfigModuleResult: boolean = FFlagEnableClassicThemeHeaderBackground and (JoinResult.enableHeaderImageBackground and UseClassicThemeHeaderBackgroundConfigModuleResult ~= nil)
	local UseResult = nil
	local UseRefResult = nil
	
	if FFlagEnableClassicThemeHeaderBackground then
		UseRefResult = ReactModule.useRef(nil)
		local GuiObjectRef = if GroupTransparency then GroupTransparency.guiObjectRef else nil
		UseResult = ReactModule.useCallback(function(Current)
			-- upvalues: UseRefResult (ref), GuiObjectRef (copy)
			UseRefResult.current = Current
			
			if type(GuiObjectRef) == "function" then
				GuiObjectRef(Current)
				
				return
			end
			if GuiObjectRef then
				GuiObjectRef.current = Current
			end
		end, { GuiObjectRef })
	end
	return ReactModule.createElement(if GroupTransparency then "CanvasGroup" else "Frame", {
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		GroupTransparency = if GroupTransparency then GroupTransparency.transparency else nil,
		ref = if FFlagEnableClassicThemeHeaderBackground then UseResult elseif GroupTransparency then GroupTransparency.guiObjectRef else nil,
		AutomaticSize = Enum.AutomaticSize.Y,
		[ReactModule.Tag] = Tag
	}, {
		HeaderImageBackground = if HasUseClassicThemeHeaderBackgroundConfigModuleResult then ReactModule.createElement(AppHeaderBarClassicThemeBackgroundModule, {
			config = UseClassicThemeHeaderBackgroundConfigModuleResult,
			containerRef = UseRefResult
		}) else nil,
		Bar = ReactModule.createElement(HeaderBar, {
			barHeight = BarHeight,
			renderLeft = UseRenderLeftResult,
			renderCenter = UseRenderCenterResult,
			renderRight = if v1 then UseRenderRightResult else nil,
			onHeaderActivated = OnHeaderActivated,
			backgroundStyle = BackgroundStyle,
			backgroundTransparency = if HasUseClassicThemeHeaderBackgroundConfigModuleResult then 1 else nil,
			isOnMedia = OnMedia,
			automaticHeight = AutomaticHeight,
			paddingLeft = PaddingLeft,
			paddingTop = PaddingTop,
			paddingRight = PaddingRight,
			paddingBottom = PaddingBottom,
			zIndex = ZIndex,
			hasDivider = HasDivider
		})
	})
end