local WebViewService = game:GetService("WebViewService")
local GuiService = game:GetService("GuiService")
local TelemetryService = game:GetService("TelemetryService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local WebViewStateTracker = require(CorePackages.Workspace.Packages.WebViewUtils).WebViewStateTracker
local FFlagEnableWebViewStateTracker = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableWebViewStateTracker
local GetFFlagLuaAppEnableWebViewTelemetryFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableWebViewTelemetry
local WebViewStubModule = require(Modules.LuaApp.Components.WebViewStub)
local GetFFlagWebViewServiceHasBackButtonVisibilityModule = require(Modules.LuaApp.Flags.GetFFlagWebViewServiceHasBackButtonVisibility)
local GetFFlagWebViewHasHideHeaderModule = require(Modules.LuaApp.Flags.GetFFlagWebViewHasHideHeader)
local GetFFlagFixWebViewParamsEmptyArrayCastModule = require(Modules.LuaApp.Flags.GetFFlagFixWebViewParamsEmptyArrayCast)
local FFlagFixSelectionWithWebViews = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFixSelectionWithWebViews
local NewResult = require(CorePackages.Workspace.Packages.AppCommonLib).AsyncQueue.new()
local config = {
	eventName = "WebViewParamsEmpty",
	description = "Counts WebView opens whose WebViewParams would have been an all-nil (Array-shaped) Lua table.",
	lastUpdated = { 2026, 6, 2 },
	backends = { "RobloxTelemetryCounter" }
}

local function _(Text: string): string
	local Match: string = string.match(Text, "^[%a][%w+.-]*://([^/?#]+)") or Text
	
	return string.match(Match, "^([^:?#]+)") or Match
end

local config1 = {
	eventName = "WebViewOpenRequest",
	description = "Counter for WebView open requests via WebViewService OpenWindow/OpenWindowV2",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 5, 29 }
}

local function useWebView(p1)
	-- upvalues: WebViewService (copy), NewResult (copy), TelemetryService (copy), ReactModule (copy), FFlagEnableWebViewStateTracker (copy), WebViewStateTracker (copy), GetFFlagLuaAppEnableWebViewTelemetryFunction (copy), config1 (copy), GetFFlagWebViewHasHideHeaderModule (copy), GetFFlagFixWebViewParamsEmptyArrayCastModule (copy), config (copy), GetFFlagWebViewServiceHasBackButtonVisibilityModule (copy), FFlagFixSelectionWithWebViews (copy), GuiService (copy)
	local WebViewService1 = p1.webViewService or WebViewService
	local WebViewLock = p1.webViewLock or NewResult
	local TelemetryService1 = p1.telemetryService or TelemetryService
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: WebViewLock (copy), UseStateResult2 (copy)
		return (WebViewLock:request(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end))
	end, { WebViewLock })
	local UseRefResult = ReactModule.useRef(true)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult (copy), FFlagEnableWebViewStateTracker (upval), WebViewStateTracker (upval), p1 (copy), GetFFlagLuaAppEnableWebViewTelemetryFunction (upval), TelemetryService1 (copy), config1 (upval), GetFFlagWebViewHasHideHeaderModule (upval), GetFFlagFixWebViewParamsEmptyArrayCastModule (upval), config (upval), WebViewService1 (copy), GetFFlagWebViewServiceHasBackButtonVisibilityModule (upval)
		if not UseStateResult then return end
		if UseRefResult.current then
			UseRefResult.current = false
			
			if FFlagEnableWebViewStateTracker then
				WebViewStateTracker.markOpen(p1.url, p1.title, p1.isVisible, p1.hasBackButton)
			end
			if GetFFlagLuaAppEnableWebViewTelemetryFunction() then
				TelemetryService1:LogCounter(config1, {
					customFields = { url = p1.url },
					standardizedFields = { "addOSInfo" }
				}, 1)
			end
			if GetFFlagWebViewHasHideHeaderModule() then
				local config2 = {
					Title = p1.title,
					IsVisible = p1.isVisible,
					TransitionAnimation = p1.transitionAnimation,
					BackButtonVisible = p1.hasBackButton,
					HideHeader = p1.hideHeader
				}
				
				if GetFFlagFixWebViewParamsEmptyArrayCastModule() and not next(config2) then
					local Url: string = p1.url
					local Match: string = string.match(Url, "^[%a][%w+.-]*://([^/?#]+)") or Url
					TelemetryService1:LogCounter(config, {
						customFields = {
							url = p1.url,
							domain = string.match(Match, "^([^:?#]+)") or Match
						}
					}, 1)
					WebViewService1:OpenWindowV2(p1.url, nil)
					
					return
				else
					WebViewService1:OpenWindowV2(p1.url, config2)
					
					return
				end
			elseif GetFFlagWebViewServiceHasBackButtonVisibilityModule and GetFFlagWebViewServiceHasBackButtonVisibilityModule() then
				WebViewService1:OpenWindow(p1.url, p1.title, p1.isVisible, "", p1.transitionAnimation, false, p1.hasBackButton)
				
				return
			else
				WebViewService1:OpenWindow(p1.url, p1.title, p1.isVisible, p1.transitionAnimation)
				
				return
			end
		else
			if FFlagEnableWebViewStateTracker then
				WebViewStateTracker.updateMetadata(p1.url, p1.title, p1.isVisible, p1.hasBackButton)
			end
			if GetFFlagWebViewServiceHasBackButtonVisibilityModule() then
				WebViewService1:MutateWindow(p1.url, p1.title, p1.isVisible, "", p1.transitionAnimation, false, p1.hasBackButton)
				
				return
			else
				WebViewService1:MutateWindow(p1.url, p1.title, p1.isVisible, p1.transitionAnimation)
			end
		end
	end, {
		UseStateResult, p1.url, p1.title, p1.isVisible, p1.transitionAnimation,
		if GetFFlagWebViewServiceHasBackButtonVisibilityModule() or GetFFlagWebViewHasHideHeaderModule() then p1.hasBackButton else nil,
		if GetFFlagWebViewHasHideHeaderModule() then p1.hideHeader else nil,
		WebViewService1, TelemetryService1
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), WebViewService1 (copy)
		if not UseStateResult then return end
		return function()
			-- upvalues: WebViewService1 (upval)
			WebViewService1:CloseWindow()
		end
	end, { UseStateResult, WebViewService1 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), FFlagEnableWebViewStateTracker (upval), p1 (copy), WebViewService1 (copy), WebViewStateTracker (upval)
		if not UseStateResult then return end
		if not FFlagEnableWebViewStateTracker and p1.windowCloseCallback == nil then return end
		local OnWindowClosedConnection = WebViewService1.OnWindowClosed:Connect(function()
			-- upvalues: FFlagEnableWebViewStateTracker (upval), WebViewStateTracker (upval), p1 (upval)
			if FFlagEnableWebViewStateTracker then
				WebViewStateTracker.markClosed()
			end
			if p1.windowCloseCallback then
				p1.windowCloseCallback()
			end
		end)
		
		return function()
			-- upvalues: OnWindowClosedConnection (copy)
			OnWindowClosedConnection:Disconnect()
		end
	end, {
		UseStateResult,
		p1.windowCloseCallback,
		WebViewService1.OnWindowClosed
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), p1 (copy), WebViewService1 (copy)
		if not UseStateResult then return end
		if p1.javaScriptCallback == nil then return end
		local OnJavaScriptCallConnection = WebViewService1.OnJavaScriptCall:Connect(p1.javaScriptCallback)
		
		return function()
			-- upvalues: OnJavaScriptCallConnection (copy)
			OnJavaScriptCallConnection:Disconnect()
		end
	end, {
		UseStateResult,
		p1.javaScriptCallback,
		WebViewService1.OnJavaScriptCall
	})
	
	if FFlagFixSelectionWithWebViews then
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult (copy), GuiService (upval)
			if not UseStateResult then return end
			local CoreGuiNavigationEnabled = GuiService.CoreGuiNavigationEnabled
			GuiService.CoreGuiNavigationEnabled = false
			
			return function()
				-- upvalues: GuiService (upval), CoreGuiNavigationEnabled (copy)
				GuiService.CoreGuiNavigationEnabled = CoreGuiNavigationEnabled
			end
		end, { UseStateResult })
	end
end

return function(p1)
	-- upvalues: useWebView (copy), ReactModule (copy), WebViewStubModule (copy)
	useWebView(p1)
	local OverlayProps = p1.overlayProps or {}
	
	return ReactModule.createElement(WebViewStubModule, {
		isVisible = OverlayProps.isVisible,
		DisplayOrder = OverlayProps.DisplayOrder
	})
end