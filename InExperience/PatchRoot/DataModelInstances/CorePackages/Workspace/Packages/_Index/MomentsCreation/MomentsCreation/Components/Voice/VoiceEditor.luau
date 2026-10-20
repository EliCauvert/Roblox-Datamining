local ReactModule = require(script:FindFirstAncestor("MomentsCreation").Parent.React)
local VoiceEditorViewModule = require(script.Parent.VoiceEditorView)
local UseVoiceEditorViewModelModule = require(script.Parent.useVoiceEditorViewModel)

return function(p1)
	-- upvalues: UseVoiceEditorViewModelModule (copy), ReactModule (copy), VoiceEditorViewModule (copy)
	return ReactModule.createElement(VoiceEditorViewModule, (UseVoiceEditorViewModelModule(p1)))
end