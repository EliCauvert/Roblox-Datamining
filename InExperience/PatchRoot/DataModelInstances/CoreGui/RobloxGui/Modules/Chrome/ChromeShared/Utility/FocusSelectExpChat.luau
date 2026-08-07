local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local userInputService = game:GetService("UserInputService")
local chrome = script:FindFirstAncestor("Chrome")
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local focusUtils = require(corePackagesService.Workspace.Packages.Chrome).FocusUtils
local serviceModule = require(chrome.Service)
local fFlagChatIntegrationFixShortcutModule = require(chrome.Flags.FFlagChatIntegrationFixShortcut)
local inputTypeModule = require(corePackagesService.Workspace.Packages.InputType)
local getInputGroup = inputTypeModule.getInputGroup
local focusNavigationStore = require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false)
local chatSelectorModule = require(robloxGui.Modules.ChatSelector)

local function _() --[[ line: 22 | named "isUsingGamepad" ]]
	-- upvalues: getInputGroup (ref), userInputService (ref), inputTypeModule (ref)
	return getInputGroup(userInputService:GetLastInputType()) == inputTypeModule.InputTypeConstants.Gamepad
end

return function(_) --[[ line: 27 ]]
	-- upvalues: chatSelectorModule (ref), getInputGroup (ref), userInputService (ref), inputTypeModule (ref), focusUtils (ref), fFlagChatIntegrationFixShortcutModule (ref), serviceModule (ref), constantsModule (ref), focusNavigationStore (ref)
	if chatSelectorModule:GetVisibility() and getInputGroup(userInputService:GetLastInputType()) == inputTypeModule.InputTypeConstants.Gamepad then
		focusUtils.FocusOffChrome(function() --[[ line: 29 ]]
			-- upvalues: fFlagChatIntegrationFixShortcutModule (copy), serviceModule (copy), constantsModule (copy), focusNavigationStore (copy)
			if not fFlagChatIntegrationFixShortcutModule then
				serviceModule:setShortcutBar(constantsModule.UNIBAR_SHORTCUTBAR_ID)
			end
			focusNavigationStore.focusChatInputBar()
		end)
	end
end