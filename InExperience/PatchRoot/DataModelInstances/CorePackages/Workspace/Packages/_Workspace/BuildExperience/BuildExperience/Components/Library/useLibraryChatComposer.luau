local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(BuildExperience.Chat.useChatSessionCore)
local GetLibraryStoreModule = require(BuildExperience.Stores.GetLibraryStore)
local _ = require(BuildExperience.Stores.GetLibraryStore.createLibraryStore)
local LibraryTypesModule = require(script.Parent.LibraryTypes)
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)

return function(Current, p1, IsReadOnly, ModelPicker)
	-- upvalues: GetLibraryStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), LibraryTypesModule (copy), FFlagBuildExperienceAnswerFormModule (copy)
	local LibraryStoreModule = GetLibraryStoreModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(LibraryStoreModule.getChatResourceRequest)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(Current)
	UseRefResult2.current = Current
	local UseResult = ReactModule.useCallback(function(p2): boolean
		-- upvalues: UseRefResult2 (copy), LibraryTypesModule (upval)
		local Current = UseRefResult2.current
		local ResourceAttachment = LibraryTypesModule.toResourceAttachment(p2)
		
		if Current.findComposerResourceAttachmentIndexByUri(ResourceAttachment.uri) == nil then
			Current.addComposerResourceAttachment(ResourceAttachment)
			
			return true
		else
			return false
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2): boolean
		-- upvalues: UseRefResult2 (copy), LibraryTypesModule (upval)
		local Current = UseRefResult2.current
		local ComposerResourceAttachmentIndexByUri = Current.findComposerResourceAttachmentIndexByUri(LibraryTypesModule.toResourceUri(p2))
		
		if ComposerResourceAttachmentIndexByUri == nil then
			return false
		else
			Current.removeComposerResourceAttachmentAtIndex(ComposerResourceAttachmentIndexByUri)
			
			return true
		end
	end, {})
	local IsComposerSendBlocked = Current.isComposerSendBlocked or Current.isAssistantResponding and #Current.composerResourceAttachments > 0
	local AnswerForm = if FFlagBuildExperienceAnswerFormModule then Current.answerForm else nil
	local LocalToolActions = if FFlagBuildExperienceAnswerFormModule then Current.localToolActions else nil
	local SubmitAnswerText = if FFlagBuildExperienceAnswerFormModule then Current.submitAnswerText else nil
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseRefResult (copy), UseResult1 (copy), UseResult (copy), LibraryStoreModule (copy), p1 (copy), AnswerForm (copy), Current (copy)
		if UseSignalStateResult == nil or UseSignalStateResult.token <= UseRefResult.current then return end
		UseRefResult.current = UseSignalStateResult.token
		
		if UseSignalStateResult.action == "Remove" then
			UseResult1(UseSignalStateResult.resource.path)
		else
			local ReplacePath = UseSignalStateResult.replacePath
			
			if ReplacePath ~= nil and ReplacePath ~= UseSignalStateResult.resource.path then
				UseResult1(ReplacePath)
			end
			UseResult(UseSignalStateResult.resource)
		end
		LibraryStoreModule.consumeChatResourceRequest(UseSignalStateResult.token)
		
		if p1 and AnswerForm == nil and UseSignalStateResult.action == "Add" and UseSignalStateResult.focusComposer ~= false and Current.textBoxRef.current ~= nil then
			Current.textBoxRef.current.focus()
		end
	end, {
		LibraryStoreModule, UseSignalStateResult, p1, AnswerForm, UseResult,
		UseResult1, Current.textBoxRef
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: ModelPicker (copy), AnswerForm (copy), LocalToolActions (copy), SubmitAnswerText (copy), Current (copy), UseResult (copy), UseResult1 (copy), IsComposerSendBlocked (copy), IsReadOnly (copy), UseRefResult1 (copy), LibraryStoreModule (copy)
		local Current1 = {
			tracksExternalText = true,
			modelPicker = ModelPicker,
			answerForm = AnswerForm,
			localToolActions = LocalToolActions,
			onSubmitAnswerText = SubmitAnswerText,
			composerText = Current.composerText,
			composerErrorText = Current.composerErrorText,
			onComposerChanged = Current.setComposerText,
			images = Current.composerImages,
			onImagesChanged = Current.setComposerImages,
			onRetryImage = Current.retryComposerImage,
			resourceAttachments = Current.composerResourceAttachments,
			onAddResource = UseResult,
			onRemoveResourceAttachment = Current.removeComposerResourceAttachmentAtIndex,
			onRemoveResourceByPath = UseResult1,
			isSendBlocked = IsComposerSendBlocked,
			isReadOnly = IsReadOnly,
			textBoxRef = Current.textBoxRef,
			isAssistantResponding = Current.isAssistantResponding,
			canStopAssistantResponse = Current.canStopAssistantResponse,
			canSendWhileResponding = Current.canSendWhileResponding,
			onSend = Current.sendMessage,
			onStop = Current.stopAssistantResponse
		}
		UseRefResult1.current = Current1
		LibraryStoreModule.setChatComposerState(Current1)
	end, {
		LibraryStoreModule, ModelPicker, Current.composerText, AnswerForm,
		LocalToolActions, SubmitAnswerText, Current.composerErrorText,
		Current.setComposerText, Current.composerImages, Current.setComposerImages,
		Current.retryComposerImage, Current.composerResourceAttachments, UseResult,
		Current.removeComposerResourceAttachmentAtIndex, UseResult1,
		IsComposerSendBlocked, IsReadOnly, Current.textBoxRef,
		Current.isAssistantResponding, Current.canStopAssistantResponse,
		Current.canSendWhileResponding, Current.sendMessage,
		Current.stopAssistantResponse
	})
	ReactModule.useEffect(function()
		-- upvalues: LibraryStoreModule (copy), UseRefResult1 (copy)
		return function()
			-- upvalues: LibraryStoreModule (upval), UseRefResult1 (upval)
			if LibraryStoreModule.getChatComposerState(false) == UseRefResult1.current then
				LibraryStoreModule.setChatComposerState(nil)
			end
		end
	end, { LibraryStoreModule })
	
	return IsComposerSendBlocked
end