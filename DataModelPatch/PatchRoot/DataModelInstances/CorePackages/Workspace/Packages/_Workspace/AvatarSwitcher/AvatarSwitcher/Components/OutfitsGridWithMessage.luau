local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AvatarsUnsupportedMessageModule = require(AvatarSwitcher.Components.Messages.AvatarsUnsupportedMessage)
local PendingAvatarSwitchMessageModule = require(AvatarSwitcher.Components.Messages.PendingAvatarSwitchMessage)
local OutfitsGridContainerModule = require(AvatarSwitcher.Components.OutfitsGrid.OutfitsGridContainer)

return function()
	-- upvalues: ReactModule (copy), FoundationModule (copy), AvatarsUnsupportedMessageModule (copy), PendingAvatarSwitchMessageModule (copy), OutfitsGridContainerModule (copy)
	return (ReactModule.createElement(FoundationModule.View, { tag = "size-full-full col gap-large" }, {
		AvatarsUnsupportedMessage = ReactModule.createElement(AvatarsUnsupportedMessageModule, { LayoutOrder = 1 }),
		PendingAvatarSwitchMessage = ReactModule.createElement(PendingAvatarSwitchMessageModule, { LayoutOrder = 2 }),
		GridContainer = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 grow", LayoutOrder = 3 }, {
			OutfitsGridContainer = ReactModule.createElement(OutfitsGridContainerModule)
		})
	}))
end