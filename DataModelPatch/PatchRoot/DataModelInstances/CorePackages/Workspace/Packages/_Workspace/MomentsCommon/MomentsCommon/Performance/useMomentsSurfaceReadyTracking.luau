local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(MomentsCommon.Media.MediaTypes)
local UseHasPresentedFrameModule = require(MomentsCommon.Media.useHasPresentedFrame)
local MomentsSurfaceLoadManagerModule = require(script.Parent.MomentsSurfaceLoadManager)

return function(p1)
	-- upvalues: ReactModule (copy), UseHasPresentedFrameModule (copy), SignalsModule (copy), SignalsReactModule (copy), MomentsSurfaceLoadManagerModule (copy)
	local Controller = p1.controller
	local IsVideo = p1.isVideo
	local Enabled = p1.enabled
	local UseRefResult = ReactModule.useRef(nil)
	local UseHasPresentedFrameModuleResult = UseHasPresentedFrameModule(Controller, Enabled and IsVideo)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Controller (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: Controller (upval)
			return if Controller == nil then nil else Controller.getState(p2).readiness
		end)
	end, { Controller })))
	local UseHasPresentedFrameModuleResult1 = if IsVideo then UseHasPresentedFrameModuleResult else UseSignalStateResult == "Ready"
	ReactModule.useEffect(function()
		-- upvalues: Enabled (copy), UseHasPresentedFrameModuleResult1 (copy), Controller (copy), UseRefResult (copy), MomentsSurfaceLoadManagerModule (upval)
		if Enabled and UseHasPresentedFrameModuleResult1 and Controller ~= nil and UseRefResult.current ~= Controller then
			UseRefResult.current = Controller
			MomentsSurfaceLoadManagerModule.markSurfaceReady()
		end
	end, { Enabled, UseHasPresentedFrameModuleResult1, Controller })
end