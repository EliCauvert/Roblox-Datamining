local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local RoactUtilsModule = require(Parent1.RoactUtils)
local SocialStopwatchModule = require(Parent1.SocialStopwatch)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local GetCaptureShortcutSetupKeysModule = require(Parent.Utils.getCaptureShortcutSetupKeys)
local TakeCaptureModule = require(Parent.Thunks.TakeCapture)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectFunction = require(Parent1.React).useEffect
local UseKeyboardEnabledModule = require(Parent.Hooks.useKeyboardEnabled)
local UsePlayShutterSoundModule = require(Parent.Hooks.usePlayShutterSound)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector

local function _(): boolean --[[ Line: 25 ]]
	-- upvalues: GetCaptureShortcutSetupKeysModule (copy), UserInputService (copy)
	for _, value in GetCaptureShortcutSetupKeysModule() do
		if UserInputService:IsKeyDown(value) then
			return true
		end
	end
	return false
end

return function() --[[ Line: 35 ]]
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), UsePlayShutterSoundModule (copy), UseKeyboardEnabledModule (copy), UseEffectFunction (copy), SocialStopwatchModule (copy), EventNamesModule (copy), TakeCaptureModule (copy), ContextActionService (copy), GetCaptureShortcutSetupKeysModule (copy), UserInputService (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 39 ]]
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].IsActive
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1) --[[ Line: 43 ]]
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].IsCapturesCoreGuiEnabled
	end)
	local UsePlayShutterSoundModuleResult = UsePlayShutterSoundModule()
	local UseKeyboardEnabledModuleResult = UseKeyboardEnabledModule()
	UseEffectFunction(function() --[[ Line: 50 ]]
		-- upvalues: UseKeyboardEnabledModuleResult (copy), UseSelectorResult1 (copy), UsePlayShutterSoundModuleResult (copy), SocialStopwatchModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), TakeCaptureModule (upval), ContextActionService (upval), GetCaptureShortcutSetupKeysModule (upval), UserInputService (upval)
		if not UseKeyboardEnabledModuleResult then return end
		if not UseSelectorResult1 then return end
		local function v20() --[[ Line: 59 ]]
			-- upvalues: UsePlayShutterSoundModuleResult (upval), SocialStopwatchModule (upval), UseAnalyticsModuleResult (upval), EventNamesModule (upval), UseDispatchResult (upval), TakeCaptureModule (upval)
			UsePlayShutterSoundModuleResult()
			
			if not SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.CaptureTaken) then
				SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.CaptureTaken)
			end
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesEntrypointActivated)
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesDesktopHotkeyCaptureTriggered)
			UseDispatchResult(TakeCaptureModule())
		end
		
		ContextActionService:BindCoreAction("CaptureShortcutAction", function(_, UserInputState) --[[ Line: 70 ]]
			-- upvalues: GetCaptureShortcutSetupKeysModule (upval), UserInputService (upval), v20 (copy)
			if UserInputState == Enum.UserInputState.Begin then
				local Flag = false
				
				for _, value in GetCaptureShortcutSetupKeysModule() do
					if UserInputService:IsKeyDown(value) then
						Flag = true
						break
					end
				end
				if Flag then
					v20()
					
					return Enum.ContextActionResult.Sink
				end
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.KeyCode.One)
		
		return function() --[[ Line: 79 ]]
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("CaptureShortcutAction")
		end
	end, {
		UseSelectorResult,
		UseSelectorResult1,
		UseKeyboardEnabledModuleResult
	})
end