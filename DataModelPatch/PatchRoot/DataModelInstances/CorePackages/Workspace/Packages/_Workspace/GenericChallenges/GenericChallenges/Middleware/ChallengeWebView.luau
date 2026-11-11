local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local ChallengeHeadersModule = require(script.Parent.ChallengeHeaders)
local BuildChallengeWebViewUrlModule = require(script.Parent.BuildChallengeWebViewUrl)
local _ = require(script.Parent.BuildHybridCallback)
local _ = require(GenericChallenges.Types.ChallengeParameters)
local GetFFlagEnableUnifiedWebViewsFunction = require(GenericChallenges.Parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local WebViewService = if GetFFlagEnableUnifiedWebViewsFunction() then game:GetService("WebViewService") else nil
local ChallengeWebViewModule = {}
ChallengeWebViewModule.__index = ChallengeWebViewModule

function ChallengeWebViewModule.new(RawResponseHeaders)
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy), WebViewService (copy), BrowserService (copy), ChallengeHeadersModule (copy), BuildChallengeWebViewUrlModule (copy), ChallengeWebViewModule (copy)
	local t = {}
	
	if GetFFlagEnableUnifiedWebViewsFunction() then
		t.webViewService = RawResponseHeaders.webViewService or WebViewService
	else
		t.browserService = RawResponseHeaders.browserService or BrowserService
	end
	t.challengeUrl = BuildChallengeWebViewUrlModule(if RawResponseHeaders.rawResponseHeaders == nil then nil else ChallengeHeadersModule.new(RawResponseHeaders.rawResponseHeaders), RawResponseHeaders.challengeType, RawResponseHeaders.challengeParameters)
	t.title = RawResponseHeaders.title
	
	if RawResponseHeaders.hybridCallback ~= nil then
		t.hybridCallback = RawResponseHeaders.hybridCallback
	end
	if RawResponseHeaders.closeCallback ~= nil then
		t.closeCallback = RawResponseHeaders.closeCallback
	end
	if RawResponseHeaders.openCallback ~= nil then
		t.openCallback = RawResponseHeaders.openCallback
	end
	t.hybridCallbackConnection = nil
	t.modal = false
	
	if RawResponseHeaders.modal ~= nil then
		t.modal = RawResponseHeaders.modal
	end
	return (setmetatable(t, ChallengeWebViewModule))
end

function ChallengeWebViewModule:setCloseCallback(Callback)
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy)
	if GetFFlagEnableUnifiedWebViewsFunction() then
		function self.closeCallback()
			-- upvalues: self (copy), Callback (copy)
			self.webViewService:CloseWindow()
			Callback()
		end
		
		return
	else
		self.closeCallback = Callback
	end
end

function ChallengeWebViewModule:setOpenCallback(OpenCallback)
	self.openCallback = OpenCallback
end

function ChallengeWebViewModule:setHybridCallback(HybridCallback)
	self.hybridCallback = HybridCallback
end

function ChallengeWebViewModule:open()
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy), HttpService (copy)
	assert(self.hybridCallback ~= nil, "hybrid callback has not been initialized")
	
	if self.openCallback ~= nil then
		self.openCallback()
	end
	if GetFFlagEnableUnifiedWebViewsFunction() then
		self.hybridCallbackConnection = self.webViewService.OnJavaScriptCall:Connect(self.hybridCallback)
	else
		self.hybridCallbackConnection = self.browserService.JavaScriptCallback:Connect(self.hybridCallback)
	end
	if self.closeCallback ~= nil then
		if GetFFlagEnableUnifiedWebViewsFunction() then
			self.closeCallbackConnection = self.webViewService.OnWindowClosed:Connect(self.closeCallback)
		else
			self.closeCallbackConnection = self.browserService.BrowserWindowClosed:Connect(self.closeCallback)
		end
	end
	assert(string.len(self.challengeUrl) > 0, "challenge url must have been constructed")
	assert(self.hybridCallbackConnection ~= nil, "hybrid callback connection should be initialized")
	
	if GetFFlagEnableUnifiedWebViewsFunction() then
		self.webViewService:OpenWindow(self.challengeUrl, self.title, true)
		
		return
	else
		self.browserService:SendCommand((HttpService:JSONEncode({
			command = "open",
			visible = true,
			isGenericWebview = true,
			enableOverlayReplacement = true,
			url = self.challengeUrl,
			title = self.title,
			modal = self.modal
		})))
	end
end

function ChallengeWebViewModule:close()
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy)
	if self.hybridCallbackConnection ~= nil then
		self.hybridCallbackConnection:Disconnect()
	end
	if GetFFlagEnableUnifiedWebViewsFunction() then
		self.webViewService:CloseWindow()
	else
		self.browserService:CloseBrowserWindow()
	end
	if self.closeCallbackConnection ~= nil then
		self.closeCallbackConnection:Disconnect()
	end
end

return ChallengeWebViewModule