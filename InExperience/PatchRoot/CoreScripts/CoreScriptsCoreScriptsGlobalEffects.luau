local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local CoreScriptsRootProvider = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local UsePlayerCurrentScreenOrientationModule = require(RobloxGui.Modules.Common.Hooks.usePlayerCurrentScreenOrientation)
local CoreScriptsGamepadDisconnectListenerModule = require(RobloxGui.Modules.GamepadDisconnect.CoreScriptsGamepadDisconnectListener)
local ReactModule = require(CorePackages.Packages.React)
local DeviceType = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceType
local UseLogInputTypeChangedFunction = require(CorePackages.Workspace.Packages.UiShellEvents).useLogInputTypeChanged
local UseLogOrientationChangedFunction = require(CorePackages.Workspace.Packages.UiShellEvents).useLogOrientationChanged
local NewResult = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")))
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local UserInputService = game:GetService("UserInputService")
local GetInputGroupFunction = require(CorePackages.Workspace.Packages.InputType).getInputGroup
local UseExternalEventFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useExternalEvent
local RemoveLoggingHookForCorescriptGlobalEffects2 = game:DefineFastFlag("RemoveLoggingHookForCorescriptGlobalEffects2", false)
local InputType = nil

local function sendInputTypeLogging(InputType1) --[[ Line: 28 ]]
	-- upvalues: InputType (ref), UserInputService (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), NewResult (copy)
	if InputType == InputType1 then return end
	InputType = InputType1
	local GamepadConnected = UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1)
	local PlaySessionId = if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else nil
	
	if InputType1 ~= nil then
		NewResult:sendEventDeferred("inputTypeChanged", "inputTypeChanged", {
			inputType = InputType1,
			gamepadConnected = GamepadConnected,
			playSessionId = PlaySessionId
		})
	end
end

require(CorePackages.Packages.Roact).mount(ReactModule.createElement(function(_) --[[ Line: 47 | Named "CoreScriptsGlobalEffects" ]]
	-- upvalues: RemoveLoggingHookForCorescriptGlobalEffects2 (copy), ReactModule (copy), sendInputTypeLogging (copy), GetInputGroupFunction (copy), UseExternalEventFunction (copy), UserInputService (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), UseLogInputTypeChangedFunction (copy), NewResult (copy), RbxAnalyticsService (copy), UsePlayerCurrentScreenOrientationModule (copy), UseLogOrientationChangedFunction (copy), DeviceType (copy), CoreScriptsRootProvider (copy), CoreScriptsGamepadDisconnectListenerModule (copy)
	if RemoveLoggingHookForCorescriptGlobalEffects2 then
		UseExternalEventFunction(UserInputService.LastInputTypeChanged, (ReactModule.useCallback(function(p1) --[[ Line: 49 ]]
			-- upvalues: sendInputTypeLogging (upval), GetInputGroupFunction (upval)
			sendInputTypeLogging(GetInputGroupFunction(p1))
		end, {})))
	elseif RbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		UseLogInputTypeChangedFunction(NewResult, RbxAnalyticsService:GetPlaySessionId())
	else
		UseLogInputTypeChangedFunction(NewResult)
	end
	UseLogOrientationChangedFunction(NewResult, (UsePlayerCurrentScreenOrientationModule()))
	
	return ReactModule.createElement(CoreScriptsRootProvider, { styleOverride = { deviceType = DeviceType.Console } }, {
		CoreScriptsGamepadDisconnectListener = ReactModule.createElement(CoreScriptsGamepadDisconnectListenerModule)
	})
end), CoreGui, "CoreScriptsGlobalEffects")