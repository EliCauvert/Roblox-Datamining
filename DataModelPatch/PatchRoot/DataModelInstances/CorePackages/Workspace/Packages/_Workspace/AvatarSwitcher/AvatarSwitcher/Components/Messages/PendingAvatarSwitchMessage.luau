local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local MessageCardModule = require(AvatarSwitcher.Components.Messages.MessageCard)
local GetAvatarSwitcherStoreModule = require(AvatarSwitcher.Stores.getAvatarSwitcherStore)

return function(Frame)
	-- upvalues: UseSignalStateFunction (copy), GetAvatarSwitcherStoreModule (copy), UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), MessageCardModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(GetAvatarSwitcherStoreModule)
	local UseSignalStateResult1 = UseSignalStateFunction(UseSignalStateResult.getPendingAvatarName)
	local UseLocalizationResult = UseLocalizationFunction({
		messageContent = "Feature.AvatarSwitcher.Message.SwitchingDeferred",
		messageHeader = {
			"Feature.AvatarSwitcher.Heading.AvatarSwitchedConfirmation",
			avatarName = UseSignalStateResult1
		}
	})
	
	return if UseSignalStateResult1 == nil then nil else ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y" }, {
		WarningMessage = ReactModule.createElement(MessageCardModule, {
			icon = "Info",
			headerText = UseLocalizationResult.messageHeader,
			contentText = UseLocalizationResult.messageContent,
			onClose = UseSignalStateResult.clearPendingAvatarName,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = Frame.LayoutOrder
		})
	})
end