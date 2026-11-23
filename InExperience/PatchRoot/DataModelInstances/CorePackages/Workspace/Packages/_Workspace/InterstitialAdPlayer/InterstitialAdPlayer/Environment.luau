local InterstitialAdPlayer = script:FindFirstAncestor("InterstitialAdPlayer")
local Parent = InterstitialAdPlayer.Parent
local VideoPlayerModule = require(Parent.VideoPlayer)
local HttpModule = require(Parent.Http)
local _ = require(Parent.React)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local AbuseReportModule = require(InterstitialAdPlayer.AbuseReport)
local MeasurementTelemetryModule = require(InterstitialAdPlayer.MeasurementTelemetry)
local _ = require(InterstitialAdPlayer.types)
local Text = HttpModule.Url.APIS_URL .. "abuse-reporting/v1/abuse-report"
local config = {
	eventName = "InterstitialAdReportSentCounter",
	description = "\t\tCounts the interstitial ad's abuse reports the user submitted, so InterstitialAdReportFailedCounter gives a rate.\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 11, 17 }
}
local config1 = {
	eventName = "InterstitialAdReportFailedCounter",
	description = "\t\tCounts the interstitial ad's abuse reports that could not be filed.\n\t\tCustom field \"stage\" is where it failed: user (not signed in), encode or http.\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 11, 19 }
}

local function readAppPolicy(MemStorageService, HttpService, p1)
	local Success, Result = pcall(function()
		-- upvalues: MemStorageService (copy), p1 (copy)
		return MemStorageService:GetItem(`GUAC:{p1}:app-policy`)
	end)
	
	if Success and Result ~= nil and Result ~= "" then
		local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, Result)
		
		return if Success1 and typeof(Result1) == "table" then Result1 else nil
	else
		return nil
	end
end

local function nowMs()
	return DateTime.now().UnixTimestampMillis
end

return {
	default = function()
		-- upvalues: HttpModule (copy), config (copy), config1 (copy), AbuseReportModule (copy), Text (copy), readAppPolicy (copy), UniversalAppPolicyModule (copy), nowMs (copy), MeasurementTelemetryModule (copy), VideoPlayerModule (copy)
		local BrowserService = game:GetService("BrowserService")
		local ContentProvider = game:GetService("ContentProvider")
		local HttpService = game:GetService("HttpService")
		local MemStorageService = game:GetService("MemStorageService")
		local TelemetryService = game:GetService("TelemetryService")
		local WebViewService = game:GetService("WebViewService")
		local RequestInternalWrapperResult = HttpModule.NetworkLayers.requestInternalWrapper(HttpService)
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
			reportAd = function(p1, p2: number, p3, p4): boolean
				-- upvalues: TelemetryService (copy), config (upval), config1 (upval), HttpService (copy), AbuseReportModule (upval), RequestInternalWrapperResult (copy), Text (upval)
				TelemetryService:LogCounter(config, {}, 1)
				
				local function failed(Stage)
					-- upvalues: TelemetryService (upval), config1 (upval)
					TelemetryService:LogCounter(config1, { customFields = { stage = Stage } }, 1)
				end
				
				if p2 <= 0 then
					failed("user")
					
					return false
				end
				local Success, Result = pcall(HttpService.JSONEncode, HttpService, AbuseReportModule.request(p1, p2, p3, p4))
				
				if Success then
					RequestInternalWrapperResult(Text, "POST", { postBody = Result }):catch(function()
						-- upvalues: failed (copy)
						failed("http")
					end)
					
					return true
				else
					failed("encode")
					
					return false
				end
			end,
			illegalContentReportingUrl = function(p1, p2)
				-- upvalues: readAppPolicy (upval), MemStorageService (copy), HttpService (copy), UniversalAppPolicyModule (upval), HttpModule (upval)
				local AppPolicy = readAppPolicy(MemStorageService, HttpService, p2)
				
				return if AppPolicy == nil or UniversalAppPolicyModule.AppFeaturePolicies(AppPolicy).getShowIllegalContentReportingUI() then `{HttpModule.Url.BASE_URL}illegal-content-reporting?contentURL={HttpService:UrlEncode(`{HttpModule.Url.CREATOR_HUB_URL}store/asset/{p1}`)}` else nil
			end,
			nowMs = nowMs,
			sink = MeasurementTelemetryModule.createSink(TelemetryService, nowMs),
			VideoDisplay = VideoPlayerModule.VideoDisplay
		}
	end
}