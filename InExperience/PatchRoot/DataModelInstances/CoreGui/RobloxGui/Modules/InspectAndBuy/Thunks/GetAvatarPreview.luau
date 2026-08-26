local corePackagesService = game:GetService("CorePackages")
local performFetch = require(corePackagesService.Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local setAvatarPreviewDetailsModule = require(parent.Actions.SetAvatarPreviewDetails)
local assetInfoModule = require(parent.Models.AssetInfo)
local bundleInfoModule = require(parent.Models.BundleInfo)
local setAssetsModule = require(parent.Actions.SetAssets)
local setBundlesModule = require(parent.Actions.SetBundles)
local avatarExperienceInspectAndBuyModule = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)
local avatarExperienceFlagsModule = require(corePackagesService.Workspace.Packages.AvatarExperienceFlags)
local itemTypeEnum = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum
local getItemDetailsModule = require(parent.Thunks.GetItemDetails)
local fFlagAXEnableBatchItemDetailsFetchV2 = avatarExperienceFlagsModule.FFlagAXEnableBatchItemDetailsFetchV2
local batchItemDetailsPerformFetchKey = avatarExperienceInspectAndBuyModule.Constants.BatchItemDetailsPerformFetchKey
local fFlagAXWrapInspectAndBuyThunksInTasksModule = require(parent.Flags.FFlagAXWrapInspectAndBuyThunksInTasks)
local list = { networkModule }

return function(p1)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), performFetch (ref), setAvatarPreviewDetailsModule (ref), fFlagAXEnableBatchItemDetailsFetchV2 (ref), fFlagAXWrapInspectAndBuyThunksInTasksModule (ref), itemTypeEnum (ref), getItemDetailsModule (ref), batchItemDetailsPerformFetchKey (ref), assetInfoModule (ref), bundleInfoModule (ref), setAssetsModule (ref), setBundlesModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: networkModule (copy), p1 (ref), performFetch (copy), setAvatarPreviewDetailsModule (copy), fFlagAXEnableBatchItemDetailsFetchV2 (copy), fFlagAXWrapInspectAndBuyThunksInTasksModule (copy), itemTypeEnum (copy), getItemDetailsModule (copy), batchItemDetailsPerformFetchKey (copy), assetInfoModule (copy), bundleInfoModule (copy), setAssetsModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var1 = p3[networkModule]
		local t = {}
		
		if p1 then
			for i, v in p1 do
				table.insert(t, { id = v.assetId, meta = v.meta })
			end
		end
		return performFetch.Single("PreviewAvatar", function()
			-- upvalues: var1 (ref), t (ref), p2 (ref), setAvatarPreviewDetailsModule (copy), fFlagAXEnableBatchItemDetailsFetchV2 (copy), fFlagAXWrapInspectAndBuyThunksInTasksModule (copy), itemTypeEnum (copy), getItemDetailsModule (copy), performFetch (copy), batchItemDetailsPerformFetchKey (copy), assetInfoModule (copy), bundleInfoModule (copy), setAssetsModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var1.getPreviewAvatar(t):andThen(function(p4)
				-- upvalues: p2 (copy), setAvatarPreviewDetailsModule (copy), fFlagAXEnableBatchItemDetailsFetchV2 (copy), fFlagAXWrapInspectAndBuyThunksInTasksModule (copy), itemTypeEnum (copy), getItemDetailsModule (copy), performFetch (copy), batchItemDetailsPerformFetchKey (copy), var1 (copy), assetInfoModule (copy), bundleInfoModule (copy), setAssetsModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
				p2:dispatch(setAvatarPreviewDetailsModule(p4))
				
				if not fFlagAXEnableBatchItemDetailsFetchV2 and p4.look and p4.look.items then
					for i, v in p4.look.items do
						if fFlagAXWrapInspectAndBuyThunksInTasksModule then
							task.spawn(function()
								-- upvalues: v (ref), itemTypeEnum (copy), p2 (copy), getItemDetailsModule (copy)
								if v.itemType == itemTypeEnum.Asset then
									p2:dispatch(getItemDetailsModule(v.id, Enum.AvatarItemType.Asset))
									
									return
								elseif v.itemType == itemTypeEnum.Bundle then
									p2:dispatch(getItemDetailsModule(v.id, Enum.AvatarItemType.Bundle))
								end
							end)
						elseif v.itemType == itemTypeEnum.Asset then
							p2:dispatch(getItemDetailsModule(v.id, Enum.AvatarItemType.Asset))
						elseif v.itemType == itemTypeEnum.Bundle then
							p2:dispatch(getItemDetailsModule(v.id, Enum.AvatarItemType.Bundle))
						end
					end
				end
				if fFlagAXEnableBatchItemDetailsFetchV2 then
					local t = {}
					
					if p4.look and p4.look.items then
						for i, v in p4.look.items do
							table.insert(t, {
								itemType = if v.itemType == itemTypeEnum.Asset then Enum.AvatarItemType.Asset.Value else Enum.AvatarItemType.Bundle.Value,
								id = tonumber(v.id) or 0
							})
						end
					end
					performFetch.Single(batchItemDetailsPerformFetchKey, function()
						-- upvalues: var1 (copy), t (ref), fFlagAXWrapInspectAndBuyThunksInTasksModule (copy), itemTypeEnum (copy), assetInfoModule (copy), bundleInfoModule (copy), p2 (copy), setAssetsModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
						return var1.getBatchItemDetailsV2(t):andThen(function(p5)
							-- upvalues: fFlagAXWrapInspectAndBuyThunksInTasksModule (copy), itemTypeEnum (copy), assetInfoModule (copy), bundleInfoModule (copy), p2 (copy), setAssetsModule (copy), setBundlesModule (copy)
							if fFlagAXWrapInspectAndBuyThunksInTasksModule and p5 and p5.data then
								task.spawn(function()
									-- upvalues: p5 (ref), itemTypeEnum (copy), assetInfoModule (copy), bundleInfoModule (copy), p2 (copy), setAssetsModule (copy), setBundlesModule (copy)
									local t = {}
									local t_1 = {}
									
									for i, v in p5.data do
										if v.itemType == itemTypeEnum.Asset then
											table.insert(t, assetInfoModule.fromGetItemDetailsV2(v))
										elseif v.itemType == itemTypeEnum.Bundle then
											table.insert(t_1, bundleInfoModule.fromGetItemDetailsV2(v))
										end
									end
									p2:dispatch(setAssetsModule(t))
									p2:dispatch(setBundlesModule(t_1))
								end)
								
								return
							elseif p5 and p5.data then
								local t = {}
								local t_1 = {}
								
								for i, v in p5.data do
									if v.itemType == itemTypeEnum.Asset then
										table.insert(t, assetInfoModule.fromGetItemDetailsV2(v))
									elseif v.itemType == itemTypeEnum.Bundle then
										table.insert(t_1, bundleInfoModule.fromGetItemDetailsV2(v))
									end
								end
								p2:dispatch(setAssetsModule(t))
								p2:dispatch(setBundlesModule(t_1))
							end
						end, function(_)
							-- upvalues: p2 (copy), sendCounterModule (copy), constantsModule (copy)
							p2:dispatch(sendCounterModule(constantsModule.Counters.BatchGetItemDetails .. constantsModule.CounterSuffix.RequestRejected))
						end)
					end)(p2)
					p2:dispatch(sendCounterModule(constantsModule.Counters.BatchGetItemDetails .. constantsModule.CounterSuffix.RequestSucceeded))
				end
			end, function(_)
				-- upvalues: p2 (copy), sendCounterModule (copy), constantsModule (copy)
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetAvatarPreview .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_)
			-- upvalues: p2 (ref), sendCounterModule (copy), constantsModule (copy)
			p2:dispatch(sendCounterModule(constantsModule.Counters.GetAvatarPreview .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end