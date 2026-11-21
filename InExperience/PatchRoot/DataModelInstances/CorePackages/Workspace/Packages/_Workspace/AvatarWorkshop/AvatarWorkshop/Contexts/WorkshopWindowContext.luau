return require(script:FindFirstAncestor("AvatarWorkshop").Parent.React).createContext({
	verticalLayout = false,
	respawnEnabled = false,
	onClose = function() end,
	respawn = function() end
})