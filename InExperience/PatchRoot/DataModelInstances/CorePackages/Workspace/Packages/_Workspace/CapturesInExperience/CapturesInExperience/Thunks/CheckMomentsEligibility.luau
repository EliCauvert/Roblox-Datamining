local parent = script.Parent.Parent
local momentsEligibilityReceivedModule = require(parent.Actions.MomentsEligibilityReceived)
local constantsModule = require(parent.Constants)
local fFlagCreateMomentsToastModule = require(parent.Flags.FFlagCreateMomentsToast)
local contentSharingNetworking = require(parent.App.Networking).ContentSharingNetworking

return function(p1)
	-- upvalues: fFlagCreateMomentsToastModule (ref), contentSharingNetworking (ref), constantsModule (ref), momentsEligibilityReceivedModule (ref)
	return function(p2)
		-- upvalues: fFlagCreateMomentsToastModule (copy), contentSharingNetworking (copy), constantsModule (copy), p1 (ref), momentsEligibilityReceivedModule (copy)
		if not fFlagCreateMomentsToastModule or contentSharingNetworking == nil then return end
		if type(p2:getState()[constantsModule.RoduxKey].MomentsEligibility.byUniverseId[p1]) == "boolean" then
			return
		end
		p2:dispatch(contentSharingNetworking.CheckMomentsEligibility.API({ contentType = "experience", experienceId = tostring(p1) })):andThen(function(p3)
			-- upvalues: p2 (ref), momentsEligibilityReceivedModule (copy), p1 (copy)
			local responseBody = p3.responseBody
			p2:dispatch(momentsEligibilityReceivedModule(p1, type(responseBody) == "table" and responseBody.isEligible == true))
		end):catch(function() end)
	end
end