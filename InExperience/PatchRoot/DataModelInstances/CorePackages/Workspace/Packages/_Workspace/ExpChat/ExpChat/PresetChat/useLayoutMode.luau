local UserInputService = game:GetService("UserInputService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local SignalsReactModule = require(Parent.SignalsReact)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local ConstantsModule = require(script.Parent.Constants)
local FFlagExpChatPresetChatGamepadEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local FFlagLuaSupportMicroGamepadPreferredInput = require(Parent.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput

local function _(): boolean --[[ Line: 15 | Named "isTouchDevice" ]]
	-- upvalues: UserInputService (copy)
	return UserInputService.TouchEnabled and not UserInputService.MouseEnabled
end

return function() --[[ Line: 19 | Named "useLayoutMode" ]]
	-- upvalues: GetPresetChatStoreModule (copy), SignalsReactModule (copy), ConstantsModule (copy), FFlagExpChatPresetChatGamepadEnabledModule (copy), UserInputService (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetPresetChatStoreModule(false).getLayoutModeOverride)
	
	if UseSignalStateResult == ConstantsModule.LayoutMode.Tray or UseSignalStateResult == ConstantsModule.LayoutMode.FlyOut then
		return UseSignalStateResult
	elseif FFlagExpChatPresetChatGamepadEnabledModule and (UserInputService.PreferredInput == Enum.PreferredInput.Gamepad or FFlagLuaSupportMicroGamepadPreferredInput and UserInputService.PreferredInput == Enum.PreferredInput.MicroGamepad) then
		return ConstantsModule.LayoutMode.FlyOut
	else
		local NoMouseEnabled: boolean = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
		
		return if NoMouseEnabled then ConstantsModule.LayoutMode.Tray else ConstantsModule.LayoutMode.FlyOut
	end
end