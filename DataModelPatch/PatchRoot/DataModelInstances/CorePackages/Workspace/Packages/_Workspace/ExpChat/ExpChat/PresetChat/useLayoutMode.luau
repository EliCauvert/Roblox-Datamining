local UserInputService = game:GetService("UserInputService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local SignalsReactModule = require(ExpChat.Parent.SignalsReact)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local ConstantsModule = require(script.Parent.Constants)
local FFlagExpChatPresetChatGamepadEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatGamepadEnabled)

local function _(): boolean
	-- upvalues: UserInputService (copy)
	return UserInputService.TouchEnabled and not UserInputService.MouseEnabled
end

return function()
	-- upvalues: GetPresetChatStoreModule (copy), SignalsReactModule (copy), ConstantsModule (copy), FFlagExpChatPresetChatGamepadEnabledModule (copy), UserInputService (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetPresetChatStoreModule(false).getLayoutModeOverride)
	
	if UseSignalStateResult == ConstantsModule.LayoutMode.Tray or UseSignalStateResult == ConstantsModule.LayoutMode.FlyOut then
		return UseSignalStateResult
	elseif FFlagExpChatPresetChatGamepadEnabledModule and UserInputService.PreferredInput == Enum.PreferredInput.Gamepad then
		return ConstantsModule.LayoutMode.FlyOut
	else
		local NoMouseEnabled: boolean = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
		
		return if NoMouseEnabled then ConstantsModule.LayoutMode.Tray else ConstantsModule.LayoutMode.FlyOut
	end
end