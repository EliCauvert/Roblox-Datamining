local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(momentsCommon.Media.MediaTypes)
local useHasPresentedFrameModule = require(momentsCommon.Media.useHasPresentedFrame)
local momentsSurfaceLoadManagerModule = require(script.Parent.MomentsSurfaceLoadManager)
local fFlagMomentsMediaSmoothnessTelemetryModule = require(momentsCommon.Flags.FFlagMomentsMediaSmoothnessTelemetry)
local captureKindModule = require(momentsCommon.Enums.CaptureKind)

return function(p1)
	-- upvalues: reactModule (ref), useHasPresentedFrameModule (ref), signalsModule (ref), signalsReactModule (ref), fFlagMomentsMediaSmoothnessTelemetryModule (ref), momentsSurfaceLoadManagerModule (ref), captureKindModule (ref)
	local controller = p1.controller
	local isVideo = p1.isVideo
	local enabled = p1.enabled
	local var1 = reactModule.useRef(nil)
	local var2 = if isVideo then useHasPresentedFrameModule(controller, enabled and isVideo) else signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: controller (copy)
			return if controller == nil then nil else controller.getState(p2).readiness
		end)
	end, { controller })) == "Ready"
	reactModule.useEffect(function()
		-- upvalues: enabled (ref), var2 (ref), controller (ref), var1 (ref), fFlagMomentsMediaSmoothnessTelemetryModule (copy), momentsSurfaceLoadManagerModule (copy), isVideo (ref), captureKindModule (copy)
		if enabled and var2 and (controller ~= nil and var1.current ~= controller) then
			var1.current = controller
			
			if fFlagMomentsMediaSmoothnessTelemetryModule then
				momentsSurfaceLoadManagerModule.markSurfaceReady(if isVideo then captureKindModule.Video else captureKindModule.Screenshot)
				
				return
			end
			momentsSurfaceLoadManagerModule.markSurfaceReady()
		end
	end, { enabled, var2, isVideo, controller })
end