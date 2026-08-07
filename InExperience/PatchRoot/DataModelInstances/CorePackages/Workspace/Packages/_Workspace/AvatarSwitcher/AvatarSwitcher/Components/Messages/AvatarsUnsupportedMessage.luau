local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSignalState = require(parent.SignalsReact).useSignalState
local messageCardModule = require(avatarSwitcher.Components.Messages.MessageCard)
local experienceAvatarSupportTypeModule = require(avatarSwitcher.Enums.ExperienceAvatarSupportType)
local getAvatarSwitcherStoreModule = require(avatarSwitcher.Stores.getAvatarSwitcherStore)
local fFlagAvatarSwitcherUiFixes = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherUiFixes

return function(p0) --[[ line: 21 | named "AvatarsUnsupportedMessage" ]]
	-- upvalues: useSignalState (ref), getAvatarSwitcherStoreModule (ref), useLocalization (ref), fFlagAvatarSwitcherUiFixes (ref), experienceAvatarSupportTypeModule (ref), reactModule (ref), foundationModule (ref), messageCardModule (ref)
	local var6 = useLocalization(if fFlagAvatarSwitcherUiFixes then {
		messageHeader = "Feature.AvatarSwitcher.Heading.PresetAvatars"
	} else {
		messageHeader = "Feature.AvatarSwitcher.Heading.Unsupported",
		messageContent = "Feature.AvatarSwitcher.Message.Unsupported"
	})
	
	return if useSignalState(useSignalState(getAvatarSwitcherStoreModule).getExperienceAvatarSupportType) == experienceAvatarSupportTypeModule.NoSupport then reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = p0.LayoutOrder }, {
		WarningMessage = reactModule.createElement(messageCardModule, {
			icon = "Info",
			headerText = var6.messageHeader,
			contentText = if fFlagAvatarSwitcherUiFixes then nil else var6.messageContent,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		})
	}) else nil
end