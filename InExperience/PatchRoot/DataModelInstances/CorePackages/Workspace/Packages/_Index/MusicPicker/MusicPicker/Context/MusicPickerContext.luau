local MusicPicker = script:FindFirstAncestor("MusicPicker")
local _ = require(MusicPicker.Types.MusicPickerTypes)

return (require(MusicPicker.Parent.React).createContext({
	previewingId = nil,
	togglePreview = function() end,
	savedIds = {},
	toggleSaved = function() end
}))