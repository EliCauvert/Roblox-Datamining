local parent = script:FindFirstAncestor("Badges").Parent
local fetchBadgeDetailsPageModule = require(script.Parent.fetchBadgeDetailsPage)
local getBadgeDetailsPageKeyModule = require(script.Parent.getBadgeDetailsPageKey)
local badgeDetailsSheetStateModule = require(script.Parent.BadgeDetailsSheetState)
local _ = require(parent.Navigation)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useRouteName = require(parent.Navigation).useRouteName
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local responsiveModule = require(parent.Responsive)
local useBreakpointXOrSmaller = responsiveModule.useBreakpointXOrSmaller
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiFeatureEntryPoint = sduiSharedUtilitiesModule.SduiFeatureEntryPoint
local sduiPageEntryPoint = sduiSharedUtilitiesModule.SduiPageEntryPoint
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local compositionTags = require(parent.AppComposition).CompositionTags
local setIsBadgeDetailsSheetOpen = badgeDetailsSheetStateModule.setIsBadgeDetailsSheetOpen
local fFlagSduiPageEntryUseSharedHooks = require(parent.SharedFlags).FFlagSduiPageEntryUseSharedHooks
local luaAppBadgeDetailsLargeSideSheetSize2 = game:DefineFastFlag("LuaAppBadgeDetailsLargeSideSheetSize2", false)

local function _(p0, p1) --[[ line: 41 | named "getFromPropsOrNavigationParams" ]]
	local extraProps = p0.navigation and p0.navigation.getParam("extraProps")
	
	return p0[p1] or extraProps and extraProps[p1]
end

local _ = function(p2, p3) --[[ line: 53 ]]
	return p2 .. "_" .. p3
end

return reactModule.memo(function(p4) --[[ line: 57 | named "BadgeDetailsPage" ]]
	-- upvalues: useTokens (ref), getBadgeDetailsPageKeyModule (ref), reactModule (ref), sduiLoadTimer (ref), useNavigation (ref), useRouteName (ref), useNavigationFocus (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), fetchBadgeDetailsPageModule (ref), setIsBadgeDetailsSheetOpen (ref), sduiFeatureEntryPoint (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), compositionTags (ref), foundationModule (ref), luaAppBadgeDetailsLargeSideSheetSize2 (ref)
	local var9 = useTokens()
	local extraProps = p4.navigation and p4.navigation.getParam("extraProps")
	local badgeId = p4.badgeId or extraProps and extraProps.badgeId
	local var12 = getBadgeDetailsPageKeyModule(badgeId)
	local var13 = reactModule.useMemo(function() --[[ line: 63 ]]
		-- upvalues: p4 (ref), sduiLoadTimer (copy)
		local var21 = p4
		local extraProps = var21.navigation and var21.navigation.getParam("extraProps")
		
		return var21.pageTimer or extraProps and extraProps.pageTimer or sduiLoadTimer.createLoadTimer("BadgeDetails")
	end, {})
	local var14 = useNavigation()
	local var15 = useRouteName()
	local var16 = useNavigationFocus()
	local var17 = useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local var18 = reactModule.useCallback(function() --[[ line: 72 ]]
		-- upvalues: var15 (ref), var16 (ref), var14 (ref)
		if var15 == "BadgeDetails" and var16 then
			var14.goBack()
		end
	end, { var14, var15, var16 })
	reactModule.useEffect(function() --[[ line: 78 ]]
		-- upvalues: badgeId (ref), fetchBadgeDetailsPageModule (copy), var13 (ref)
		if badgeId then
			fetchBadgeDetailsPageModule(badgeId, var13)
		end
	end, { badgeId, var13 })
	reactModule.useEffect(function() --[[ line: 84 ]]
		-- upvalues: var17 (ref), var16 (ref), setIsBadgeDetailsSheetOpen (copy)
		setIsBadgeDetailsSheetOpen(not var17 and var16)
		
		return function() --[[ line: 88 ]]
			-- upvalues: setIsBadgeDetailsSheetOpen (copy)
			setIsBadgeDetailsSheetOpen(false)
		end
	end, { var17, var16 })
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useCallback(function() --[[ line: 97 ]]
		-- upvalues: reactModule (copy), sduiFeatureEntryPoint (copy), var12 (ref), var13 (ref)
		return reactModule.createElement(sduiFeatureEntryPoint, {
			appPage = "BadgeDetails",
			identifier = "badge_details_context_menu",
			shouldDisplayError = false,
			shouldDisplayLoading = false,
			configKey = var12,
			AutomaticSize = Enum.AutomaticSize.XY,
			pageTimer = var13
		})
	end, { var12, var13 })
	
	return if badgeId == nil then nil elseif var17 then reactModule.createElement(sduiPageEntryPoint, {
		appPage = "BadgeDetails",
		includeNavigationHeaderBar = true,
		configKey = var12,
		identifier = if fFlagSduiPageEntryUseSharedHooks then "badge_details_feed" else var12 .. "_" .. "badge_details_feed",
		pageTimer = var13,
		renderUtilities = var20,
		contentTag = compositionTags.ContentRegion.Body
	}) else reactModule.createElement(foundationModule.Sheet.Root, {
		snapPoints = { 1 },
		isOpen = var16,
		displaySize = if luaAppBadgeDetailsLargeSideSheetSize2 then foundationModule.Enums.DialogSize.Large else nil,
		onClose = var18
	}, {
		Header = reactModule.createElement(foundationModule.Sheet.Header, { hasCloseAffordance = true }, {
			ContextMenu = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				ContextMenuEntryPoint = reactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY
				}, { EntryPoint = var20() })
			})
		}),
		Content = reactModule.createElement(foundationModule.Sheet.Content, { scrollingFrameRef = var19 }, reactModule.createElement(sduiPageEntryPoint, {
			appPage = "BadgeDetails",
			includeNavigationHeaderBar = false,
			disableRootPadding = true,
			snackbarPortalLayoutOrder = 2147483647,
			configKey = var12,
			identifier = if fFlagSduiPageEntryUseSharedHooks then "badge_details_feed" else var12 .. "_" .. "badge_details_feed",
			pageTimer = var13,
			backgroundStyle = var9.Color.None,
			scrollingFrameRef = var19
		}))
	})
end)