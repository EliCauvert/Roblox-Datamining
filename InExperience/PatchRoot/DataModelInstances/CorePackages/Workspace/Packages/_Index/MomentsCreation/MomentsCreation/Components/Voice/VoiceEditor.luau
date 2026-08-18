local reactModule = require(script:FindFirstAncestor("MomentsCreation").Parent.React)
local voiceEditorViewModule = require(script.Parent.VoiceEditorView)
local useVoiceEditorViewModelModule = require(script.Parent.useVoiceEditorViewModel)

return function(p0) --[[ line: 16 | named "VoiceEditor" ]]
	-- upvalues: useVoiceEditorViewModelModule (ref), reactModule (ref), voiceEditorViewModule (ref)
	return reactModule.createElement(voiceEditorViewModule, useVoiceEditorViewModelModule(p0))
end