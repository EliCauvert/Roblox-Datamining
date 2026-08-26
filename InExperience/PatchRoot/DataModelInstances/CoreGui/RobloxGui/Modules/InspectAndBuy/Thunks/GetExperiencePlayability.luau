local performFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local createInspectAndBuyKeyMapperModule = require(parent.createInspectAndBuyKeyMapper)
local experienceInfoModule = require(parent.Models.ExperienceInfo)
local setExperienceInfoModule = require(parent.Actions.SetExperienceInfo)
local sendCounterModule = require(parent.Thunks.SendCounter)
local constantsModule = require(parent.Constants)
local list = { networkModule }
local var1 = createInspectAndBuyKeyMapperModule("getExperiencePlayabilityStatus")

return function(p1)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var1 (ref), performFetch (ref), experienceInfoModule (ref), setExperienceInfoModule (ref), sendCounterModule (ref), constantsModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: networkModule (copy), var1 (copy), p1 (ref), performFetch (copy), experienceInfoModule (copy), setExperienceInfoModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var2 = p3[networkModule]
		
		return performFetch.Single(var1(p2:getState().storeId, p1), function()
			-- upvalues: var2 (ref), p1 (copy), experienceInfoModule (copy), p2 (ref), setExperienceInfoModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var2.getExperiencePlayability(p1):andThen(function(p4)
				-- upvalues: experienceInfoModule (copy), p2 (copy), setExperienceInfoModule (copy), sendCounterModule (copy), constantsModule (copy)
				p2:dispatch(setExperienceInfoModule(experienceInfoModule.fromGetPlayabilityStatus(p4[1])))
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetExperiencePlayability .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p2 (copy), sendCounterModule (copy), constantsModule (copy)
				p2:dispatch(sendCounterModule(constantsModule.Counters.GetExperiencePlayability .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p2):catch(function(_)
			-- upvalues: p2 (ref), sendCounterModule (copy), constantsModule (copy)
			p2:dispatch(sendCounterModule(constantsModule.Counters.GetExperiencePlayability .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end