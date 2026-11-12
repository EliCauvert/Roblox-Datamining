local HttpService = game:GetService("HttpService")
local GetFFlagEnableUnifiedWebViews = require(script.Parent.Parent.SharedFlags).GetFFlagEnableUnifiedWebViews

local function createWebViewWindow(p1)
	-- upvalues: HttpService (copy)
	local Flag = false
	local OnClosed = nil
	local BrowserWindowClosedConnection = nil
	
	local function handleClosed()
		-- upvalues: Flag (ref), OnClosed (ref)
		if not Flag then return end
		Flag = false
		local Callback: () -> () = OnClosed
		OnClosed = nil
		
		if Callback then
			Callback()
		end
	end
	
	local function ensureConnected()
		-- upvalues: BrowserWindowClosedConnection (ref), p1 (copy), Flag (ref), OnClosed (ref), handleClosed (copy)
		if BrowserWindowClosedConnection then return end
		if p1.isUnifiedWebViewEnabled() then
			BrowserWindowClosedConnection = p1.webViewService.OnWindowClosed:Connect(function()
				-- upvalues: Flag (upval), p1 (upval), OnClosed (upval)
				if Flag then
					p1.webViewService:CloseWindow()
				end
				if not Flag then return end
				Flag = false
				local Callback: () -> () = OnClosed
				OnClosed = nil
				
				if Callback then
					Callback()
				end
			end)
			
			return
		else
			BrowserWindowClosedConnection = p1.browserService.BrowserWindowClosed:Connect(handleClosed)
		end
	end
	
	return {
		open = function(Url, Title, p2)
			-- upvalues: ensureConnected (copy), Flag (ref), OnClosed (ref), p1 (copy), HttpService (upval)
			ensureConnected()
			
			if Flag then
				Flag = false
				local Callback: () -> () = OnClosed
				OnClosed = nil
				
				if Callback then
					Callback()
				end
			end
			Flag = true
			OnClosed = p2 and p2.onClosed
			local WindowType = p2 and p2.windowType
			
			if not p1.isUnifiedWebViewEnabled() then
				p1.browserService:SendCommand(HttpService:JSONEncode({
					command = "open",
					visible = true,
					isGenericWebview = true,
					enableOverlayReplacement = true,
					url = Url,
					title = Title
				}))
				
				return
			end
			if WindowType == "Dialog" then
				p1.webViewService:OpenWindow(Url, Title, true, nil, WindowType)
				
				return
			else
				p1.webViewService:OpenWindow(Url, Title, true)
			end
		end,
		close = function()
			-- upvalues: Flag (ref), p1 (copy), OnClosed (ref)
			if not Flag then return end
			if p1.isUnifiedWebViewEnabled() then
				p1.webViewService:CloseWindow()
			else
				p1.browserService:CloseBrowserWindow()
			end
			if not Flag then return end
			Flag = false
			local Callback: () -> () = OnClosed
			OnClosed = nil
			
			if Callback then
				Callback()
			end
		end,
		isOpen = function()
			-- upvalues: Flag (ref)
			return Flag
		end
	}
end

local v1 = nil

return {
	createWebViewWindow = createWebViewWindow,
	getDefault = function()
		-- upvalues: v1 (ref), createWebViewWindow (copy), GetFFlagEnableUnifiedWebViews (copy)
		if not v1 then
			v1 = createWebViewWindow({
				webViewService = game:GetService("WebViewService"),
				browserService = game:GetService("BrowserService"),
				isUnifiedWebViewEnabled = GetFFlagEnableUnifiedWebViews
			})
		end
		return v1
	end
}