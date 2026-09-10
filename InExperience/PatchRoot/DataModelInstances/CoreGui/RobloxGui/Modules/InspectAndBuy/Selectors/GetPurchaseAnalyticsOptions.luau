local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.Services.Analytics)
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)

return function(p1, p2, p3, p4)
	-- upvalues: constantsModule (ref)
	if not p2 then
		return { price = p4 }
	end
	local bundleType, var1
	local _ = nil
	local _ = nil
	
	if p3 == constantsModule.ItemType.Bundle then
		local var2 = p1.bundles and p1.bundles[p2]
		
		if not var2 then
			return { price = p4 }
		end
		bundleType = var2.bundleType
		var1 = tonumber(var2.price)
	else
		local var3 = p1.assets and p1.assets[p2]
		
		if not var3 then
			return { price = p4 }
		end
		bundleType = var3.assetTypeId
		var1 = tonumber(var3.price)
	end
	return {
		itemSubType = if bundleType == nil or bundleType == "" then nil else bundleType,
		price = p4 or var1
	}
end