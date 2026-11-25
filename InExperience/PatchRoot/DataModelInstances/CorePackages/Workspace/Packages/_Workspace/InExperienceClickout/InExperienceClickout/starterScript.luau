local ReplicatedStorage = game:GetService("ReplicatedStorage")
local WebViewService = game:GetService("WebViewService")
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local Parent = script.Parent
local Parent1 = Parent.Parent
local ClickoutTelemetryModule = require(Parent.ClickoutTelemetry)
local FlaggedMutedErrorFunction = require(Parent1.Loggers).flaggedMutedError
local LuaAppIsClickoutEnabledUniverse = game:DefineFastFlag("LuaAppIsClickoutEnabledUniverse", false)
local GetFFlagEnableUnifiedWebViewsFunction = require(Parent1.SharedFlags).GetFFlagEnableUnifiedWebViews

return function()
	-- upvalues: LuaAppIsClickoutEnabledUniverse (copy), ReplicatedStorage (copy), FlaggedMutedErrorFunction (copy), HttpService (copy), GetFFlagEnableUnifiedWebViewsFunction (copy), WebViewService (copy), ClickoutTelemetryModule (copy), BrowserService (copy)
	if LuaAppIsClickoutEnabledUniverse then
		ReplicatedStorage:WaitForChild("AdClickoutEvent").Event:Connect(function(Text: string)
			-- upvalues: FlaggedMutedErrorFunction (upval), HttpService (upval), GetFFlagEnableUnifiedWebViewsFunction (upval), WebViewService (upval), ClickoutTelemetryModule (upval), BrowserService (upval)
			if string.find(Text, "[<>]") then
				FlaggedMutedErrorFunction("InExperienceClickout_InvalidURL", `AdClickoutEvent received invalid URL: {Text}`)
				
				return
			end
			if not string.match(Text, "^https://") then
				FlaggedMutedErrorFunction("InExperienceClickout_InvalidURL", `AdClickoutEvent received URL with invalid scheme: {Text}`)
				
				return
			end
			if #Text == 0 then
				FlaggedMutedErrorFunction("InExperienceClickout_InvalidURL", "AdClickoutEvent received empty URL.")
				
				return
			end
			if #Text > 512 then
				FlaggedMutedErrorFunction("InExperienceClickout_InvalidURL", `AdClickoutEvent received URL exceeding max length: {Text}`)
				
				return
			end
			local Guid = HttpService:GenerateGUID(false)
			local Connection = nil
			Connection = if GetFFlagEnableUnifiedWebViewsFunction() then WebViewService.OnWindowClosed:Connect(function()
				-- upvalues: ClickoutTelemetryModule (upval), Guid (copy), Text (copy), WebViewService (upval), Connection (ref)
				ClickoutTelemetryModule.logWebviewToggled(false, Guid, Text)
				WebViewService:CloseWindow()
				
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end) else BrowserService.BrowserWindowClosed:Connect(function()
				-- upvalues: ClickoutTelemetryModule (upval), Guid (copy), Text (copy), Connection (ref)
				ClickoutTelemetryModule.logWebviewToggled(false, Guid, Text)
				
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end)
			ClickoutTelemetryModule.logWebviewToggled(true, Guid, Text)
			
			if GetFFlagEnableUnifiedWebViewsFunction() then
				WebViewService:OpenWindow(Text, nil, true, nil, nil, true)
			else
				local Success, Result = pcall(function()
					-- upvalues: HttpService (upval), Text (copy)
					return HttpService:JSONEncode({
						command = "open",
						visible = true,
						isGenericWebview = true,
						showDomainAsTitle = true,
						url = Text
					})
				end)
				
				if not Success then
					FlaggedMutedErrorFunction("InExperienceClickout_JSONEncodeFailed", `AdClickoutEvent failed to JSON encode command for URL: {Text}`)
					
					return
				end
				BrowserService:SendCommand(Result)
			end
		end)
		
		return
	end
end