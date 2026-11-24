local Parent = script.Parent.Parent
local CanCreateMomentsModule = require(Parent.Utils.canCreateMoments)
local ConstantsModule = require(Parent.Constants)
local IsEligibleForMomentsModule = require(Parent.Utils.isEligibleForMoments)
local LogCaptureEndLayerExposureModule = require(Parent.Utils.logCaptureEndLayerExposure)
local WaitForMomentsEligibilityModule = require(Parent.Thunks.WaitForMomentsEligibility)

return function(p1)
	-- upvalues: CanCreateMomentsModule (copy), WaitForMomentsEligibilityModule (copy), ConstantsModule (copy), IsEligibleForMomentsModule (copy), LogCaptureEndLayerExposureModule (copy)
	return function(p2)
		-- upvalues: CanCreateMomentsModule (upval), WaitForMomentsEligibilityModule (upval), ConstantsModule (upval), p1 (copy), IsEligibleForMomentsModule (upval), LogCaptureEndLayerExposureModule (upval)
		if CanCreateMomentsModule() then
			task.spawn(function()
				-- upvalues: p2 (copy), WaitForMomentsEligibilityModule (upval), ConstantsModule (upval), p1 (upval), IsEligibleForMomentsModule (upval), LogCaptureEndLayerExposureModule (upval)
				if p2:dispatch(WaitForMomentsEligibilityModule(game.GameId, ConstantsModule.MomentsEligibilityTimeout, p1)) and IsEligibleForMomentsModule(p2:getState()[ConstantsModule.RoduxKey].MomentsEligibility) then
					LogCaptureEndLayerExposureModule()
				end
			end)
			
			return
		end
	end
end