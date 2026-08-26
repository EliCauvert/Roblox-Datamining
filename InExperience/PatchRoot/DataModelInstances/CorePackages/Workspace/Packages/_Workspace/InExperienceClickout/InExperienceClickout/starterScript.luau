local replicatedStorageService = game:GetService("ReplicatedStorage")
local webViewService = game:GetService("WebViewService")
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local parent = script.Parent
local parent_1 = parent.Parent
local clickoutTelemetryModule = require(parent.ClickoutTelemetry)
local flaggedMutedError = require(parent_1.Loggers).flaggedMutedError
local luaAppIsClickoutEnabledUniverse = game:DefineFastFlag("LuaAppIsClickoutEnabledUniverse", false)
local getFFlagEnableUnifiedWebViews = require(parent_1.SharedFlags).GetFFlagEnableUnifiedWebViews

return function()
	-- upvalues: luaAppIsClickoutEnabledUniverse (ref), replicatedStorageService (ref), flaggedMutedError (ref), httpService (ref), getFFlagEnableUnifiedWebViews (ref), webViewService (ref), clickoutTelemetryModule (ref), browserService (ref)
	if luaAppIsClickoutEnabledUniverse then
		replicatedStorageService:WaitForChild("AdClickoutEvent").Event:Connect(function(p1)
			-- upvalues: flaggedMutedError (copy), httpService (copy), getFFlagEnableUnifiedWebViews (copy), webViewService (copy), clickoutTelemetryModule (copy), browserService (copy)
			if string.find(p1, "[<>]") then
				flaggedMutedError("InExperienceClickout_InvalidURL", `AdClickoutEvent received invalid URL: {p1}`)
				
				return
			elseif not string.match(p1, "^https://") then
				flaggedMutedError("InExperienceClickout_InvalidURL", `AdClickoutEvent received URL with invalid scheme: {p1}`)
				
				return
			elseif #p1 == 0 then
				flaggedMutedError("InExperienceClickout_InvalidURL", "AdClickoutEvent received empty URL.")
				
				return
			elseif #p1 > 512 then
				flaggedMutedError("InExperienceClickout_InvalidURL", `AdClickoutEvent received URL exceeding max length: {p1}`)
				
				return
			end
			local var1 = httpService:GenerateGUID(false)
			local var2 = nil
			var2 = if getFFlagEnableUnifiedWebViews() then webViewService.OnWindowClosed:Connect(function()
				-- upvalues: clickoutTelemetryModule (copy), var1 (ref), p1 (ref), webViewService (copy), var2 (write)
				clickoutTelemetryModule.logWebviewToggled(false, var1, p1)
				webViewService:CloseWindow()
				
				if var2 then
					var2:Disconnect()
					var2 = nil
				end
			end) else browserService.BrowserWindowClosed:Connect(function()
				-- upvalues: clickoutTelemetryModule (copy), var1 (ref), p1 (ref), var2 (write)
				clickoutTelemetryModule.logWebviewToggled(false, var1, p1)
				
				if var2 then
					var2:Disconnect()
					var2 = nil
				end
			end)
			clickoutTelemetryModule.logWebviewToggled(true, var1, p1)
			
			if getFFlagEnableUnifiedWebViews() then
				webViewService:OpenWindow(p1, nil, true, nil, nil, true)
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p1 (ref)
					return httpService:JSONEncode({
						command = "open",
						visible = true,
						isGenericWebview = true,
						showDomainAsTitle = true,
						url = p1
					})
				end)
				
				if not ok then
					flaggedMutedError("InExperienceClickout_JSONEncodeFailed", `AdClickoutEvent failed to JSON encode command for URL: {p1}`)
					
					return
				end
				browserService:SendCommand(status)
			end
		end)
		
		return
	end
end