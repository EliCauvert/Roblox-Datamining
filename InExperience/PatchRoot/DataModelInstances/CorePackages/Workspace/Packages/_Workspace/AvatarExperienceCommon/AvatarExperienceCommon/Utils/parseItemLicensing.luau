local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local RunService = game:GetService("RunService")
local ItemLicenseType = require(Parent.AvatarExperienceModel).Enums.ItemLicenseType
local NormalizeModule = require(script.Parent.normalize)
local GetRawItemLicensingInfoModule = require(script.Parent.getRawItemLicensingInfo)
local List = { ItemLicenseType.FirstParty, ItemLicenseType.ThirdParty }
local NormalizeTableFn = NormalizeModule.makeNormalizeTableFn({
	id = { fn = NormalizeModule.normalizeString },
	licenseType = NormalizeModule.makeRequired(NormalizeModule.makeNormalizeValueFn(List)),
	badgeAssetId = { fn = NormalizeModule.normalizeString },
	name = { fn = NormalizeModule.normalizeString },
	licenseHolder = { fn = NormalizeModule.normalizeString },
	licenseDisplayName = if require(Parent.AvatarExperienceFlags).FFlagAXMarketplaceLicensingItemDetails then { fn = NormalizeModule.normalizeString } else nil
})

return function(p1) --[[ Line: 29 ]]
	-- upvalues: GetRawItemLicensingInfoModule (copy), RunService (copy), List (copy), NormalizeTableFn (copy)
	local RawItemLicensingInfoModule = GetRawItemLicensingInfoModule(p1) or p1
	local LicenseType = if type(RawItemLicensingInfoModule) == "table" then RawItemLicensingInfoModule.licenseType else nil
	
	if RunService:IsStudio() and LicenseType ~= nil and table.find(List, LicenseType) == nil then
		warn(`Unsupported item licensing type: {tostring(LicenseType)}`)
	end
	return (NormalizeTableFn(RawItemLicensingInfoModule))
end