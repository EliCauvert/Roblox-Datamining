local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSignalState = require(parent.SignalsReact).useSignalState
local messageCardModule = require(avatarSwitcher.Components.Messages.MessageCard)
local getAvatarSwitcherStoreModule = require(avatarSwitcher.Stores.getAvatarSwitcherStore)

return function(p0) --[[ line: 18 | named "PendingAvatarSwitchMessage" ]]
	-- upvalues: useSignalState (ref), getAvatarSwitcherStoreModule (ref), useLocalization (ref), reactModule (ref), foundationModule (ref), messageCardModule (ref)
	local var5 = useSignalState(getAvatarSwitcherStoreModule)
	local var6 = useSignalState(var5.getPendingAvatarName)
	local var7 = useLocalization({
		messageContent = "Feature.AvatarSwitcher.Message.SwitchingDeferred",
		messageHeader = {
			"Feature.AvatarSwitcher.Heading.AvatarSwitchedConfirmation",
			avatarName = var6
		}
	})
	
	return if var6 == nil then nil else reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y" }, {
		WarningMessage = reactModule.createElement(messageCardModule, {
			icon = "Info",
			headerText = var7.messageHeader,
			contentText = var7.messageContent,
			onClose = var5.clearPendingAvatarName,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p0.LayoutOrder
		})
	})
end