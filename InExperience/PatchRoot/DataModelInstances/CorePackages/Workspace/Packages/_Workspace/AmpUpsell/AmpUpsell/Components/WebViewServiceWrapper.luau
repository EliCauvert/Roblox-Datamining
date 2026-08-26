local getFFlagEnableUnifiedWebViews = require(script:FindFirstAncestor("AmpUpsell").Parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local webViewService = game:GetService("WebViewService")
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: getFFlagEnableUnifiedWebViews (ref), webViewService (ref), t (ref)
	local t_1 = {}
	
	if getFFlagEnableUnifiedWebViews() then
		t_1.webViewService = p1.webViewService or webViewService
	end
	t_1.title = p1.title
	t_1.url = p1.url
	t_1.closeCallbackConnection = nil
	local tbl = setmetatable(t_1, t)
	tbl:setCloseCallback(p1.closeCallback or function() end)
	
	return tbl
end

function t:setCloseCallback(p1)
	-- upvalues: getFFlagEnableUnifiedWebViews (ref)
	if getFFlagEnableUnifiedWebViews() then
		function self.closeCallback()
			-- upvalues: self (ref), p1 (ref)
			self:close()
			
			if p1 ~= nil then
				p1()
			end
		end
		
		return
	end
	self.closeCallback = p1
end

function t:setOpenCallback(p1)
	self.openCallback = p1
end

function t:open()
	-- upvalues: getFFlagEnableUnifiedWebViews (ref), browserService (ref), httpService (ref)
	if self.openCallback ~= nil then
		self.openCallback()
	end
	if self.closeCallback ~= nil and getFFlagEnableUnifiedWebViews() then
		self.closeCallbackConnection = self.webViewService.OnWindowClosed:Connect(self.closeCallback)
	end
	if self.closeCallback ~= nil and not getFFlagEnableUnifiedWebViews() then
		self.closeCallbackConnection = browserService.BrowserWindowClosed:Connect(self.closeCallback)
	end
	if getFFlagEnableUnifiedWebViews() then
		self.webViewService:OpenWindow(self.url, self.title, true)
		
		return
	end
	browserService:SendCommand(httpService:JSONEncode({
		command = "open",
		visible = true,
		isGenericWebview = true,
		enableOverlayReplacement = true,
		url = self.url,
		title = self.title
	}))
end

function t:close()
	-- upvalues: getFFlagEnableUnifiedWebViews (ref)
	if getFFlagEnableUnifiedWebViews() then
		self.webViewService:CloseWindow()
	end
	if self.closeCallbackConnection ~= nil then
		self.closeCallbackConnection:Disconnect()
	end
end

return t