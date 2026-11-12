local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local GalleryButtonContentViewModule = require(script.Parent.GalleryButtonContentView)
local _ = require(Parent.Types)
local UseGalleryButtonContentViewModelModule = require(script.Parent.useGalleryButtonContentViewModel)

return ReactModule.memo(function(p1)
	-- upvalues: UseGalleryButtonContentViewModelModule (copy), ReactModule (copy), GalleryButtonContentViewModule (copy)
	return ReactModule.createElement(GalleryButtonContentViewModule, (UseGalleryButtonContentViewModelModule(p1.latestCapture)))
end)