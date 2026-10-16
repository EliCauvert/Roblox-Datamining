local Parent = script:FindFirstAncestor("ShareSheet").Parent
local FoundationModule = require(Parent.Foundation)
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local ReactModule = require(Parent.React)
local Image = FoundationModule.Image
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Assets = FoundationCloudAssetsModule.Assets
FoundationCloudAssetsModule.preloadAsset("pictograms/find_people")
local PictogramsFindPeople = Assets["pictograms/find_people"] or {}

return function(p1) --[[ Line: 25 | Named "PeoplePickerEmptyState" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy), PictogramsFindPeople (copy)
	local UseTokensResult = UseTokensFunction()
	local TestId = p1.testId or "people-picker-empty-state"
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center size-full-0 auto-y padding-y-large",
		testId = TestId
	}, {
		Image = ReactModule.createElement(Image, {
			Image = PictogramsFindPeople.assetId,
			imageStyle = UseTokensResult.Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(320 * UseTokensResult.Config.UI.Scale, 180 * UseTokensResult.Config.UI.Scale),
			testId = `{TestId}--image`
		})
	})
end