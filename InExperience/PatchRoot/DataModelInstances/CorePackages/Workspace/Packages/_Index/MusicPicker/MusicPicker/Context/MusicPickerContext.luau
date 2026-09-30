local musicPicker = script:FindFirstAncestor("MusicPicker")
local _ = require(musicPicker.Types.MusicPickerTypes)

return require(musicPicker.Parent.React).createContext({
	previewingId = nil,
	togglePreview = function() end,
	savedIds = {},
	toggleSaved = function() end
})