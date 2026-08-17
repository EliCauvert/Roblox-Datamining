local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local momentsCommonModule = require(parent.MomentsCommon)
local getCreationFlowStoreModule = require(momentsCreation.Stores.GetCreationFlowStore)
local momentsDraftStorageModule = require(momentsCreation.Storage.MomentsDraftStorage)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local eventNames = momentsCommonModule.Analytics.EventNames

return function() --[[ line: 23 | named "useDraftSaveEffect" ]]
	-- upvalues: getCreationFlowStoreModule (ref), reactModule (ref), signalsModule (ref), momentsDraftStorageModule (ref), fireAnalyticsEventModule (ref), eventNames (ref)
	local var7 = getCreationFlowStoreModule(false)
	reactModule.useEffect(function() --[[ line: 26 ]]
		-- upvalues: signalsModule (copy), var7 (ref), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy)
		return signalsModule.createEffect(function(p0) --[[ line: 27 ]]
			-- upvalues: var7 (copy), momentsDraftStorageModule (copy), fireAnalyticsEventModule (copy), eventNames (copy)
			local selectedCapture = var7.getSelectedCapture(p0)
			local description = var7.getDescription(p0)
			local editsMap = var7.getEditsMap(p0)
			
			if selectedCapture == nil then return end
			if not momentsDraftStorageModule.save({
				captureRef = {
					localId = selectedCapture.LocalId,
					captureType = selectedCapture.CaptureType
				},
				description = description,
				edits = editsMap
			}) then
				fireAnalyticsEventModule(eventNames.DraftSaveFailedEvent, {})
			end
		end)
	end, { var7 })
end