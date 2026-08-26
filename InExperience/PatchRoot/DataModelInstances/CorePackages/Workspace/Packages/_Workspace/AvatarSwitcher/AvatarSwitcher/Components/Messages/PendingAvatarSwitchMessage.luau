local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSignalState = require(parent.SignalsReact).useSignalState
local messageCardModule = require(avatarSwitcher.Components.Messages.MessageCard)
local getAvatarSwitcherStoreModule = require(avatarSwitcher.Stores.getAvatarSwitcherStore)

return function(p1)
	-- upvalues: useSignalState (ref), getAvatarSwitcherStoreModule (ref), useLocalization (ref), reactModule (ref), foundationModule (ref), messageCardModule (ref)
	local var1 = useSignalState(getAvatarSwitcherStoreModule)
	local var2 = useSignalState(var1.getPendingAvatarName)
	local var3 = useLocalization({
		messageContent = "Feature.AvatarSwitcher.Message.SwitchingDeferred",
		messageHeader = {
			"Feature.AvatarSwitcher.Heading.AvatarSwitchedConfirmation",
			avatarName = var2
		}
	})
	
	return if var2 == nil then nil else reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y" }, {
		WarningMessage = reactModule.createElement(messageCardModule, {
			icon = "Info",
			headerText = var3.messageHeader,
			contentText = var3.messageContent,
			onClose = var1.clearPendingAvatarName,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.LayoutOrder
		})
	})
end