local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local appPageShellModule = require(parent.AppPageShell)
local _ = require(parent.AppCommonLib)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local pageContentMode = appPageShellModule.PageContentMode
local pageContext = appPageShellModule.PageContext
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local fFlagAppPageShellScrollToTopFocus = require(parent.SharedFlags).FFlagAppPageShellScrollToTopFocus
local fFlagLuaAppsDefaultSelection = require(parent.SharedFlags).FFlagLuaAppsDefaultSelection
local useComponentConfigModule = require(sduiSharedUtilities.hooks.useComponentConfig)
local useComponentLifecycleTimingModule = require(sduiSharedUtilities.hooks.useComponentLifecycleTiming)
local _ = require(sduiSharedUtilities.SduiLoadTimer)

local function SduiPageWholeContent(p1)
	-- upvalues: reactModule (ref), pageContext (ref), fFlagAppPageShellScrollToTopFocus (ref), fFlagLuaAppsDefaultSelection (ref), getSduiComponentWrapper (ref)
	local var1 = reactModule.useContext(pageContext)
	local verticalScrollingFrameRef = var1.verticalScrollingFrameRef
	
	return reactModule.createElement(getSduiComponentWrapper(p1.config), {
		debugName = `{p1.debugName}-content`,
		componentConfig = p1.config,
		sduiContext = p1.sduiContext,
		localAnalyticsData = p1.localAnalyticsData,
		extraLocalProps = reactModule.useMemo(function()
			-- upvalues: verticalScrollingFrameRef (ref), var1 (ref), p1 (ref), fFlagAppPageShellScrollToTopFocus (copy), fFlagLuaAppsDefaultSelection (copy)
			return {
				scrollToSelectionAnimationManagedByParent = true,
				scrollingFrameRef = verticalScrollingFrameRef,
				verticalScrollingFrameRef = verticalScrollingFrameRef,
				scrollViewPositionChangedSignal = var1.scrollViewPositionChangedSignal,
				refreshSignal = p1.refreshSignal,
				defaultFocusRef = if fFlagAppPageShellScrollToTopFocus and fFlagLuaAppsDefaultSelection then p1.defaultFocusRef else nil
			}
		end, {
			var1,
			p1.refreshSignal,
			if fFlagAppPageShellScrollToTopFocus and fFlagLuaAppsDefaultSelection then p1.defaultFocusRef else nil,
			verticalScrollingFrameRef
		})
	})
end

local function buildWholePageContent(p1, p2)
	-- upvalues: reactModule (ref), SduiPageWholeContent (ref), fFlagAppPageShellScrollToTopFocus (ref), fFlagLuaAppsDefaultSelection (ref)
	return {
		reactModule.createElement(SduiPageWholeContent, {
			config = p1,
			sduiContext = p2.sduiContext,
			localAnalyticsData = p2.localAnalyticsData,
			debugName = p2.debugName,
			refreshSignal = p2.refreshSignal,
			defaultFocusRef = if fFlagAppPageShellScrollToTopFocus and fFlagLuaAppsDefaultSelection then p2.defaultFocusRef else nil
		})
	}
end

return function(p1)
	-- upvalues: useComponentConfigModule (ref), useComponentLifecycleTimingModule (ref), pageContentMode (ref), reactModule (ref), buildWholePageContent (ref)
	local var1 = useComponentConfigModule(p1.configKey, p1.contentIdentifier)
	useComponentLifecycleTimingModule(p1.pageTimer, var1 ~= nil)
	local contentMode = p1.contentMode or pageContentMode.Scroll
	
	return {
		contentMode = contentMode,
		content = {
			contentSlot = reactModule.useMemo(function()
				-- upvalues: var1 (ref), contentMode (ref), pageContentMode (copy), buildWholePageContent (copy), p1 (ref)
				return if var1 == nil then nil elseif contentMode == pageContentMode.Scroll then buildWholePageContent(var1, p1) else buildWholePageContent(var1, p1)
			end, { var1, p1, contentMode })
		}
	}
end