local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")

return require(avatarSwitcher.Parent.Signals).createComputed(require(avatarSwitcher.Stores.createAvatarSwitcherStore))