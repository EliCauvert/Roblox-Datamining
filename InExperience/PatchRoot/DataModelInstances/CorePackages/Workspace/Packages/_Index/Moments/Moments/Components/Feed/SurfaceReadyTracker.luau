local parent = script:FindFirstAncestor("Moments").Parent
local momentsCommonModule = require(parent.MomentsCommon)
local signalsReactModule = require(parent.SignalsReact)
local useMomentMediaController = momentsCommonModule.Media.useMomentMediaController
local useMomentsSurfaceReadyTracking = momentsCommonModule.Performance.useMomentsSurfaceReadyTracking
local _ = require(script.Parent.FeedTypes)

return function(p0)
	-- upvalues: signalsReactModule (ref), useMomentMediaController (ref), useMomentsSurfaceReadyTracking (ref)
	local var4
	local var2 = signalsReactModule.useSignalState(p0.pager.getCurrentItem)
	local var3 = if var2 == nil or var2.kind ~= "moment" then nil else var2.moment.momentId
	
	if var2 == nil or var2.kind ~= "moment" then
		var4 = false
	else
		var4 = var2.moment.metadata.captureType == Enum.CaptureType.Video
		var4 = nil
	end
	useMomentsSurfaceReadyTracking({
		controller = if var3 then useMomentMediaController(var3 or "") else nil,
		isVideo = var4,
		enabled = var3 ~= nil
	})
	
	return nil
end