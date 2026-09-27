local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local libraryAudioPlayerViewModule = require(script.Parent.LibraryAudioPlayerView)
local useLibraryAudioPlayerViewModelModule = require(script.Parent.useLibraryAudioPlayerViewModel)

return function(p1)
	-- upvalues: useLibraryAudioPlayerViewModelModule (ref), reactModule (ref), libraryAudioPlayerViewModule (ref)
	return reactModule.createElement(libraryAudioPlayerViewModule, useLibraryAudioPlayerViewModelModule(p1))
end