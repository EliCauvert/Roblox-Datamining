local Parent = script.Parent.Parent
local CheckMomentsEligibilityModule = require(Parent.Thunks.CheckMomentsEligibility)
local ConstantsModule = require(Parent.Constants)
local self = if require(Parent.Flags.FFlagCapturesInExpLazyMomentsEligibility) then setmetatable({}, { __mode = "k" }) else nil

return function(p1, p2, p3)
	-- upvalues: self (copy), CheckMomentsEligibilityModule (copy), ConstantsModule (copy)
	return function(Key)
		-- upvalues: self (upval), p1 (copy), p3 (copy), CheckMomentsEligibilityModule (upval), p2 (copy), ConstantsModule (upval)
		local SelfEntry = self[Key] or {}
		self[Key] = SelfEntry
		local SelfEntry1 = SelfEntry[p1] or {}
		SelfEntry[p1] = SelfEntry1
		local SelfEntry2 = if p3 then SelfEntry1[p3] else nil
		
		if SelfEntry2 and SelfEntry2.isKnownInTime ~= nil then
			return SelfEntry2.isKnownInTime
		end
		local DispatchResult = Key:dispatch(CheckMomentsEligibilityModule(p1))
		local Flag = false
		DispatchResult:andThen(function()
			-- upvalues: Flag (ref)
			Flag = true
		end)
		
		if SelfEntry2 == nil then
			local config = { deadline = os.clock() + p2 }
			SelfEntry2 = config
			
			if p3 then
				for i, value in SelfEntry1 do
					if ConstantsModule.CaptureSaveTimeout < os.clock() - value.deadline then
						SelfEntry1[i] = nil
					end
				end
				SelfEntry1[p3] = config
			end
		end
		assert(SelfEntry2, "wait is set above")
		while SelfEntry2.isKnownInTime == nil and (not Flag and os.clock() < SelfEntry2.deadline) do
			task.wait()
		end
		if SelfEntry2.isKnownInTime == nil then
			SelfEntry2.isKnownInTime = type(Key:getState()[ConstantsModule.RoduxKey].MomentsEligibility.byUniverseId[p1]) == "boolean"
		end
		return SelfEntry2.isKnownInTime == true
	end
end