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
local fFlagMomentsCommentsCreatorControlModule = require(momentsCreation.Flags.FFlagMomentsCommentsCreatorControl)
local fFlagMomentsTTSDraftRestoreModule = require(momentsCreation.Flags.FFlagMomentsTTSDraftRestore)
local fFlagMomentsTTSVoiceSelectorModule = require(momentsCreation.Flags.FFlagMomentsTTSVoiceSelector)
local defaultCreationToolsModule = require(momentsCreation.Tools.defaultCreationTools)
local voiceToolModule = require(momentsCreation.Tools.voiceTool)
local voiceCatalogModule = require(momentsCreation.Components.Voice.voiceCatalog)
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames

local function withCreationSession(p1)
	-- upvalues: sessionManager (ref), funnelEventNames (ref), cryoModule (ref), makeCreationEventFieldsModule (ref)
	return cryoModule.Dictionary.join(p1, makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)))
end

local function _(p1)
	-- upvalues: fFlagMomentsTTSVoiceSelectorModule (ref), voiceCatalogModule (ref)
	if fFlagMomentsTTSVoiceSelectorModule and voiceCatalogModule.getVoiceById(p1.voiceId) ~= nil then
		return p1
	end
	local cloned = table.clone(p1)
	cloned.voiceId = voiceCatalogModule.getDefaultVoiceId()
	
	return cloned
end

return function(p1, p2)
	-- upvalues: getCreationFlowStoreModule (ref), reactModule (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref), failureReasonModule (ref), fFlagMomentsCommentsCreatorControlModule (ref), fFlagMomentsTTSDraftRestoreModule (ref), defaultCreationToolsModule (ref), voiceToolModule (ref), fFlagMomentsTTSVoiceSelectorModule (ref), voiceCatalogModule (ref), creationFlowStateModule (ref), withCreationSession (ref)
	local var1 = getCreationFlowStoreModule(false)
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var1 (ref), p1 (ref), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy), failureReasonModule (copy), fFlagMomentsCommentsCreatorControlModule (copy), fFlagMomentsTTSDraftRestoreModule (copy), defaultCreationToolsModule (copy), voiceToolModule (copy), fFlagMomentsTTSVoiceSelectorModule (copy), voiceCatalogModule (copy), creationFlowStateModule (copy), withCreationSession (copy)
		if p2 then return end
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
		
		if fFlagMomentsCommentsCreatorControlModule then
			var1.updateCommentsEnabled(var2.commentsEnabled ~= false)
		end
		for i_1, v in pairs(var2.edits) do
			if not fFlagMomentsTTSDraftRestoreModule or i_1 ~= "voice" then
				var1.setCommittedEdit(i_1, v)
			end
		end
		if fFlagMomentsTTSDraftRestoreModule and var2.edits.voice ~= nil and table.find(defaultCreationToolsModule, voiceToolModule) ~= nil then
			local var5
			local voice = var2.edits.voice
			
			if fFlagMomentsTTSVoiceSelectorModule and voiceCatalogModule.getVoiceById(voice.voiceId) ~= nil then
				var5 = voice
			else
				local cloned = table.clone(voice)
				cloned.voiceId = voiceCatalogModule.getDefaultVoiceId()
				var5 = cloned
			end
			var1.setCommittedEdit("voice", var5)
			var1.setPendingRestoredVoice(var5)
		end
		var1.updateCurrentState(creationFlowStateModule.Preview)
		fireAnalyticsEventModule(eventNames.DraftRestoreSucceededEvent, withCreationSession({}))
	end, { var1, p1, p2 })
end