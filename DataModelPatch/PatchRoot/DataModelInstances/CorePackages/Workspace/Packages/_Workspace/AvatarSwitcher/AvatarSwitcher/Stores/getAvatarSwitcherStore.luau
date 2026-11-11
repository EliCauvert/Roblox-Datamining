local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")

return require(AvatarSwitcher.Parent.Signals).createComputed((require(AvatarSwitcher.Stores.createAvatarSwitcherStore)))