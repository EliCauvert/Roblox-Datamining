local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagBuildExperienceConfirmStopModule = require(BuildExperience.Flags.FFlagBuildExperienceConfirmStop)
local StopAssistantResponseDialogModule = require(script.Parent.StopAssistantResponseDialog)
local IconButton = FoundationModule.IconButton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

local function constantSource(): number
	return 0
end

return function(Frame)
	-- upvalues: ReactModule (copy), constantSource (copy), SignalsReactModule (copy), FFlagBuildExperienceConfirmStopModule (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), StopAssistantResponseDialogModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(Callback: (any) -> ())
		-- upvalues: Frame (copy), constantSource (upval)
		if Frame.getIsComposerEmpty ~= nil then
			return Frame.getIsComposerEmpty(Callback)
		end
		if typeof(Callback) == "function" then
			Callback(constantSource)
		end
		return Frame.isComposerEmpty == true
	end, { Frame.getIsComposerEmpty, Frame.isComposerEmpty })))
	local IsNotCanSendWhileResponding: boolean = Frame.isAssistantResponding and (Frame.canStopAssistantResponse ~= false and Frame.canSendWhileResponding ~= true)
	local IsNotHasAttachments: boolean = not IsNotCanSendWhileResponding and (UseSignalStateResult and Frame.hasAttachments ~= true or Frame.isSendDisabled == true)
	local v1 = false
	local Callback = nil
	local UseResult = nil
	local UseResult1 = nil
	
	if FFlagBuildExperienceConfirmStopModule then
		local UseStateResult2 = nil
		v1, UseStateResult2 = ReactModule.useState(false)
		Callback = UseStateResult2
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (ref)
			UseStateResult2(false)
		end, {})
		UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (ref), Frame (copy)
			UseStateResult2(false)
			Frame.onStop()
		end, { Frame.onStop })
		ReactModule.useEffect(function()
			-- upvalues: IsNotCanSendWhileResponding (copy), UseStateResult2 (ref)
			if not IsNotCanSendWhileResponding then
				UseStateResult2(false)
			end
		end, { IsNotCanSendWhileResponding })
	end
	local Element = ReactModule.createElement(IconButton, {
		isCircular = true,
		LayoutOrder = Frame.LayoutOrder,
		icon = if IsNotCanSendWhileResponding then IconName.StopSmall else IconName.ArrowWideShortUp,
		size = InputSize.Small,
		variant = if IsNotCanSendWhileResponding then ButtonVariant.Standard elseif UseSignalStateResult and Frame.hasAttachments ~= true then ButtonVariant.Standard else ButtonVariant.Emphasis,
		isDisabled = IsNotHasAttachments,
		onActivated = function()
			-- upvalues: IsNotCanSendWhileResponding (copy), FFlagBuildExperienceConfirmStopModule (upval), Callback (ref), Frame (copy)
			if not IsNotCanSendWhileResponding then
				Frame.onSend()
				
				return
			end
			if FFlagBuildExperienceConfirmStopModule then
				Callback(true)
				
				return
			else
				Frame.onStop()
			end
		end
	})
	
	return if FFlagBuildExperienceConfirmStopModule then ReactModule.createElement(ReactModule.Fragment, nil, {
		Action = Element,
		StopDialog = if v1 and IsNotCanSendWhileResponding then ReactModule.createElement(StopAssistantResponseDialogModule, { onCancel = UseResult, onConfirm = UseResult1 }) else nil
	}) else Element
end