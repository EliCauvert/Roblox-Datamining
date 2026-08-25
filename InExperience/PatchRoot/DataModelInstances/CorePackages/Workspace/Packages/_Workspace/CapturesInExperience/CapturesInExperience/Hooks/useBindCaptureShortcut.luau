local parent = script.Parent.Parent
local parent_1 = parent.Parent
local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local socialStopwatchModule = require(parent_1.SocialStopwatch)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local getCaptureShortcutSetupKeysModule = require(parent.Utils.getCaptureShortcutSetupKeys)
local takeCaptureModule = require(parent.Thunks.TakeCapture)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useKeyboardEnabledModule = require(parent.Hooks.useKeyboardEnabled)
local usePlayShutterSoundModule = require(parent.Hooks.usePlayShutterSound)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector

local _ = function()
	-- upvalues: getCaptureShortcutSetupKeysModule (ref), userInputService (ref)
	for i, v in getCaptureShortcutSetupKeysModule() do
		if userInputService:IsKeyDown(v) then
			return true
		end
	end
	return false
end

return function()
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useSelector (ref), constantsModule (ref), usePlayShutterSoundModule (ref), useKeyboardEnabledModule (ref), useEffect (ref), socialStopwatchModule (ref), eventNamesModule (ref), takeCaptureModule (ref), contextActionService (ref), getCaptureShortcutSetupKeysModule (ref), userInputService (ref)
	local var12 = useAnalyticsModule()
	local var13 = useDispatch()
	local var14 = useSelector(function(p0)
		-- upvalues: constantsModule (copy)
		return p0[constantsModule.RoduxKey].IsActive
	end)
	local var15 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].IsCapturesCoreGuiEnabled
	end)
	local var16 = usePlayShutterSoundModule()
	local var17 = useKeyboardEnabledModule()
	useEffect(function()
		-- upvalues: var17 (ref), var15 (ref), var16 (ref), socialStopwatchModule (copy), var12 (ref), eventNamesModule (copy), var13 (ref), takeCaptureModule (copy), contextActionService (copy), getCaptureShortcutSetupKeysModule (copy), userInputService (copy)
		if not var17 then return end
		if var15 then
			local var18 = function()
				-- upvalues: var16 (copy), socialStopwatchModule (copy), var12 (copy), eventNamesModule (copy), var13 (copy), takeCaptureModule (copy)
				var16()
				
				if not socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CaptureTaken) then
					socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CaptureTaken)
				end
				var12.fireEvent(eventNamesModule.CapturesEntrypointActivated)
				var12.fireEvent(eventNamesModule.CapturesDesktopHotkeyCaptureTriggered)
				var13(takeCaptureModule())
			end
			
			contextActionService:BindCoreAction("CaptureShortcutAction", function(_, p2)
				-- upvalues: getCaptureShortcutSetupKeysModule (copy), userInputService (copy), var18 (ref)
				if p2 == Enum.UserInputState.Begin then
					local var19
					for i, v in getCaptureShortcutSetupKeysModule() do
						if userInputService:IsKeyDown(v) then
							var19 = true
							if var19 then
								var18()
								
								return Enum.ContextActionResult.Sink
							end
						end
					end
					var19 = false
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.One)
			
			return function()
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("CaptureShortcutAction")
			end
		end
	end, { var14, var15, var17 })
end