local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local ReactModule = require(Parent.React)
local Image = FoundationModule.Image
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Assets = FoundationCloudAssetsModule.Assets
FoundationCloudAssetsModule.preloadAsset("pictograms/find_people")
local PictogramsFindPeople = Assets["pictograms/find_people"] or {}

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy), PictogramsFindPeople (copy)
	local UseTokensResult = UseTokensFunction()
	local TestId = Frame.testId or "SearchEmptyState"
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center size-full",
		LayoutOrder = Frame.LayoutOrder,
		testId = TestId
	}, {
		Image = ReactModule.createElement(Image, {
			Image = PictogramsFindPeople.assetId,
			imageStyle = UseTokensResult.Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(320 * UseTokensResult.Config.UI.Scale, 180 * UseTokensResult.Config.UI.Scale),
			testId = `{TestId}.Image`
		})
	})
end