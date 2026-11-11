local Parent = script.Parent

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	ProfilePictureParams = require(Parent.ProfilePictureParams),
	PeekabooLayoutDetails = require(Parent.PeekabooLayoutDetails),
	CameraSliders = require(Parent.CameraSliders),
	FinalPageViewMode = require(Parent.FinalPageViewMode)
})