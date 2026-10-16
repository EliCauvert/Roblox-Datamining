local Parent = script.Parent.Parent
local MomentsEligibilityReceivedModule = require(Parent.Actions.MomentsEligibilityReceived)
local ConstantsModule = require(Parent.Constants)
local FFlagCreateMomentsToastModule = require(Parent.Flags.FFlagCreateMomentsToast)
local ContentSharingNetworking = require(Parent.App.Networking).ContentSharingNetworking

return function(p1) --[[ Line: 14 ]]
	-- upvalues: FFlagCreateMomentsToastModule (copy), ContentSharingNetworking (copy), ConstantsModule (copy), MomentsEligibilityReceivedModule (copy)
	return function(p2) --[[ Line: 15 ]]
		-- upvalues: FFlagCreateMomentsToastModule (upval), ContentSharingNetworking (upval), ConstantsModule (upval), p1 (copy), MomentsEligibilityReceivedModule (upval)
		if not FFlagCreateMomentsToastModule or ContentSharingNetworking == nil then return end
		if type(p2:getState()[ConstantsModule.RoduxKey].MomentsEligibility.byUniverseId[p1]) ~= "boolean" then
			p2:dispatch(ContentSharingNetworking.CheckMomentsEligibility.API({ contentType = "experience", experienceId = tostring(p1) })):andThen(function(Result) --[[ Line: 31 ]]
				-- upvalues: p2 (copy), MomentsEligibilityReceivedModule (upval), p1 (upval)
				local ResponseBody = Result.responseBody
				p2:dispatch(MomentsEligibilityReceivedModule(p1, type(ResponseBody) == "table" and ResponseBody.isEligible == true))
			end):catch(function() --[[ Line: 36 ]] end)
			
			return
		end
	end
end