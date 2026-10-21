local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local LegallySensitiveContentModule = require(Parent.LegallySensitiveContent)
local AccountUpgradeAnalyticsModule = require(AccountUpgrade.Analytics.AccountUpgradeAnalytics)
local _ = require(AccountUpgrade.AccountUpgradeFlow)
local _ = require(AccountUpgrade.AccountUpgradeSurface)
local _ = require(AccountUpgrade.FlowSpec)
local GetMarketingEmailAutoOptInModule = require(AccountUpgrade.Eligibility.getMarketingEmailAutoOptIn)
local SendMarketingConsentModule = require(AccountUpgrade.Utils.sendMarketingConsent)
local FIntAccountUpgradeMarketingConsentMinimumAgeModule = require(AccountUpgrade.Flags.FIntAccountUpgradeMarketingConsentMinimumAge)
local ConsentName = LegallySensitiveContentModule.ConsentName

local function noop() end

return function(p1)
	-- upvalues: LegallySensitiveContentModule (copy), ConsentName (copy), ReactModule (copy), PromiseModule (copy), GetMarketingEmailAutoOptInModule (copy), FIntAccountUpgradeMarketingConsentMinimumAgeModule (copy), AccountUpgradeAnalyticsModule (copy), SendMarketingConsentModule (copy), noop (copy)
	local Flow = p1.flow
	local Surface = p1.surface
	local Birthday = p1.birthday
	local IsShowsMarketingConsent = p1.spec.showsMarketingConsent == true
	local EmailMarketingCheckboxDuringAccountUpgrade, EmailMarketingCheckboxDuringAccountUpgrade2 = LegallySensitiveContentModule.useLegallySensitiveContentAndActions(ConsentName.allowMarketingEmailCheckboxAccountUpgrade, "email-marketing-checkbox-during-account-upgrade")
	local _, EmailMarketingAutoOptInDuringAccountUpgrade2 = LegallySensitiveContentModule.useLegallySensitiveContentAndActions(ConsentName.allowMarketingEmailAutoOptInAccountUpgrade, "email-marketing-auto-opt-in-during-account-upgrade")
	local UseRefResult = ReactModule.useRef(EmailMarketingCheckboxDuringAccountUpgrade2)
	UseRefResult.current = EmailMarketingCheckboxDuringAccountUpgrade2
	local UseRefResult1 = ReactModule.useRef(EmailMarketingAutoOptInDuringAccountUpgrade2)
	UseRefResult1.current = EmailMarketingAutoOptInDuringAccountUpgrade2
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: IsShowsMarketingConsent (copy), PromiseModule (upval), GetMarketingEmailAutoOptInModule (upval), UseStateResult2 (copy)
		if IsShowsMarketingConsent then
			local v1 = PromiseModule.try(GetMarketingEmailAutoOptInModule):andThen(UseStateResult2, function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
			
			return function()
				-- upvalues: v1 (copy)
				v1:cancel()
			end
		else
			return nil
		end
	end, { IsShowsMarketingConsent })
	local IsUseStateResult: boolean = IsShowsMarketingConsent and UseStateResult == true
	local IsAgeInYearsBelow: boolean = Birthday ~= nil and Birthday:GetAgeInYears() < FIntAccountUpgradeMarketingConsentMinimumAgeModule
	local NoIsAgeInYearsBelow: boolean = Birthday ~= nil and not IsAgeInYearsBelow
	local Consent = EmailMarketingCheckboxDuringAccountUpgrade.wordsOfConsent.consent
	local IsNotConsentMatch: boolean = IsShowsMarketingConsent and (UseStateResult == false and (Consent ~= nil and Consent ~= ""))
	local NoIsAgeInYearsBelow1: boolean = IsNotConsentMatch and not IsAgeInYearsBelow
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	
	if not NoIsAgeInYearsBelow1 and UseStateResult1 then
		UseStateResult2_1(false)
	end
	ReactModule.useEffect(function()
		-- upvalues: IsNotConsentMatch (copy), AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy)
		if IsNotConsentMatch then
			AccountUpgradeAnalyticsModule.reportMarketingConsentShown(Flow, Surface, false)
		end
	end, { IsNotConsentMatch, Flow, Surface })
	
	return {
		text = if IsNotConsentMatch then Consent else nil,
		isChecked = NoIsAgeInYearsBelow1 and UseStateResult1,
		isDisabled = IsNotConsentMatch and not NoIsAgeInYearsBelow1,
		onToggled = ReactModule.useCallback(function()
			-- upvalues: NoIsAgeInYearsBelow1 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy), AccountUpgradeAnalyticsModule (upval), Flow (copy), Surface (copy)
			if NoIsAgeInYearsBelow1 then
				local NoUseStateResult1 = not UseStateResult1
				UseStateResult2_1(NoUseStateResult1)
				AccountUpgradeAnalyticsModule.reportMarketingConsentToggled(Flow, Surface, NoUseStateResult1)
				
				return
			end
		end, { NoIsAgeInYearsBelow1, UseStateResult1, Flow, Surface }),
		submit = ReactModule.useCallback(function()
			-- upvalues: PromiseModule (upval), NoIsAgeInYearsBelow (copy), IsUseStateResult (copy), SendMarketingConsentModule (upval), UseRefResult1 (copy), Flow (copy), Surface (copy), AccountUpgradeAnalyticsModule (upval), IsNotConsentMatch (copy), UseStateResult1 (copy), UseRefResult (copy), noop (upval)
			PromiseModule.try(function()
				-- upvalues: NoIsAgeInYearsBelow (upval), IsUseStateResult (upval), SendMarketingConsentModule (upval), UseRefResult1 (upval), Flow (upval), Surface (upval), AccountUpgradeAnalyticsModule (upval), IsNotConsentMatch (upval), UseStateResult1 (upval), UseRefResult (upval)
				if not NoIsAgeInYearsBelow then return end
				if IsUseStateResult then
					SendMarketingConsentModule(UseRefResult1.current.getBase64EncodedAuditHeader, Flow, Surface)
					AccountUpgradeAnalyticsModule.reportMarketingConsentAutoOptIn(Flow, Surface)
					
					return
				end
				if IsNotConsentMatch then
					if UseStateResult1 then
						SendMarketingConsentModule(UseRefResult.current.getBase64EncodedAuditHeader, Flow, Surface)
					end
					AccountUpgradeAnalyticsModule.reportMarketingConsentSubmitted(Flow, Surface, UseStateResult1)
				end
			end):catch(noop)
		end, {
			NoIsAgeInYearsBelow, IsUseStateResult, IsNotConsentMatch, UseStateResult1,
			Flow, Surface
		})
	}
end