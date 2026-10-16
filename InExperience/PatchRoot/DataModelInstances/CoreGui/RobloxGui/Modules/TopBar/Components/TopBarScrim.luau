local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local ExpChatModule = require(CorePackages.Workspace.Packages.ExpChat)
local GamepadConnectorModule = require(script.Parent.GamepadConnector)
local Scrim = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).Scrim
local FFlagEnableUISelector = CoreGuiCommonModule.Flags.FFlagEnableUISelector
local GetUiSelectorSignalStore = if FFlagEnableUISelector then CoreGuiCommonModule.Stores.GetUiSelectorSignalStore else nil

local function createComputedScrimVisible() --[[ Line: 19 ]]
	-- upvalues: SignalsModule (copy), GamepadConnectorModule (copy), ExpChatModule (copy), FFlagEnableUISelector (copy), GetUiSelectorSignalStore (copy)
	return SignalsModule.createComputed(function(p1) --[[ Line: 20 ]]
		-- upvalues: GamepadConnectorModule (upval), ExpChatModule (upval), FFlagEnableUISelector (upval), GetUiSelectorSignalStore (upval)
		local PBarFocused = GamepadConnectorModule:topBarFocused(p1)
		local ChatInputBarFocused = ExpChatModule.Stores.GetFocusNavigationStore(p1).getChatInputBarFocused(p1)
		local Visibility = FFlagEnableUISelector and GetUiSelectorSignalStore(p1).getVisibility(p1)
		
		return PBarFocused or (ChatInputBarFocused or Visibility)
	end)
end

return ReactModule.memo(function() --[[ Line: 29 | Named "TopBarScrim" ]]
	-- upvalues: SignalsReactModule (copy), createComputedScrimVisible (copy), ReactModule (copy), Scrim (copy)
	return ReactModule.createElement(Scrim, {
		Visible = SignalsReactModule.useSignalBinding(createComputedScrimVisible())
	})
end)