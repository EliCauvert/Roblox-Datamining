local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local ampUpsellModule = require(accountUpgrade.Parent.AmpUpsell)
local ampApiProvider = ampUpsellModule.AmpApiProvider
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local fFlagAccountUpgradeInExpGateModule = require(accountUpgrade.Flags.FFlagAccountUpgradeInExpGate)
local fStringAccountUpgradeAmpFeatureNameModule = require(accountUpgrade.Flags.FStringAccountUpgradeAmpFeatureName)
local fStringAccountUpgradeAmpNameSpaceModule = require(accountUpgrade.Flags.FStringAccountUpgradeAmpNameSpace)

local function _(p1)
	return {
		granted = false,
		access = if type(p1) == "table" and type(p1.access) == "string" then p1.access else "Malformed"
	}
end

return function()
	-- upvalues: fFlagAccountUpgradeInExpGateModule (ref), fStringAccountUpgradeAmpFeatureNameModule (ref), fStringAccountUpgradeAmpNameSpaceModule (ref), ampApiProvider (ref), accessResponseEnum (ref)
	if not fFlagAccountUpgradeInExpGateModule then
		return { granted = false, access = "Disabled" }
	elseif fStringAccountUpgradeAmpFeatureNameModule == "" or fStringAccountUpgradeAmpNameSpaceModule == "" then
		return { granted = false, access = "Misconfigured" }
	end
	local ok, status = pcall(function()
		-- upvalues: ampApiProvider (copy), fStringAccountUpgradeAmpFeatureNameModule (ref), fStringAccountUpgradeAmpNameSpaceModule (ref)
		return ampApiProvider.getFeatureAccess({ fStringAccountUpgradeAmpFeatureNameModule }, fStringAccountUpgradeAmpNameSpaceModule)
	end)
	
	if not ok then
		return { granted = false, access = accessResponseEnum.Error }
	elseif type(status) == "table" then
		local featureAccessList = status.featureAccessList
		
		if type(featureAccessList) == "table" and type(featureAccessList[1]) == "table" then
			local access = featureAccessList[1].access
			
			return if type(access) == "string" then {
				granted = access == accessResponseEnum.Granted,
				access = access
			} else {
				granted = false,
				access = if type(status) == "table" and type(status.access) == "string" then status.access else "Malformed"
			}
		end
		return {
			granted = false,
			access = if type(status) == "table" and type(status.access) == "string" then status.access else "Malformed"
		}
	else
		return {
			granted = false,
			access = if type(status) == "table" and type(status.access) == "string" then status.access else "Malformed"
		}
	end
end