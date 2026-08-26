local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roduxModule = require(corePackagesService.Packages.Rodux)
local parent = script.Parent.Parent
local setAvatarPreviewDetailsModule = require(parent.Actions.SetAvatarPreviewDetails)
local updateBulkPuchaseResultsModule = require(parent.Actions.UpdateBulkPuchaseResults)
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)
local itemTypeEnum = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum

return roduxModule.createReducer({}, {
	[updateBulkPuchaseResultsModule.name] = if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase then function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { totalPrice = p1.totalPrice - p2.result.RobuxSpent })
	end else nil,
	[setAvatarPreviewDetailsModule.name] = if require(parent.Flags.FFlagAXEnableFetchAvatarPreview) then function(p1, p2)
		-- upvalues: cryoModule (ref), itemTypeEnum (ref)
		local t = {}
		local totalPrice = nil
		local totalValue = nil
		
		if p2.avatarPreviewDetails and p2.avatarPreviewDetails.look then
			local look = p2.avatarPreviewDetails.look
			totalPrice = look.totalPrice
			totalValue = look.totalValue
			
			if look.items then
				t = cryoModule.List.map(look.items, function(p3)
					-- upvalues: itemTypeEnum (copy)
					return {
						id = tostring(p3.id),
						itemType = if p3.itemType == itemTypeEnum.Asset then itemTypeEnum.Asset else itemTypeEnum.Bundle,
						noPriceStatus = p3.noPriceStatus,
						quantityOwned = p3.quantityOwned
					}
				end)
			end
		end
		return cryoModule.Dictionary.join(p1, {
			totalPrice = totalPrice,
			totalValue = totalValue,
			items = t
		})
	end else nil
})