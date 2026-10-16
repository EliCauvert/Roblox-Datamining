local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local UseSelectorFunction = require(Parent.dependencies).useSelector
local UseSignalStateFunction = require(Parent1.SignalsReact).useSignalState
local GetContactImporterParamsModule = require(script.Parent.getContactImporterParams)
local UseUiModeInfoFunction = require(Parent1.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent1.RobloxAppEnums).UiMode
local FFlagUseSignalsForIsLocalUserSoothsayer = require(Parent1.SharedFlags).FFlagUseSignalsForIsLocalUserSoothsayer
local GetIsLocalUserSoothsayerStore = if FFlagUseSignalsForIsLocalUserSoothsayer then require(Parent1.IsLocalUserSoothsayerStore).GetIsLocalUserSoothsayerStore else nil

return function(p1) --[[ Line: 15 ]]
	-- upvalues: FFlagUseSignalsForIsLocalUserSoothsayer (copy), UseSignalStateFunction (copy), GetIsLocalUserSoothsayerStore (copy), UseSelectorFunction (copy), GetContactImporterParamsModule (copy), UseUiModeInfoFunction (copy), UiMode (copy)
	local UseSignalStateResult = if FFlagUseSignalsForIsLocalUserSoothsayer then UseSignalStateFunction(GetIsLocalUserSoothsayerStore(false).getIsLocalUserSoothsayer) else UseSelectorFunction(function(p2) --[[ Line: 18 ]]
		return p2.IsLocalUserSoothsayer
	end)
	local UseSelectorResult = UseSelectorFunction(GetContactImporterParamsModule)
	local PolicyIsEnabled = nil
	local ShouldShowContactImporterFeature = nil
	
	if not (UseUiModeInfoFunction().uiMode == UiMode.TenFoot) and UseSignalStateResult then
		PolicyIsEnabled = true
		ShouldShowContactImporterFeature = true
	else
		PolicyIsEnabled = p1.policyIsEnabled
		ShouldShowContactImporterFeature = UseSelectorResult.shouldShowContactImporterFeature
	end
	local ShouldShowContactImporterFeature1: boolean = PolicyIsEnabled and ShouldShowContactImporterFeature
	
	return {
		shouldFetchContactImporterData = PolicyIsEnabled or false,
		shouldShowContactImporter = ShouldShowContactImporterFeature1 or false,
		shouldShowContactImporterModal = ShouldShowContactImporterFeature1 and UseSelectorResult.shouldShowContactImporterUpsellModal or false
	}
end