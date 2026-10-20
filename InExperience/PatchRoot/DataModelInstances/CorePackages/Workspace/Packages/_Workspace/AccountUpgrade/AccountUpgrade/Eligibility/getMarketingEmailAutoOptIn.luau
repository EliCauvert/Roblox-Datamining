local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local AmpUpsellModule = require(AccountUpgrade.Parent.AmpUpsell)
local AmpApiProvider = AmpUpsellModule.AmpApiProvider
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local FStringAccountUpgradeAmpNameSpaceModule = require(AccountUpgrade.Flags.FStringAccountUpgradeAmpNameSpace)
local FStringAccountUpgradeMarketingConsentAmpFeatureNameModule = require(AccountUpgrade.Flags.FStringAccountUpgradeMarketingConsentAmpFeatureName)

return function(): boolean
	-- upvalues: FStringAccountUpgradeMarketingConsentAmpFeatureNameModule (copy), AmpApiProvider (copy), FStringAccountUpgradeAmpNameSpaceModule (copy), AccessResponseEnum (copy)
	if FStringAccountUpgradeMarketingConsentAmpFeatureNameModule == "" then
		return false
	end
	local Success, Result = pcall(function()
		-- upvalues: AmpApiProvider (upval), FStringAccountUpgradeMarketingConsentAmpFeatureNameModule (copy), FStringAccountUpgradeAmpNameSpaceModule (upval)
		return AmpApiProvider.getFeatureAccess({
			FStringAccountUpgradeMarketingConsentAmpFeatureNameModule
		}, FStringAccountUpgradeAmpNameSpaceModule)
	end)
	
	if Success and type(Result) == "table" then
		local FeatureAccessList = Result.featureAccessList
		
		return type(FeatureAccessList) == "table" and type(FeatureAccessList[1]) == "table" and FeatureAccessList[1].access == AccessResponseEnum.Granted
	else
		return false
	end
end