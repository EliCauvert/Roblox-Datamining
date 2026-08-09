local coreGuiService = game:GetService("CoreGui")
local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local coreScriptsCommonModule = require(parent.CoreScriptsCommon)
local displayModule = require(parent.Display)
local drawerModule = require(parent.Drawer)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local responsiveModule = require(parent.Responsive)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local divider = foundationModule.Divider
local drawerContainer = drawerModule.DrawerContainer
local experienceDetailsRowModule = require(inExperienceSideSheet.Components.ExperienceDetailsRow)
local footerModule = require(inExperienceSideSheet.Components.Footer)
local scrollView = foundationModule.ScrollView
local gridListModule = require(inExperienceSideSheet.Components.GridList)
local verticalListModule = require(inExperienceSideSheet.Components.VerticalList)
local view = foundationModule.View
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local useDrawerShouldMount = drawerModule.Hooks.useDrawerShouldMount
local useTokens = foundationModule.Hooks.useTokens
local useStyleSheet = foundationModule.Hooks.useStyleSheet
local useBackgroundStyleModule = require(inExperienceSideSheet.Hooks.useBackgroundStyle)
local getIntegrationsStoreModule = require(inExperienceSideSheet.Stores.GetIntegrationsStore)
local getSideSheetConfigStoreModule = require(inExperienceSideSheet.Stores.GetSideSheetConfigStore)
local wrapWithProvidersModule = require(inExperienceSideSheet.Utils.wrapWithProviders)
local getSideSheetVisibilityModule = require(inExperienceSideSheet.Utils.getSideSheetVisibility)
local fFlagMountUnmountSideSheet = require(inExperienceSideSheet.Flags).FFlagMountUnmountSideSheet
local fIntSideSheetVariant = require(parent.SharedFlags).FIntSideSheetVariant
local t = {}
local mouseIconOverrideService = coreScriptsCommonModule.MouseIconOverrideService
local usePreferredInput = responsiveModule.usePreferredInput

local function getDeviceSafePadding(p0) --[[ line: 72 ]]
	-- upvalues: displayModule (ref)
	return displayModule.GetDisplayStore(p0).getDeviceSafePadding(p0)
end

local function getToggleIntegrations(p1) --[[ line: 76 ]]
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p1).getToggleIntegrations(p1)
end

local var24 = function(p2) --[[ line: 80 ]]
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p2).getPageIntegrations(p2)
end

local var25 = nil

local function SideSheetContent(p3) --[[ line: 85 ]]
	-- upvalues: useTokens (ref), useStyleSheet (ref), useBackgroundStyleModule (ref), signalsReactModule (ref), getDeviceSafePadding (ref), fFlagMountUnmountSideSheet (ref), useDrawerShouldMount (ref), getToggleIntegrations (ref), reactModule (ref), sidesheetAnalyticsModule (ref), getSideSheetConfigStoreModule (ref), usePreferredInput (ref), signalsModule (ref), getSideSheetVisibilityModule (ref), responsiveModule (ref), mouseIconOverrideService (ref), experienceDetailsRowModule (ref), view (ref), divider (ref), fIntSideSheetVariant (ref), gridListModule (ref), verticalListModule (ref), var24 (ref), drawerContainer (ref), scrollView (ref), footerModule (ref)
	local var27 = useTokens()
	local var28 = useStyleSheet()
	local var29 = useBackgroundStyleModule()
	local var30 = signalsReactModule.useSignalState(getDeviceSafePadding)
	local var31 = if fFlagMountUnmountSideSheet then useDrawerShouldMount() else true
	local var32 = signalsReactModule.useSignalState(getToggleIntegrations)
	local var33 = reactModule.useCallback(function(p4) --[[ line: 93 ]]
		-- upvalues: sidesheetAnalyticsModule (copy)
		sidesheetAnalyticsModule.logSidesheetClosed(p4.source)
	end, {})
	local var34 = reactModule.useCallback(function(p5) --[[ line: 97 ]]
		-- upvalues: getSideSheetConfigStoreModule (copy)
		return getSideSheetConfigStoreModule().onHeightChanged(p5.AbsoluteSize.Y)
	end, {})
	local var35 = reactModule.useRef(false)
	local var36 = reactModule.useRef(false)
	local var37 = usePreferredInput()
	reactModule.useEffect(function() --[[ line: 105 ]]
		-- upvalues: signalsModule (copy), getSideSheetVisibilityModule (copy), p3 (ref), var35 (ref), var37 (ref), responsiveModule (copy), var36 (ref), mouseIconOverrideService (copy)
		local var38 = signalsModule.createEffect(function(p6) --[[ line: 106 ]]
			-- upvalues: getSideSheetVisibilityModule (copy), p3 (copy), var35 (copy), var37 (copy), responsiveModule (copy), var36 (copy), mouseIconOverrideService (copy)
			local var40 = getSideSheetVisibilityModule(p6)
			
			if p3.ChatSelector then
				if var40 then
					var35.current = p3.ChatSelector:GetVisibility()
					p3.ChatSelector:SetVisible(false)
				elseif var35.current then
					p3.ChatSelector:SetVisible(true)
					var35.current = false
				end
			end
			if var37 == responsiveModule.Input.Pointer then
				if var40 and not var36.current then
					mouseIconOverrideService.push("InExperienceSideSheet", Enum.OverrideMouseIconBehavior.ForceShow)
					var36.current = true
					
					return
				elseif not var40 and var36.current then
					mouseIconOverrideService.pop("InExperienceSideSheet")
					var36.current = false
				end
			end
		end)
		local var39 = if p3.ChatSelector then p3.ChatSelector.VisibilityStateChanged:connect(function(p7) --[[ line: 133 ]]
			-- upvalues: getSideSheetVisibilityModule (copy), var35 (copy)
			if getSideSheetVisibilityModule() and p7 then
				var35.current = false
			end
		end) else nil
		
		return function() --[[ line: 140 ]]
			-- upvalues: var38 (ref), var39 (write)
			var38()
			
			if var39 ~= nil then
				var39:disconnect()
			end
		end
	end, { p3.ChatSelector, var37 })
	
	return if var31 then reactModule.createElement(drawerContainer, {
		displayOrder = 12,
		scrimIsModal = true,
		menuWidth = 300 - var27.Padding.XLarge,
		leftOffset = var30.left + var27.Padding.XLarge,
		topOffset = var30.top,
		bottomOffset = var30.bottom,
		backgroundStyle = var29,
		onDrawerClosedAnalytics = var33
	}, {
		FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var28 }),
		Content = reactModule.createElement(view, { tag = "col size-full", onAbsoluteSizeChanged = var34 }, {
			ScrollableContent = reactModule.createElement(scrollView, {
				tag = "fill size-full-0",
				LayoutOrder = 1,
				scroll = {
					ScrollingDirection = Enum.ScrollingDirection.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(0, 0)
				},
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, {
				ExperienceDetailsRow = reactModule.createElement(experienceDetailsRowModule, { layoutOrder = 0 }),
				HeaderDivider = reactModule.createElement(view, {
					tag = "size-full-0 auto-y padding-right-xlarge",
					LayoutOrder = 1
				}, { Divider = reactModule.createElement(divider) }),
				IntegrationsList = if #var32 <= 0 then nil elseif fIntSideSheetVariant == 0 then reactModule.createElement(gridListModule, {
					layoutOrder = 2,
					integrationsGetter = getToggleIntegrations
				}) else reactModule.createElement(verticalListModule, {
					layoutOrder = if fIntSideSheetVariant == 2 then 4 else 2,
					integrationsGetter = getToggleIntegrations
				}),
				PageDivider = if #var32 > 0 then reactModule.createElement(view, {
					tag = "size-full-0 auto-y padding-right-xlarge",
					LayoutOrder = 3
				}, { Divider = reactModule.createElement(divider) }) else nil,
				PageList = reactModule.createElement(verticalListModule, {
					layoutOrder = if fIntSideSheetVariant == 2 then 2 else 4,
					integrationsGetter = var24
				})
			}),
			Footer = reactModule.createElement(footerModule, { layoutOrder = 2 })
		})
	}) else nil
end

function t.createSideSheet(p8, p9, p10) --[[ line: 224 ]]
	-- upvalues: var25 (write), coreGuiService (ref), wrapWithProvidersModule (ref), reactModule (ref), SideSheetContent (ref), reactRobloxModule (ref)
	if not var25 then
		local inExperienceSideSheet = Instance.new("Folder")
		inExperienceSideSheet.Name = "InExperienceSideSheet"
		inExperienceSideSheet.Parent = coreGuiService
		var25 = reactRobloxModule.createRoot(inExperienceSideSheet)
		var25:render(wrapWithProvidersModule({
			SideSheetContent = reactModule.createElement(SideSheetContent, p9)
		}, p8, p10))
	end
	return var25
end

return t