local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local FFlagBuildExperienceDeveloperProductContextModule = require(BuildExperience.Flags.FFlagBuildExperienceDeveloperProductContext)
local GetBuildPromptDraftStoreModule = require(BuildExperience.Stores.GetBuildPromptDraftStore)
local ChatTypesModule = require(script.Parent.chatTypes)

return function(UniverseId, SessionId, Callback, Callback1, Enabled, Current) --[[ Line: 19 | Named "useBuildPromptDraft" ]]
	-- upvalues: GetBuildPromptDraftStoreModule (copy), SignalsReactModule (copy), FFlagBuildExperienceDeveloperProductContextModule (copy), ReactModule (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), ChatTypesModule (copy)
	local BuildPromptDraftStoreModule = GetBuildPromptDraftStoreModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(BuildPromptDraftStoreModule.getPendingDraft)
	local v1 = nil
	
	if FFlagBuildExperienceDeveloperProductContextModule then
		local UseRefResult = ReactModule.useRef(Current)
		UseRefResult.current = Current
		v1 = UseRefResult
	end
	ReactModule.useEffect(function() --[[ Line: 37 ]]
		-- upvalues: FFlagBuildExperienceMonetizationNativeUIModule (upval), Enabled (copy), BuildPromptDraftStoreModule (copy), UseSignalStateResult (copy), UniverseId (copy), SessionId (copy), FFlagBuildExperienceDeveloperProductContextModule (upval), v1 (ref), ChatTypesModule (upval), Callback (copy), Callback1 (copy)
		if FFlagBuildExperienceMonetizationNativeUIModule and (Enabled == false or BuildPromptDraftStoreModule.getPendingDraft() ~= UseSignalStateResult) then return end
		if UseSignalStateResult == nil or UseSignalStateResult.universeId ~= UniverseId or UseSignalStateResult.sessionId ~= nil and UseSignalStateResult.sessionId ~= SessionId or not FFlagBuildExperienceDeveloperProductContextModule and UseSignalStateResult.resourceAttachments ~= nil then return end
		if FFlagBuildExperienceDeveloperProductContextModule and UseSignalStateResult.resourceAttachments ~= nil then
			local Current = if v1 == nil then nil else v1.current
			
			if Current == nil then return end
			Current.clearComposerResourceAttachments()
			
			for _, resourceAttachment in UseSignalStateResult.resourceAttachments do
				if Current.findComposerResourceAttachmentIndexByUri(ChatTypesModule.getResourceAttachmentUri(resourceAttachment)) == nil then
					Current.addComposerResourceAttachment(resourceAttachment)
				end
			end
		end
		Callback(UseSignalStateResult.text)
		
		if UseSignalStateResult.autoSend ~= true or Callback1 ~= nil and Callback1() then
			BuildPromptDraftStoreModule.consumeDraft(UniverseId, SessionId)
			
			return
		end
	end, if FFlagBuildExperienceMonetizationNativeUIModule then {
		UseSignalStateResult or false, BuildPromptDraftStoreModule,
		UniverseId or false, SessionId or false, Callback, Callback1 or false,
		Enabled ~= false
	} else {
		UseSignalStateResult, BuildPromptDraftStoreModule, UniverseId, SessionId,
		Callback, Callback1
	})
end