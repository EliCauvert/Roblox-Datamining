local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local FFlagBuildExperienceGateSendDuringResponseModule = require(BuildExperience.Flags.FFlagBuildExperienceGateSendDuringResponse)
local FFlagBuildExperienceFTUXChipSendGuidanceModule = require(BuildExperience.Flags.FFlagBuildExperienceFTUXChipSendGuidance)
local StopAssistantResponseDialogModule = require(script.Parent.StopAssistantResponseDialog)
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

local function constantSource(): number
	return 0
end

return function(Frame)
	-- upvalues: ReactModule (copy), constantSource (copy), SignalsReactModule (copy), FFlagBuildExperienceModelPickerModule (copy), FFlagBuildExperienceGateSendDuringResponseModule (copy), FFlagBuildExperienceFTUXChipSendGuidanceModule (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), View (copy), StopAssistantResponseDialogModule (copy)
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
	local IsNotCanSendWhileResponding: boolean = Frame.canStopAssistantResponse ~= false and Frame.canSendWhileResponding ~= true
	local IsNotCanSendWhileResponding1: boolean = if Frame.isAssistantResponding then IsNotCanSendWhileResponding else FFlagBuildExperienceModelPickerModule and (Frame.canStopAssistantResponse == true and IsNotCanSendWhileResponding)
	local IsNotIsAssistantResponding: boolean = Frame.isAssistantResponding ~= true or Frame.canSendWhileResponding == true
	local NoIsNotIsAssistantResponding: boolean = not IsNotCanSendWhileResponding1 and (FFlagBuildExperienceGateSendDuringResponseModule and not IsNotIsAssistantResponding or (UseSignalStateResult and Frame.hasAttachments ~= true or (Frame.isSendDisabled == true or FFlagBuildExperienceFTUXChipSendGuidanceModule and Frame.isFtuxSendGated == true)))
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), Frame (copy)
		UseStateResult2(false)
		Frame.onStop()
	end, { Frame.onStop })
	ReactModule.useEffect(function()
		-- upvalues: IsNotCanSendWhileResponding1 (copy), UseStateResult2 (copy)
		if not IsNotCanSendWhileResponding1 then
			UseStateResult2(false)
		end
	end, { IsNotCanSendWhileResponding1 })
	local Element = ReactModule.createElement(IconButton, {
		isCircular = true,
		LayoutOrder = Frame.LayoutOrder,
		icon = if IsNotCanSendWhileResponding1 then IconName.StopSmall else IconName.ArrowWideShortUp,
		size = InputSize.Small,
		variant = if IsNotCanSendWhileResponding1 then ButtonVariant.Standard elseif FFlagBuildExperienceFTUXChipSendGuidanceModule and Frame.isFtuxSendGated == true then ButtonVariant.Standard elseif UseSignalStateResult and Frame.hasAttachments ~= true then ButtonVariant.Standard else ButtonVariant.Emphasis,
		isDisabled = NoIsNotIsAssistantResponding or IsNotCanSendWhileResponding1 and Frame.isStopDisabled == true,
		onActivated = function()
			-- upvalues: IsNotCanSendWhileResponding1 (copy), UseStateResult2 (copy), Frame (copy)
			if IsNotCanSendWhileResponding1 then
				UseStateResult2(true)
				
				return
			else
				Frame.onSend()
			end
		end
	})
	
	if FFlagBuildExperienceFTUXChipSendGuidanceModule and Frame.isFtuxSendGated == true and not IsNotCanSendWhileResponding1 then
		Element = ReactModule.createElement(View, {
			tag = "auto-xy radius-circle",
			testId = "ChatActionsRow.FtuxSend",
			onActivated = Frame.onSend,
			selection = { Selectable = true }
		}, { Button = Element })
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Action = Element,
		StopDialog = if UseStateResult and IsNotCanSendWhileResponding1 then ReactModule.createElement(StopAssistantResponseDialogModule, { onCancel = UseResult, onConfirm = UseResult1 }) else nil
	})
end