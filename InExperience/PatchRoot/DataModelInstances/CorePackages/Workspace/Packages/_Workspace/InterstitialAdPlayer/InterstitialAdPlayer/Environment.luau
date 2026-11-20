local InterstitialAdPlayer = script:FindFirstAncestor("InterstitialAdPlayer")
local Parent = InterstitialAdPlayer.Parent
local VideoPlayerModule = require(Parent.VideoPlayer)
local _ = require(Parent.React)
local MeasurementTelemetryModule = require(InterstitialAdPlayer.MeasurementTelemetry)
local _ = require(InterstitialAdPlayer.types)

local function nowMs()
	return DateTime.now().UnixTimestampMillis
end

return {
	default = function()
		-- upvalues: nowMs (copy), MeasurementTelemetryModule (copy), VideoPlayerModule (copy)
		local BrowserService = game:GetService("BrowserService")
		local ContentProvider = game:GetService("ContentProvider")
		local HttpService = game:GetService("HttpService")
		local WebViewService = game:GetService("WebViewService")
		local WebViewServiceEngineFeature = game:GetEngineFeature("WebViewService")
		
		return {
			heartbeat = game:GetService("RunService").Heartbeat,
			inputBegan = game:GetService("UserInputService").InputBegan,
			leaveRequested = game:GetService("GuiService").ShowLeaveConfirmation,
			openBrowser = function(Url, Callback)
				-- upvalues: WebViewServiceEngineFeature (copy), WebViewService (copy), BrowserService (copy), HttpService (copy)
				return pcall(function()
					-- upvalues: WebViewServiceEngineFeature (upval), WebViewService (upval), Callback (copy), Url (copy), BrowserService (upval), HttpService (upval)
					if WebViewServiceEngineFeature then
						local Connection = nil
						Connection = WebViewService.OnWindowClosed:Connect(function()
							-- upvalues: Connection (ref), WebViewService (upval), Callback (upval)
							Connection:Disconnect()
							WebViewService:CloseWindow()
							Callback()
						end)
						WebViewService:OpenWindow(Url, nil, true, nil, nil, true)
						
						return
					else
						local Connection = nil
						Connection = BrowserService.BrowserWindowClosed:Connect(function()
							-- upvalues: Connection (ref), Callback (upval)
							Connection:Disconnect()
							Callback()
						end)
						BrowserService:SendCommand(HttpService:JSONEncode({
							command = "open",
							visible = true,
							isGenericWebview = true,
							showDomainAsTitle = true,
							url = Url
						}))
					end
				end)
			end,
			closeBrowser = function()
				-- upvalues: WebViewServiceEngineFeature (copy), WebViewService (copy), BrowserService (copy)
				pcall(function()
					-- upvalues: WebViewServiceEngineFeature (upval), WebViewService (upval), BrowserService (upval)
					if WebViewServiceEngineFeature then
						WebViewService:CloseWindow()
						
						return
					else
						BrowserService:CloseBrowserWindow()
					end
				end)
			end,
			preloadFonts = function(ContentIdList)
				-- upvalues: ContentProvider (copy)
				ContentProvider:PreloadAsync(ContentIdList)
			end,
			nowMs = nowMs,
			sink = MeasurementTelemetryModule.createSink(game:GetService("TelemetryService"), nowMs),
			VideoDisplay = VideoPlayerModule.VideoDisplay
		}
	end
}