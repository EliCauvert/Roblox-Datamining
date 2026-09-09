local userInputService = game:GetService("UserInputService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsReactModule = require(parent.SignalsReact)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local constantsModule = require(script.Parent.Constants)
local fFlagExpChatPresetChatGamepadEnabledModule = require(expChat.Flags.FFlagExpChatPresetChatGamepadEnabled)
local fFlagLuaSupportMicroGamepadPreferredInput = require(parent.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput

local function _()
	-- upvalues: userInputService (ref)
	return userInputService.TouchEnabled and not userInputService.MouseEnabled
end

return function()
	-- upvalues: getPresetChatStoreModule (ref), signalsReactModule (ref), constantsModule (ref), fFlagExpChatPresetChatGamepadEnabledModule (ref), userInputService (ref), fFlagLuaSupportMicroGamepadPreferredInput (ref)
	local var1 = signalsReactModule.useSignalState(getPresetChatStoreModule(false).getLayoutModeOverride)
	
	return if var1 == constantsModule.LayoutMode.Tray or var1 == constantsModule.LayoutMode.FlyOut then var1 elseif fFlagExpChatPresetChatGamepadEnabledModule and (userInputService.PreferredInput == Enum.PreferredInput.Gamepad or fFlagLuaSupportMicroGamepadPreferredInput and userInputService.PreferredInput == Enum.PreferredInput.MicroGamepad) then constantsModule.LayoutMode.FlyOut elseif userInputService.TouchEnabled and not userInputService.MouseEnabled then constantsModule.LayoutMode.Tray else constantsModule.LayoutMode.FlyOut
end