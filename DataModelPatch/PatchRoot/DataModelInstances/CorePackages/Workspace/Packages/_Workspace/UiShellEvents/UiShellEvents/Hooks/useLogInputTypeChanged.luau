local UiShellEvents = script:FindFirstAncestor("UiShellEvents")
local UserInputService = game:GetService("UserInputService")
local Parent = UiShellEvents.Parent
local ReactModule = require(Parent.React)
local LogInputTypeChangedModule = require(UiShellEvents.Analytics.logInputTypeChanged)
local UseInputTypeFunction = require(Parent.RoactUtils).Hooks.useInputType
local UseIsTvRemoteDeviceFunction = require(Parent.RoactUtils).Hooks.useIsTvRemoteDevice
local LogInputTypeChangedTvRemote1 = game:DefineFastFlag("LogInputTypeChangedTvRemote1", false)

local function getConnectedGamepadTypes(ConnectedGamepads)
	-- upvalues: UserInputService (copy)
	if ConnectedGamepads == nil then
		return nil
	end
	local List = {}
	
	for _, connectedGamepad in ConnectedGamepads do
		if UserInputService:GamepadSupports(connectedGamepad, Enum.KeyCode.Return) then
			table.insert(List, "tv_remote")
		else
			table.insert(List, "full_gamepad")
		end
	end
	return List
end

local function anyFullGamepadConnected(ConnectedGamepads): boolean?
	-- upvalues: UserInputService (copy)
	if ConnectedGamepads == nil then
		return nil
	end
	for _, connectedGamepad in ConnectedGamepads do
		if not UserInputService:GamepadSupports(connectedGamepad, Enum.KeyCode.Return) then
			return true
		end
	end
	return false
end

return function(p1, PlaySessionId)
	-- upvalues: UseInputTypeFunction (copy), LogInputTypeChangedTvRemote1 (copy), UseIsTvRemoteDeviceFunction (copy), UserInputService (copy), anyFullGamepadConnected (copy), getConnectedGamepadTypes (copy), ReactModule (copy), LogInputTypeChangedModule (copy)
	local UseInputTypeResult = UseInputTypeFunction()
	local UseIsTvRemoteDeviceResult = if LogInputTypeChangedTvRemote1 then UseIsTvRemoteDeviceFunction() else nil
	local ConnectedGamepads = if LogInputTypeChangedTvRemote1 then UserInputService:GetConnectedGamepads() else nil
	local AnyFullGamepadConnectedResult = if LogInputTypeChangedTvRemote1 then anyFullGamepadConnected(ConnectedGamepads) else nil
	local ConnectedGamepadTypes = if LogInputTypeChangedTvRemote1 then getConnectedGamepadTypes(ConnectedGamepads) else nil
	local Joined = if ConnectedGamepadTypes then table.concat(ConnectedGamepadTypes, ",") else nil
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), LogInputTypeChangedModule (upval), p1 (copy), UseInputTypeResult (copy), AnyFullGamepadConnectedResult (copy), Joined (copy), UseIsTvRemoteDeviceResult (copy), PlaySessionId (copy)
		LogInputTypeChangedModule(p1, "inputTypeChanged", {
			inputType = UseInputTypeResult,
			gamepadConnected = UserInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1),
			anyFullGamepadConnected = AnyFullGamepadConnectedResult,
			connectedGamepads = Joined,
			isTvRemote = UseIsTvRemoteDeviceResult,
			playSessionId = PlaySessionId
		})
	end, { UseInputTypeResult, Joined })
end