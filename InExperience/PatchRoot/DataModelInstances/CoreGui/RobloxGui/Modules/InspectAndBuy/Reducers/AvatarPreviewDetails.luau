local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceInspectAndBuy)
local ItemTypeEnum = require(CorePackages.Workspace.Packages.AvatarExperienceModel).Enums.ItemTypeEnum
local FFlagAXEnableFetchAvatarPreviewModule = require(Parent.Flags.FFlagAXEnableFetchAvatarPreview)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Parent.Actions.UpdateBulkPuchaseResults).name] = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase then function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { totalPrice = p1.totalPrice - p2.result.RobuxSpent })
	end else nil,
	[require(Parent.Actions.SetAvatarPreviewDetails).name] = if FFlagAXEnableFetchAvatarPreviewModule then function(p1, p2)
		-- upvalues: CryoModule (copy), ItemTypeEnum (copy)
		local MapResult = {}
		local TotalPrice = nil
		local TotalValue = nil
		
		if p2.avatarPreviewDetails and p2.avatarPreviewDetails.look then
			local Look = p2.avatarPreviewDetails.look
			TotalPrice = Look.totalPrice
			TotalValue = Look.totalValue
			
			if Look.items then
				MapResult = CryoModule.List.map(Look.items, function(p3)
					-- upvalues: ItemTypeEnum (upval)
					return {
						id = tostring(p3.id),
						itemType = if p3.itemType == ItemTypeEnum.Asset then ItemTypeEnum.Asset else ItemTypeEnum.Bundle,
						noPriceStatus = p3.noPriceStatus,
						quantityOwned = p3.quantityOwned
					}
				end)
			end
		end
		return CryoModule.Dictionary.join(p1, {
			totalPrice = TotalPrice,
			totalValue = TotalValue,
			items = MapResult
		})
	end else nil
})