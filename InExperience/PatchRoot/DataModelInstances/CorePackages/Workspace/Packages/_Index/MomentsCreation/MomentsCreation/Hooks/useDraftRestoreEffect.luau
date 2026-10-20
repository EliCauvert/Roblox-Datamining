local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MomentsCommonModule = require(Parent.MomentsCommon)
local GetCreationFlowStoreModule = require(MomentsCreation.Stores.GetCreationFlowStore)
local MomentsDraftStorageModule = require(MomentsCreation.Storage.MomentsDraftStorage)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local CreationFlowStateModule = require(MomentsCreation.Enums.CreationFlowState)
local FailureReasonModule = require(MomentsCreation.Enums.FailureReason)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local FFlagMomentsCommentsCreatorControlModule = require(MomentsCreation.Flags.FFlagMomentsCommentsCreatorControl)
local FFlagMomentsTTSDraftRestoreModule = require(MomentsCreation.Flags.FFlagMomentsTTSDraftRestore)
local FFlagMomentsTTSVoiceSelectorModule = require(MomentsCreation.Flags.FFlagMomentsTTSVoiceSelector)
local DefaultCreationToolsModule = require(MomentsCreation.Tools.defaultCreationTools)
local VoiceToolModule = require(MomentsCreation.Tools.voiceTool)
local VoiceCatalogModule = require(MomentsCreation.Components.Voice.voiceCatalog)
local EventNames = MomentsCommonModule.Analytics.EventNames
local SessionManager = MomentsCommonModule.Analytics.SessionManager
local FunnelEventNames = MomentsCommonModule.Analytics.FunnelEventNames

local function withCreationSession(p1)
	-- upvalues: SessionManager (copy), FunnelEventNames (copy), CryoModule (copy), MakeCreationEventFieldsModule (copy)
	return CryoModule.Dictionary.join(p1, MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow))))
end

local function _(Tbl)
	-- upvalues: FFlagMomentsTTSVoiceSelectorModule (copy), VoiceCatalogModule (copy)
	if FFlagMomentsTTSVoiceSelectorModule and VoiceCatalogModule.getVoiceById(Tbl.voiceId) ~= nil then
		return Tbl
	else
		local Copy = table.clone(Tbl)
		Copy.voiceId = VoiceCatalogModule.getDefaultVoiceId()
		
		return Copy
	end
end

return function(p1, p2)
	-- upvalues: GetCreationFlowStoreModule (copy), ReactModule (copy), MomentsDraftStorageModule (copy), FireAnalyticsEventModule (copy), EventNames (copy), FailureReasonModule (copy), FFlagMomentsCommentsCreatorControlModule (copy), FFlagMomentsTTSDraftRestoreModule (copy), DefaultCreationToolsModule (copy), VoiceToolModule (copy), FFlagMomentsTTSVoiceSelectorModule (copy), VoiceCatalogModule (copy), CreationFlowStateModule (copy), withCreationSession (copy)
	local CreationFlowStoreModule = GetCreationFlowStoreModule(false)
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), CreationFlowStoreModule (copy), p1 (copy), MomentsDraftStorageModule (upval), FireAnalyticsEventModule (upval), EventNames (upval), FailureReasonModule (upval), FFlagMomentsCommentsCreatorControlModule (upval), FFlagMomentsTTSDraftRestoreModule (upval), DefaultCreationToolsModule (upval), VoiceToolModule (upval), FFlagMomentsTTSVoiceSelectorModule (upval), VoiceCatalogModule (upval), CreationFlowStateModule (upval), withCreationSession (upval)
		if p2 then return end
		if CreationFlowStoreModule.getSelectedCapture(false) ~= nil or next(CreationFlowStoreModule.getEditsMap(false)) ~= nil then return end
		if p1 == nil then return end
		local LoadResult, LoadResult2 = MomentsDraftStorageModule.load()
		
		if LoadResult2 ~= nil then
			FireAnalyticsEventModule(EventNames.DraftRestoreFailedEvent, { reason = LoadResult2 })
			
			return
		end
		if LoadResult == nil then return end
		local v1 = nil
		
		for i, value in p1.getCaptures(false) do
			if value.LocalId == LoadResult.captureRef.localId then
				v1 = value
				break
			end
		end
		if v1 == nil then
			MomentsDraftStorageModule.clear()
			FireAnalyticsEventModule(EventNames.DraftRestoreFailedEvent, { reason = FailureReasonModule.CaptureDeleted })
			
			return
		end
		CreationFlowStoreModule.onSelectedCaptureUpdated(v1)
		CreationFlowStoreModule.updateDescription(LoadResult.description or "")
		
		if FFlagMomentsCommentsCreatorControlModule then
			CreationFlowStoreModule.updateCommentsEnabled(LoadResult.commentsEnabled ~= false)
		end
		for i, edit in pairs(LoadResult.edits) do
			if not FFlagMomentsTTSDraftRestoreModule or i ~= "voice" then
				CreationFlowStoreModule.setCommittedEdit(i, edit)
			end
		end
		if FFlagMomentsTTSDraftRestoreModule and LoadResult.edits.voice ~= nil and table.find(DefaultCreationToolsModule, VoiceToolModule) ~= nil then
			local Voice = LoadResult.edits.voice
			local Copy1 = nil
			
			if FFlagMomentsTTSVoiceSelectorModule and VoiceCatalogModule.getVoiceById(Voice.voiceId) ~= nil then
				Copy1 = Voice
			else
				local Copy = table.clone(Voice)
				Copy.voiceId = VoiceCatalogModule.getDefaultVoiceId()
				Copy1 = Copy
			end
			CreationFlowStoreModule.setCommittedEdit("voice", Copy1)
			CreationFlowStoreModule.setPendingRestoredVoice(Copy1)
		end
		CreationFlowStoreModule.updateCurrentState(CreationFlowStateModule.Preview)
		FireAnalyticsEventModule(EventNames.DraftRestoreSucceededEvent, withCreationSession({}))
	end, { CreationFlowStoreModule, p1, p2 })
end