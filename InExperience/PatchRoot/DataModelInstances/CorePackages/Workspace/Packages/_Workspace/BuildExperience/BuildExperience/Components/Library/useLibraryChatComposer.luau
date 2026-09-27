local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(buildExperience.Chat.useChatSessionCore)
local getLibraryStoreModule = require(buildExperience.Stores.GetLibraryStore)
local _ = require(buildExperience.Stores.GetLibraryStore.createLibraryStore)
local libraryTypesModule = require(script.Parent.LibraryTypes)
local _ = require(buildExperience.Chat.chatTypes)

return function(p1, p2)
	-- upvalues: getLibraryStoreModule (ref), signalsReactModule (ref), reactModule (ref), libraryTypesModule (ref)
	local var1 = getLibraryStoreModule()
	local var2 = signalsReactModule.useSignalState(var1.getChatResourceRequest)
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(p1)
	var5.current = p1
	local var6 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), libraryTypesModule (copy)
		local current = var5.current
		local var7 = libraryTypesModule.toResourceAttachment(p3)
		
		if current.findComposerResourceAttachmentIndexByUri(var7.uri) == nil then
			current.addComposerResourceAttachment(var7)
			
			return true
		end
		return false
	end, {})
	local var7 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), libraryTypesModule (copy)
		local current = var5.current
		local var8 = current.findComposerResourceAttachmentIndexByUri(libraryTypesModule.toResourceUri(p3))
		
		if var8 == nil then
			return false
		end
		current.removeComposerResourceAttachmentAtIndex(var8)
		
		return true
	end, {})
	local isComposerSendBlocked = p1.isComposerSendBlocked or p1.isAssistantResponding and #p1.composerResourceAttachments > 0
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var3 (ref), var7 (ref), var6 (ref), var1 (ref), p2 (ref), p1 (ref)
		if var2 == nil or var2.token <= var3.current then return end
		var3.current = var2.token
		
		if var2.action == "Remove" then
			var7(var2.resource.path)
		else
			local replacePath = var2.replacePath
			
			if replacePath ~= nil and replacePath ~= var2.resource.path then
				var7(replacePath)
			end
			var6(var2.resource)
		end
		var1.consumeChatResourceRequest(var2.token)
		
		if p2 and var2.action == "Add" and (var2.focusComposer ~= false and p1.textBoxRef.current ~= nil) then
			p1.textBoxRef.current.focus()
		end
	end, {
		var1, var2, p2, var6, var7, p1.textBoxRef
	})
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), var6 (ref), var7 (ref), isComposerSendBlocked (ref), var4 (ref), var1 (ref)
		local t = {
			tracksExternalText = true,
			composerText = p1.composerText,
			composerErrorText = p1.composerErrorText,
			onComposerChanged = p1.setComposerText,
			images = p1.composerImages,
			onImagesChanged = p1.setComposerImages,
			onRetryImage = p1.retryComposerImage,
			resourceAttachments = p1.composerResourceAttachments,
			onAddResource = var6,
			onRemoveResourceAttachment = p1.removeComposerResourceAttachmentAtIndex,
			onRemoveResourceByPath = var7,
			isSendBlocked = isComposerSendBlocked,
			textBoxRef = p1.textBoxRef,
			isAssistantResponding = p1.isAssistantResponding,
			canStopAssistantResponse = p1.canStopAssistantResponse,
			canSendWhileResponding = p1.canSendWhileResponding,
			onSend = p1.sendMessage,
			onStop = p1.stopAssistantResponse
		}
		var4.current = t
		var1.setChatComposerState(t)
	end, {
		var1, p1.composerText, p1.composerErrorText, p1.setComposerText,
		p1.composerImages, p1.setComposerImages, p1.retryComposerImage,
		p1.composerResourceAttachments, var6,
		p1.removeComposerResourceAttachmentAtIndex, var7, isComposerSendBlocked,
		p1.textBoxRef, p1.isAssistantResponding, p1.canStopAssistantResponse,
		p1.canSendWhileResponding, p1.sendMessage, p1.stopAssistantResponse
	})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var4 (ref)
		return function()
			-- upvalues: var1 (copy), var4 (copy)
			if var1.getChatComposerState(false) == var4.current then
				var1.setChatComposerState(nil)
			end
		end
	end, { var1 })
	
	return isComposerSendBlocked
end