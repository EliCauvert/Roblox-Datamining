local getFFlagEnableUnifiedWebViews = require(script:FindFirstAncestor("WebViewUtils").Parent.SharedFlags).GetFFlagEnableUnifiedWebViews
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local webViewService = game:GetService("WebViewService")

local function openUnified(p1, p2, p3)
	-- upvalues: webViewService (ref)
	local onWindowClosedConnection = nil
	local var1 = false
	
	local function stopListening()
		-- upvalues: onWindowClosedConnection (write)
		if onWindowClosedConnection ~= nil then
			onWindowClosedConnection:Disconnect()
			onWindowClosedConnection = nil
		end
	end
	
	local function close()
		-- upvalues: var1 (write), onWindowClosedConnection (write), webViewService (copy)
		if var1 then return end
		var1 = true
		
		if onWindowClosedConnection ~= nil then
			onWindowClosedConnection:Disconnect()
			onWindowClosedConnection = nil
		end
		webViewService:CloseWindow()
	end
	
	onWindowClosedConnection = webViewService.OnWindowClosed:Connect(function()
		-- upvalues: var1 (write), onWindowClosedConnection (write), webViewService (copy), p3 (ref)
		if not var1 then
			var1 = true
			
			if onWindowClosedConnection ~= nil then
				onWindowClosedConnection:Disconnect()
				onWindowClosedConnection = nil
			end
			webViewService:CloseWindow()
		end
		if p3 then
			p3()
		end
	end)
	webViewService:OpenWindow(p1, p2, true)
	
	return close, stopListening
end

local function openBrowser(p1, p2, p3)
	-- upvalues: browserService (ref), httpService (ref)
	local browserWindowClosedConnection = nil
	local var1 = false
	
	local function stopListening()
		-- upvalues: browserWindowClosedConnection (write)
		if browserWindowClosedConnection ~= nil then
			browserWindowClosedConnection:Disconnect()
			browserWindowClosedConnection = nil
		end
	end
	
	if p3 then
		browserWindowClosedConnection = browserService.BrowserWindowClosed:Connect(function()
			-- upvalues: var1 (write), browserWindowClosedConnection (write), p3 (ref)
			var1 = true
			
			if browserWindowClosedConnection ~= nil then
				browserWindowClosedConnection:Disconnect()
				browserWindowClosedConnection = nil
			end
			p3()
		end)
	end
	browserService:SendCommand(httpService:JSONEncode({
		command = "open",
		visible = true,
		isGenericWebview = true,
		enableOverlayReplacement = true,
		url = p1,
		title = p2
	}))
	
	return function()
		-- upvalues: var1 (write), browserWindowClosedConnection (write), browserService (copy)
		if var1 then return end
		var1 = true
		
		if browserWindowClosedConnection ~= nil then
			browserWindowClosedConnection:Disconnect()
			browserWindowClosedConnection = nil
		end
		browserService:CloseBrowserWindow()
	end, stopListening
end

return function(p1, p2, p3)
	-- upvalues: getFFlagEnableUnifiedWebViews (ref), openUnified (ref), openBrowser (ref)
	return if getFFlagEnableUnifiedWebViews() then openUnified(p1, p2, p3) else openBrowser(p1, p2, p3)
end