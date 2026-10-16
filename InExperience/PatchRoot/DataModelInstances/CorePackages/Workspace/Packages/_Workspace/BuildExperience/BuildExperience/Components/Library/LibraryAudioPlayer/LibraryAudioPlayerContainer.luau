local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local LibraryAudioPlayerViewModule = require(script.Parent.LibraryAudioPlayerView)
local UseLibraryAudioPlayerViewModelModule = require(script.Parent.useLibraryAudioPlayerViewModel)

return function(p1) --[[ Line: 6 | Named "LibraryAudioPlayerContainer" ]]
	-- upvalues: UseLibraryAudioPlayerViewModelModule (copy), ReactModule (copy), LibraryAudioPlayerViewModule (copy)
	return ReactModule.createElement(LibraryAudioPlayerViewModule, (UseLibraryAudioPlayerViewModelModule(p1)))
end