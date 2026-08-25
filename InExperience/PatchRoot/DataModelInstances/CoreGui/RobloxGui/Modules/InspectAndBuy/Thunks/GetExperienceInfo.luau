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
local var8 = createInspectAndBuyKeyMapperModule("getExperienceInfo")

return function(p0)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), var8 (ref), performFetch (ref), experienceInfoModule (ref), setExperienceInfoModule (ref), sendCounterModule (ref), constantsModule (ref)
	p0 = tostring(p0)
	
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: networkModule (copy), var8 (copy), p0 (write), performFetch (copy), experienceInfoModule (copy), setExperienceInfoModule (copy), sendCounterModule (copy), constantsModule (copy)
		local var9 = p2[networkModule]
		
		return performFetch.Single(var8(p1:getState().storeId, p0), function()
			-- upvalues: var9 (ref), p0 (copy), experienceInfoModule (copy), p1 (ref), setExperienceInfoModule (copy), sendCounterModule (copy), constantsModule (copy)
			return var9.getExperienceInfo(p0):andThen(function(p3)
				-- upvalues: experienceInfoModule (copy), p1 (copy), setExperienceInfoModule (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(setExperienceInfoModule(experienceInfoModule.fromGetExperienceInfo(p3.data[1])))
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetExperienceInfo .. constantsModule.CounterSuffix.RequestSucceeded))
			end, function(_)
				-- upvalues: p1 (copy), sendCounterModule (copy), constantsModule (copy)
				p1:dispatch(sendCounterModule(constantsModule.Counters.GetExperienceInfo .. constantsModule.CounterSuffix.RequestRejected))
			end)
		end)(p1):catch(function(_)
			-- upvalues: p1 (ref), sendCounterModule (copy), constantsModule (copy)
			p1:dispatch(sendCounterModule(constantsModule.Counters.GetExperienceInfo .. constantsModule.CounterSuffix.RequestFailed))
		end)
	end)
end