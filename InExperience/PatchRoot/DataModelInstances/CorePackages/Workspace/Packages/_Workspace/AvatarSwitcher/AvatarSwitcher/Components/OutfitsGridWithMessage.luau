local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarsUnsupportedMessageModule = require(avatarSwitcher.Components.Messages.AvatarsUnsupportedMessage)
local pendingAvatarSwitchMessageModule = require(avatarSwitcher.Components.Messages.PendingAvatarSwitchMessage)
local outfitsGridContainerModule = require(avatarSwitcher.Components.OutfitsGrid.OutfitsGridContainer)

return function()
	-- upvalues: reactModule (ref), foundationModule (ref), avatarsUnsupportedMessageModule (ref), pendingAvatarSwitchMessageModule (ref), outfitsGridContainerModule (ref)
	return reactModule.createElement(foundationModule.View, { tag = "size-full-full col gap-large" }, {
		AvatarsUnsupportedMessage = reactModule.createElement(avatarsUnsupportedMessageModule, { LayoutOrder = 1 }),
		PendingAvatarSwitchMessage = reactModule.createElement(pendingAvatarSwitchMessageModule, { LayoutOrder = 2 }),
		GridContainer = reactModule.createElement(foundationModule.View, { tag = "size-full-0 grow", LayoutOrder = 3 }, {
			OutfitsGridContainer = reactModule.createElement(outfitsGridContainerModule)
		})
	})
end