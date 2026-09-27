local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildExperienceLibrary = require(parent.SharedFlags).FFlagBuildExperienceLibrary
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local fFlagComposerControlAlignment = require(parent.SharedFlags).FFlagComposerControlAlignment
local _ = require(buildExperience.Chat.chatTypes)
local chatActionsRowModule = require(script.Parent.ChatActionsRow)
local fFlagBuildExperienceFixChatComposerInitialSendStateModule = require(buildExperience.Flags.FFlagBuildExperienceFixChatComposerInitialSendState)
local var1 = if require(buildExperience.Flags.FFlagBuildExperienceUseCommonTextArea) then require(parent.AppBlox).Composer else require(buildExperience.FoundationFork.TextArea)
local useReleaseFocusOnDownSwipeModule = require(script.Parent.useReleaseFocusOnDownSwipe)
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local useTokens = foundationModule.Hooks.useTokens

local function _(p1)
	return string.gsub(p1, "^%s*(.-)%s*$", "%1")
end

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), fFlagBuildExperienceFixChatComposerInitialSendStateModule (ref), signalsModule (ref), fFlagBuildExperienceLibrary (ref), useReleaseFocusOnDownSwipeModule (ref), var1 (ref), inputSize (ref), view (ref), iconButton (ref), iconName (ref), buttonVariant (ref), fFlagComposerControlAlignment (ref), chatActionsRowModule (ref)
	local var2 = useTokens()
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useMemo(function()
		-- upvalues: fFlagBuildExperienceFixChatComposerInitialSendStateModule (copy), p1 (ref), signalsModule (copy)
		local var5
		if fFlagBuildExperienceFixChatComposerInitialSendStateModule then
			var5 = string.gsub(p1.text:getValue(), "^%s*(.-)%s*$", "%1") == ""
			var5 = nil
		else
			var5 = true
		end
		local var6, var7 = signalsModule.createSignal(var5)
		
		return { getIsComposerEmpty = var6, setIsComposerEmpty = var7 }
	end, { p1.text })
	local var5 = p1.isAssistantResponding and p1.canSendWhileResponding ~= true
	local var6 = false
	
	if fFlagBuildExperienceLibrary and p1.allowsTypingWhileResponding == true then
		var6 = var5
		var5 = false
	end
	local var7 = p1.composerErrorText ~= nil
	local var8 = p1.images ~= nil and #p1.images > 0
	local var9 = p1.isAttachmentSupported and p1.onOpenCaptureGallery ~= nil
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), p1 (ref)
		var4.setIsComposerEmpty(string.gsub(p2, "^%s*(.-)%s*$", "%1") == "")
		p1.onChanged(p2)
	end, { p1.onChanged, var4 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var6 (write), p1 (ref), var4 (ref)
		if var6 then return end
		if p1.onSend() then
			var4.setIsComposerEmpty(true)
		end
	end, { p1.onSend, var4, var6 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.textBoxRef ~= nil and p1.textBoxRef.current ~= nil then
			p1.textBoxRef.current.releaseFocus()
		end
		if p1.onOpenCaptureGallery ~= nil then
			p1.onOpenCaptureGallery()
		end
	end, { p1.textBoxRef, p1.onOpenCaptureGallery })
	
	if fFlagBuildExperienceLibrary then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var4 (ref), reactModule (copy)
			if p1.tracksExternalText then
				local var13 = reactModule.__subscribeToBinding(p1.text, function(p2)
					-- upvalues: var4 (copy)
					var4.setIsComposerEmpty(string.gsub(p2, "^%s*(.-)%s*$", "%1") == "")
				end)
				var4.setIsComposerEmpty(string.gsub(p1.text:getValue(), "^%s*(.-)%s*$", "%1") == "")
				
				return var13
			end
			return nil
		end, { p1.tracksExternalText, p1.text, var4 })
	end
	useReleaseFocusOnDownSwipeModule(var3, p1.textBoxRef)
	
	return reactModule.createElement(var1, {
		label = "",
		text = p1.text,
		onChanged = var10,
		hint = p1.composerErrorText,
		hasError = var7,
		placeholder = p1.placeholder or "",
		width = UDim.new(1, 0),
		size = inputSize.Large,
		maxLines = p1.maxLines or 5,
		isDisabled = var5,
		onReturnPressed = var11,
		textBoxRef = p1.textBoxRef,
		ref = var3,
		composerDebug = p1.composerDebug,
		LayoutOrder = p1.LayoutOrder,
		leadingElement = if var9 then reactModule.createElement(view, {
			tag = "auto-xy",
			padding = {
				top = UDim.new(0, var2.Size.Size_200),
				bottom = UDim.new(0, var2.Size.Size_200 - 1),
				left = UDim.new(0, var2.Size.Size_100),
				right = UDim.new(0, 0)
			}
		}, {
			Attach = reactModule.createElement(iconButton, {
				isCircular = true,
				testId = "ChatComposer.AttachImage",
				icon = iconName.PlusSmall,
				isDisabled = p1.isAssistantResponding,
				onActivated = var12,
				size = inputSize.Small,
				variant = buttonVariant.Standard
			})
		}) else nil,
		trailingElement = reactModule.createElement(view, {
			padding = if fFlagComposerControlAlignment then {
				top = UDim.new(0, var2.Size.Size_200),
				bottom = UDim.new(0, var2.Size.Size_200 - 1),
				left = UDim.new(0, 0),
				right = UDim.new(0, var2.Size.Size_100)
			} else nil,
			tag = {
				["auto-xy"] = fFlagComposerControlAlignment,
				["auto-xy padding-x-xsmall padding-y-small"] = not fFlagComposerControlAlignment
			}
		}, {
			Actions = reactModule.createElement(chatActionsRowModule, {
				isAssistantResponding = p1.isAssistantResponding,
				canStopAssistantResponse = p1.canStopAssistantResponse,
				canSendWhileResponding = p1.canSendWhileResponding,
				getIsComposerEmpty = var4.getIsComposerEmpty,
				hasAttachments = var8,
				isSendDisabled = var7 or p1.isSendBlocked == true,
				onSend = var11,
				onStop = p1.onStop
			})
		})
	})
end