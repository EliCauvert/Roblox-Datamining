local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local fFlagBuildExperienceConfirmStopModule = require(buildExperience.Flags.FFlagBuildExperienceConfirmStop)
local stopAssistantResponseDialogModule = require(script.Parent.StopAssistantResponseDialog)
local iconButton = foundationModule.IconButton
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

local function constantSource()
	return 0
end

return function(p1)
	-- upvalues: reactModule (ref), constantSource (ref), signalsReactModule (ref), fFlagBuildExperienceConfirmStopModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), stopAssistantResponseDialogModule (ref)
	local var1 = signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), constantSource (copy)
		if p1.getIsComposerEmpty ~= nil then
			return p1.getIsComposerEmpty(p2)
		elseif typeof(p2) == "function" then
			p2(constantSource)
		end
		return p1.isComposerEmpty == true
	end, { p1.getIsComposerEmpty, p1.isComposerEmpty }))
	local var2 = p1.isAssistantResponding and (p1.canStopAssistantResponse ~= false and p1.canSendWhileResponding ~= true)
	local var3 = not var2
	
	if var3 and var1 then
		var3 = if p1.hasAttachments == true then p1.isSendDisabled == true else true
	end
	local var4
	local var5 = false
	local var6 = nil
	local var7 = nil
	local var8 = nil
	
	if fFlagBuildExperienceConfirmStopModule then
		local _ = nil
		local var9, var10 = reactModule.useState(false)
		var5 = var9
		var4 = var10
		var6 = var4
		var7 = reactModule.useCallback(function()
			-- upvalues: var4 (write)
			var4(false)
		end, {})
		var8 = reactModule.useCallback(function()
			-- upvalues: var4 (write), p1 (ref)
			var4(false)
			p1.onStop()
		end, { p1.onStop })
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), var4 (write)
			if not var2 then
				var4(false)
			end
		end, { var2 })
	end
	var4 = reactModule.createElement
	var4 = var4(iconButton, {
		isCircular = true,
		LayoutOrder = p1.LayoutOrder,
		icon = if var2 then iconName.StopSmall else iconName.ArrowWideShortUp,
		size = inputSize.Small,
		variant = if var2 then buttonVariant.Standard elseif var1 and p1.hasAttachments ~= true then buttonVariant.Standard else buttonVariant.Emphasis,
		isDisabled = var3,
		onActivated = function()
			-- upvalues: var2 (ref), fFlagBuildExperienceConfirmStopModule (copy), var6 (write), p1 (ref)
			if not var2 then
				p1.onSend()
				
				return
			elseif fFlagBuildExperienceConfirmStopModule then
				var6(true)
				
				return
			end
			p1.onStop()
		end
	})
	
	return if fFlagBuildExperienceConfirmStopModule then reactModule.createElement(reactModule.Fragment, nil, {
		Action = var4,
		StopDialog = if var5 and var2 then reactModule.createElement(stopAssistantResponseDialogModule, { onCancel = var7, onConfirm = var8 }) else nil
	}) else var4
end