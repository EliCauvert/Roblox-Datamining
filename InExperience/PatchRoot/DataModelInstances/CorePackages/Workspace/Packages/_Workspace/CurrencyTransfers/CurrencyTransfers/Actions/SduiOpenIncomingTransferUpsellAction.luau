local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local IncomingTransferHomepagePromptDismissModule = require(CurrencyTransfers.Utils.IncomingTransferHomepagePromptDismiss)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FFlagSduiDismissPromptPageScope = SharedFlagsModule.FFlagSduiDismissPromptPageScope

local function parseTransferRequestIdFromUrl(Text: string)
	local FoundAt: number? = string.find(string.lower(Text), "transferrequestid=", 1, true)
	
	if FoundAt then
		local Segment = string.sub(Text, FoundAt + 18)
		local FoundAt1: number? = string.find(Segment, "&", 1, true)
		local Segment1: string = if FoundAt1 then string.sub(Segment, 1, FoundAt1 - 1) else Segment
		
		return if Segment1 == "" then nil else Segment1
	else
		return nil
	end
end

local function _(p1)
	-- upvalues: parseTransferRequestIdFromUrl (copy)
	local TransferId = p1.transferId
	
	if typeof(TransferId) == "string" and TransferId ~= "" then
		return TransferId
	else
		local Url = p1.url
		
		return if typeof(Url) == "string" and Url ~= "" then parseTransferRequestIdFromUrl(Url) else nil
	end
end

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), parseTransferRequestIdFromUrl (copy), IncomingTransferHomepagePromptDismissModule (copy), SduiParseHelpers (copy), FFlagSduiDismissPromptPageScope (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenIncomingTransferUpsell
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local TransferId = ActionParams.transferId
	local ParseTransferRequestIdFromUrlResult = nil
	
	if typeof(TransferId) == "string" and TransferId ~= "" then
		ParseTransferRequestIdFromUrlResult = TransferId
	else
		local Url = ActionParams.url
		ParseTransferRequestIdFromUrlResult = if typeof(Url) == "string" and Url ~= "" then parseTransferRequestIdFromUrl(Url) else nil
	end
	if ParseTransferRequestIdFromUrlResult == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Invalid or missing transferId (set transferId or url with transferrequestid)",
			propName = "transferId",
			name = SduiActionType.OpenIncomingTransferUpsell
		}, p2.appPage)
		
		return
	end
	local PromptType = ActionParams.promptType
	
	if typeof(PromptType) ~= "string" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "promptType",
			name = SduiActionType.OpenIncomingTransferUpsell,
			message = `Invalid or missing promptType: {PromptType}`
		}, p2.appPage)
		
		return
	end
	local PromptId = ActionParams.promptId
	
	if PromptId ~= nil and typeof(PromptId) ~= "string" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "promptId",
			name = SduiActionType.OpenIncomingTransferUpsell,
			message = `Invalid promptId: {PromptId}`
		}, p2.appPage)
		
		return
	end
	local Callbacks = IncomingTransferHomepagePromptDismissModule.createCallbacks({
		networking = p2.dependencies.networking,
		promptId = PromptId,
		optimisticHidePromptType = PromptType,
		onReportPromptDismissFailed = function(p3)
			-- upvalues: p2 (copy), SduiErrorType (upval), SduiActionType (upval), SduiParseHelpers (upval)
			p2.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
				name = SduiActionType.OpenIncomingTransferUpsell,
				message = "reportPromptDismiss failed: " .. SduiParseHelpers.stringifyValue(p3)
			}, p2.appPage)
		end,
		configKey = if FFlagSduiDismissPromptPageScope then p2.configKey else nil
	})
	local config = {
		name = AppPage.TransferRobuxFlow,
		extraProps = {
			direction = "receive",
			transferId = ParseTransferRequestIdFromUrlResult,
			onPromptOptimisticHide = Callbacks.optimisticHide,
			onPromptDismissCommitted = Callbacks.commitDismiss
		}
	}
	
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		
		return
	else
		p2.dependencies.dispatch(NavigateDownFunction(config))
	end
end