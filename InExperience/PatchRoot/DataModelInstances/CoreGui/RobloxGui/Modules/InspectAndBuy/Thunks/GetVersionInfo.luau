local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local AssetInfoModule = require(Parent.Models.AssetInfo)
local SetAssetsModule = require(Parent.Actions.SetAssets)
local GetExperiencePlayabilityModule = require(Parent.Thunks.GetExperiencePlayability)
local GetExperienceInfoModule = require(Parent.Thunks.GetExperienceInfo)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetVersionInfo = require(Parent.createInspectAndBuyKeyMapper)("getVersionInfo")

return function(p1) --[[ Line: 29 | Named "GetVersionInfo" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetVersionInfo (copy), PerformFetch (copy), AssetInfoModule (copy), SetAssetsModule (copy), GetExperiencePlayabilityModule (copy), GetExperienceInfoModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 30 ]]
		-- upvalues: NetworkModule (upval), GetVersionInfo (upval), p1 (copy), PerformFetch (upval), AssetInfoModule (upval), SetAssetsModule (upval), GetExperiencePlayabilityModule (upval), GetExperienceInfoModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		
		return PerformFetch.Single(GetVersionInfo(p2:getState().storeId, p1), function() --[[ Line: 35 ]]
			-- upvalues: v1 (copy), p1 (upval), AssetInfoModule (upval), p2 (copy), SetAssetsModule (upval), GetExperiencePlayabilityModule (upval), GetExperienceInfoModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getVersionInfo(p1):andThen(function(Result) --[[ Line: 36 ]]
				-- upvalues: AssetInfoModule (upval), p1 (upval), p2 (upval), SetAssetsModule (upval), GetExperiencePlayabilityModule (upval), GetExperienceInfoModule (upval), SendCounterModule (upval), ConstantsModule (upval)
				local Entry = Result.data[1]
				local CreatingUniverseId = if Entry then Entry.creatingUniverseId else nil
				
				if CreatingUniverseId then
					local Text = tostring(CreatingUniverseId)
					p2:dispatch(SetAssetsModule({ (AssetInfoModule.fromGetVersionInfo(p1, Entry)) }))
					p2:dispatch(GetExperiencePlayabilityModule(Text))
					p2:dispatch(GetExperienceInfoModule(Text))
				end
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetVersionInfo .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ Line: 55 ]]
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetVersionInfo .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_) --[[ Line: 60 ]]
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetVersionInfo .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end