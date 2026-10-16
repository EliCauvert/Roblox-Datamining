local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local ChallengeHeadersModule = require(script.Parent.ChallengeHeaders)
local BuildChallengeWebViewUrlModule = require(script.Parent.BuildChallengeWebViewUrl)
local _ = require(script.Parent.BuildHybridCallback)
local _ = require(GenericChallenges.Types.ChallengeParameters)
local GenericTypeModule = require(GenericChallenges.Types.GenericType)
local GetFFlagEnableUnifiedWebViewsFunction = require(GenericChallenges.Parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local FFlagHideChallengeWebViewsUntilDisplayedModule = require(script.Parent.Flags.FFlagHideChallengeWebViewsUntilDisplayed)
local FFlagReleaseTextBoxFocusOnChallengeOpenModule = require(script.Parent.Flags.FFlagReleaseTextBoxFocusOnChallengeOpen)
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local WebViewService = if GetFFlagEnableUnifiedWebViewsFunction() then game:GetService("WebViewService") else nil
local WebViewHasHideHeaderEngineFeature = game:GetEngineFeature("WebViewHasHideHeader")
local HiddenChallengeWebViewTimeoutSeconds = game:DefineFastInt("HiddenChallengeWebViewTimeoutSeconds", 3)
local ChallengeWebViewModule = {}
ChallengeWebViewModule.__index = ChallengeWebViewModule

function ChallengeWebViewModule.new(RawResponseHeaders) --[[ Line: 76 ]]
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy), WebViewService (copy), BrowserService (copy), ChallengeHeadersModule (copy), FFlagHideChallengeWebViewsUntilDisplayedModule (copy), GenericTypeModule (copy), BuildChallengeWebViewUrlModule (copy), ChallengeWebViewModule (copy)
	local t = {}
	
	if GetFFlagEnableUnifiedWebViewsFunction() then
		t.webViewService = RawResponseHeaders.webViewService or WebViewService
	else
		t.browserService = RawResponseHeaders.browserService or BrowserService
	end
	local NewChallengeHeaders = if RawResponseHeaders.rawResponseHeaders == nil then nil else ChallengeHeadersModule.new(RawResponseHeaders.rawResponseHeaders)
	local Typed = if NewChallengeHeaders == nil then nil else NewChallengeHeaders.challengeType.typed
	t.opensVisible = not (FFlagHideChallengeWebViewsUntilDisplayedModule and (Typed == GenericTypeModule.Captcha or (Typed == GenericTypeModule.CaptchaV2 or (Typed == GenericTypeModule.ProofOfWork or Typed == GenericTypeModule.Turnstile))))
	t.visible = t.opensVisible
	t.isOpen = false
	t.openGeneration = 0
	t.challengeUrl = BuildChallengeWebViewUrlModule(NewChallengeHeaders, RawResponseHeaders.challengeType, RawResponseHeaders.challengeParameters)
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

function ChallengeWebViewModule:setCloseCallback(Callback) --[[ Line: 134 ]]
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy)
	if GetFFlagEnableUnifiedWebViewsFunction() then
		function self.closeCallback() --[[ Line: 137 ]]
			-- upvalues: self (copy), Callback (copy)
			self.webViewService:CloseWindow()
			Callback()
		end
		
		return
	else
		self.closeCallback = Callback
	end
end

function ChallengeWebViewModule:setOpenCallback(OpenCallback) --[[ Line: 146 ]]
	self.openCallback = OpenCallback
end

function ChallengeWebViewModule:setHybridCallback(HybridCallback) --[[ Line: 151 ]]
	self.hybridCallback = HybridCallback
end

local function openUnifiedWebView(WebViewService, ChallengeUrl, Title, IsVisible) --[[ Line: 156 ]]
	-- upvalues: FFlagHideChallengeWebViewsUntilDisplayedModule (copy), WebViewHasHideHeaderEngineFeature (copy)
	if FFlagHideChallengeWebViewsUntilDisplayedModule and WebViewHasHideHeaderEngineFeature and not IsVisible then
		WebViewService:OpenWindowV2(ChallengeUrl, { Title = Title, IsVisible = IsVisible })
		
		return
	else
		WebViewService:OpenWindow(ChallengeUrl, Title, IsVisible)
	end
end

local function _() --[[ Line: 167 | Named "releaseFocusedTextBox" ]]
	-- upvalues: UserInputService (copy)
	local FocusedTextBox = UserInputService:GetFocusedTextBox()
	
	if FocusedTextBox then
		FocusedTextBox:ReleaseFocus()
	end
end

local _ = function(WebViewService, Url, Title, IsVisible) --[[ Line: 174 | Named "mutateUnifiedWebViewVisibility" ]]
	WebViewService:MutateWindow(Url, Title, IsVisible, "")
end

function ChallengeWebViewModule:setVisible(Visible) --[[ Line: 183 ]]
	-- upvalues: FFlagReleaseTextBoxFocusOnChallengeOpenModule (copy), UserInputService (copy), GetFFlagEnableUnifiedWebViewsFunction (copy), HttpService (copy)
	if self.visible == Visible or not self.isOpen then return end
	self.visible = Visible
	
	if FFlagReleaseTextBoxFocusOnChallengeOpenModule and Visible then
		local FocusedTextBox = UserInputService:GetFocusedTextBox()
		
		if FocusedTextBox then
			FocusedTextBox:ReleaseFocus()
		end
	end
	if GetFFlagEnableUnifiedWebViewsFunction() then
		self.webViewService:MutateWindow(self.challengeUrl, self.title, Visible, "")
		
		return
	else
		self.browserService:SendCommand(HttpService:JSONEncode({ command = "config", visible = Visible }))
	end
end

function ChallengeWebViewModule:open() --[[ Line: 204 ]]
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy), FFlagReleaseTextBoxFocusOnChallengeOpenModule (copy), UserInputService (copy), openUnifiedWebView (copy), HttpService (copy), HiddenChallengeWebViewTimeoutSeconds (copy)
	assert(self.hybridCallback ~= nil, "hybrid callback has not been initialized")
	
	if self.openCallback ~= nil then
		self.openCallback()
	end
	if GetFFlagEnableUnifiedWebViewsFunction() then
		self.hybridCallbackConnection = self.webViewService.OnJavaScriptCall:Connect(self.hybridCallback)
	else
		self.hybridCallbackConnection = self.browserService.JavaScriptCallback:Connect(self.hybridCallback)
	end
	local CloseCallback = if not self.opensVisible then function() --[[ Line: 217 ]]
		-- upvalues: self (copy)
		self.isOpen = false
		self.visible = self.opensVisible
		
		if self.closeCallback ~= nil then
			self.closeCallback()
		end
	end else self.closeCallback
	
	if CloseCallback ~= nil then
		if GetFFlagEnableUnifiedWebViewsFunction() then
			self.closeCallbackConnection = self.webViewService.OnWindowClosed:Connect(CloseCallback)
		else
			self.closeCallbackConnection = self.browserService.BrowserWindowClosed:Connect(CloseCallback)
		end
	end
	assert(string.len(self.challengeUrl) > 0, "challenge url must have been constructed")
	assert(self.hybridCallbackConnection ~= nil, "hybrid callback connection should be initialized")
	
	if FFlagReleaseTextBoxFocusOnChallengeOpenModule and self.visible then
		local FocusedTextBox = UserInputService:GetFocusedTextBox()
		
		if FocusedTextBox then
			FocusedTextBox:ReleaseFocus()
		end
	end
	self.isOpen = true
	self.openGeneration += 1
	
	if GetFFlagEnableUnifiedWebViewsFunction() then
		openUnifiedWebView(self.webViewService, self.challengeUrl, self.title, self.visible)
	else
		self.browserService:SendCommand((HttpService:JSONEncode({
			command = "open",
			isGenericWebview = true,
			enableOverlayReplacement = true,
			url = self.challengeUrl,
			title = self.title,
			visible = self.visible,
			modal = self.modal
		})))
	end
	if not self.visible then
		local Delay: number = HiddenChallengeWebViewTimeoutSeconds
		
		if Delay <= 0 then
			Delay = 3
		end
		local OpenGeneration = self.openGeneration
		task.delay(Delay, function() --[[ Line: 262 ]]
			-- upvalues: self (copy), OpenGeneration (copy)
			if self.isOpen and self.openGeneration == OpenGeneration and not self.visible then
				self:setVisible(true)
			end
		end)
	end
end

function ChallengeWebViewModule:close() --[[ Line: 270 ]]
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy)
	self.isOpen = false
	self.visible = self.opensVisible
	
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