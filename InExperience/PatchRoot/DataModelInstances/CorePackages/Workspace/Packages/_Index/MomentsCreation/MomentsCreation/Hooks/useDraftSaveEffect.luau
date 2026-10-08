local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local momentsCommonModule = require(parent.MomentsCommon)
local getCreationFlowStoreModule = require(momentsCreation.Stores.GetCreationFlowStore)
local momentsDraftStorageModule = require(momentsCreation.Storage.MomentsDraftStorage)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local fFlagMomentsCommentsCreatorControlModule = require(momentsCreation.Flags.FFlagMomentsCommentsCreatorControl)
local eventNames = momentsCommonModule.Analytics.EventNames

return function(p1)
	-- upvalues: getCreationFlowStoreModule (ref), reactModule (ref), signalsModule (ref), fFlagMomentsCommentsCreatorControlModule (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref)
	local var1 = getCreationFlowStoreModule(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), signalsModule (copy), var1 (ref), fFlagMomentsCommentsCreatorControlModule (copy), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy)
		return if p1 then nil else signalsModule.createEffect(function(p2)
			-- upvalues: var1 (copy), fFlagMomentsCommentsCreatorControlModule (copy), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy)
			local selectedCapture = var1.getSelectedCapture(p2)
			local description = var1.getDescription(p2)
			local var2 = if fFlagMomentsCommentsCreatorControlModule then var1.getCommentsEnabled(p2) else nil
			local editsMap = var1.getEditsMap(p2)
			
			if selectedCapture == nil then return end
			if not momentsDraftStorageModule.save({
				captureRef = {
					localId = selectedCapture.LocalId,
					captureType = selectedCapture.CaptureType
				},
				description = description,
				commentsEnabled = var2,
				edits = editsMap
			}) then
				fireAnalyticsEventModule(eventNames.DraftSaveFailedEvent, {})
			end
		end)
	end, { var1, p1 })
end