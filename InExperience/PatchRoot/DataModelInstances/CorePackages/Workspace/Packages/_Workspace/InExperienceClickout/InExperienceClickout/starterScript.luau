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
		replicatedStorageService:WaitForChild("AdClickoutEvent").Event:Connect(function(p0)
			-- upvalues: flaggedMutedError (copy), httpService (copy), getFFlagEnableUnifiedWebViews (copy), webViewService (copy), clickoutTelemetryModule (copy), browserService (copy)
			if string.find(p0, "[<>]") then
				flaggedMutedError("InExperienceClickout_InvalidURL", `AdClickoutEvent received invalid URL: {p0}`)
				
				return
			elseif not string.match(p0, "^https://") then
				flaggedMutedError("InExperienceClickout_InvalidURL", `AdClickoutEvent received URL with invalid scheme: {p0}`)
				
				return
			elseif #p0 == 0 then
				flaggedMutedError("InExperienceClickout_InvalidURL", "AdClickoutEvent received empty URL.")
				
				return
			elseif #p0 > 512 then
				flaggedMutedError("InExperienceClickout_InvalidURL", `AdClickoutEvent received URL exceeding max length: {p0}`)
				
				return
			end
			local var6 = httpService:GenerateGUID(false)
			local var7 = nil
			var7 = if getFFlagEnableUnifiedWebViews() then webViewService.OnWindowClosed:Connect(function()
				-- upvalues: clickoutTelemetryModule (copy), var6 (ref), p0 (ref), webViewService (copy), var7 (write)
				clickoutTelemetryModule.logWebviewToggled(false, var6, p0)
				webViewService:CloseWindow()
				
				if var7 then
					var7:Disconnect()
					var7 = nil
				end
			end) else browserService.BrowserWindowClosed:Connect(function()
				-- upvalues: clickoutTelemetryModule (copy), var6 (ref), p0 (ref), var7 (write)
				clickoutTelemetryModule.logWebviewToggled(false, var6, p0)
				
				if var7 then
					var7:Disconnect()
					var7 = nil
				end
			end)
			clickoutTelemetryModule.logWebviewToggled(true, var6, p0)
			
			if getFFlagEnableUnifiedWebViews() then
				webViewService:OpenWindow(p0, nil, true, nil, nil, true)
			else
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p0 (ref)
					return httpService:JSONEncode({
						command = "open",
						visible = true,
						isGenericWebview = true,
						showDomainAsTitle = true,
						url = p0
					})
				end)
				
				if not ok then
					flaggedMutedError("InExperienceClickout_JSONEncodeFailed", `AdClickoutEvent failed to JSON encode command for URL: {p0}`)
					
					return
				end
				browserService:SendCommand(status)
			end
		end)
		
		return
	end
end