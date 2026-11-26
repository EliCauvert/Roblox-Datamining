local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local ContentProvider = game:GetService("ContentProvider")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorCreditModule = require(Parent.DataHydration.CreatorCredit)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local WebViewUtilsModule = require(Parent.WebViewUtils)
local OpenWebViewSessionFunction = WebViewUtilsModule.openWebViewSession
local UseOpenWebViewFunction = WebViewUtilsModule.useOpenWebView
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagAppNavMyStatsTab = require(Parent.SharedFlags).FFlagAppNavMyStatsTab
local FFlagBuildExperienceAdsAndRobuxTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceAdsAndRobuxTelemetry)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

local function _(p1): string
	return if p1 == nil then "build-uapp" else `build-uapp-{string.gsub(string.lower(p1.context), "[^%w]+", "-")}`
end

local function getPurchaseRobuxUrl(Attempt): string
	-- upvalues: ContentProvider (copy), FFlagBuildExperienceAdsAndRobuxTelemetryModule (copy)
	return `{string.gsub(string.gsub(ContentProvider.BaseUrl:lower(), "/m.", "/www."), "http:", "https:")}upgrades/robux?ctx={if FFlagBuildExperienceAdsAndRobuxTelemetryModule then if Attempt == nil then "build-uapp" else `build-uapp-{string.gsub(string.lower(Attempt.context), "[^%w]+", "-")}` else "build-uapp"}`
end

local _ = function()
	-- upvalues: CreatorCreditModule (copy)
	local DataResult = CreatorCreditModule.getCreatorCreditStore(false).getQuotaSummarySignals().data(false)
	
	return if DataResult == nil then nil else DataResult.robuxBalance
end

local function reportBuyRobuxReturn(Current)
	-- upvalues: CreatorCreditModule (copy), SendBuildExperienceEventModule (copy)
	local config = {
		buyRobuxAttemptId = Current.attempt.id,
		context = Current.attempt.context,
		isInExperience = if game.GameId == 0 then "false" else "true",
		durationMs = tostring((math.max(0, DateTime.now().UnixTimestampMillis - Current.openedAtMillis)))
	}
	local BalanceBefore = Current.balanceBefore
	
	if BalanceBefore ~= nil then
		config.balanceBefore = tostring(BalanceBefore)
	end
	local Granularity = Current.attempt.granularity or {}
	CreatorCreditModule.getCreatorCreditStore(false).refreshQuotaSummary():andThen(function(Result)
		-- upvalues: config (copy), BalanceBefore (copy), SendBuildExperienceEventModule (upval), Granularity (copy)
		local RobuxBalance = if Result == nil then nil else Result.robuxBalance
		
		if RobuxBalance == nil then
			config.refreshFailed = "true"
		else
			config.balanceAfter = tostring(RobuxBalance)
			
			if BalanceBefore ~= nil then
				config.purchaseDetected = if BalanceBefore < RobuxBalance then "true" else "false"
			end
		end
		SendBuildExperienceEventModule("BUY_ROBUX_RETURN", Granularity, config)
	end, function()
		-- upvalues: config (copy), SendBuildExperienceEventModule (upval), Granularity (copy)
		config.refreshFailed = "true"
		SendBuildExperienceEventModule("BUY_ROBUX_RETURN", Granularity, config)
	end)
end

return function(Callback, p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseOpenWebViewFunction (copy), ReactModule (copy), FFlagBuildExperienceAdsAndRobuxTelemetryModule (copy), reportBuyRobuxReturn (copy), FFlagAppNavMyStatsTab (copy), AppLifecycleObserverService (copy), getPurchaseRobuxUrl (copy), CreatorCreditModule (copy), OpenWebViewSessionFunction (copy)
	local Title = UseLocalizationFunction({
		title = LocalizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_TITLE
	}).title
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = if FFlagBuildExperienceAdsAndRobuxTelemetryModule then ReactModule.useRef(nil) else nil
	local UseRefResult2 = if FFlagBuildExperienceAdsAndRobuxTelemetryModule then ReactModule.useRef(nil) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), Callback (copy)
		if not UseRefResult.current then return end
		UseRefResult.current = false
		
		if Callback then
			Callback()
		end
	end, { Callback })
	local UseResult1 = if FFlagBuildExperienceAdsAndRobuxTelemetryModule then ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), reportBuyRobuxReturn (upval), FFlagAppNavMyStatsTab (upval), UseResult (copy)
		if UseRefResult2 ~= nil then
			UseRefResult2.current = nil
		end
		local Current = if UseRefResult1 == nil then nil else UseRefResult1.current
		
		if UseRefResult1 ~= nil and Current ~= nil then
			UseRefResult1.current = nil
			reportBuyRobuxReturn(Current)
		end
		if FFlagAppNavMyStatsTab then
			UseResult()
		end
	end, { UseResult }) else nil
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy), p1 (copy), AppLifecycleObserverService (upval), UseResult (copy), UseRefResult (copy)
		if Callback == nil then
			return function() end
		else
			local OnUnhideConnection = (p1 or AppLifecycleObserverService).OnUnhide:Connect(UseResult)
			
			return function()
				-- upvalues: UseRefResult (upval), OnUnhideConnection (copy)
				UseRefResult.current = false
				OnUnhideConnection:Disconnect()
			end
		end
	end, { p1, UseResult, Callback })
	
	if FFlagBuildExperienceAdsAndRobuxTelemetryModule then
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy)
			return function()
				-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval)
				if UseRefResult1 ~= nil then
					UseRefResult1.current = nil
				end
				if UseRefResult2 ~= nil and UseRefResult2.current ~= nil then
					UseRefResult2.current()
					UseRefResult2.current = nil
				end
			end
		end, {})
	end
	return ReactModule.useCallback(function(Attempt)
		-- upvalues: UseRefResult (copy), Callback (copy), getPurchaseRobuxUrl (upval), UseRefResult1 (copy), UseRefResult2 (copy), CreatorCreditModule (upval), OpenWebViewSessionFunction (upval), Title (copy), UseResult1 (copy), UseOpenWebViewResult (copy), UseResult (copy)
		UseRefResult.current = Callback ~= nil
		local PurchaseRobuxUrl = getPurchaseRobuxUrl(Attempt)
		
		if UseRefResult1 ~= nil and UseRefResult2 ~= nil then
			UseRefResult1.current = nil
			
			if UseRefResult2.current ~= nil then
				UseRefResult2.current()
				UseRefResult2.current = nil
			end
			if Attempt ~= nil then
				local DataResult = CreatorCreditModule.getCreatorCreditStore(false).getQuotaSummarySignals().data(false)
				UseRefResult1.current = {
					attempt = Attempt,
					openedAtMillis = DateTime.now().UnixTimestampMillis,
					balanceBefore = if DataResult == nil then nil else DataResult.robuxBalance
				}
				local _, OpenWebViewSessionResult2 = OpenWebViewSessionFunction(PurchaseRobuxUrl, Title, UseResult1)
				UseRefResult2.current = OpenWebViewSessionResult2
				
				return
			end
		end
		UseOpenWebViewResult(PurchaseRobuxUrl, Title, if Callback == nil then nil else UseResult)
	end, {
		UseResult,
		Callback,
		UseOpenWebViewResult,
		Title,
		UseResult1
	})
end