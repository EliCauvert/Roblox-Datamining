local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local ExperienceInfoModule = require(Parent.Models.ExperienceInfo)
local SetExperienceInfoModule = require(Parent.Actions.SetExperienceInfo)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetExperiencePlayabilityStatus = require(Parent.createInspectAndBuyKeyMapper)("getExperiencePlayabilityStatus")

return function(p1) --[[ Line: 23 | Named "GetExperiencePlayability" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetExperiencePlayabilityStatus (copy), PerformFetch (copy), ExperienceInfoModule (copy), SetExperienceInfoModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 24 ]]
		-- upvalues: NetworkModule (upval), GetExperiencePlayabilityStatus (upval), p1 (copy), PerformFetch (upval), ExperienceInfoModule (upval), SetExperienceInfoModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		
		return PerformFetch.Single(GetExperiencePlayabilityStatus(p2:getState().storeId, p1), function() --[[ Line: 29 ]]
			-- upvalues: v1 (copy), p1 (upval), ExperienceInfoModule (upval), p2 (copy), SetExperienceInfoModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getExperiencePlayability(p1):andThen(function(Entry) --[[ Line: 30 ]]
				-- upvalues: ExperienceInfoModule (upval), p2 (upval), SetExperienceInfoModule (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SetExperienceInfoModule((ExperienceInfoModule.fromGetPlayabilityStatus(Entry[1]))))
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetExperiencePlayability .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ Line: 38 ]]
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetExperiencePlayability .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_) --[[ Line: 43 ]]
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetExperiencePlayability .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end