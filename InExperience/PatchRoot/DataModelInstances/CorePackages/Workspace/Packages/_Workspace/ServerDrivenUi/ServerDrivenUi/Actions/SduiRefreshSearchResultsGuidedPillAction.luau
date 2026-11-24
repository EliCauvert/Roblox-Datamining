local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SearchResultsModule = require(Parent.SearchResults)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local SearchGuidedPillRequest = SearchResultsModule.searchGuidedPillRequest
local SearchPage = AppPage.SearchPage

local function _(p1, Message, PropName)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.RefreshSearchResultsGuidedPill,
		message = Message,
		propName = PropName
	}, p1.appPage)
end

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), SduiLoadTimer (copy), SearchPage (copy), SearchGuidedPillRequest (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = SduiActionType.RefreshSearchResultsGuidedPill
		}, p2.appPage)
		
		return nil
	end
	local ConfigKey = p2.configKey
	
	if typeof(ConfigKey) ~= "string" or ConfigKey == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "configKey",
			name = SduiActionType.RefreshSearchResultsGuidedPill,
			message = `Invalid or missing configKey: {ConfigKey}`
		}, p2.appPage)
		
		return nil
	end
	local SelectedOption = ActionParams.selectedOption
	
	if typeof(SelectedOption) ~= "string" or SelectedOption == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "selectedOption",
			name = SduiActionType.RefreshSearchResultsGuidedPill,
			message = `Invalid or missing selectedOption: {SelectedOption}`
		}, p2.appPage)
		
		return nil
	end
	local LoadTimer = SduiLoadTimer.createLoadTimer(SearchPage)
	LoadTimer.start("refresh")
	local Suggestions = ActionParams.suggestions
	local TapPillResult = SearchGuidedPillRequest.tapPill({
		configKey = ConfigKey,
		selectedOption = SelectedOption,
		loadTimer = LoadTimer,
		suggestions = if typeof(Suggestions) == "table" then Suggestions else nil,
		onUnknownOption = function()
			-- upvalues: p2 (copy), SelectedOption (copy), SduiErrorType (upval), SduiActionType (upval)
			p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				propName = "selectedOption",
				name = SduiActionType.RefreshSearchResultsGuidedPill,
				message = `Unknown selectedOption: {SelectedOption}`
			}, p2.appPage)
		end
	})
	
	if TapPillResult then
		TapPillResult:finally(function()
			-- upvalues: LoadTimer (copy)
			LoadTimer.logRefreshComplete()
		end)
		
		return TapPillResult
	else
		return nil
	end
end