local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local reactModule = require(parent.React)
local image = foundationModule.Image
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local assets = foundationCloudAssetsModule.Assets
foundationCloudAssetsModule.preloadAsset("pictograms/find_people")
local findPeople = assets["pictograms/find_people"] or {}

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), image (ref), findPeople (ref)
	local var4 = useTokens()
	local testId = p0.testId or "SearchEmptyState"
	
	return reactModule.createElement(view, {
		tag = "col align-x-center align-y-center size-full",
		LayoutOrder = p0.LayoutOrder,
		testId = testId
	}, {
		Image = reactModule.createElement(image, {
			Image = findPeople.assetId,
			imageStyle = var4.Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(320 * var4.Config.UI.Scale, 180 * var4.Config.UI.Scale),
			testId = `{testId}.Image`
		})
	})
end