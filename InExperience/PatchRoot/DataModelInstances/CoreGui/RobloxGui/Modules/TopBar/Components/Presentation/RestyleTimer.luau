local CorePackages = game:GetService("CorePackages")
local Chrome = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Chrome
local Stores = require(CorePackages.Workspace.Packages.CoreGuiCommon).Stores
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagTopBarRefactor = require(CorePackages.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor
local RestyleTimerModule = require(CorePackages.Workspace.Packages.InExperienceCloudPlay.RestyleTimer)
local ChromeUtilsModule = require(Chrome.ChromeShared.Service.ChromeUtils)
local UseObservableValueModule = require(Chrome.ChromeShared.Hooks.useObservableValue)
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local GamepadConnectorModule = if SharedFlagsModule.FFlagEnableConsoleExpControls and EnabledResult then require(script.Parent.Parent.GamepadConnector) else nil
local UILessStore = if SharedFlagsModule.FFlagAddUILessMode and SharedFlagsModule.FIntAddUILessModeVariant ~= 0 and Stores.GetUILessStore then Stores.GetUILessStore(false) else nil
local Computed = require(CorePackages.Packages.Signals).createComputed(function(p1): boolean
	-- upvalues: UILessStore (copy)
	return UILessStore ~= nil and (UILessStore.getUILessModeEnabled(p1) and not UILessStore.getUIVisible(p1))
end)
local NewResult = if GamepadConnectorModule == nil then ChromeUtilsModule.ObservableValue.new(true) else GamepadConnectorModule:getShowTopBar()

return function(p1)
	-- upvalues: UseObservableValueModule (copy), NewResult (copy), SignalsReactModule (copy), Computed (copy), ReactModule (copy), RestyleTimerModule (copy), FFlagTopBarRefactor (copy)
	local UseObservableValueModuleResult = UseObservableValueModule(p1.showTopBar or NewResult)
	local UseSignalStateResult = SignalsReactModule.useSignalState(Computed)
	
	return ReactModule.createElement(RestyleTimerModule, {
		buttonSize = p1.buttonSize,
		layoutOrder = p1.layoutOrder,
		onAreaChanged = p1.onAreaChanged,
		onAreaRemoved = p1.onAreaRemoved,
		isHidden = if FFlagTopBarRefactor then nil else UseObservableValueModuleResult == false or p1.followsUILessMode == true and UseSignalStateResult
	})
end