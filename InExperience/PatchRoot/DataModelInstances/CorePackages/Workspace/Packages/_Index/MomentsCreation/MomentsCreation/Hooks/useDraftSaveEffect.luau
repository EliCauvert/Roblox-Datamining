local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetCreationFlowStoreModule = require(MomentsCreation.Stores.GetCreationFlowStore)
local MomentsDraftStorageModule = require(MomentsCreation.Storage.MomentsDraftStorage)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local FFlagMomentsCommentsCreatorControlModule = require(MomentsCreation.Flags.FFlagMomentsCommentsCreatorControl)
local EventNames = require(Parent.MomentsCommon).Analytics.EventNames

return function(p1)
	-- upvalues: GetCreationFlowStoreModule (copy), ReactModule (copy), SignalsModule (copy), FFlagMomentsCommentsCreatorControlModule (copy), MomentsDraftStorageModule (copy), FireAnalyticsEventModule (copy), EventNames (copy)
	local CreationFlowStoreModule = GetCreationFlowStoreModule(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), SignalsModule (upval), CreationFlowStoreModule (copy), FFlagMomentsCommentsCreatorControlModule (upval), MomentsDraftStorageModule (upval), FireAnalyticsEventModule (upval), EventNames (upval)
		return if p1 then nil else SignalsModule.createEffect(function(p2)
			-- upvalues: CreationFlowStoreModule (upval), FFlagMomentsCommentsCreatorControlModule (upval), MomentsDraftStorageModule (upval), FireAnalyticsEventModule (upval), EventNames (upval)
			local SelectedCapture = CreationFlowStoreModule.getSelectedCapture(p2)
			local Description = CreationFlowStoreModule.getDescription(p2)
			local CommentsEnabled = if FFlagMomentsCommentsCreatorControlModule then CreationFlowStoreModule.getCommentsEnabled(p2) else nil
			local EditsMap = CreationFlowStoreModule.getEditsMap(p2)
			
			if SelectedCapture == nil then return end
			if not MomentsDraftStorageModule.save({
				captureRef = {
					localId = SelectedCapture.LocalId,
					captureType = SelectedCapture.CaptureType
				},
				description = Description,
				commentsEnabled = CommentsEnabled,
				edits = EditsMap
			}) then
				FireAnalyticsEventModule(EventNames.DraftSaveFailedEvent, {})
			end
		end)
	end, { CreationFlowStoreModule, p1 })
end