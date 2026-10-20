local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.Services.Analytics)
local _ = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceInspectAndBuy)

return function(p1, p2, Bundle, Price)
	-- upvalues: ConstantsModule (copy)
	if not p2 then
		return { price = Price }
	end
	local BundleType = nil
	local Number = nil
	if Bundle == ConstantsModule.ItemType.Bundle then
		local Bundle1 = p1.bundles and p1.bundles[p2]
		
		if not Bundle1 then
			return { price = Price }
		end
		BundleType = Bundle1.bundleType
		Number = tonumber(Bundle1.price)
	else
		local Asset = p1.assets and p1.assets[p2]
		
		if not Asset then
			return { price = Price }
		end
		BundleType = Asset.assetTypeId
		Number = tonumber(Asset.price)
	end
	return {
		itemSubType = if BundleType == nil or BundleType == "" then nil else BundleType,
		price = Price or Number
	}
end