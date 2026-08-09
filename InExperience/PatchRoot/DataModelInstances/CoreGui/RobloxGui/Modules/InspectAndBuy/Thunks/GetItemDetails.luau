local corePackagesService = game:GetService("CorePackages")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local performFetch = require(corePackagesService.Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local assetInfoModule = require(parent.Models.AssetInfo)
local bundleInfoModule = require(parent.Models.BundleInfo)
local networkModule = require(parent.Services.Network)
local setAssetsModule = require(parent.Actions.SetAssets)
local setBundlesModule = require(parent.Actions.SetBundles)
local getExperiencePlayabilityModule = require(parent.Thunks.GetExperiencePlayability)
local getExperienceInfoModule = require(parent.Thunks.GetExperienceInfo)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local fFlagIBV2Attribution = sharedFlagsModule.FFlagIBV2Attribution
local list = { networkModule }
local var14 = createInspectAndBuyKeyMapperModule("getItemDetails")

return function(p0, p1) --[[ line: 28 | named "GetItemDetails" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var14 (ref), performFetch (ref), assetInfoModule (ref), setAssetsModule (ref), bundleInfoModule (ref), setBundlesModule (ref), sendCounterModule (ref), constantsModule (ref), fFlagIBV2Attribution (ref), getExperiencePlayabilityModule (ref), getExperienceInfoModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3) --[[ line: 29 ]]
		-- upvalues: networkModule (copy), var14 (copy), p0 (ref), p1 (ref), performFetch (copy), assetInfoModule (copy), setAssetsModule (copy), bundleInfoModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy), fFlagIBV2Attribution (copy), getExperiencePlayabilityModule (copy), getExperienceInfoModule (copy)
		local var15 = p3[networkModule]
		
		return performFetch.Single(var14(p2:getState().storeId, p0, p1), function() --[[ line: 34 ]]
			-- upvalues: var15 (ref), p0 (copy), p1 (copy), assetInfoModule (copy), p2 (ref), setAssetsModule (copy), bundleInfoModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy), fFlagIBV2Attribution (copy), getExperiencePlayabilityModule (copy), getExperienceInfoModule (copy)
			return var15.getItemDetails(p0, p1):andThen(function(p4) --[[ line: 35 ]]
				-- upvalues: p1 (copy), assetInfoModule (copy), p2 (copy), setAssetsModule (copy), bundleInfoModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy), fFlagIBV2Attribution (copy), getExperiencePlayabilityModule (copy), getExperienceInfoModule (copy)
				if p1 == Enum.AvatarItemType.Asset then
					p2:dispatch(setAssetsModule({ assetInfoModule.fromGetItemDetails(p4) }))
				elseif p1 == Enum.AvatarItemType.Bundle then
					p2:dispatch(setBundlesModule({ bundleInfoModule.fromGetItemDetails(p4) }))
				else
					p2:dispatch(sendCounterModule(constantsModule.Counters.GetItemDetailsRespondedWithUnknownItemType))
				end
				if fFlagIBV2Attribution and p4.CreatingUniverseId then
					p2:dispatch(getExperiencePlayabilityModule(p4.CreatingUniverseId))
					p2:dispatch(getExperienceInfoModule(p4.CreatingUniverseId))
				end
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetItemDetails .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ line: 54 ]]
				-- upvalues: p2 (copy), sendCounterModule (copy), constantsModule (copy)
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetItemDetails .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_) --[[ line: 59 ]]
			-- upvalues: p2 (ref), sendCounterModule (copy), constantsModule (copy)
			p2:dispatch(sendCounterModule(constantsModule.Counters.GetItemDetails .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end