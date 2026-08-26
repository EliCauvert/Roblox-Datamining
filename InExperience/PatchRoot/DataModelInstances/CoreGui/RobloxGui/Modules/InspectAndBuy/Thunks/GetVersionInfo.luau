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
local var1 = createInspectAndBuyKeyMapperModule("getVersionInfo")

return function(p1)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var1 (ref), performFetch (ref), assetInfoModule (ref), setAssetsModule (ref), getExperiencePlayabilityModule (ref), getExperienceInfoModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: networkModule (copy), var1 (copy), p1 (ref), performFetch (copy), assetInfoModule (copy), setAssetsModule (copy), getExperiencePlayabilityModule (copy), getExperienceInfoModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var2 = p3[networkModule]
		
		return performFetch.Single(var1(p2:getState().storeId, p1), function()
			-- upvalues: var2 (ref), p1 (copy), assetInfoModule (copy), p2 (ref), setAssetsModule (copy), getExperiencePlayabilityModule (copy), getExperienceInfoModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var2.getVersionInfo(p1):andThen(function(p4)
				-- upvalues: assetInfoModule (copy), p1 (copy), p2 (copy), setAssetsModule (copy), getExperiencePlayabilityModule (copy), getExperienceInfoModule (copy), sendCounterModule (copy), constantsModule (copy)
				local var3 = p4.data[1]
				local var4 = if var3 then var3.creatingUniverseId else nil
				
				if var4 then
					var4 = tostring(var4)
					p2:dispatch(setAssetsModule({ assetInfoModule.fromGetVersionInfo(p1, var3) }))
					p2:dispatch(getExperiencePlayabilityModule(var4))
					p2:dispatch(getExperienceInfoModule(var4))
				end
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetVersionInfo .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p2 (copy), sendCounterModule (copy), constantsModule (copy)
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetVersionInfo .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_)
			-- upvalues: p2 (ref), sendCounterModule (copy), constantsModule (copy)
			p2:dispatch(sendCounterModule(constantsModule.Counters.GetVersionInfo .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end