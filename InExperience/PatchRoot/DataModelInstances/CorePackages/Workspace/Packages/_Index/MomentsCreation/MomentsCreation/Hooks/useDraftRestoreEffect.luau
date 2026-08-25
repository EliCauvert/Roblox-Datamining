local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local momentsCommonModule = require(parent.MomentsCommon)
local getCreationFlowStoreModule = require(momentsCreation.Stores.GetCreationFlowStore)
local momentsDraftStorageModule = require(momentsCreation.Storage.MomentsDraftStorage)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local failureReasonModule = require(momentsCreation.Enums.FailureReason)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames

local function withCreationSession(p0)
	-- upvalues: sessionManager (ref), funnelEventNames (ref), cryoModule (ref), makeCreationEventFieldsModule (ref)
	return cryoModule.Dictionary.join(p0, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
end

return function(p1)
	-- upvalues: getCreationFlowStoreModule (ref), reactModule (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), failureReasonModule (ref), creationFlowStateModule (ref), withCreationSession (ref)
	local var11 = getCreationFlowStoreModule(false)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), p1 (ref), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), failureReasonModule (copy), creationFlowStateModule (copy), withCreationSession (copy)
		if var11.getSelectedCapture(false) ~= nil or next(var11.getEditsMap(false)) ~= nil then return end
		if p1 == nil then return end
		local var12, var13 = momentsDraftStorageModule.load()
		
		if var13 ~= nil then
			fireAnalyticsEventModule(eventNames.DraftRestoreFailedEvent, { reason = var13 })
			
			return
		elseif var12 == nil then return end
		local var14 = nil
		
		for i, v in p1.getCaptures(false) do
			if v.LocalId == var12.captureRef.localId then
				var14 = v
				break
			end
		end
		if var14 == nil then
			momentsDraftStorageModule.clear()
			fireAnalyticsEventModule(eventNames.DraftRestoreFailedEvent, { reason = failureReasonModule.CaptureDeleted })
			
			return
		end
		var11.onSelectedCaptureUpdated(var14)
		var11.updateDescription(var12.description or "")
		
		for i_1, v in pairs(var12.edits) do
			var11.setCommittedEdit(i_1, v)
		end
		var11.updateCurrentState(creationFlowStateModule.Preview)
		fireAnalyticsEventModule(eventNames.DraftRestoreSucceededEvent, withCreationSession({}))
	end, { var11, p1 })
end