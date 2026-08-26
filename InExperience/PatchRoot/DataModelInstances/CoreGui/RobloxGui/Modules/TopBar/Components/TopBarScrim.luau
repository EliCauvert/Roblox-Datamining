local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local signalsModule = require(corePackagesService.Packages.Signals)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local coreScriptsRoactCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon)
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local gamepadConnectorModule = require(script.Parent.GamepadConnector)
local scrim = coreScriptsRoactCommonModule.Scrim
local fFlagEnableUISelector = coreGuiCommonModule.Flags.FFlagEnableUISelector
local var1 = if fFlagEnableUISelector then coreGuiCommonModule.Stores.GetUiSelectorSignalStore else nil

local function createComputedScrimVisible()
	-- upvalues: signalsModule (ref), gamepadConnectorModule (ref), expChatModule (ref), fFlagEnableUISelector (ref), var1 (ref)
	return signalsModule.createComputed(function(p1)
		-- upvalues: gamepadConnectorModule (copy), expChatModule (copy), fFlagEnableUISelector (copy), var1 (copy)
		return gamepadConnectorModule:topBarFocused(p1) or (expChatModule.Stores.GetFocusNavigationStore(p1).getChatInputBarFocused(p1) or fFlagEnableUISelector and var1(p1).getVisibility(p1))
	end)
end

return reactModule.memo(function()
	-- upvalues: signalsReactModule (ref), createComputedScrimVisible (ref), reactModule (ref), scrim (ref)
	return reactModule.createElement(scrim, {
		Visible = signalsReactModule.useSignalBinding(createComputedScrimVisible())
	})
end)