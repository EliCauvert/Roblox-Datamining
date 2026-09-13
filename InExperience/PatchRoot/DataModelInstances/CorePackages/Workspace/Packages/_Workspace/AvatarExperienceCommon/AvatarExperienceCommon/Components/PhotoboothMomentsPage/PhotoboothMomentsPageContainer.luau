local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local photoboothMomentsPageViewModule = require(script.Parent.PhotoboothMomentsPageView)
local usePhotoboothMomentsPageViewModelModule = require(script.Parent.usePhotoboothMomentsPageViewModel)

return function(p1)
	-- upvalues: usePhotoboothMomentsPageViewModelModule (ref), reactModule (ref), photoboothMomentsPageViewModule (ref)
	return reactModule.createElement(photoboothMomentsPageViewModule, usePhotoboothMomentsPageViewModelModule(p1))
end