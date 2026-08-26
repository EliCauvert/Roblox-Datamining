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

local function withCreationSession(p1)
	-- upvalues: sessionManager (ref), funnelEventNames (ref), cryoModule (ref), makeCreationEventFieldsModule (ref)
	return cryoModule.Dictionary.join(p1, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
end

return function(p1)
	-- upvalues: getCreationFlowStoreModule (ref), reactModule (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), failureReasonModule (ref), creationFlowStateModule (ref), withCreationSession (ref)
	local var1 = getCreationFlowStoreModule(false)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), failureReasonModule (copy), creationFlowStateModule (copy), withCreationSession (copy)
		if var1.getSelectedCapture(false) ~= nil or next(var1.getEditsMap(false)) ~= nil then return end
		if p1 == nil then return end
		local var2, var3 = momentsDraftStorageModule.load()
		
		if var3 ~= nil then
			fireAnalyticsEventModule(eventNames.DraftRestoreFailedEvent, { reason = var3 })
			
			return
		elseif var2 == nil then return end
		local var4 = nil
		
		for i, v in p1.getCaptures(false) do
			if v.LocalId == var2.captureRef.localId then
				var4 = v
				break
			end
		end
		if var4 == nil then
			momentsDraftStorageModule.clear()
			fireAnalyticsEventModule(eventNames.DraftRestoreFailedEvent, { reason = failureReasonModule.CaptureDeleted })
			
			return
		end
		var1.onSelectedCaptureUpdated(var4)
		var1.updateDescription(var2.description or "")
		
		for i_1, v in pairs(var2.edits) do
			var1.setCommittedEdit(i_1, v)
		end
		var1.updateCurrentState(creationFlowStateModule.Preview)
		fireAnalyticsEventModule(eventNames.DraftRestoreSucceededEvent, withCreationSession({}))
	end, { var1, p1 })
end