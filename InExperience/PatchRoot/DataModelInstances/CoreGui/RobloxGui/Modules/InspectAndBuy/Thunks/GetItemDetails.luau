local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
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
local list = { networkModule }
local var1 = createInspectAndBuyKeyMapperModule("getItemDetails")

return function(p1, p2)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var1 (ref), performFetch (ref), assetInfoModule (ref), setAssetsModule (ref), bundleInfoModule (ref), setBundlesModule (ref), sendCounterModule (ref), constantsModule (ref), getExperiencePlayabilityModule (ref), getExperienceInfoModule (ref)
	return thunkModule.new(script.Name, list, function(p3, p4)
		-- upvalues: networkModule (copy), var1 (copy), p1 (ref), p2 (ref), performFetch (copy), assetInfoModule (copy), setAssetsModule (copy), bundleInfoModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy), getExperiencePlayabilityModule (copy), getExperienceInfoModule (copy)
		local var2 = p4[networkModule]
		
		return performFetch.Single(var1(p3:getState().storeId, p1, p2), function()
			-- upvalues: var2 (ref), p1 (copy), p2 (copy), assetInfoModule (copy), p3 (ref), setAssetsModule (copy), bundleInfoModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy), getExperiencePlayabilityModule (copy), getExperienceInfoModule (copy)
			return var2.getItemDetails(p1, p2):andThen(function(p5)
				-- upvalues: p2 (copy), assetInfoModule (copy), p3 (copy), setAssetsModule (copy), bundleInfoModule (copy), setBundlesModule (copy), sendCounterModule (copy), constantsModule (copy), getExperiencePlayabilityModule (copy), getExperienceInfoModule (copy)
				if p2 == Enum.AvatarItemType.Asset then
					p3:dispatch(setAssetsModule({ assetInfoModule.fromGetItemDetails(p5) }))
				elseif p2 == Enum.AvatarItemType.Bundle then
					p3:dispatch(setBundlesModule({ bundleInfoModule.fromGetItemDetails(p5) }))
				else
					p3:dispatch(sendCounterModule(constantsModule.Counters.GetItemDetailsRespondedWithUnknownItemType))
				end
				if p5.CreatingUniverseId then
					p3:dispatch(getExperiencePlayabilityModule(p5.CreatingUniverseId))
					p3:dispatch(getExperienceInfoModule(p5.CreatingUniverseId))
				end
				p3:dispatch(sendCounterModule(constantsModule.Counters.GetItemDetails .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p3 (copy), sendCounterModule (copy), constantsModule (copy)
				p3:dispatch(sendCounterModule(constantsModule.Counters.GetItemDetails .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p3):catch(function(_)
			-- upvalues: p3 (ref), sendCounterModule (copy), constantsModule (copy)
			p3:dispatch(sendCounterModule(constantsModule.Counters.GetItemDetails .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end