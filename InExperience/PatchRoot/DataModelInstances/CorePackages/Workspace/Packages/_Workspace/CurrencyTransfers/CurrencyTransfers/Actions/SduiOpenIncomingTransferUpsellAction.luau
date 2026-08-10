local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local incomingTransferHomepagePromptDismissModule = require(currencyTransfers.Utils.IncomingTransferHomepagePromptDismiss)
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var3 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

local function parseTransferRequestIdFromUrl(value) --[[ line: 25 ]]
	local matchIndex = string.find(string.lower(value), "transferrequestid=", 1, true)
	
	if not matchIndex then
		return nil
	end
	local substring = string.sub(value, matchIndex + 18)
	local matchIndex_1 = string.find(substring, "&", 1, true)
	local var8 = if matchIndex_1 then string.sub(substring, 1, matchIndex_1 - 1) else substring
	
	return if var8 == "" then nil else var8
end

local function _(p0) --[[ line: 42 | named "resolveTransferId" ]]
	-- upvalues: parseTransferRequestIdFromUrl (ref)
	local transferId = p0.transferId
	
	if typeof(transferId) == "string" and transferId ~= "" then
		return transferId
	end
	local url = p0.url
	
	return if typeof(url) == "string" and url ~= "" then parseTransferRequestIdFromUrl(url) else nil
end

return function(a, _, p1) --[[ line: 57 | named "SduiOpenIncomingTransferUpsellAction" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), parseTransferRequestIdFromUrl (ref), incomingTransferHomepagePromptDismissModule (ref), sduiParseHelpers (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var3 (ref), navigateDown (ref)
	local var9 = if a then a.actionParams else nil
	
	if var9 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenIncomingTransferUpsell
		}, p1.appPage)
		
		return
	end
	local url, var10
	assert(var9, "actionParams must exist")
	local transferId = var9.transferId
	
	if typeof(transferId) == "string" and transferId ~= "" then
		var10 = transferId
	else
		url = var9.url
		var10 = if typeof(url) == "string" and url ~= "" then parseTransferRequestIdFromUrl(url) else nil
	end
	if var10 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Invalid or missing transferId (set transferId or url with transferrequestid)",
			propName = "transferId",
			name = sduiActionType.OpenIncomingTransferUpsell
		}, p1.appPage)
		
		return
	end
	transferId = var9.promptType
	
	if typeof(transferId) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "promptType",
			name = sduiActionType.OpenIncomingTransferUpsell,
			message = `Invalid or missing promptType: {transferId}`
		}, p1.appPage)
		
		return
	end
	url = var9.promptId
	
	if url ~= nil and typeof(url) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "promptId",
			name = sduiActionType.OpenIncomingTransferUpsell,
			message = `Invalid promptId: {url}`
		}, p1.appPage)
		
		return
	end
	local var11 = incomingTransferHomepagePromptDismissModule.createCallbacks({
		networking = p1.dependencies.networking,
		promptId = url,
		optimisticHidePromptType = transferId,
		onReportPromptDismissFailed = function(p2) --[[ line: 109 ]]
			-- upvalues: p1 (ref), sduiErrorType (copy), sduiActionType (copy), sduiParseHelpers (copy)
			p1.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
				name = sduiActionType.OpenIncomingTransferUpsell,
				message = "reportPromptDismiss failed: " .. sduiParseHelpers.stringifyValue(p2)
			}, p1.appPage)
		end
	})
	local t = {
		name = appPage.TransferRobuxFlow,
		extraProps = {
			direction = "receive",
			transferId = var10,
			onPromptOptimisticHide = var11.optimisticHide,
			onPromptDismissCommitted = var11.commitDismiss
		}
	}
	
	if fFlagSignalsNavP3Dispatch then
		var3.down(var3.fromLegacyPage(t))
		
		return
	end
	p1.dependencies.dispatch(navigateDown(t))
end