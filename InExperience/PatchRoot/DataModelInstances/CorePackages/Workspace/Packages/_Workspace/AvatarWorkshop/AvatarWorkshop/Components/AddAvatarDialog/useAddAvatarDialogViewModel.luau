local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSignalStateFunction = SignalsReactModule.useSignalState
local _ = require(AvatarWorkshop.Components.AvatarPreview.useAvatarPreviewViewModel)
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local GetAvatarStateStoreModule = require(AvatarWorkshop.Stores.Getters.getAvatarStateStore)
local _ = require(script.Parent.AddAvatarDialogView)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseSignalStateFunction (copy), GetAvatarStateStoreModule (copy), ReactModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.AvatarWorkshop.Heading.AddAvatar",
		body = "Feature.AvatarWorkshop.Description.AddAvatar",
		add = "Feature.Avatar.Label.Add",
		cancel = "Feature.Avatar.Action.Cancel",
		previewFailed = "Feature.Avatar.Message.FailedToLoadAvatar",
		tryAgain = "Feature.AvatarWorkshop.Action.TryAgain"
	})
	local UseSignalStateResult = UseSignalStateFunction(GetAvatarStateStoreModule)
	local UseSignalStateResult1 = UseSignalStateFunction(UseSignalStateResult.getAvatarState)
	local UseSignalStateResult2 = UseSignalStateFunction(UseSignalStateResult.getLoadCurrentAvatarFailed)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, {})
	local OnConfirmFunction = p1.onConfirm
	
	return {
		previewProps = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult1 (copy), UseResult (copy)
			return if UseSignalStateResult1 == nil then nil else {
				avatarState = UseSignalStateResult1,
				onBuildFailed = UseResult
			}
		end, { UseSignalStateResult1, UseResult }),
		hasLoadFailed = UseSignalStateResult1 == nil and UseSignalStateResult2,
		onRetryLoad = UseSignalStateResult.loadCurrentAvatar,
		hasPreviewFailed = UseSignalStateResult1 ~= nil and UseStateResult == UseSignalStateResult1,
		onRetryPreview = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end, {}),
		onConfirm = ReactModule.useCallback(function()
			-- upvalues: UseSignalStateResult1 (copy), OnConfirmFunction (copy)
			if UseSignalStateResult1 then
				OnConfirmFunction(UseSignalStateResult1)
			end
		end, { UseSignalStateResult1, OnConfirmFunction }),
		onCancel = p1.onCancel,
		titleText = UseLocalizationResult.title,
		bodyText = UseLocalizationResult.body,
		addText = UseLocalizationResult.add,
		cancelText = UseLocalizationResult.cancel,
		previewFailedText = UseLocalizationResult.previewFailed,
		tryAgainText = UseLocalizationResult.tryAgain
	}
end