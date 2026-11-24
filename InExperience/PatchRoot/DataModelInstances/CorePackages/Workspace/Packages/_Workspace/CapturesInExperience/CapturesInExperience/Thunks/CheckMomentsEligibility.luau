local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Parent.Promise)
local MomentsEligibilityReceivedModule = require(Parent.Actions.MomentsEligibilityReceived)
local ConstantsModule = require(Parent.Constants)
local FFlagCapturesInExpLazyMomentsEligibilityModule = require(Parent.Flags.FFlagCapturesInExpLazyMomentsEligibility)
local FFlagCreateMomentsToastModule = require(Parent.Flags.FFlagCreateMomentsToast)
local FFlagMomentsCaptureEndIxpEnabledModule = require(Parent.Flags.FFlagMomentsCaptureEndIxpEnabled)
local ContentSharingNetworking = require(Parent.App.Networking).ContentSharingNetworking
local self = if FFlagCapturesInExpLazyMomentsEligibilityModule then setmetatable({}, { __mode = "k" }) else nil

return function(p1)
	-- upvalues: FFlagCreateMomentsToastModule (copy), FFlagMomentsCaptureEndIxpEnabledModule (copy), ContentSharingNetworking (copy), FFlagCapturesInExpLazyMomentsEligibilityModule (copy), PromiseModule (copy), ConstantsModule (copy), self (copy), MomentsEligibilityReceivedModule (copy)
	return function(Key)
		-- upvalues: FFlagCreateMomentsToastModule (upval), FFlagMomentsCaptureEndIxpEnabledModule (upval), ContentSharingNetworking (upval), FFlagCapturesInExpLazyMomentsEligibilityModule (upval), PromiseModule (upval), ConstantsModule (upval), p1 (copy), self (upval), MomentsEligibilityReceivedModule (upval)
		if not FFlagCreateMomentsToastModule and not FFlagMomentsCaptureEndIxpEnabledModule or ContentSharingNetworking == nil then
			return if FFlagCapturesInExpLazyMomentsEligibilityModule then PromiseModule.resolve() else nil
		end
		if type(Key:getState()[ConstantsModule.RoduxKey].MomentsEligibility.byUniverseId[p1]) == "boolean" then
			return if FFlagCapturesInExpLazyMomentsEligibilityModule then PromiseModule.resolve() else nil
		end
		if FFlagCapturesInExpLazyMomentsEligibilityModule then
			local SelfEntry = self[Key] and self[Key][p1]
			
			if SelfEntry then
				return SelfEntry
			end
		end
		local Promise = Key:dispatch(ContentSharingNetworking.CheckMomentsEligibility.API({ contentType = "experience", experienceId = tostring(p1) })):andThen(function(Result)
			-- upvalues: Key (copy), MomentsEligibilityReceivedModule (upval), p1 (upval)
			local ResponseBody = Result.responseBody
			Key:dispatch(MomentsEligibilityReceivedModule(p1, type(ResponseBody) == "table" and ResponseBody.isEligible == true))
		end):catch(function() end)
		
		if FFlagCapturesInExpLazyMomentsEligibilityModule then
			local SelfEntry = self[Key] or {}
			self[Key] = SelfEntry
			SelfEntry[p1] = Promise
			Promise:finally(function()
				-- upvalues: SelfEntry (copy), p1 (upval)
				SelfEntry[p1] = nil
			end)
		end
		return if FFlagCapturesInExpLazyMomentsEligibilityModule then Promise else nil
	end
end