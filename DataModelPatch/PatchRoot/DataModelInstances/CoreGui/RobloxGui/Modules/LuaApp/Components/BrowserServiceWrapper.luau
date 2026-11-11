local Modules = game:GetService("CoreGui").RobloxGui.Modules
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local NativePageWrapperModule = require(Modules.LuaApp.Components.NativePageWrapper)
local AppWebViewModule = require(Modules.LuaApp.Components.WebView.AppWebView)
local WebViewWindowModule = require(Modules.LuaApp.Enum.WebViewWindow)
local GetFFlagReplaceBrowserServiceWrapperModule = require(Modules.LuaApp.Flags.GetFFlagReplaceBrowserServiceWrapper)
local WebViewStateTracker = require(CorePackages.Workspace.Packages.WebViewUtils).WebViewStateTracker
local BackDisableStoreModule = require(CorePackages.Workspace.Packages.BackDisableStore)
local FFlagEnableWebViewStateTracker = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableWebViewStateTracker
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagUseBackDisableSignalStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseBackDisableSignalStore
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local BrowserServiceWrapper = RoactModule.PureComponent:extend("BrowserServiceWrapper")

function BrowserServiceWrapper.didMount(p1)
	-- upvalues: BrowserService (copy), FFlagEnableWebViewStateTracker (copy), WebViewStateTracker (copy), HttpService (copy)
	p1.connections = {
		BrowserService.BrowserWindowClosed:Connect(function()
			-- upvalues: FFlagEnableWebViewStateTracker (upval), WebViewStateTracker (upval), p1 (copy)
			if FFlagEnableWebViewStateTracker then
				WebViewStateTracker.markClosed()
			end
			if p1.props.windowClosedCallback then
				p1.props.windowClosedCallback()
			end
		end),
		BrowserService.JavaScriptCallback:Connect(function(Content)
			-- upvalues: p1 (copy)
			if p1.props.javaScriptCallback then
				p1.props.javaScriptCallback(Content)
			end
		end)
	}
	local Json = HttpService:JSONEncode({
		command = "open",
		url = p1.props.url,
		title = p1.props.title,
		visible = p1.props.webViewVisible,
		modal = p1.props.modal,
		isGenericWebview = p1.props.isGenericWebview,
		enableOverlayReplacement = p1.props.enableOverlayReplacement
	})
	
	if FFlagEnableWebViewStateTracker then
		WebViewStateTracker.markOpen(p1.props.url, p1.props.title, p1.props.webViewVisible)
	end
	BrowserService:SendCommand(Json)
end

function BrowserServiceWrapper.didUpdate(p1, p2, _)
	-- upvalues: FFlagUseBackDisableSignalStore (copy), BackDisableStoreModule (copy), FFlagEnableWebViewStateTracker (copy), WebViewStateTracker (copy), BrowserService (copy), HttpService (copy)
	if p2.webViewVisible ~= p1.props.webViewVisible then
		local config = {
			command = "config",
			visible = p1.props.webViewVisible == true
		}
		
		if p1.props.ignoreBackNavigationDisabled ~= true then
			if FFlagUseBackDisableSignalStore then
				config.backNavigationDisabled = BackDisableStoreModule.getIsDisabled(false)
			else
				config.backNavigationDisabled = p1.props.backNavigationDisableCounter > 0
			end
		end
		if FFlagEnableWebViewStateTracker then
			WebViewStateTracker.updateMetadata(p1.props.url, p1.props.title, p1.props.webViewVisible)
		end
		BrowserService:SendCommand(HttpService:JSONEncode(config))
	end
end

function BrowserServiceWrapper.willUnmount(p1)
	-- upvalues: BrowserService (copy)
	for _, connection in ipairs(p1.connections) do
		connection:Disconnect()
	end
	BrowserService:CloseBrowserWindow()
end

function BrowserServiceWrapper.render(p2)
	-- upvalues: RoactModule (copy), NativePageWrapperModule (copy)
	return RoactModule.createElement(NativePageWrapperModule, {
		isVisible = p2.props.isVisible,
		displayOrder = p2.props.displayOrder,
		backNavigationHandledByParent = p2.props.backNavigationHandledByParent
	})
end

if not FFlagUseBackDisableSignalStore then
	BrowserServiceWrapper = RoactRoduxModule.connect(function(p2, _)
		-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
		return {
			backNavigationDisableCounter = if FFlagUseNavigationSelectors then Selectors.selectBackNavigationDisableCounter(p2) else p2.Navigation.backNavigationDisableCounter
		}
	end)(BrowserServiceWrapper)
end
return if GetFFlagReplaceBrowserServiceWrapperModule() then function(p2)
	-- upvalues: RoactModule (copy), AppWebViewModule (copy), WebViewWindowModule (copy)
	return RoactModule.createElement(AppWebViewModule, {
		url = p2.url,
		title = p2.title,
		isVisible = p2.webViewVisible,
		windowType = if p2.modal then WebViewWindowModule.Dialog else WebViewWindowModule.Default,
		windowCloseCallback = p2.windowClosedCallback,
		javaScriptCallback = p2.javaScriptCallback,
		overlayProps = { isVisible = p2.isVisible, DisplayOrder = p2.displayOrder }
	})
end else BrowserServiceWrapper