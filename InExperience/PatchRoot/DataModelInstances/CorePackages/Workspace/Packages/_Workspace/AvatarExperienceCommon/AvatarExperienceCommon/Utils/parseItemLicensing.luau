local runService = game:GetService("RunService")
local itemLicenseType = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceModel).Enums.ItemLicenseType
local normalizeModule = require(script.Parent.normalize)
local getRawItemLicensingInfoModule = require(script.Parent.getRawItemLicensingInfo)
local list = { itemLicenseType.FirstParty, itemLicenseType.ThirdParty }
local var1 = normalizeModule.makeNormalizeTableFn({
	id = { fn = normalizeModule.normalizeString },
	licenseType = normalizeModule.makeRequired(normalizeModule.makeNormalizeValueFn(list)),
	badgeAssetId = { fn = normalizeModule.normalizeString },
	name = { fn = normalizeModule.normalizeString },
	licenseHolder = { fn = normalizeModule.normalizeString }
})

return function(p1)
	-- upvalues: getRawItemLicensingInfoModule (ref), runService (ref), list (ref), var1 (ref)
	local var2 = getRawItemLicensingInfoModule(p1) or p1
	local var3 = if type(var2) == "table" then var2.licenseType else nil
	
	if runService:IsStudio() and var3 ~= nil and table.find(list, var3) == nil then
		warn(`Unsupported item licensing type: {tostring(var3)}`)
	end
	return var1(var2)
end