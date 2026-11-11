local Parent = script:FindFirstAncestor("Badges").Parent
local FetchBadgeDetailsPageModule = require(script.Parent.fetchBadgeDetailsPage)
local GetBadgeDetailsPageKeyModule = require(script.Parent.getBadgeDetailsPageKey)
local _ = require(Parent.Navigation)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseRouteNameFunction = require(Parent.Navigation).useRouteName
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local ResponsiveModule = require(Parent.Responsive)
local UseBreakpointXOrSmallerFunction = ResponsiveModule.useBreakpointXOrSmaller
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local CompositionTags = require(Parent.AppComposition).CompositionTags
local SetIsBadgeDetailsSheetOpenFunction = require(script.Parent.BadgeDetailsSheetState).setIsBadgeDetailsSheetOpen
local FFlagSduiPageEntryUseSharedHooks = require(Parent.SharedFlags).FFlagSduiPageEntryUseSharedHooks
local LuaAppBadgeDetailsLargeSideSheetSize2 = game:DefineFastFlag("LuaAppBadgeDetailsLargeSideSheetSize2", false)

local function _(p1, p2)
	local ExtraPropsParam = p1.navigation and p1.navigation.getParam("extraProps")
	
	return p1[p2] or ExtraPropsParam and ExtraPropsParam[p2]
end

local _ = function(Text, Text1): string
	return Text .. "_" .. Text1
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), GetBadgeDetailsPageKeyModule (copy), ReactModule (copy), SduiLoadTimer (copy), UseNavigationFunction (copy), UseRouteNameFunction (copy), UseNavigationFocusFunction (copy), UseBreakpointXOrSmallerFunction (copy), ResponsiveModule (copy), FetchBadgeDetailsPageModule (copy), SetIsBadgeDetailsSheetOpenFunction (copy), SduiFeatureEntryPoint (copy), SduiPageEntryPoint (copy), FFlagSduiPageEntryUseSharedHooks (copy), CompositionTags (copy), FoundationModule (copy), LuaAppBadgeDetailsLargeSideSheetSize2 (copy)
	local UseTokensResult = UseTokensFunction()
	local ExtraPropsParam = p1.navigation and p1.navigation.getParam("extraProps")
	local BadgeId = p1.badgeId or ExtraPropsParam and ExtraPropsParam.badgeId
	local BadgeDetailsPageKeyModule = GetBadgeDetailsPageKeyModule(BadgeId)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), SduiLoadTimer (upval)
		local ExtraPropsParam = p1.navigation and p1.navigation.getParam("extraProps")
		
		return (if p1.pageTimer then p1.pageTimer else ExtraPropsParam and ExtraPropsParam.pageTimer) or SduiLoadTimer.createLoadTimer("BadgeDetails")
	end, {})
	local UseNavigationResult = UseNavigationFunction()
	local UseRouteNameResult = UseRouteNameFunction()
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseBreakpointXOrSmallerResult = UseBreakpointXOrSmallerFunction(ResponsiveModule.Keys.Small)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRouteNameResult (copy), UseNavigationFocusResult (copy), UseNavigationResult (copy)
		if UseRouteNameResult == "BadgeDetails" and UseNavigationFocusResult then
			UseNavigationResult.goBack()
		end
	end, {
		UseNavigationResult,
		UseRouteNameResult,
		UseNavigationFocusResult
	})
	ReactModule.useEffect(function()
		-- upvalues: BadgeId (copy), FetchBadgeDetailsPageModule (upval), UseMemoResult (copy)
		if BadgeId then
			FetchBadgeDetailsPageModule(BadgeId, UseMemoResult)
		end
	end, { BadgeId, UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: UseBreakpointXOrSmallerResult (copy), UseNavigationFocusResult (copy), SetIsBadgeDetailsSheetOpenFunction (upval)
		SetIsBadgeDetailsSheetOpenFunction(not UseBreakpointXOrSmallerResult and UseNavigationFocusResult)
		
		return function()
			-- upvalues: SetIsBadgeDetailsSheetOpenFunction (upval)
			SetIsBadgeDetailsSheetOpenFunction(false)
		end
	end, { UseBreakpointXOrSmallerResult, UseNavigationFocusResult })
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), SduiFeatureEntryPoint (upval), BadgeDetailsPageKeyModule (copy), UseMemoResult (copy)
		return ReactModule.createElement(SduiFeatureEntryPoint, {
			appPage = "BadgeDetails",
			identifier = "badge_details_context_menu",
			shouldDisplayError = false,
			shouldDisplayLoading = false,
			configKey = BadgeDetailsPageKeyModule,
			AutomaticSize = Enum.AutomaticSize.XY,
			pageTimer = UseMemoResult
		})
	end, { BadgeDetailsPageKeyModule, UseMemoResult })
	
	return if BadgeId == nil then nil elseif UseBreakpointXOrSmallerResult then ReactModule.createElement(SduiPageEntryPoint, {
		appPage = "BadgeDetails",
		includeNavigationHeaderBar = true,
		configKey = BadgeDetailsPageKeyModule,
		identifier = if FFlagSduiPageEntryUseSharedHooks then "badge_details_feed" else BadgeDetailsPageKeyModule .. "_" .. "badge_details_feed",
		pageTimer = UseMemoResult,
		renderUtilities = UseResult1,
		contentTag = CompositionTags.ContentRegion.Body
	}) else ReactModule.createElement(FoundationModule.Sheet.Root, {
		snapPoints = { 1 },
		isOpen = UseNavigationFocusResult,
		displaySize = if LuaAppBadgeDetailsLargeSideSheetSize2 then FoundationModule.Enums.DialogSize.Large else nil,
		onClose = UseResult
	}, {
		Header = ReactModule.createElement(FoundationModule.Sheet.Header, { hasCloseAffordance = true }, {
			ContextMenu = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				ContextMenuEntryPoint = ReactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY
				}, { EntryPoint = UseResult1() })
			})
		}),
		Content = ReactModule.createElement(FoundationModule.Sheet.Content, { scrollingFrameRef = UseRefResult }, ReactModule.createElement(SduiPageEntryPoint, {
			appPage = "BadgeDetails",
			includeNavigationHeaderBar = false,
			disableRootPadding = true,
			snackbarPortalLayoutOrder = 2147483647,
			configKey = BadgeDetailsPageKeyModule,
			identifier = if FFlagSduiPageEntryUseSharedHooks then "badge_details_feed" else BadgeDetailsPageKeyModule .. "_" .. "badge_details_feed",
			pageTimer = UseMemoResult,
			backgroundStyle = UseTokensResult.Color.None,
			scrollingFrameRef = UseRefResult
		}))
	})
end)