local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local challengeHeadersModule = require(script.Parent.ChallengeHeaders)
local buildChallengeWebViewUrlModule = require(script.Parent.BuildChallengeWebViewUrl)
local _ = require(script.Parent.BuildHybridCallback)
local _ = require(genericChallenges.Types.ChallengeParameters)
local genericTypeModule = require(genericChallenges.Types.GenericType)
local getFFlagEnableUnifiedWebViews = require(genericChallenges.Parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local fFlagHideChallengeWebViewsUntilDisplayedModule = require(script.Parent.Flags.FFlagHideChallengeWebViewsUntilDisplayed)
local fFlagReleaseTextBoxFocusOnChallengeOpenModule = require(script.Parent.Flags.FFlagReleaseTextBoxFocusOnChallengeOpen)
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local var1 = if getFFlagEnableUnifiedWebViews() then game:GetService("WebViewService") else nil
local webViewHasHideHeaderEngineFeature = game:GetEngineFeature("WebViewHasHideHeader")
local hiddenChallengeWebViewTimeoutSeconds = game:DefineFastInt("HiddenChallengeWebViewTimeoutSeconds", 3)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: getFFlagEnableUnifiedWebViews (ref), var1 (ref), browserService (ref), challengeHeadersModule (ref), fFlagHideChallengeWebViewsUntilDisplayedModule (ref), genericTypeModule (ref), buildChallengeWebViewUrlModule (ref), t (ref)
	local t_1 = {}
	
	if getFFlagEnableUnifiedWebViews() then
		t_1.webViewService = p1.webViewService or var1
	else
		t_1.browserService = p1.browserService or browserService
	end
	local var2 = if p1.rawResponseHeaders ~= nil then challengeHeadersModule.new(p1.rawResponseHeaders) else nil
	local var3 = if var2 ~= nil then nil else var2.challengeType.typed
	t_1.opensVisible = not (fFlagHideChallengeWebViewsUntilDisplayedModule and (if var3 ~= genericTypeModule.Captcha then if var3 ~= genericTypeModule.CaptchaV2 then if var3 ~= genericTypeModule.ProofOfWork then var3 == genericTypeModule.Turnstile else true else true else true))
	t_1.visible = t_1.opensVisible
	t_1.isOpen = false
	t_1.openGeneration = 0
	t_1.challengeUrl = buildChallengeWebViewUrlModule(var2, p1.challengeType, p1.challengeParameters)
	t_1.title = p1.title
	
	if p1.hybridCallback ~= nil then
		t_1.hybridCallback = p1.hybridCallback
	end
	if p1.closeCallback ~= nil then
		t_1.closeCallback = p1.closeCallback
	end
	if p1.openCallback ~= nil then
		t_1.openCallback = p1.openCallback
	end
	t_1.hybridCallbackConnection = nil
	t_1.modal = false
	
	if p1.modal ~= nil then
		t_1.modal = p1.modal
	end
	return setmetatable(t_1, t)
end

function t:setCloseCallback(p1)
	-- upvalues: getFFlagEnableUnifiedWebViews (ref)
	if getFFlagEnableUnifiedWebViews() then
		function self.closeCallback()
			-- upvalues: self (ref), p1 (ref)
			self.webViewService:CloseWindow()
			p1()
		end
		
		return
	end
	self.closeCallback = p1
end

function t:setOpenCallback(p1)
	self.openCallback = p1
end

function t:setHybridCallback(p1)
	self.hybridCallback = p1
end

local function openUnifiedWebView(p1, p2, p3, p4)
	-- upvalues: fFlagHideChallengeWebViewsUntilDisplayedModule (ref), webViewHasHideHeaderEngineFeature (ref)
	if fFlagHideChallengeWebViewsUntilDisplayedModule and webViewHasHideHeaderEngineFeature and not p4 then
		p1:OpenWindowV2(p2, { Title = p3, IsVisible = p4 })
		
		return
	end
	p1:OpenWindow(p2, p3, p4)
end

local function _()
	-- upvalues: userInputService (ref)
	local focusedTextBox = userInputService:GetFocusedTextBox()
	
	if focusedTextBox then
		focusedTextBox:ReleaseFocus()
	end
end

local _ = function(p1, p2, p3, p4)
	p1:MutateWindow(p2, p3, p4, "")
end

function t:setVisible(p1)
	-- upvalues: fFlagReleaseTextBoxFocusOnChallengeOpenModule (ref), userInputService (ref), getFFlagEnableUnifiedWebViews (ref), httpService (ref)
	if self.visible == p1 or not self.isOpen then return end
	self.visible = p1
	
	if fFlagReleaseTextBoxFocusOnChallengeOpenModule and p1 then
		local focusedTextBox = userInputService:GetFocusedTextBox()
		
		if focusedTextBox then
			focusedTextBox:ReleaseFocus()
		end
	end
	if getFFlagEnableUnifiedWebViews() then
		self.webViewService:MutateWindow(self.challengeUrl, self.title, p1, "")
		
		return
	end
	self.browserService:SendCommand(httpService:JSONEncode({ command = "config", visible = p1 }))
end

function t:open()
	-- upvalues: getFFlagEnableUnifiedWebViews (ref), fFlagReleaseTextBoxFocusOnChallengeOpenModule (ref), userInputService (ref), openUnifiedWebView (ref), httpService (ref), hiddenChallengeWebViewTimeoutSeconds (ref)
	assert(self.hybridCallback ~= nil, "hybrid callback has not been initialized")
	
	if self.openCallback ~= nil then
		self.openCallback()
	end
	if getFFlagEnableUnifiedWebViews() then
		self.hybridCallbackConnection = self.webViewService.OnJavaScriptCall:Connect(self.hybridCallback)
	else
		self.hybridCallbackConnection = self.browserService.JavaScriptCallback:Connect(self.hybridCallback)
	end
	local var2 = if not self.opensVisible then function()
		-- upvalues: self (ref)
		self.isOpen = false
		self.visible = self.opensVisible
		
		if self.closeCallback ~= nil then
			self.closeCallback()
		end
	end else self.closeCallback
	
	if var2 ~= nil then
		if getFFlagEnableUnifiedWebViews() then
			self.closeCallbackConnection = self.webViewService.OnWindowClosed:Connect(var2)
		else
			self.closeCallbackConnection = self.browserService.BrowserWindowClosed:Connect(var2)
		end
	end
	assert(string.len(self.challengeUrl) > 0, "challenge url must have been constructed")
	assert(self.hybridCallbackConnection ~= nil, "hybrid callback connection should be initialized")
	
	if fFlagReleaseTextBoxFocusOnChallengeOpenModule and self.visible then
		local focusedTextBox = userInputService:GetFocusedTextBox()
		
		if focusedTextBox then
			focusedTextBox:ReleaseFocus()
		end
	end
	self.isOpen = true
	self.openGeneration += 1
	
	if getFFlagEnableUnifiedWebViews() then
		openUnifiedWebView(self.webViewService, self.challengeUrl, self.title, self.visible)
	else
		self.browserService:SendCommand(httpService:JSONEncode({
			command = "open",
			isGenericWebview = true,
			enableOverlayReplacement = true,
			url = self.challengeUrl,
			title = self.title,
			visible = self.visible,
			modal = self.modal
		}))
	end
	if not self.visible then
		local var3 = hiddenChallengeWebViewTimeoutSeconds
		
		if var3 <= 0 then
			var3 = 3
		end
		local openGeneration = self.openGeneration
		task.delay(var3, function()
			-- upvalues: self (ref), openGeneration (ref)
			if self.isOpen and self.openGeneration == openGeneration and not self.visible then
				self:setVisible(true)
			end
		end)
	end
end

function t:close()
	-- upvalues: getFFlagEnableUnifiedWebViews (ref)
	self.isOpen = false
	self.visible = self.opensVisible
	
	if self.hybridCallbackConnection ~= nil then
		self.hybridCallbackConnection:Disconnect()
	end
	if getFFlagEnableUnifiedWebViews() then
		self.webViewService:CloseWindow()
	else
		self.browserService:CloseBrowserWindow()
	end
	if self.closeCallbackConnection ~= nil then
		self.closeCallbackConnection:Disconnect()
	end
end

return t