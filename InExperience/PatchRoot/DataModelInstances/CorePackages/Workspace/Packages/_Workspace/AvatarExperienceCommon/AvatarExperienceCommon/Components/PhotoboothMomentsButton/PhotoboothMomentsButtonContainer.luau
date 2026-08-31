local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local photoboothMomentsButtonViewModule = require(script.Parent.PhotoboothMomentsButtonView)
local usePhotoboothMomentsButtonViewModelModule = require(script.Parent.usePhotoboothMomentsButtonViewModel)

return function(p1)
	-- upvalues: usePhotoboothMomentsButtonViewModelModule (ref), reactModule (ref), photoboothMomentsButtonViewModule (ref)
	return reactModule.createElement(photoboothMomentsButtonViewModule, usePhotoboothMomentsButtonViewModelModule(p1))
end