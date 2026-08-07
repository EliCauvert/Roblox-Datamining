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

return function(p0) --[[ line: 33 | named "GetAvatarPreview" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), performFetch (ref), setAvatarPreviewDetailsModule (ref), fFlagAXEnableBatchItemDetailsFetchV2 (ref), fFlagAXWrapInspectAndBuyThunksInTasksModule (ref), itemTypeEnum (ref), getItemDetailsModule (ref), batchItemDetailsPerformFetchKey (ref), assetInfoModule (ref), bundleInfoModule (ref), setAssetsModule (ref), setBundlesModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2) --[[ line: 34 ]]
		-- upvalues: networkModule (copy), p0 (ref), performFetch (copy), setAvatarPreviewDetailsModule (copy), fFlagAXEnableBatchItemDetailsFetchV2 (copy), fFlagAXWrapInspectAndBuyThunksInTasksModule (copy), itemTypeEnum (copy), getItemDetailsModule (copy), batchItemDetailsPerformFetchKey (copy), assetInfoModule (copy), bundleInfoModule (copy), setAssetsModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var15 = p2[networkModule]
		local t = {}
		
		if p0 then
			for i, v in p0 do
				table.insert(t, { id = v.assetId, meta = v.meta })
			end
		end
		return performFetch.Single("PreviewAvatar", function() --[[ line: 47 ]]
			-- upvalues: var15 (ref), t (ref), p1 (ref), setAvatarPreviewDetailsModule (copy), fFlagAXEnableBatchItemDetailsFetchV2 (copy), fFlagAXWrapInspectAndBuyThunksInTasksModule (copy), itemTypeEnum (copy), getItemDetailsModule (copy), performFetch (copy), batchItemDetailsPerformFetchKey (copy), assetInfoModule (copy), bundleInfoModule (copy), setAssetsModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var15.getPreviewAvatar(t):andThen(function(p3) --[[ line: 48 ]]
				-- upvalues: p1 (copy), setAvatarPreviewDetailsModule (copy), fFlagAXEnableBatchItemDetailsFetchV2 (copy), fFlagAXWrapInspectAndBuyThunksInTasksModule (copy), itemTypeEnum (copy), getItemDetailsModule (copy), performFetch (copy), batchItemDetailsPerformFetchKey (copy), var15 (copy), assetInfoModule (copy), bundleInfoModule (copy), setAssetsModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(setAvatarPreviewDetailsModule(p3))
				
				if not fFlagAXEnableBatchItemDetailsFetchV2 and p3.look and p3.look.items then
					for i, v in p3.look.items do
						if fFlagAXWrapInspectAndBuyThunksInTasksModule then
							task.spawn(function() --[[ line: 58 ]]
								-- upvalues: v (ref), itemTypeEnum (copy), p1 (copy), getItemDetailsModule (copy)
								if v.itemType == itemTypeEnum.Asset then
									p1:dispatch(getItemDetailsModule(v.id, Enum.AvatarItemType.Asset))
									
									return
								elseif v.itemType == itemTypeEnum.Bundle then
									p1:dispatch(getItemDetailsModule(v.id, Enum.AvatarItemType.Bundle))
								end
							end)
						elseif v.itemType == itemTypeEnum.Asset then
							p1:dispatch(getItemDetailsModule(v.id, Enum.AvatarItemType.Asset))
						elseif v.itemType == itemTypeEnum.Bundle then
							p1:dispatch(getItemDetailsModule(v.id, Enum.AvatarItemType.Bundle))
						end
					end
				end
				if fFlagAXEnableBatchItemDetailsFetchV2 then
					local t = {}
					
					if p3.look and p3.look.items then
						for i, v in p3.look.items do
							table.insert(t, {
								itemType = if v.itemType == itemTypeEnum.Asset then Enum.AvatarItemType.Asset.Value else Enum.AvatarItemType.Bundle.Value,
								id = tonumber(v.id) or 0
							})
						end
					end
					performFetch.Single(batchItemDetailsPerformFetchKey, function() --[[ line: 91 ]]
						-- upvalues: var15 (copy), t (ref), fFlagAXWrapInspectAndBuyThunksInTasksModule (copy), itemTypeEnum (copy), assetInfoModule (copy), bundleInfoModule (copy), p1 (copy), setAssetsModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy)
						return var15.getBatchItemDetailsV2(t):andThen(function(p4) --[[ line: 94 ]]
							-- upvalues: fFlagAXWrapInspectAndBuyThunksInTasksModule (copy), itemTypeEnum (copy), assetInfoModule (copy), bundleInfoModule (copy), p1 (copy), setAssetsModule (copy), setBundlesModule (copy)
							if fFlagAXWrapInspectAndBuyThunksInTasksModule and p4 and p4.data then
								task.spawn(function() --[[ line: 96 ]]
									-- upvalues: p4 (ref), itemTypeEnum (copy), assetInfoModule (copy), bundleInfoModule (copy), p1 (copy), setAssetsModule (copy), setBundlesModule (copy)
									local t = {}
									local t_1 = {}
									
									for i, v in p4.data do
										if v.itemType == itemTypeEnum.Asset then
											table.insert(t, assetInfoModule.fromGetItemDetailsV2(v))
										elseif v.itemType == itemTypeEnum.Bundle then
											table.insert(t_1, bundleInfoModule.fromGetItemDetailsV2(v))
										end
									end
									p1:dispatch(setAssetsModule(t))
									p1:dispatch(setBundlesModule(t_1))
								end)
								
								return
							elseif p4 and p4.data then
								local t = {}
								local t_1 = {}
								
								for i, v in p4.data do
									if v.itemType == itemTypeEnum.Asset then
										table.insert(t, assetInfoModule.fromGetItemDetailsV2(v))
									elseif v.itemType == itemTypeEnum.Bundle then
										table.insert(t_1, bundleInfoModule.fromGetItemDetailsV2(v))
									end
								end
								p1:dispatch(setAssetsModule(t))
								p1:dispatch(setBundlesModule(t_1))
							end
						end, function(_) --[[ line: 126 ]]
							-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy)
							p1:dispatch(sendCounterModule(constantsModule.Counters.BatchGetItemDetails .. constantsModule.CounterSuffix.RequestRejected))
						end)
					end)(p1)
					p1:dispatch(sendCounterModule(constantsModule.Counters.BatchGetItemDetails .. constantsModule.CounterSuffix.RequestSucceeded))
				end
			end, function(_) --[[ line: 140 ]]
				-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetAvatarPreview .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p1):catch(function(_) --[[ line: 145 ]]
			-- upvalues: p1 (ref), sendCounterModule (copy), constantsModule (copy)
			p1:dispatch(sendCounterModule(constantsModule.Counters.GetAvatarPreview .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end