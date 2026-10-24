local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local AmpUpsellModule = require(AccountUpgrade.Parent.AmpUpsell)
local AmpApiProvider = AmpUpsellModule.AmpApiProvider
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local MarketingConsentOptInMethodModule = require(AccountUpgrade.MarketingConsentOptInMethod)
local FStringAccountUpgradeAmpNameSpaceModule = require(AccountUpgrade.Flags.FStringAccountUpgradeAmpNameSpace)
local FStringAccountUpgradeMarketingConsentAmpFeatureNameModule = require(AccountUpgrade.Flags.FStringAccountUpgradeMarketingConsentAmpFeatureName)
local FStringAccountUpgradeMarketingConsentGateAmpFeatureNameModule = require(AccountUpgrade.Flags.FStringAccountUpgradeMarketingConsentGateAmpFeatureName)
local FStringDebugAccountUpgradeMarketingConsentOverrideModule = require(AccountUpgrade.Flags.FStringDebugAccountUpgradeMarketingConsentOverride)

return function()
	-- upvalues: FStringDebugAccountUpgradeMarketingConsentOverrideModule (copy), MarketingConsentOptInMethodModule (copy), FStringAccountUpgradeMarketingConsentGateAmpFeatureNameModule (copy), FStringAccountUpgradeMarketingConsentAmpFeatureNameModule (copy), AmpApiProvider (copy), FStringAccountUpgradeAmpNameSpaceModule (copy), AccessResponseEnum (copy)
	if FStringDebugAccountUpgradeMarketingConsentOverrideModule == "AutoOptIn" then
		return MarketingConsentOptInMethodModule.AutoOptIn
	end
	if FStringDebugAccountUpgradeMarketingConsentOverrideModule == "Checkbox" then
		return MarketingConsentOptInMethodModule.Checkbox
	end
	if FStringAccountUpgradeMarketingConsentGateAmpFeatureNameModule == "" or FStringAccountUpgradeMarketingConsentAmpFeatureNameModule == "" then
		return MarketingConsentOptInMethodModule.None
	end
	local Success, Result = pcall(function()
		-- upvalues: AmpApiProvider (upval), FStringAccountUpgradeMarketingConsentGateAmpFeatureNameModule (copy), FStringAccountUpgradeMarketingConsentAmpFeatureNameModule (copy), FStringAccountUpgradeAmpNameSpaceModule (upval)
		return AmpApiProvider.getFeatureAccess({
			FStringAccountUpgradeMarketingConsentGateAmpFeatureNameModule,
			FStringAccountUpgradeMarketingConsentAmpFeatureNameModule
		}, FStringAccountUpgradeAmpNameSpaceModule)
	end)
	
	if not Success or type(Result) ~= "table" or type(Result.featureAccessList) ~= "table" then
		return MarketingConsentOptInMethodModule.None
	end
	local Accesses = {}
	
	for _, value in Result.featureAccessList do
		if type(value) == "table" and type(value.feature) == "string" then
			Accesses[value.feature] = value.access
		end
	end
	if Accesses[FStringAccountUpgradeMarketingConsentGateAmpFeatureNameModule] == AccessResponseEnum.Granted then
		local Access = Accesses[FStringAccountUpgradeMarketingConsentAmpFeatureNameModule]
		
		return if Access == AccessResponseEnum.Granted then MarketingConsentOptInMethodModule.AutoOptIn elseif Access == AccessResponseEnum.Denied then MarketingConsentOptInMethodModule.Checkbox else MarketingConsentOptInMethodModule.None
	else
		return MarketingConsentOptInMethodModule.None
	end
end