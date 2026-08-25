local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local challengeHeadersModule = require(script.Parent.ChallengeHeaders)
local buildChallengeWebViewUrlModule = require(script.Parent.BuildChallengeWebViewUrl)
local _ = require(script.Parent.BuildHybridCallback)
local _ = require(genericChallenges.Types.ChallengeParameters)
local getFFlagEnableUnifiedWebViews = require(genericChallenges.Parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local var5 = if getFFlagEnableUnifiedWebViews() then game:GetService("WebViewService") else nil
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: getFFlagEnableUnifiedWebViews (ref), var5 (ref), browserService (ref), challengeHeadersModule (ref), buildChallengeWebViewUrlModule (ref), t (ref)
	local t_1 = {}
	
	if getFFlagEnableUnifiedWebViews() then
		t_1.webViewService = p0.webViewService or var5
	else
		t_1.browserService = p0.browserService or browserService
	end
	t_1.challengeUrl = buildChallengeWebViewUrlModule(if p0.rawResponseHeaders ~= nil then challengeHeadersModule.new(p0.rawResponseHeaders) else nil, p0.challengeType, p0.challengeParameters)
	t_1.title = p0.title
	
	if p0.hybridCallback ~= nil then
		t_1.hybridCallback = p0.hybridCallback
	end
	if p0.closeCallback ~= nil then
		t_1.closeCallback = p0.closeCallback
	end
	if p0.openCallback ~= nil then
		t_1.openCallback = p0.openCallback
	end
	t_1.hybridCallbackConnection = nil
	t_1.modal = false
	
	if p0.modal ~= nil then
		t_1.modal = p0.modal
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

function t:setOpenCallback(p2)
	self.openCallback = p2
end

function t:setHybridCallback(p3)
	self.hybridCallback = p3
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