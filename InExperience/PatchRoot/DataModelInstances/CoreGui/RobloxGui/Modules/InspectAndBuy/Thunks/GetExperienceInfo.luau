local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local ExperienceInfoModule = require(Parent.Models.ExperienceInfo)
local SetExperienceInfoModule = require(Parent.Actions.SetExperienceInfo)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local list = { NetworkModule }
local GetExperienceInfo = require(Parent.createInspectAndBuyKeyMapper)("getExperienceInfo")

return function(p1) --[[ Line: 23 | Named "GetExperienceInfo" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetExperienceInfo (copy), PerformFetch (copy), ExperienceInfoModule (copy), SetExperienceInfoModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	local Text = tostring(p1)
	
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 26 ]]
		-- upvalues: NetworkModule (upval), GetExperienceInfo (upval), Text (ref), PerformFetch (upval), ExperienceInfoModule (upval), SetExperienceInfoModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		
		return PerformFetch.Single(GetExperienceInfo(p2:getState().storeId, Text), function() --[[ Line: 31 ]]
			-- upvalues: v1 (copy), Text (upval), ExperienceInfoModule (upval), p2 (copy), SetExperienceInfoModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			return v1.getExperienceInfo(Text):andThen(function(Result) --[[ Line: 32 ]]
				-- upvalues: ExperienceInfoModule (upval), p2 (upval), SetExperienceInfoModule (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SetExperienceInfoModule((ExperienceInfoModule.fromGetExperienceInfo(Result.data[1]))))
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetExperienceInfo .. ConstantsModule.CounterSuffix.RequestSucceeded))
			end, function(_) --[[ Line: 40 ]]
				-- upvalues: p2 (upval), SendCounterModule (upval), ConstantsModule (upval)
				p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetExperienceInfo .. ConstantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_) --[[ Line: 45 ]]
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.GetExperienceInfo .. ConstantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end