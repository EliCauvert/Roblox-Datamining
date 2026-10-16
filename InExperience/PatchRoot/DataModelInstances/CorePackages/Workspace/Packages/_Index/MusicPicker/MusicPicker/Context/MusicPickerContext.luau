local MusicPicker = script:FindFirstAncestor("MusicPicker")
local _ = require(MusicPicker.Types.MusicPickerTypes)

return (require(MusicPicker.Parent.React).createContext({
	previewingId = nil,
	togglePreview = function() --[[ Line: 18 ]] end,
	savedIds = {},
	toggleSaved = function() --[[ Line: 20 ]] end
}))