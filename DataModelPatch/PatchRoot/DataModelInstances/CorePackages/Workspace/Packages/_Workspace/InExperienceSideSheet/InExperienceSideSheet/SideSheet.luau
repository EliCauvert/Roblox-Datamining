local CoreGui = game:GetService("CoreGui")
local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local DisplayModule = require(Parent.Display)
local DrawerModule = require(Parent.Drawer)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ResponsiveModule = require(Parent.Responsive)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local Divider = FoundationModule.Divider
local DrawerContainer = DrawerModule.DrawerContainer
local ExperienceDetailsRowModule = require(InExperienceSideSheet.Components.ExperienceDetailsRow)
local FooterModule = require(InExperienceSideSheet.Components.Footer)
local ScrollView = FoundationModule.ScrollView
local GridListModule = require(InExperienceSideSheet.Components.GridList)
local VerticalListModule = require(InExperienceSideSheet.Components.VerticalList)
local View = FoundationModule.View
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local SidesheetAnalyticsModule = require(InExperienceSideSheet.Analytics.SidesheetAnalytics)
local UseDrawerShouldMountFunction = DrawerModule.Hooks.useDrawerShouldMount
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet
local UseBackgroundStyleModule = require(InExperienceSideSheet.Hooks.useBackgroundStyle)
local GetIntegrationsStoreModule = require(InExperienceSideSheet.Stores.GetIntegrationsStore)
local GetSideSheetConfigStoreModule = require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)
local WrapWithProvidersModule = require(InExperienceSideSheet.Utils.wrapWithProviders)
local GetSideSheetVisibilityModule = require(InExperienceSideSheet.Utils.getSideSheetVisibility)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagMountUnmountSideSheet = require(InExperienceSideSheet.Flags).FFlagMountUnmountSideSheet
local FIntSideSheetVariant = SharedFlagsModule.FIntSideSheetVariant
local FFlagSideSheetFocusNav = SharedFlagsModule.FFlagSideSheetFocusNav
local SideSheetModule = {}
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local MouseIconOverrideService = require(Parent.CoreScriptsCommon).MouseIconOverrideService
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput

local function getDeviceSafePadding(p1)
	-- upvalues: DisplayModule (copy)
	return DisplayModule.GetDisplayStore(p1).getDeviceSafePadding(p1)
end

local function getToggleIntegrations(p1)
	-- upvalues: GetIntegrationsStoreModule (copy)
	return GetIntegrationsStoreModule(p1).getToggleIntegrations(p1)
end

local function IntegrationsGetter(p1)
	-- upvalues: GetIntegrationsStoreModule (copy)
	return GetIntegrationsStoreModule(p1).getPageIntegrations(p1)
end

local v1 = nil
local UseFocusGuiObjectFunction = nil

if FFlagSideSheetFocusNav then
	v1 = { IntegrationsList = 0, PageList = 1 }
	UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
end
local Root = nil

local function SideSheetContent(p1)
	-- upvalues: UseTokensFunction (copy), UseStyleSheetFunction (copy), UseBackgroundStyleModule (copy), SignalsReactModule (copy), getDeviceSafePadding (copy), FFlagMountUnmountSideSheet (copy), UseDrawerShouldMountFunction (copy), getToggleIntegrations (copy), ReactModule (copy), SidesheetAnalyticsModule (copy), FFlagSideSheetFocusNav (copy), UseFocusGuiObjectFunction (ref), GetSideSheetConfigStoreModule (copy), UsePreferredInputFunction (copy), SignalsModule (copy), GetSideSheetVisibilityModule (copy), ResponsiveModule (copy), MouseIconOverrideService (copy), FIntSideSheetVariant (copy), v1 (ref), ExperienceDetailsRowModule (copy), View (copy), Divider (copy), GridListModule (copy), VerticalListModule (copy), IntegrationsGetter (copy), ScrollView (copy), FooterModule (copy), DrawerContainer (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStyleSheetResult = UseStyleSheetFunction()
	local UseBackgroundStyleModuleResult = UseBackgroundStyleModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(getDeviceSafePadding)
	local NoFFlagMountUnmountSideSheet = not FFlagMountUnmountSideSheet or UseDrawerShouldMountFunction()
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(getToggleIntegrations)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: SidesheetAnalyticsModule (upval)
		SidesheetAnalyticsModule.logSidesheetClosed(p2.source)
	end, {})
	local UseFocusGuiObjectResult = nil
	local UseResult1 = nil
	
	if FFlagSideSheetFocusNav then
		UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
		UseResult1 = ReactModule.useCallback(function(p2)
			-- upvalues: UseFocusGuiObjectResult (ref)
			UseFocusGuiObjectResult(p2)
		end, { UseFocusGuiObjectResult })
	end
	local UseRefResult = if FFlagSideSheetFocusNav then ReactModule.useRef(nil) else nil
	local UseResult2 = ReactModule.useCallback(function(Frame)
		-- upvalues: GetSideSheetConfigStoreModule (upval)
		return GetSideSheetConfigStoreModule().onHeightChanged(Frame.AbsoluteSize.Y)
	end, {})
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(false)
	local UsePreferredInputResult = UsePreferredInputFunction()
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), GetSideSheetVisibilityModule (upval), p1 (copy), UseRefResult1 (copy), UsePreferredInputResult (copy), ResponsiveModule (upval), UseRefResult2 (copy), MouseIconOverrideService (upval)
		local Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: GetSideSheetVisibilityModule (upval), p1 (upval), UseRefResult1 (upval), UsePreferredInputResult (upval), ResponsiveModule (upval), UseRefResult2 (upval), MouseIconOverrideService (upval)
			local SideSheetVisibilityModule = GetSideSheetVisibilityModule(p2)
			
			if p1.ChatSelector then
				if SideSheetVisibilityModule then
					UseRefResult1.current = p1.ChatSelector:GetVisibility()
					p1.ChatSelector:SetVisible(false)
				elseif UseRefResult1.current then
					p1.ChatSelector:SetVisible(true)
					UseRefResult1.current = false
				end
			end
			if UsePreferredInputResult == ResponsiveModule.Input.Pointer then
				if SideSheetVisibilityModule and not UseRefResult2.current then
					MouseIconOverrideService.push("InExperienceSideSheet", Enum.OverrideMouseIconBehavior.ForceShow)
					UseRefResult2.current = true
					
					return
				end
				if not SideSheetVisibilityModule and UseRefResult2.current then
					MouseIconOverrideService.pop("InExperienceSideSheet")
					UseRefResult2.current = false
				end
			end
		end)
		local VisibilityStateChangedConnection = if p1.ChatSelector then p1.ChatSelector.VisibilityStateChanged:connect(function(p2)
			-- upvalues: GetSideSheetVisibilityModule (upval), UseRefResult1 (upval)
			if GetSideSheetVisibilityModule() and p2 then
				UseRefResult1.current = false
			end
		end) else nil
		
		return function()
			-- upvalues: Effect (copy), VisibilityStateChangedConnection (ref)
			Effect()
			
			if VisibilityStateChangedConnection ~= nil then
				VisibilityStateChangedConnection:disconnect()
			end
		end
	end, { p1.ChatSelector, UsePreferredInputResult })
	local PageList = if FFlagSideSheetFocusNav then if FIntSideSheetVariant == 2 or #UseSignalStateResult1 <= 0 then v1.PageList else v1.IntegrationsList else nil
	
	if NoFFlagMountUnmountSideSheet then
		local Element = ReactModule.createElement(View, {
			tag = "col size-full",
			onAbsoluteSizeChanged = UseResult2,
			ref = if FFlagSideSheetFocusNav then UseRefResult else nil
		}, {
			ScrollableContent = ReactModule.createElement(ScrollView, {
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
				},
				selection = if FFlagSideSheetFocusNav then { Selectable = false } else nil
			}, {
				ExperienceDetailsRow = ReactModule.createElement(ExperienceDetailsRowModule, { layoutOrder = 0 }),
				HeaderDivider = ReactModule.createElement(View, {
					tag = "size-full-0 auto-y padding-right-xlarge",
					LayoutOrder = 1
				}, { Divider = ReactModule.createElement(Divider) }),
				IntegrationsList = if #UseSignalStateResult1 <= 0 then nil elseif FIntSideSheetVariant == 0 then ReactModule.createElement(GridListModule, {
					layoutOrder = 2,
					integrationsGetter = getToggleIntegrations,
					firstIntegrationToFocusCallback = if FFlagSideSheetFocusNav and PageList == v1.IntegrationsList then UseResult1 else nil
				}) else ReactModule.createElement(VerticalListModule, {
					layoutOrder = if FIntSideSheetVariant == 2 then 4 else 2,
					integrationsGetter = getToggleIntegrations,
					firstIntegrationToFocusCallback = if FFlagSideSheetFocusNav and PageList == v1.IntegrationsList then UseResult1 else nil
				}),
				PageDivider = if #UseSignalStateResult1 > 0 then ReactModule.createElement(View, {
					tag = "size-full-0 auto-y padding-right-xlarge",
					LayoutOrder = 3
				}, { Divider = ReactModule.createElement(Divider) }) else nil,
				PageList = ReactModule.createElement(VerticalListModule, {
					layoutOrder = if FIntSideSheetVariant == 2 then 2 else 4,
					integrationsGetter = IntegrationsGetter,
					firstIntegrationToFocusCallback = if FFlagSideSheetFocusNav and PageList == v1.PageList then UseResult1 else nil
				})
			}),
			Footer = ReactModule.createElement(FooterModule, { layoutOrder = 2 })
		})
		
		return ReactModule.createElement(DrawerContainer, {
			displayOrder = 12,
			scrimIsModal = true,
			menuWidth = 300 - UseTokensResult.Padding.XLarge,
			leftOffset = UseSignalStateResult.left + UseTokensResult.Padding.XLarge,
			topOffset = UseSignalStateResult.top,
			bottomOffset = UseSignalStateResult.bottom,
			backgroundStyle = UseBackgroundStyleModuleResult,
			onDrawerClosedAnalytics = UseResult
		}, {
			FoundationStyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetResult }),
			if FFlagSideSheetFocusNav then ReactModule.createElement(FocusRoot, {
				isIsolated = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
			}, { Content = Element }) else Element
		})
	else
		return nil
	end
end

function SideSheetModule.createSideSheet(p1, p2, p3)
	-- upvalues: Root (ref), CoreGui (copy), WrapWithProvidersModule (copy), ReactModule (copy), SideSheetContent (copy), ReactRobloxModule (copy)
	if not Root then
		local InExperienceSideSheet = Instance.new("Folder")
		InExperienceSideSheet.Name = "InExperienceSideSheet"
		InExperienceSideSheet.Parent = CoreGui
		local WrapWithProvidersModuleResult = WrapWithProvidersModule({
			SideSheetContent = ReactModule.createElement(SideSheetContent, p2)
		}, p1, p3)
		Root = ReactRobloxModule.createRoot(InExperienceSideSheet)
		Root:render(WrapWithProvidersModuleResult)
	end
	return Root
end

return SideSheetModule