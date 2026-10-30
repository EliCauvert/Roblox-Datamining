local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local ReactModule = require(Parent.React)
local AppPageShellModule = require(Parent.AppPageShell)
local _ = require(Parent.AppCommonLib)
local PageContentMode = AppPageShellModule.PageContentMode
local PageContext = AppPageShellModule.PageContext
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper
local FFlagAppPageShellScrollToTopFocus = require(Parent.SharedFlags).FFlagAppPageShellScrollToTopFocus
local FFlagLuaAppsDefaultSelection = require(Parent.SharedFlags).FFlagLuaAppsDefaultSelection
local FFlagSduiPageCanvasCollectionLayout = require(Parent.SharedFlags).FFlagSduiPageCanvasCollectionLayout
local UseComponentConfigModule = require(SduiSharedUtilities.hooks.useComponentConfig)
local UseComponentLifecycleTimingModule = require(SduiSharedUtilities.hooks.useComponentLifecycleTiming)
local UseMissingRootWarningModule = require(SduiSharedUtilities.hooks.useMissingRootWarning)
local FFlagDataHydrationAccountReset = require(Parent.SharedFlags).FFlagDataHydrationAccountReset
local _ = require(SduiSharedUtilities.SduiLoadTimer)

local function SduiPageWholeContent(p1)
	-- upvalues: ReactModule (copy), PageContext (copy), FFlagAppPageShellScrollToTopFocus (copy), FFlagLuaAppsDefaultSelection (copy), FFlagSduiPageCanvasCollectionLayout (copy), GetSduiComponentWrapperFunction (copy)
	local UseContextResult = ReactModule.useContext(PageContext)
	local VerticalScrollingFrameRef = UseContextResult.verticalScrollingFrameRef
	
	return ReactModule.createElement(GetSduiComponentWrapperFunction(p1.config), {
		debugName = `{p1.debugName}-content`,
		componentConfig = p1.config,
		sduiContext = p1.sduiContext,
		localAnalyticsData = p1.localAnalyticsData,
		extraLocalProps = ReactModule.useMemo(function()
			-- upvalues: VerticalScrollingFrameRef (copy), UseContextResult (copy), p1 (copy), FFlagAppPageShellScrollToTopFocus (upval), FFlagLuaAppsDefaultSelection (upval), FFlagSduiPageCanvasCollectionLayout (upval)
			return {
				scrollToSelectionAnimationManagedByParent = true,
				scrollingFrameRef = VerticalScrollingFrameRef,
				verticalScrollingFrameRef = VerticalScrollingFrameRef,
				scrollViewPositionChangedSignal = UseContextResult.scrollViewPositionChangedSignal,
				refreshSignal = p1.refreshSignal,
				defaultFocusRef = if FFlagAppPageShellScrollToTopFocus and FFlagLuaAppsDefaultSelection then p1.defaultFocusRef else nil,
				disableCollectionLayoutStoreProvider = if FFlagSduiPageCanvasCollectionLayout then true else nil
			}
		end, {
			UseContextResult,
			p1.refreshSignal,
			if FFlagAppPageShellScrollToTopFocus and FFlagLuaAppsDefaultSelection then p1.defaultFocusRef else nil,
			VerticalScrollingFrameRef
		})
	})
end

local function buildWholePageContent(Config, p1)
	-- upvalues: ReactModule (copy), SduiPageWholeContent (copy), FFlagAppPageShellScrollToTopFocus (copy), FFlagLuaAppsDefaultSelection (copy)
	return {
		ReactModule.createElement(SduiPageWholeContent, {
			config = Config,
			sduiContext = p1.sduiContext,
			localAnalyticsData = p1.localAnalyticsData,
			debugName = p1.debugName,
			refreshSignal = p1.refreshSignal,
			defaultFocusRef = if FFlagAppPageShellScrollToTopFocus and FFlagLuaAppsDefaultSelection then p1.defaultFocusRef else nil
		})
	}
end

return function(p1)
	-- upvalues: UseComponentConfigModule (copy), FFlagDataHydrationAccountReset (copy), UseMissingRootWarningModule (copy), UseComponentLifecycleTimingModule (copy), PageContentMode (copy), ReactModule (copy), buildWholePageContent (copy)
	local UseComponentConfigModuleResult = UseComponentConfigModule(p1.configKey, p1.contentIdentifier)
	
	if FFlagDataHydrationAccountReset then
		UseMissingRootWarningModule(p1.configKey, UseComponentConfigModuleResult)
	end
	UseComponentLifecycleTimingModule(p1.pageTimer, UseComponentConfigModuleResult ~= nil)
	local ContentMode = p1.contentMode or PageContentMode.Scroll
	
	return {
		contentMode = ContentMode,
		content = {
			contentSlot = ReactModule.useMemo(function()
				-- upvalues: UseComponentConfigModuleResult (copy), ContentMode (copy), PageContentMode (upval), buildWholePageContent (upval), p1 (copy)
				return if UseComponentConfigModuleResult == nil then nil elseif ContentMode == PageContentMode.Scroll then buildWholePageContent(UseComponentConfigModuleResult, p1) else buildWholePageContent(UseComponentConfigModuleResult, p1)
			end, { UseComponentConfigModuleResult, p1, ContentMode })
		}
	}
end