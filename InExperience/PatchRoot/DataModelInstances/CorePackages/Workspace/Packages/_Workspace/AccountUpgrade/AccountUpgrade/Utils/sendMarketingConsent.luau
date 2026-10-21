local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local PromiseModule = require(Parent.Promise)
local LegallySensitiveContentModule = require(Parent.LegallySensitiveContent)
local AccountUpgradeAnalyticsModule = require(AccountUpgrade.Analytics.AccountUpgradeAnalytics)
local _ = require(AccountUpgrade.AccountUpgradeFlow)
local _ = require(AccountUpgrade.AccountUpgradeSurface)
local FIntAccountUpgradeMarketingConsentWriteDelayMsModule = require(AccountUpgrade.Flags.FIntAccountUpgradeMarketingConsentWriteDelayMs)
local UserSetting = LegallySensitiveContentModule.UserSetting
local config = {
	channelSettings = { { channelName = "Email", setting = "Enabled" } }
}

local function noop() end

local function _(p1)
	return if type(p1) == "table" then p1.statusCode else nil
end

local _ = function(p1)
	return if type(p1) == "table" and type(p1.message) == "string" then p1.message else tostring(p1)
end

local _ = function()
	-- upvalues: FIntAccountUpgradeMarketingConsentWriteDelayMsModule (copy), PromiseModule (copy)
	return if FIntAccountUpgradeMarketingConsentWriteDelayMsModule <= 0 then PromiseModule.resolve() else PromiseModule.delay(FIntAccountUpgradeMarketingConsentWriteDelayMsModule / 1000)
end

return function(Callback, p1, p2)
	-- upvalues: PromiseModule (copy), FIntAccountUpgradeMarketingConsentWriteDelayMsModule (copy), LegallySensitiveContentModule (copy), UserSetting (copy), config (copy), AccountUpgradeAnalyticsModule (copy), noop (copy)
	PromiseModule.try(function()
		-- upvalues: Callback (copy), FIntAccountUpgradeMarketingConsentWriteDelayMsModule (upval), PromiseModule (upval), LegallySensitiveContentModule (upval), UserSetting (upval), config (upval)
		local CallbackResult = Callback()
		
		return (if FIntAccountUpgradeMarketingConsentWriteDelayMsModule <= 0 then PromiseModule.resolve() else PromiseModule.delay(FIntAccountUpgradeMarketingConsentWriteDelayMsModule / 1000)):andThen(function()
			-- upvalues: LegallySensitiveContentModule (upval), UserSetting (upval), config (upval), CallbackResult (copy)
			return LegallySensitiveContentModule.updateUserSettingV2(UserSetting.allowPromotionalOffersNotifications, config, CallbackResult)
		end)
	end):andThen(function()
		-- upvalues: AccountUpgradeAnalyticsModule (upval), p1 (copy), p2 (copy)
		AccountUpgradeAnalyticsModule.reportMarketingConsentWriteSucceeded(p1, p2)
	end, function(p3)
		-- upvalues: AccountUpgradeAnalyticsModule (upval), p1 (copy), p2 (copy)
		warn(`AccountUpgrade: marketing consent write failed, {if type(p3) == "table" and type(p3.message) == "string" then p3.message else tostring(p3)}`)
		AccountUpgradeAnalyticsModule.reportMarketingConsentWriteFailed(p1, p2, if type(p3) == "table" then p3.statusCode else nil)
	end):catch(noop)
end