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
local _ = require(parent.Types)
local t = {
	automaticHeight = false,
	hasDivider = false,
	onMedia = false,
	isTitleCentered = false,
	utilitiesGap = UDim.new(0, 0)
}

local function BarTitle(p1)
	-- upvalues: useStyle (ref), reactModule (ref), textService (ref), cryoModule (ref)
	local tokens = useStyle().Tokens
	local layoutOrder = p1.layoutOrder
	local title = p1.title
	local titleFont = p1.titleFont or tokens.Typography.HeadingLarge
	local var1 = if p1.onMedia then tokens.Color.Extended.White.White_100 else tokens.Color.Content.Emphasis
	
	return reactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextWrapped = true,
		LayoutOrder = layoutOrder,
		Size = reactModule.useMemo(function()
			-- upvalues: textService (copy), title (ref), titleFont (ref), tokens (ref)
			local var2 = textService:GetTextSize(title, titleFont.FontSize, titleFont.Font, Vector2.new(1e999, 1e999))
			
			return UDim2.fromOffset(var2.X + 2, var2.Y + tokens.Size.Size_50 * 2)
		end, { title, titleFont.FontSize, titleFont.Font, tokens }),
		Text = title,
		Font = titleFont.Font,
		TextSize = titleFont.FontSize,
		LineHeight = titleFont.LineHeight,
		TextColor3 = var1.Color3,
		TextTransparency = var1.Transparency,
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
	local var1 = if fFlagEnableConsoleRobloxLogo then p1.groupTransparencyCenter else nil
	
	return reactModule.useCallback(function()
		-- upvalues: renderCenter (ref), fFlagEnableConsoleRobloxLogo (copy), reactModule (copy), var1 (ref), appHeaderBarUseSizeFull (copy), title (ref), isTitleCentered (ref), BarTitle (copy), titleFontStyle (ref), onMedia (ref)
		return if renderCenter then if fFlagEnableConsoleRobloxLogo then reactModule.createElement(if var1 then "CanvasGroup" else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = if var1 then var1.transparency else nil,
			ref = if var1 then var1.guiObjectRef else nil,
			Size = if appHeaderBarUseSizeFull then UDim2.fromScale(1, 1) else nil,
			AutomaticSize = if appHeaderBarUseSizeFull then nil else Enum.AutomaticSize.XY
		}, { CenterContent = renderCenter() }) else renderCenter() elseif title and isTitleCentered then reactModule.createElement(BarTitle, {
			title = title,
			titleFont = titleFontStyle,
			onMedia = onMedia
		}) else nil
	end, {
		renderCenter, title, titleFontStyle, isTitleCentered, onMedia, var1
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
	-- upvalues: cryoModule (ref), t (ref), useRenderLeft (ref), useRenderCenter (ref), useRenderRight (ref), reactModule (ref), fFlagLuaAppCompositionTopBarFullBleed (ref), headerBar (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local groupTransparency = var1.groupTransparency
	
	return reactModule.createElement(if groupTransparency then "CanvasGroup" else "Frame", {
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		GroupTransparency = if groupTransparency then groupTransparency.transparency else nil,
		ref = if groupTransparency then groupTransparency.guiObjectRef else nil,
		AutomaticSize = Enum.AutomaticSize.Y,
		[reactModule.Tag] = if fFlagLuaAppCompositionTopBarFullBleed then var1.tag else nil
	}, {
		Bar = reactModule.createElement(headerBar, {
			barHeight = var1.barHeight,
			renderLeft = useRenderLeft(var1),
			renderCenter = useRenderCenter(var1),
			renderRight = if if var1.renderUserInfo or var1.avatarActionIcon or (var1.searchActionIcon or var1.renderUtilities) then true else false then useRenderRight(var1) else nil,
			onHeaderActivated = var1.onHeaderActivated,
			backgroundStyle = var1.backgroundStyle,
			isOnMedia = var1.onMedia,
			automaticHeight = var1.automaticHeight,
			paddingLeft = var1.paddingLeft,
			paddingTop = var1.paddingTop,
			paddingRight = var1.paddingRight,
			paddingBottom = var1.paddingBottom,
			zIndex = var1.zIndex,
			hasDivider = var1.hasDivider
		})
	})
end