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

local function _(p1, p2)
	local extraProps = p1.navigation and p1.navigation.getParam("extraProps")
	
	return p1[p2] or extraProps and extraProps[p2]
end

local _ = function(p1, p2)
	return p1 .. "_" .. p3
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), getBadgeDetailsPageKeyModule (ref), reactModule (ref), sduiLoadTimer (ref), useNavigation (ref), useRouteName (ref), useNavigationFocus (ref), useBreakpointXOrSmaller (ref), responsiveModule (ref), fetchBadgeDetailsPageModule (ref), setIsBadgeDetailsSheetOpen (ref), sduiFeatureEntryPoint (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), compositionTags (ref), foundationModule (ref), luaAppBadgeDetailsLargeSideSheetSize2 (ref)
	local var1 = useTokens()
	local extraProps = p1.navigation and p1.navigation.getParam("extraProps")
	local badgeId = p1.badgeId or extraProps and extraProps.badgeId
	local var2 = getBadgeDetailsPageKeyModule(badgeId)
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), sduiLoadTimer (copy)
		local var4 = p1
		local extraProps = var4.navigation and var4.navigation.getParam("extraProps")
		
		return var4.pageTimer or extraProps and extraProps.pageTimer or sduiLoadTimer.createLoadTimer("BadgeDetails")
	end, {})
	local var4 = useNavigation()
	local var5 = useRouteName()
	local var6 = useNavigationFocus()
	local var7 = useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref), var4 (ref)
		if var5 == "BadgeDetails" and var6 then
			var4.goBack()
		end
	end, { var4, var5, var6 })
	reactModule.useEffect(function()
		-- upvalues: badgeId (ref), fetchBadgeDetailsPageModule (copy), var3 (ref)
		if badgeId then
			fetchBadgeDetailsPageModule(badgeId, var3)
		end
	end, { badgeId, var3 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var6 (ref), setIsBadgeDetailsSheetOpen (copy)
		setIsBadgeDetailsSheetOpen(not var7 and var6)
		
		return function()
			-- upvalues: setIsBadgeDetailsSheetOpen (copy)
			setIsBadgeDetailsSheetOpen(false)
		end
	end, { var7, var6 })
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), sduiFeatureEntryPoint (copy), var2 (ref), var3 (ref)
		return reactModule.createElement(sduiFeatureEntryPoint, {
			appPage = "BadgeDetails",
			identifier = "badge_details_context_menu",
			shouldDisplayError = false,
			shouldDisplayLoading = false,
			configKey = var2,
			AutomaticSize = Enum.AutomaticSize.XY,
			pageTimer = var3
		})
	end, { var2, var3 })
	
	return if badgeId == nil then nil elseif var7 then reactModule.createElement(sduiPageEntryPoint, {
		appPage = "BadgeDetails",
		includeNavigationHeaderBar = true,
		configKey = var2,
		identifier = if fFlagSduiPageEntryUseSharedHooks then "badge_details_feed" else var2 .. "_" .. "badge_details_feed",
		pageTimer = var3,
		renderUtilities = var10,
		contentTag = compositionTags.ContentRegion.Body
	}) else reactModule.createElement(foundationModule.Sheet.Root, {
		snapPoints = { 1 },
		isOpen = var6,
		displaySize = if luaAppBadgeDetailsLargeSideSheetSize2 then foundationModule.Enums.DialogSize.Large else nil,
		onClose = var8
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
				}, { EntryPoint = var10() })
			})
		}),
		Content = reactModule.createElement(foundationModule.Sheet.Content, { scrollingFrameRef = var9 }, reactModule.createElement(sduiPageEntryPoint, {
			appPage = "BadgeDetails",
			includeNavigationHeaderBar = false,
			disableRootPadding = true,
			snackbarPortalLayoutOrder = 2147483647,
			configKey = var2,
			identifier = if fFlagSduiPageEntryUseSharedHooks then "badge_details_feed" else var2 .. "_" .. "badge_details_feed",
			pageTimer = var3,
			backgroundStyle = var1.Color.None,
			scrollingFrameRef = var9
		}))
	})
end)