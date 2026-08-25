local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local chatActionsRowModule = require(script.Parent.ChatActionsRow)
local fFlagBuildExperienceFixChatComposerInitialSendStateModule = require(buildExperience.Flags.FFlagBuildExperienceFixChatComposerInitialSendState)
local var6 = if require(buildExperience.Flags.FFlagBuildExperienceUseCommonTextArea) then require(parent.AppBlox).Composer else require(buildExperience.FoundationFork.TextArea)
local useReleaseFocusOnDownSwipeModule = require(script.Parent.useReleaseFocusOnDownSwipe)
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize

local function _(p0)
	return string.gsub(p0, "^%s*(.-)%s*$", "%1")
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagBuildExperienceFixChatComposerInitialSendStateModule (ref), signalsModule (ref), useReleaseFocusOnDownSwipeModule (ref), var6 (ref), inputSize (ref), view (ref), chatActionsRowModule (ref)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useMemo(function()
		-- upvalues: fFlagBuildExperienceFixChatComposerInitialSendStateModule (copy), p1 (ref), signalsModule (copy)
		local var14
		if fFlagBuildExperienceFixChatComposerInitialSendStateModule then
			var14 = string.gsub(p1.text:getValue(), "^%s*(.-)%s*$", "%1") == ""
			var14 = nil
		else
			var14 = true
		end
		local var15, var16 = signalsModule.createSignal(var14)
		
		return { getIsComposerEmpty = var15, setIsComposerEmpty = var16 }
	end, { p1.text })
	local var10 = p1.isAssistantResponding and p1.canSendWhileResponding ~= true
	local var11 = p1.composerErrorText ~= nil
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), p1 (ref)
		var9.setIsComposerEmpty(string.gsub(p2, "^%s*(.-)%s*$", "%1") == "")
		p1.onChanged(p2)
	end, { p1.onChanged, var9 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var9 (ref)
		if p1.onSend() then
			var9.setIsComposerEmpty(true)
		end
	end, { p1.onSend, var9 })
	useReleaseFocusOnDownSwipeModule(var8, p1.textBoxRef)
	
	return reactModule.createElement(var6, {
		label = "",
		text = p1.text,
		onChanged = var12,
		hint = p1.composerErrorText,
		hasError = var11,
		placeholder = p1.placeholder or "",
		width = UDim.new(1, 0),
		size = inputSize.Large,
		maxLines = p1.maxLines or 5,
		isDisabled = var10,
		onReturnPressed = var13,
		textBoxRef = p1.textBoxRef,
		ref = var8,
		composerDebug = p1.composerDebug,
		LayoutOrder = p1.LayoutOrder,
		trailingElement = reactModule.createElement(view, { tag = "auto-xy padding-x-xsmall padding-y-small" }, {
			Actions = reactModule.createElement(chatActionsRowModule, {
				isAssistantResponding = p1.isAssistantResponding,
				canStopAssistantResponse = p1.canStopAssistantResponse,
				canSendWhileResponding = p1.canSendWhileResponding,
				getIsComposerEmpty = var9.getIsComposerEmpty,
				isSendDisabled = var11,
				onSend = var13,
				onStop = p1.onStop
			})
		})
	})
end