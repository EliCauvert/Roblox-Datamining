local textService = game:GetService("TextService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local cryoModule = require(parent_1.Cryo)
local useStyle = UIBloxModule.Core.Style.useStyle
local headerBar = UIBloxModule.App.Bar.HeaderBar
local utilityActionIcon = UIBloxModule.App.Button.UtilityActionIcon
local sharedFlagsModule = require(parent_1.SharedFlags)
local fFlagEnableConsoleRobloxLogo = sharedFlagsModule.FFlagEnableConsoleRobloxLogo
local fFlagLuaAppCompositionTopBarFullBleed = sharedFlagsModule.FFlagLuaAppCompositionTopBarFullBleed
local appHeaderBarUseSizeFull = game:DefineFastFlag("AppHeaderBarUseSizeFull", false)
local fFlagEnableClassicThemeHeaderBackground = sharedFlagsModule.FFlagEnableClassicThemeHeaderBackground
local var1 = if fFlagEnableClassicThemeHeaderBackground then require(script.Parent.AppHeaderBarClassicThemeBackground) else nil
local var2 = if fFlagEnableClassicThemeHeaderBackground then require(script.Parent.Parent.Hooks.useClassicThemeHeaderBackgroundConfig) else nil
local _ = require(parent.Types)
local t = {
	automaticHeight = false,
	hasDivider = false,
	onMedia = false,
	isTitleCentered = false,
	enableHeaderImageBackground = if fFlagEnableClassicThemeHeaderBackground then false else nil,
	utilitiesGap = UDim.new(0, 0)
}

local function BarTitle(p1)
	-- upvalues: useStyle (ref), reactModule (ref), textService (ref), cryoModule (ref)
	local tokens = useStyle().Tokens
	local layoutOrder = p1.layoutOrder
	local title = p1.title
	local titleFont = p1.titleFont or tokens.Typography.HeadingLarge
	local var3 = if p1.onMedia then tokens.Color.Extended.White.White_100 else tokens.Color.Content.Emphasis
	
	return reactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextWrapped = true,
		LayoutOrder = layoutOrder,
		Size = reactModule.useMemo(function()
			-- upvalues: textService (copy), title (ref), titleFont (ref), tokens (ref)
			local var4 = textService:GetTextSize(title, titleFont.FontSize, titleFont.Font, Vector2.new(1e999, 1e999))
			
			return UDim2.fromOffset(var4.X + 2, var4.Y + tokens.Size.Size_50 * 2)
		end, { title, titleFont.FontSize, titleFont.Font, tokens }),
		Text = title,
		Font = titleFont.Font,
		TextSize = titleFont.FontSize,
		LineHeight = titleFont.LineHeight,
		TextColor3 = var3.Color3,
		TextTransparency = var3.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left
	}, cryoModule.Dictionary.join(p1.children or {}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, tokens.Size.Size_50),
			PaddingBottom = UDim.new(0, tokens.Size.Size_50)
		})
	}))
end

local function useRenderLeft(p1)
	-- upvalues: reactModule (ref), BarTitle (ref)
	local renderNavigation = p1.renderNavigation
	local title = p1.title
	local onMedia = p1.onMedia
	local titleFontStyle = p1.titleFontStyle
	local isTitleCentered = p1.isTitleCentered
	local groupTransparencyLeft = p1.groupTransparencyLeft
	
	return reactModule.useCallback(function(p2)
		-- upvalues: reactModule (copy), groupTransparencyLeft (ref), renderNavigation (ref), title (ref), isTitleCentered (ref), BarTitle (copy), titleFontStyle (ref), onMedia (ref)
		return reactModule.createElement(if groupTransparencyLeft then "CanvasGroup" else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = if groupTransparencyLeft then groupTransparencyLeft.transparency else nil,
			ref = if groupTransparencyLeft then groupTransparencyLeft.guiObjectRef else nil,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			ListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Navigation = if renderNavigation then renderNavigation({ layoutOrder = 1 }) else nil,
			Title = if title and not isTitleCentered then reactModule.createElement(BarTitle, {
				layoutOrder = 2,
				title = title,
				titleFont = titleFontStyle,
				onMedia = onMedia
			}, if p2 then p2.children else nil) else nil
		})
	end, {
		renderNavigation, title, titleFontStyle, groupTransparencyLeft, onMedia,
		isTitleCentered
	})
end

local function useRenderCenter(p1)
	-- upvalues: fFlagEnableConsoleRobloxLogo (ref), reactModule (ref), appHeaderBarUseSizeFull (ref), BarTitle (ref)
	local renderCenter = p1.renderCenter
	local title = p1.title
	local onMedia = p1.onMedia
	local titleFontStyle = p1.titleFontStyle
	local isTitleCentered = p1.isTitleCentered
	local var3 = if fFlagEnableConsoleRobloxLogo then p1.groupTransparencyCenter else nil
	
	return reactModule.useCallback(function()
		-- upvalues: renderCenter (ref), fFlagEnableConsoleRobloxLogo (copy), reactModule (copy), var3 (ref), appHeaderBarUseSizeFull (copy), title (ref), isTitleCentered (ref), BarTitle (copy), titleFontStyle (ref), onMedia (ref)
		return if renderCenter then if fFlagEnableConsoleRobloxLogo then reactModule.createElement(if var3 then "CanvasGroup" else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = if var3 then var3.transparency else nil,
			ref = if var3 then var3.guiObjectRef else nil,
			Size = if appHeaderBarUseSizeFull then UDim2.fromScale(1, 1) else nil,
			AutomaticSize = if appHeaderBarUseSizeFull then nil else Enum.AutomaticSize.XY
		}, { CenterContent = renderCenter() }) else renderCenter() elseif title and isTitleCentered then reactModule.createElement(BarTitle, {
			title = title,
			titleFont = titleFontStyle,
			onMedia = onMedia
		}) else nil
	end, {
		renderCenter, title, titleFontStyle, isTitleCentered, onMedia, var3
	})
end

local function useRenderRight(p1)
	-- upvalues: reactModule (ref), utilityActionIcon (ref)
	local renderUserInfo = p1.renderUserInfo
	local avatarActionIcon = p1.avatarActionIcon
	local searchActionIcon = p1.searchActionIcon
	local renderUtilities = p1.renderUtilities
	local utilitiesGap = p1.utilitiesGap
	local groupTransparencyRight = p1.groupTransparencyRight
	
	return reactModule.useCallback(function()
		-- upvalues: reactModule (copy), groupTransparencyRight (ref), utilitiesGap (ref), renderUserInfo (ref), avatarActionIcon (ref), utilityActionIcon (copy), searchActionIcon (ref), renderUtilities (ref)
		return reactModule.createElement(if groupTransparencyRight then "CanvasGroup" else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(0, 1),
			GroupTransparency = if groupTransparencyRight then groupTransparencyRight.transparency else nil,
			ref = if groupTransparencyRight then groupTransparencyRight.guiObjectRef else nil,
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			ListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = utilitiesGap
			}),
			UserInfo = if renderUserInfo then renderUserInfo({ layoutOrder = 1, itemsGap = utilitiesGap }) else nil,
			Avatar = if avatarActionIcon then reactModule.createElement(utilityActionIcon, {
				layoutOrder = 2,
				icon = avatarActionIcon.icon,
				iconColor = {},
				onActivated = avatarActionIcon.onActivated
			}) else nil,
			SearchIcon = if searchActionIcon then reactModule.createElement(utilityActionIcon, {
				layoutOrder = 3,
				icon = searchActionIcon.icon,
				onActivated = searchActionIcon.onActivated
			}) else nil,
			Utilities = if renderUtilities then renderUtilities({ layoutOrder = 4, itemsGap = utilitiesGap }) else nil
		})
	end, {
		renderUserInfo, avatarActionIcon, searchActionIcon, renderUtilities,
		utilitiesGap, groupTransparencyRight
	})
end

local function _(p1)
	return p1.renderUserInfo or p1.avatarActionIcon or (p1.searchActionIcon or p1.renderUtilities)
end

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useRenderLeft (ref), useRenderCenter (ref), useRenderRight (ref), fFlagEnableClassicThemeHeaderBackground (ref), var2 (ref), reactModule (ref), fFlagLuaAppCompositionTopBarFullBleed (ref), var1 (ref), headerBar (ref)
	local var3 = cryoModule.Dictionary.join(t, p1)
	local barHeight = var3.barHeight
	local zIndex = var3.zIndex
	local automaticHeight = var3.automaticHeight
	local groupTransparency = var3.groupTransparency
	local backgroundStyle = var3.backgroundStyle
	local hasDivider = var3.hasDivider
	local onMedia = var3.onMedia
	local onHeaderActivated = var3.onHeaderActivated
	local paddingLeft = var3.paddingLeft
	local paddingTop = var3.paddingTop
	local paddingRight = var3.paddingRight
	local paddingBottom = var3.paddingBottom
	local tag = var3.tag
	local var4 = useRenderLeft(var3)
	local var5 = useRenderCenter(var3)
	local var6 = useRenderRight(var3)
	local renderUserInfo = var3.renderUserInfo
	local avatarActionIcon = var3.avatarActionIcon
	local searchActionIcon = var3.searchActionIcon
	local var7 = if renderUserInfo or avatarActionIcon or (searchActionIcon or var3.renderUtilities) then true else false
	renderUserInfo = if fFlagEnableClassicThemeHeaderBackground then var2() else nil
	avatarActionIcon = fFlagEnableClassicThemeHeaderBackground and (var3.enableHeaderImageBackground and renderUserInfo ~= nil)
	searchActionIcon = nil
	local var8 = nil
	
	if fFlagEnableClassicThemeHeaderBackground then
		var8 = reactModule.useRef(nil)
		local var9 = if groupTransparency then groupTransparency.guiObjectRef else nil
		searchActionIcon = reactModule.useCallback(function(p2)
			-- upvalues: var8 (write), var9 (ref)
			var8.current = p2
			
			if type(var9) == "function" then
				var9(p2)
				
				return
			elseif var9 then
				var9.current = p2
			end
		end, { var9 })
	end
	return reactModule.createElement(if groupTransparency then "CanvasGroup" else "Frame", {
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		GroupTransparency = if groupTransparency then groupTransparency.transparency else nil,
		ref = if fFlagEnableClassicThemeHeaderBackground then searchActionIcon elseif groupTransparency then groupTransparency.guiObjectRef else nil,
		AutomaticSize = Enum.AutomaticSize.Y,
		[reactModule.Tag] = if fFlagLuaAppCompositionTopBarFullBleed then tag else nil
	}, {
		HeaderImageBackground = if avatarActionIcon then reactModule.createElement(var1, { config = renderUserInfo, containerRef = var8 }) else nil,
		Bar = reactModule.createElement(headerBar, {
			barHeight = barHeight,
			renderLeft = var4,
			renderCenter = var5,
			renderRight = if var7 then var6 else nil,
			onHeaderActivated = onHeaderActivated,
			backgroundStyle = backgroundStyle,
			backgroundTransparency = if avatarActionIcon then 1 else nil,
			isOnMedia = onMedia,
			automaticHeight = automaticHeight,
			paddingLeft = paddingLeft,
			paddingTop = paddingTop,
			paddingRight = paddingRight,
			paddingBottom = paddingBottom,
			zIndex = zIndex,
			hasDivider = hasDivider
		})
	})
end