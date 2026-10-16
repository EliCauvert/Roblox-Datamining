local GetFFlagEnableUnifiedWebViewsFunction = require(script:FindFirstAncestor("AmpUpsell").Parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local WebViewService = game:GetService("WebViewService")
local WebViewServiceWrapperModule = {}
WebViewServiceWrapperModule.__index = WebViewServiceWrapperModule

function WebViewServiceWrapperModule.new(p1) --[[ Line: 47 ]]
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy), WebViewService (copy), WebViewServiceWrapperModule (copy)
	local t = {}
	
	if GetFFlagEnableUnifiedWebViewsFunction() then
		t.webViewService = p1.webViewService or WebViewService
	end
	t.title = p1.title
	t.url = p1.url
	t.closeCallbackConnection = nil
	local self = setmetatable(t, WebViewServiceWrapperModule)
	self:setCloseCallback(p1.closeCallback or function() --[[ Line: 62 ]] end)
	
	return self
end

function WebViewServiceWrapperModule:setCloseCallback(Callback) --[[ Line: 67 ]]
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy)
	if GetFFlagEnableUnifiedWebViewsFunction() then
		function self.closeCallback() --[[ Line: 72 ]]
			-- upvalues: self (copy), Callback (copy)
			self:close()
			
			if Callback ~= nil then
				Callback()
			end
		end
		
		return
	else
		self.closeCallback = Callback
	end
end

function WebViewServiceWrapperModule:setOpenCallback(OpenCallback) --[[ Line: 85 ]]
	self.openCallback = OpenCallback
end

function WebViewServiceWrapperModule:open() --[[ Line: 89 ]]
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy), BrowserService (copy), HttpService (copy)
	if self.openCallback ~= nil then
		self.openCallback()
	end
	if self.closeCallback ~= nil and GetFFlagEnableUnifiedWebViewsFunction() then
		self.closeCallbackConnection = self.webViewService.OnWindowClosed:Connect(self.closeCallback)
	end
	if self.closeCallback ~= nil and not GetFFlagEnableUnifiedWebViewsFunction() then
		self.closeCallbackConnection = BrowserService.BrowserWindowClosed:Connect(self.closeCallback)
	end
	if GetFFlagEnableUnifiedWebViewsFunction() then
		self.webViewService:OpenWindow(self.url, self.title, true)
		
		return
	else
		BrowserService:SendCommand((HttpService:JSONEncode({
			command = "open",
			visible = true,
			isGenericWebview = true,
			enableOverlayReplacement = true,
			url = self.url,
			title = self.title
		})))
	end
end

function WebViewServiceWrapperModule:close() --[[ Line: 117 ]]
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy)
	if GetFFlagEnableUnifiedWebViewsFunction() then
		self.webViewService:CloseWindow()
	end
	if self.closeCallbackConnection ~= nil then
		self.closeCallbackConnection:Disconnect()
	end
end

return WebViewServiceWrapperModule