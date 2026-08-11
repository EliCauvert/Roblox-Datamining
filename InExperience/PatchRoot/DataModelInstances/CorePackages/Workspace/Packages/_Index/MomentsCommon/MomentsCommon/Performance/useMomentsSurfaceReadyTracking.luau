local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(momentsCommon.Media.MediaTypes)
local useHasPresentedFrameModule = require(momentsCommon.Media.useHasPresentedFrame)
local momentsSurfaceLoadManagerModule = require(script.Parent.MomentsSurfaceLoadManager)

return function(p0) --[[ line: 21 | named "useMomentsSurfaceReadyTracking" ]]
	-- upvalues: reactModule (ref), useHasPresentedFrameModule (ref), signalsModule (ref), signalsReactModule (ref), momentsSurfaceLoadManagerModule (ref)
	local controller = p0.controller
	local isVideo = p0.isVideo
	local enabled = p0.enabled
	local var6 = reactModule.useRef(nil)
	local var7 = if isVideo then useHasPresentedFrameModule(controller, enabled and isVideo) else signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 36 ]]
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 37 ]]
			-- upvalues: controller (copy)
			return if controller == nil then nil else controller.getState(p1).readiness
		end)
	end, { controller })) == "Ready"
	reactModule.useEffect(function() --[[ line: 48 ]]
		-- upvalues: enabled (ref), var7 (ref), controller (ref), var6 (ref), momentsSurfaceLoadManagerModule (copy)
		if enabled and var7 and (controller ~= nil and var6.current ~= controller) then
			var6.current = controller
			momentsSurfaceLoadManagerModule.markSurfaceReady()
		end
	end, { enabled, var7, controller })
end