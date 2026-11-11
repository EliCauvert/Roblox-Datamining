local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local MessageCardModule = require(AvatarSwitcher.Components.Messages.MessageCard)
local ExperienceAvatarSupportTypeModule = require(AvatarSwitcher.Enums.ExperienceAvatarSupportType)
local GetAvatarSwitcherStoreModule = require(AvatarSwitcher.Stores.getAvatarSwitcherStore)
local FFlagAvatarSwitcherUiFixes = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherUiFixes

return function(Frame)
	-- upvalues: UseSignalStateFunction (copy), GetAvatarSwitcherStoreModule (copy), UseLocalizationFunction (copy), FFlagAvatarSwitcherUiFixes (copy), ExperienceAvatarSupportTypeModule (copy), ReactModule (copy), FoundationModule (copy), MessageCardModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(UseSignalStateFunction(GetAvatarSwitcherStoreModule).getExperienceAvatarSupportType)
	local UseLocalizationResult = UseLocalizationFunction(if FFlagAvatarSwitcherUiFixes then {
		messageHeader = "Feature.AvatarSwitcher.Heading.PresetAvatars"
	} else {
		messageHeader = "Feature.AvatarSwitcher.Heading.Unsupported",
		messageContent = "Feature.AvatarSwitcher.Message.Unsupported"
	})
	
	return if UseSignalStateResult == ExperienceAvatarSupportTypeModule.NoSupport then ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		WarningMessage = ReactModule.createElement(MessageCardModule, {
			icon = "Info",
			headerText = UseLocalizationResult.messageHeader,
			contentText = if FFlagAvatarSwitcherUiFixes then nil else UseLocalizationResult.messageContent,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		})
	}) else nil
end