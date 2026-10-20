local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Chrome = script:FindFirstAncestor("Chrome")
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local FocusUtils = require(CorePackages.Workspace.Packages.Chrome).FocusUtils
local ServiceModule = require(Chrome.Service)
local FFlagChatIntegrationFixShortcutModule = require(Chrome.Flags.FFlagChatIntegrationFixShortcut)
local InputTypeModule = require(CorePackages.Workspace.Packages.InputType)
local GetInputGroupFunction = InputTypeModule.getInputGroup
local FocusNavigationStore = require(CorePackages.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local ChatSelectorModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ChatSelector)

local function _(): boolean
	-- upvalues: GetInputGroupFunction (copy), UserInputService (copy), InputTypeModule (copy)
	return GetInputGroupFunction(UserInputService:GetLastInputType()) == InputTypeModule.InputTypeConstants.Gamepad
end

return function(_)
	-- upvalues: ChatSelectorModule (copy), GetInputGroupFunction (copy), UserInputService (copy), InputTypeModule (copy), FocusUtils (copy), FFlagChatIntegrationFixShortcutModule (copy), ServiceModule (copy), ConstantsModule (copy), FocusNavigationStore (copy)
	if ChatSelectorModule:GetVisibility() and GetInputGroupFunction(UserInputService:GetLastInputType()) == InputTypeModule.InputTypeConstants.Gamepad then
		FocusUtils.FocusOffChrome(function()
			-- upvalues: FFlagChatIntegrationFixShortcutModule (upval), ServiceModule (upval), ConstantsModule (upval), FocusNavigationStore (upval)
			if not FFlagChatIntegrationFixShortcutModule then
				ServiceModule:setShortcutBar(ConstantsModule.UNIBAR_SHORTCUTBAR_ID)
			end
			FocusNavigationStore.focusChatInputBar()
		end)
	end
end