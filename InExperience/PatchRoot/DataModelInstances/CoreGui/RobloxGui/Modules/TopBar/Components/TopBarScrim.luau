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
local var8 = if fFlagEnableUISelector then coreGuiCommonModule.Stores.GetUiSelectorSignalStore else nil

local function createComputedScrimVisible() --[[ line: 19 ]]
	-- upvalues: signalsModule (ref), gamepadConnectorModule (ref), expChatModule (ref), fFlagEnableUISelector (ref), var8 (ref)
	return signalsModule.createComputed(function(p0) --[[ line: 20 ]]
		-- upvalues: gamepadConnectorModule (copy), expChatModule (copy), fFlagEnableUISelector (copy), var8 (copy)
		return gamepadConnectorModule:topBarFocused(p0) or (expChatModule.Stores.GetFocusNavigationStore(p0).getChatInputBarFocused(p0) or fFlagEnableUISelector and var8(p0).getVisibility(p0))
	end)
end

return reactModule.memo(function() --[[ line: 29 | named "TopBarScrim" ]]
	-- upvalues: signalsReactModule (ref), createComputedScrimVisible (ref), reactModule (ref), scrim (ref)
	return reactModule.createElement(scrim, {
		Visible = signalsReactModule.useSignalBinding(createComputedScrimVisible())
	})
end)