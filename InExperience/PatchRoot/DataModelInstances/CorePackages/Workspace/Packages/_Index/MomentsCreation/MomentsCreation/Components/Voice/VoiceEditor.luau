local reactModule = require(script:FindFirstAncestor("MomentsCreation").Parent.React)
local voiceEditorViewModule = require(script.Parent.VoiceEditorView)
local useVoiceEditorViewModelModule = require(script.Parent.useVoiceEditorViewModel)

return function(p1)
	-- upvalues: useVoiceEditorViewModelModule (ref), reactModule (ref), voiceEditorViewModule (ref)
	return reactModule.createElement(voiceEditorViewModule, useVoiceEditorViewModelModule(p1))
end