local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local AmpUpsellModule = require(AccountUpgrade.Parent.AmpUpsell)
local AmpApiProvider = AmpUpsellModule.AmpApiProvider
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local FFlagAccountUpgradeInExpGateModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeInExpGate)
local FStringAccountUpgradeAmpFeatureNameModule = require(AccountUpgrade.Flags.FStringAccountUpgradeAmpFeatureName)
local FStringAccountUpgradeAmpNameSpaceModule = require(AccountUpgrade.Flags.FStringAccountUpgradeAmpNameSpace)

local function _(p1) --[[ Line: 28 | Named "malformedAvailability" ]]
	return {
		granted = false,
		access = if type(p1) == "table" and type(p1.access) == "string" then p1.access else "Malformed"
	}
end

return function() --[[ Line: 37 | Named "getPioneerAccountUpgradeAvailability" ]]
	-- upvalues: FFlagAccountUpgradeInExpGateModule (copy), FStringAccountUpgradeAmpFeatureNameModule (copy), FStringAccountUpgradeAmpNameSpaceModule (copy), AmpApiProvider (copy), AccessResponseEnum (copy)
	if not FFlagAccountUpgradeInExpGateModule then
		return { granted = false, access = "Disabled" }
	elseif FStringAccountUpgradeAmpFeatureNameModule == "" or FStringAccountUpgradeAmpNameSpaceModule == "" then
		return { granted = false, access = "Misconfigured" }
	else
		local Success, Result = pcall(function() --[[ Line: 49 ]]
			-- upvalues: AmpApiProvider (upval), FStringAccountUpgradeAmpFeatureNameModule (copy), FStringAccountUpgradeAmpNameSpaceModule (copy)
			return AmpApiProvider.getFeatureAccess({ FStringAccountUpgradeAmpFeatureNameModule }, FStringAccountUpgradeAmpNameSpaceModule)
		end)
		
		if not Success then
			return { granted = false, access = AccessResponseEnum.Error }
		elseif type(Result) ~= "table" then
			return {
				granted = false,
				access = if type(Result) == "table" and type(Result.access) == "string" then Result.access else "Malformed"
			}
		else
			local FeatureAccessList = Result.featureAccessList
			
			if type(FeatureAccessList) == "table" and type(FeatureAccessList[1]) == "table" then
				local Access = FeatureAccessList[1].access
				
				return if type(Access) == "string" then {
					granted = Access == AccessResponseEnum.Granted,
					access = Access
				} else {
					granted = false,
					access = if type(Result) == "table" and type(Result.access) == "string" then Result.access else "Malformed"
				}
			else
				return {
					granted = false,
					access = if type(Result) == "table" and type(Result.access) == "string" then Result.access else "Malformed"
				}
			end
		end
	end
end