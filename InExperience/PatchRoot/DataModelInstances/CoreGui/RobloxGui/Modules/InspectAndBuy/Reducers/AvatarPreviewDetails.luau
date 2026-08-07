local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roduxModule = require(corePackagesService.Packages.Rodux)
local parent = script.Parent.Parent
local setAvatarPreviewDetailsModule = require(parent.Actions.SetAvatarPreviewDetails)
local updateBulkPuchaseResultsModule = require(parent.Actions.UpdateBulkPuchaseResults)
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)
local itemTypeEnum = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum

return roduxModule.createReducer({}, {
	[updateBulkPuchaseResultsModule.name] = if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase then function(p0, p1) --[[ line: 31 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { totalPrice = p0.totalPrice - p1.result.RobuxSpent })
	end else nil,
	[setAvatarPreviewDetailsModule.name] = if require(parent.Flags.FFlagAXEnableFetchAvatarPreview) then function(p2, p3) --[[ line: 41 ]]
		-- upvalues: cryoModule (ref), itemTypeEnum (ref)
		local t = {}
		local totalPrice = nil
		local totalValue = nil
		
		if p3.avatarPreviewDetails and p3.avatarPreviewDetails.look then
			local look = p3.avatarPreviewDetails.look
			totalPrice = look.totalPrice
			totalValue = look.totalValue
			
			if look.items then
				t = cryoModule.List.map(look.items, function(p4) --[[ line: 53 ]]
					-- upvalues: itemTypeEnum (copy)
					return {
						id = tostring(p4.id),
						itemType = if p4.itemType == itemTypeEnum.Asset then itemTypeEnum.Asset else itemTypeEnum.Bundle,
						noPriceStatus = p4.noPriceStatus,
						quantityOwned = p4.quantityOwned
					}
				end)
			end
		end
		return cryoModule.Dictionary.join(p2, {
			totalPrice = totalPrice,
			totalValue = totalValue,
			items = t
		})
	end else nil
})