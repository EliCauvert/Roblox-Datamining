local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local FocusUtils = require(CorePackages.Workspace.Packages.Chrome).FocusUtils
local InputTypeModule = require(CorePackages.Workspace.Packages.InputType)
local GetInputGroupFunction = InputTypeModule.getInputGroup
local FocusNavigationStore = require(CorePackages.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local ChatSelectorModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ChatSelector)

local function _(): boolean --[[ Line: 18 | Named "isUsingGamepad" ]]
	-- upvalues: GetInputGroupFunction (copy), UserInputService (copy), InputTypeModule (copy)
	return GetInputGroupFunction(UserInputService:GetLastInputType()) == InputTypeModule.InputTypeConstants.Gamepad
end

return function(_) --[[ Line: 23 ]]
	-- upvalues: ChatSelectorModule (copy), GetInputGroupFunction (copy), UserInputService (copy), InputTypeModule (copy), FocusUtils (copy), FocusNavigationStore (copy)
	if ChatSelectorModule:GetVisibility() and GetInputGroupFunction(UserInputService:GetLastInputType()) == InputTypeModule.InputTypeConstants.Gamepad then
		FocusUtils.FocusOffChrome(function() --[[ Line: 25 ]]
			-- upvalues: FocusNavigationStore (upval)
			FocusNavigationStore.focusChatInputBar()
		end)
	end
end