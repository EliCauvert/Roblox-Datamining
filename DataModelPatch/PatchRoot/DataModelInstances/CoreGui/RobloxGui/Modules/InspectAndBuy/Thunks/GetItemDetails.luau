local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local AssetInfoModule = require(Parent.Models.AssetInfo)
local BundleInfoModule = require(Parent.Models.BundleInfo)
local NetworkModule = require(Parent.Services.Network)
local SetAssetsModule = require(Parent.Actions.SetAssets)
local SetBundlesModule = require(Parent.Actions.SetBundles)
local GetExperiencePlayabilityModule = require(Parent.Thunks.GetExperiencePlayability)
local GetExperienceInfoModule = require(Parent.Thunks.GetExperienceInfo)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetItemDetails = require(Parent.createInspectAndBuyKeyMapper)("getItemDetails")

return function(p1, AvatarItemType)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetItemDetails (copy), PerformFetch (copy), AssetInfoModule (copy), SetAssetsModule (copy), BundleInfoModule (copy), SetBundlesModule (copy), SendCounterModule (copy), ConstantsModule (copy), GetExperiencePlayabilityModule (copy), GetExperienceInfoModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: NetworkModule (upval), GetItemDetails (upval), p1 (copy), AvatarItemType (copy), PerformFetch (upval), AssetInfoModule (upval), SetAssetsModule (upval), BundleInfoModule (upval), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval), GetExperiencePlayabilityModule (upval), GetExperienceInfoModule (upval)
		local v1 = p3[NetworkModule]
		
		return PerformFetch.Single(GetItemDetails(p2:getState().storeId, p1, AvatarItemType), function()
			-- upvalues: v1 (copy), p1 (upval), AvatarItemType (upval), AssetInfoModule (upval), p2 (copy), SetAssetsModule (upval), BundleInfoModule (upval), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval), GetExperiencePlayabilityModule (upval), GetExperienceInfoModule (upval)
			return v1.getItemDetails(p1, AvatarItemType):andThen(function(Result)
				-- upvalues: AvatarItemType (upval), AssetInfoModule (upval), p2 (upval), SetAssetsModule (upval), BundleInfoModule (upval), SetBundlesModule (upval), SendCounterModule (upval), ConstantsModule (upval), GetExperiencePlayabilityModule (upval), GetExperienceInfoModule (upval)
				if AvatarItemType == Enum.AvatarItemType.Asset then
					p2:dispatch(SetAssetsModule({ (AssetInfoModule.fromGetItemDetails(Result)) }))
				elseif AvatarItemType == Enum.AvatarItemType.Bundle then
					p2:dispatch(SetBundlesModule({ (BundleInfoModule.fromGetItemDetails(Result)) }))
				else
					p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetItemDetailsRespondedWithUnknownItemType))
				end
				if Result.CreatingUniverseId then
					p2:dispatch(GetExperiencePlayabilityModule(Result.CreatingUniverseId))
					p2:dispatch(GetExperienceInfoModule(Result.CreatingUniverseId))
				end
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetItemDetails .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetItemDetails .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_)
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetItemDetails .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end