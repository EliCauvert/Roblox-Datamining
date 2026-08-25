local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local assetInfoModule = require(parent.Models.AssetInfo)
local setAssetsModule = require(parent.Actions.SetAssets)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local getExperiencePlayabilityModule = require(parent.Thunks.GetExperiencePlayability)
local getExperienceInfoModule = require(parent.Thunks.GetExperienceInfo)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var10 = createInspectAndBuyKeyMapperModule("getVersionInfo")

return function(p0)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var10 (ref), performFetch (ref), assetInfoModule (ref), setAssetsModule (ref), getExperiencePlayabilityModule (ref), getExperienceInfoModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), var10 (copy), p0 (ref), performFetch (copy), assetInfoModule (copy), setAssetsModule (copy), getExperiencePlayabilityModule (copy), getExperienceInfoModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var11 = p2[networkModule]
		
		return performFetch.Single(var10(p1:getState().storeId, p0), function()
			-- upvalues: var11 (ref), p0 (copy), assetInfoModule (copy), p1 (ref), setAssetsModule (copy), getExperiencePlayabilityModule (copy), getExperienceInfoModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var11.getVersionInfo(p0):andThen(function(p3)
				-- upvalues: assetInfoModule (copy), p0 (copy), p1 (copy), setAssetsModule (copy), getExperiencePlayabilityModule (copy), getExperienceInfoModule (copy), sendCounterModule (copy), constantsModule (copy)
				local var12 = p3.data[1]
				local var13 = if var12 then var12.creatingUniverseId else nil
				
				if var13 then
					var13 = tostring(var13)
					p1:dispatch(setAssetsModule({ assetInfoModule.fromGetVersionInfo(p0, var12) }))
					p1:dispatch(getExperiencePlayabilityModule(var13))
					p1:dispatch(getExperienceInfoModule(var13))
				end
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetVersionInfo .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetVersionInfo .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p1):catch(function(_)
			-- upvalues: p1 (ref), sendCounterModule (copy), constantsModule (copy)
			p1:dispatch(sendCounterModule(constantsModule.Counters.GetVersionInfo .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end