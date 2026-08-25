local parent = script.Parent.Parent
local momentsEligibilityReceivedModule = require(parent.Actions.MomentsEligibilityReceived)
local constantsModule = require(parent.Constants)
local fFlagCreateMomentsToastModule = require(parent.Flags.FFlagCreateMomentsToast)
local contentSharingNetworking = require(parent.App.Networking).ContentSharingNetworking

return function(p0)
	-- upvalues: fFlagCreateMomentsToastModule (ref), contentSharingNetworking (ref), constantsModule (ref), momentsEligibilityReceivedModule (ref)
	return function(p1)
		-- upvalues: fFlagCreateMomentsToastModule (copy), contentSharingNetworking (copy), constantsModule (copy), p0 (ref), momentsEligibilityReceivedModule (copy)
		if not fFlagCreateMomentsToastModule or contentSharingNetworking == nil then return end
		if type(p1:getState()[constantsModule.RoduxKey].MomentsEligibility.byUniverseId[p0]) == "boolean" then
			return
		end
		p1:dispatch(contentSharingNetworking.CheckMomentsEligibility.API({ contentType = "experience", experienceId = tostring(p0) })):andThen(function(p2)
			-- upvalues: p1 (ref), momentsEligibilityReceivedModule (copy), p0 (copy)
			local responseBody = p2.responseBody
			p1:dispatch(momentsEligibilityReceivedModule(p0, type(responseBody) == "table" and responseBody.isEligible == true))
		end):catch(function() end)
	end
end