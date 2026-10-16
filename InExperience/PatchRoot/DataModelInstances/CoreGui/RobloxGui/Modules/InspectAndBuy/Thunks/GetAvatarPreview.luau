local CorePackages = game:GetService("CorePackages")
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local SetAvatarPreviewDetailsModule = require(Parent.Actions.SetAvatarPreviewDetails)
local AssetInfoModule = require(Parent.Models.AssetInfo)
local BundleInfoModule = require(Parent.Models.BundleInfo)
local SetAssetsModule = require(Parent.Actions.SetAssets)
local SetBundlesModule = require(Parent.Actions.SetBundles)
local ItemTypeEnum = require(CorePackages.Workspace.Packages.AvatarExperienceModel).Enums.ItemTypeEnum
local GetItemDetailsModule = require(Parent.Thunks.GetItemDetails)
local FFlagAXEnableBatchItemDetailsFetchV2 = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableBatchItemDetailsFetchV2
local BatchItemDetailsPerformFetchKey = require(CorePackages.Workspace.Packages.AvatarExperienceInspectAndBuy).Constants.BatchItemDetailsPerformFetchKey
local FFlagAXWrapInspectAndBuyThunksInTasksModule = require(Parent.Flags.FFlagAXWrapInspectAndBuyThunksInTasks)
local list = { NetworkModule }

return function(p1) --[[ Line: 33 | Named "GetAvatarPreview" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), PerformFetch (copy), SetAvatarPreviewDetailsModule (copy), FFlagAXEnableBatchItemDetailsFetchV2 (copy), FFlagAXWrapInspectAndBuyThunksInTasksModule (copy), ItemTypeEnum (copy), GetItemDetailsModule (copy), BatchItemDetailsPerformFetchKey (copy), AssetInfoModule (copy), BundleInfoModule (copy), SetAssetsModule (copy), SetBundlesModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 34 ]]
		-- upvalues: NetworkModule (upval), p1 (copy), PerformFetch (upval), SetAvatarPreviewDetailsModule (upval), FFlagAXEnableBatchItemDetailsFetchV2 (upval), FFlagAXWrapInspectAndBuyThunksInTasksModule (upval), ItemTypeEnum (upval), GetItemDetailsModule (upval), BatchItemDetailsPerformFetchKey (upval), AssetInfoModule (upval), BundleInfoModule (upval), SetAssetsModule (upval), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		local List = {}
		
		if p1 then
			for _, value in p1 do
				table.insert(List, { id = value.assetId, meta = value.meta })
			end
		end
		return PerformFetch.Single("PreviewAvatar", function() --[[ Line: 47 ]]
			-- upvalues: v1 (copy), List (copy), p2 (copy), SetAvatarPreviewDetailsModule (upval), FFlagAXEnableBatchItemDetailsFetchV2 (upval), FFlagAXWrapInspectAndBuyThunksInTasksModule (upval), ItemTypeEnum (upval), GetItemDetailsModule (upval), PerformFetch (upval), BatchItemDetailsPerformFetchKey (upval), AssetInfoModule (upval), BundleInfoModule (upval), SetAssetsModule (upval), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getPreviewAvatar(List):andThen(function(Result) --[[ Line: 48 ]]
				-- upvalues: p2 (upval), SetAvatarPreviewDetailsModule (upval), FFlagAXEnableBatchItemDetailsFetchV2 (upval), FFlagAXWrapInspectAndBuyThunksInTasksModule (upval), ItemTypeEnum (upval), GetItemDetailsModule (upval), PerformFetch (upval), BatchItemDetailsPerformFetchKey (upval), v1 (upval), AssetInfoModule (upval), BundleInfoModule (upval), SetAssetsModule (upval), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SetAvatarPreviewDetailsModule(Result))
				
				if not FFlagAXEnableBatchItemDetailsFetchV2 and Result.look and Result.look.items then
					for _, item in Result.look.items do
						if FFlagAXWrapInspectAndBuyThunksInTasksModule then
							task.spawn(function() --[[ Line: 58 ]]
								-- upvalues: item (copy), ItemTypeEnum (upval), p2 (upval), GetItemDetailsModule (upval)
								if item.itemType == ItemTypeEnum.Asset then
									p2:dispatch(GetItemDetailsModule(item.id, Enum.AvatarItemType.Asset))
									
									return
								end
								if item.itemType == ItemTypeEnum.Bundle then
									p2:dispatch(GetItemDetailsModule(item.id, Enum.AvatarItemType.Bundle))
								end
							end)
						elseif item.itemType == ItemTypeEnum.Asset then
							p2:dispatch(GetItemDetailsModule(item.id, Enum.AvatarItemType.Asset))
						elseif item.itemType == ItemTypeEnum.Bundle then
							p2:dispatch(GetItemDetailsModule(item.id, Enum.AvatarItemType.Bundle))
						end
					end
				end
				if FFlagAXEnableBatchItemDetailsFetchV2 then
					local List = {}
					
					if Result.look and Result.look.items then
						for _, item1 in Result.look.items do
							table.insert(List, {
								itemType = if item1.itemType == ItemTypeEnum.Asset then Enum.AvatarItemType.Asset.Value else Enum.AvatarItemType.Bundle.Value,
								id = tonumber(item1.id) or 0
							})
						end
					end
					PerformFetch.Single(BatchItemDetailsPerformFetchKey, function() --[[ Line: 91 ]]
						-- upvalues: v1 (upval), List (copy), FFlagAXWrapInspectAndBuyThunksInTasksModule (upval), ItemTypeEnum (upval), AssetInfoModule (upval), BundleInfoModule (upval), p2 (upval), SetAssetsModule (upval), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval)
						return v1.getBatchItemDetailsV2(List):andThen(function(Result) --[[ Line: 94 ]]
							-- upvalues: FFlagAXWrapInspectAndBuyThunksInTasksModule (upval), ItemTypeEnum (upval), AssetInfoModule (upval), BundleInfoModule (upval), p2 (upval), SetAssetsModule (upval), SetBundlesModule (upval)
							if FFlagAXWrapInspectAndBuyThunksInTasksModule and Result and Result.data then
								task.spawn(function() --[[ Line: 96 ]]
									-- upvalues: Result (copy), ItemTypeEnum (upval), AssetInfoModule (upval), BundleInfoModule (upval), p2 (upval), SetAssetsModule (upval), SetBundlesModule (upval)
									local FromGetItemDetailsV2Results = {}
									local FromGetItemDetailsV2Results1 = {}
									
									for _, entry in Result.data do
										if entry.itemType == ItemTypeEnum.Asset then
											table.insert(FromGetItemDetailsV2Results, AssetInfoModule.fromGetItemDetailsV2(entry))
										elseif entry.itemType == ItemTypeEnum.Bundle then
											table.insert(FromGetItemDetailsV2Results1, BundleInfoModule.fromGetItemDetailsV2(entry))
										end
									end
									p2:dispatch(SetAssetsModule(FromGetItemDetailsV2Results))
									p2:dispatch(SetBundlesModule(FromGetItemDetailsV2Results1))
								end)
								
								return
							end
							if Result and Result.data then
								local FromGetItemDetailsV2Results = {}
								local FromGetItemDetailsV2Results1 = {}
								
								for _, entry in Result.data do
									if entry.itemType == ItemTypeEnum.Asset then
										table.insert(FromGetItemDetailsV2Results, AssetInfoModule.fromGetItemDetailsV2(entry))
									elseif entry.itemType == ItemTypeEnum.Bundle then
										table.insert(FromGetItemDetailsV2Results1, BundleInfoModule.fromGetItemDetailsV2(entry))
									end
								end
								p2:dispatch(SetAssetsModule(FromGetItemDetailsV2Results))
								p2:dispatch(SetBundlesModule(FromGetItemDetailsV2Results1))
							end
						end, function(_) --[[ Line: 126 ]]
							-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
							p2:dispatch(SendCounterModule(ConstantsModule.Counters.BatchGetItemDetails .. ConstantsModule.CounterSuffix.RequestRejected))
						end)
					end)(p2)
					p2:dispatch(SendCounterModule(ConstantsModule.Counters.BatchGetItemDetails .. ConstantsModule.CounterSuffix.RequestSucceeded))
				end
			end, function(_) --[[ Line: 140 ]]
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetAvatarPreview .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_) --[[ Line: 145 ]]
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetAvatarPreview .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end