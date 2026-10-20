local GetFFlagEnableUnifiedWebViewsFunction = require(script:FindFirstAncestor("WebViewUtils").Parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local WebViewService = game:GetService("WebViewService")

local function openUnified(Url, Title, Callback)
	-- upvalues: WebViewService (copy)
	local Connection = nil
	local Flag = false
	
	local function stopListening()
		-- upvalues: Connection (ref)
		if Connection ~= nil then
			Connection:Disconnect()
			Connection = nil
		end
	end
	
	local function close()
		-- upvalues: Flag (ref), Connection (ref), WebViewService (upval)
		if Flag then return end
		Flag = true
		
		if Connection ~= nil then
			Connection:Disconnect()
			Connection = nil
		end
		WebViewService:CloseWindow()
	end
	
	Connection = WebViewService.OnWindowClosed:Connect(function()
		-- upvalues: Flag (ref), Connection (ref), WebViewService (upval), Callback (copy)
		if not Flag then
			Flag = true
			
			if Connection ~= nil then
				Connection:Disconnect()
				Connection = nil
			end
			WebViewService:CloseWindow()
		end
		if Callback then
			Callback()
		end
	end)
	WebViewService:OpenWindow(Url, Title, true)
	
	return close, stopListening
end

local function openBrowser(Url, Title, Callback)
	-- upvalues: BrowserService (copy), HttpService (copy)
	local Connection = nil
	local Flag = false
	
	local function stopListening()
		-- upvalues: Connection (ref)
		if Connection ~= nil then
			Connection:Disconnect()
			Connection = nil
		end
	end
	
	if Callback then
		Connection = BrowserService.BrowserWindowClosed:Connect(function()
			-- upvalues: Flag (ref), Connection (ref), Callback (copy)
			Flag = true
			
			if Connection ~= nil then
				Connection:Disconnect()
				Connection = nil
			end
			Callback()
		end)
	end
	BrowserService:SendCommand(HttpService:JSONEncode({
		command = "open",
		visible = true,
		isGenericWebview = true,
		enableOverlayReplacement = true,
		url = Url,
		title = Title
	}))
	
	return function()
		-- upvalues: Flag (ref), Connection (ref), BrowserService (upval)
		if Flag then return end
		Flag = true
		
		if Connection ~= nil then
			Connection:Disconnect()
			Connection = nil
		end
		BrowserService:CloseBrowserWindow()
	end, stopListening
end

return function(Url, Title, p1)
	-- upvalues: GetFFlagEnableUnifiedWebViewsFunction (copy), openUnified (copy), openBrowser (copy)
	return if GetFFlagEnableUnifiedWebViewsFunction() then openUnified(Url, Title, p1) else openBrowser(Url, Title, p1)
end