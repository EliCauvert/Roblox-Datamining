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
	local var1 = useAnalyticsModule()
	local var2 = useDispatch()
	local var3 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].IsActive
	end)
	local var4 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].IsCapturesCoreGuiEnabled
	end)
	local var5 = usePlayShutterSoundModule()
	local var6 = useKeyboardEnabledModule()
	useEffect(function()
		-- upvalues: var6 (ref), var4 (ref), var5 (ref), socialStopwatchModule (copy), var1 (ref), eventNamesModule (copy), var2 (ref), takeCaptureModule (copy), contextActionService (copy), getCaptureShortcutSetupKeysModule (copy), userInputService (copy)
		if not var6 then return end
		if var4 then
			local var7 = function()
				-- upvalues: var5 (copy), socialStopwatchModule (copy), var1 (copy), eventNamesModule (copy), var2 (copy), takeCaptureModule (copy)
				var5()
				
				if not socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CaptureTaken) then
					socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CaptureTaken)
				end
				var1.fireEvent(eventNamesModule.CapturesEntrypointActivated)
				var1.fireEvent(eventNamesModule.CapturesDesktopHotkeyCaptureTriggered)
				var2(takeCaptureModule())
			end
			
			contextActionService:BindCoreAction("CaptureShortcutAction", function(_, p1)
				-- upvalues: getCaptureShortcutSetupKeysModule (copy), userInputService (copy), var7 (ref)
				if p1 == Enum.UserInputState.Begin then
					local var8
					for i, v in getCaptureShortcutSetupKeysModule() do
						if userInputService:IsKeyDown(v) then
							var8 = true
							if var8 then
								var7()
								
								return Enum.ContextActionResult.Sink
							end
						end
					end
					var8 = false
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.One)
			
			return function()
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("CaptureShortcutAction")
			end
		end
	end, { var3, var4, var6 })
end