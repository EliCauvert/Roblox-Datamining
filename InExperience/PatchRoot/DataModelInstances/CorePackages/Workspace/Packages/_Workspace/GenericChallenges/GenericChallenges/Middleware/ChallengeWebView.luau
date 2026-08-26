local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local challengeHeadersModule = require(script.Parent.ChallengeHeaders)
local buildChallengeWebViewUrlModule = require(script.Parent.BuildChallengeWebViewUrl)
local _ = require(script.Parent.BuildHybridCallback)
local _ = require(genericChallenges.Types.ChallengeParameters)
local getFFlagEnableUnifiedWebViews = require(genericChallenges.Parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local var1 = if getFFlagEnableUnifiedWebViews() then game:GetService("WebViewService") else nil
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: getFFlagEnableUnifiedWebViews (ref), var1 (ref), browserService (ref), challengeHeadersModule (ref), buildChallengeWebViewUrlModule (ref), t (ref)
	local t_1 = {}
	
	if getFFlagEnableUnifiedWebViews() then
		t_1.webViewService = p1.webViewService or var1
	else
		t_1.browserService = p1.browserService or browserService
	end
	t_1.challengeUrl = buildChallengeWebViewUrlModule(if p1.rawResponseHeaders ~= nil then challengeHeadersModule.new(p1.rawResponseHeaders) else nil, p1.challengeType, p1.challengeParameters)
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

function t:open()
	-- upvalues: getFFlagEnableUnifiedWebViews (ref), httpService (ref)
	assert(self.hybridCallback ~= nil, "hybrid callback has not been initialized")
	
	if self.openCallback ~= nil then
		self.openCallback()
	end
	if getFFlagEnableUnifiedWebViews() then
		self.hybridCallbackConnection = self.webViewService.OnJavaScriptCall:Connect(self.hybridCallback)
	else
		self.hybridCallbackConnection = self.browserService.JavaScriptCallback:Connect(self.hybridCallback)
	end
	if self.closeCallback ~= nil then
		if getFFlagEnableUnifiedWebViews() then
			self.closeCallbackConnection = self.webViewService.OnWindowClosed:Connect(self.closeCallback)
		else
			self.closeCallbackConnection = self.browserService.BrowserWindowClosed:Connect(self.closeCallback)
		end
	end
	assert(string.len(self.challengeUrl) > 0, "challenge url must have been constructed")
	assert(self.hybridCallbackConnection ~= nil, "hybrid callback connection should be initialized")
	
	if getFFlagEnableUnifiedWebViews() then
		self.webViewService:OpenWindow(self.challengeUrl, self.title, true)
		
		return
	end
	self.browserService:SendCommand(httpService:JSONEncode({
		command = "open",
		visible = true,
		isGenericWebview = true,
		enableOverlayReplacement = true,
		url = self.challengeUrl,
		title = self.title,
		modal = self.modal
	}))
end

function t:close()
	-- upvalues: getFFlagEnableUnifiedWebViews (ref)
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