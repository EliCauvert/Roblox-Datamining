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

local function BarTitle(p0) --[[ line: 39 ]]
	-- upvalues: useStyle (ref), reactModule (ref), textService (ref), cryoModule (ref)
	local tokens = useStyle().Tokens
	local layoutOrder = p0.layoutOrder
	local title = p0.title
	local titleFont = p0.titleFont or tokens.Typography.HeadingLarge
	local var12 = if p0.onMedia then tokens.Color.Extended.White.White_100 else tokens.Color.Content.Emphasis
	
	return reactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextWrapped = true,
		LayoutOrder = layoutOrder,
		Size = reactModule.useMemo(function() --[[ line: 49 ]]
			-- upvalues: textService (copy), title (ref), titleFont (ref), tokens (ref)
			local var13 = textService:GetTextSize(title, titleFont.FontSize, titleFont.Font, Vector2.new(1e999, 1e999))
			
			return UDim2.fromOffset(var13.X + 2, var13.Y + tokens.Size.Size_50 * 2)
		end, { title, titleFont.FontSize, titleFont.Font, tokens }),
		Text = title,
		Font = titleFont.Font,
		TextSize = titleFont.FontSize,
		LineHeight = titleFont.LineHeight,
		TextColor3 = var12.Color3,
		TextTransparency = var12.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left
	}, cryoModule.Dictionary.join(p0.children or {}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, tokens.Size.Size_50),
			PaddingBottom = UDim.new(0, tokens.Size.Size_50)
		})
	}))
end

local function useRenderLeft(p1) --[[ line: 79 ]]
	-- upvalues: reactModule (ref), BarTitle (ref)
	local renderNavigation = p1.renderNavigation
	local title = p1.title
	local onMedia = p1.onMedia
	local titleFontStyle = p1.titleFontStyle
	local isTitleCentered = p1.isTitleCentered
	local groupTransparencyLeft = p1.groupTransparencyLeft
	
	return reactModule.useCallback(function(p2) --[[ line: 87 ]]
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

local function useRenderCenter(p3) --[[ line: 118 ]]
	-- upvalues: fFlagEnableConsoleRobloxLogo (ref), reactModule (ref), appHeaderBarUseSizeFull (ref), BarTitle (ref)
	local renderCenter = p3.renderCenter
	local title = p3.title
	local onMedia = p3.onMedia
	local titleFontStyle = p3.titleFontStyle
	local isTitleCentered = p3.isTitleCentered
	local var14 = if fFlagEnableConsoleRobloxLogo then p3.groupTransparencyCenter else nil
	
	return reactModule.useCallback(function() --[[ line: 126 ]]
		-- upvalues: renderCenter (ref), fFlagEnableConsoleRobloxLogo (copy), reactModule (copy), var14 (ref), appHeaderBarUseSizeFull (copy), title (ref), isTitleCentered (ref), BarTitle (copy), titleFontStyle (ref), onMedia (ref)
		return if renderCenter then if fFlagEnableConsoleRobloxLogo then reactModule.createElement(if var14 then "CanvasGroup" else "Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = if var14 then var14.transparency else nil,
			ref = if var14 then var14.guiObjectRef else nil,
			Size = if appHeaderBarUseSizeFull then UDim2.fromScale(1, 1) else nil,
			AutomaticSize = if appHeaderBarUseSizeFull then nil else Enum.AutomaticSize.XY
		}, { CenterContent = renderCenter() }) else renderCenter() elseif title and isTitleCentered then reactModule.createElement(BarTitle, {
			title = title,
			titleFont = titleFontStyle,
			onMedia = onMedia
		}) else nil
	end, {
		renderCenter, title, titleFontStyle, isTitleCentered, onMedia, var14
	})
end

local function useRenderRight(p4) --[[ line: 154 ]]
	-- upvalues: reactModule (ref), utilityActionIcon (ref)
	local renderUserInfo = p4.renderUserInfo
	local avatarActionIcon = p4.avatarActionIcon
	local searchActionIcon = p4.searchActionIcon
	local renderUtilities = p4.renderUtilities
	local utilitiesGap = p4.utilitiesGap
	local groupTransparencyRight = p4.groupTransparencyRight
	
	return reactModule.useCallback(function() --[[ line: 163 ]]
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

local function _(p5) --[[ line: 211 | named "shouldRenderRight" ]]
	return p5.renderUserInfo or p5.avatarActionIcon or (p5.searchActionIcon or p5.renderUtilities)
end

return function(p6) --[[ line: 223 | named "AppHeaderBarComponent" ]]
	-- upvalues: cryoModule (ref), t (ref), useRenderLeft (ref), useRenderCenter (ref), useRenderRight (ref), reactModule (ref), fFlagLuaAppCompositionTopBarFullBleed (ref), headerBar (ref)
	local var15 = cryoModule.Dictionary.join(t, p6)
	local groupTransparency = var15.groupTransparency
	
	return reactModule.createElement(if groupTransparency then "CanvasGroup" else "Frame", {
		Size = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		GroupTransparency = if groupTransparency then groupTransparency.transparency else nil,
		ref = if groupTransparency then groupTransparency.guiObjectRef else nil,
		AutomaticSize = Enum.AutomaticSize.Y,
		[reactModule.Tag] = if fFlagLuaAppCompositionTopBarFullBleed then var15.tag else nil
	}, {
		Bar = reactModule.createElement(headerBar, {
			barHeight = var15.barHeight,
			renderLeft = useRenderLeft(var15),
			renderCenter = useRenderCenter(var15),
			renderRight = if if var15.renderUserInfo or var15.avatarActionIcon or (var15.searchActionIcon or var15.renderUtilities) then true else false then useRenderRight(var15) else nil,
			onHeaderActivated = var15.onHeaderActivated,
			backgroundStyle = var15.backgroundStyle,
			isOnMedia = var15.onMedia,
			automaticHeight = var15.automaticHeight,
			paddingLeft = var15.paddingLeft,
			paddingTop = var15.paddingTop,
			paddingRight = var15.paddingRight,
			paddingBottom = var15.paddingBottom,
			zIndex = var15.zIndex,
			hasDivider = var15.hasDivider
		})
	})
end