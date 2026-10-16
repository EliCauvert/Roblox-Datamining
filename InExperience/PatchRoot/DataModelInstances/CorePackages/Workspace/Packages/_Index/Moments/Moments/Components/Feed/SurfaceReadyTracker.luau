local Parent = script:FindFirstAncestor("Moments").Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local SignalsReactModule = require(Parent.SignalsReact)
local UseMomentMediaControllerFunction = MomentsCommonModule.Media.useMomentMediaController
local UseMomentsSurfaceReadyTrackingFunction = MomentsCommonModule.Performance.useMomentsSurfaceReadyTracking
local _ = require(script.Parent.FeedTypes)

return function(p1) --[[ Line: 19 | Named "SurfaceReadyTracker" ]]
	-- upvalues: SignalsReactModule (copy), UseMomentMediaControllerFunction (copy), UseMomentsSurfaceReadyTrackingFunction (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.pager.getCurrentItem)
	local MomentId = if UseSignalStateResult == nil or UseSignalStateResult.kind ~= "moment" then nil else UseSignalStateResult.moment.momentId
	local IsCaptureTypeMatch: boolean = UseSignalStateResult ~= nil and UseSignalStateResult.kind == "moment" and UseSignalStateResult.moment.metadata.captureType == Enum.CaptureType.Video
	local UseMomentMediaControllerResult = UseMomentMediaControllerFunction(MomentId or "")
	UseMomentsSurfaceReadyTrackingFunction({
		controller = if MomentId then UseMomentMediaControllerResult else nil,
		isVideo = IsCaptureTypeMatch,
		enabled = MomentId ~= nil
	})
	
	return nil
end