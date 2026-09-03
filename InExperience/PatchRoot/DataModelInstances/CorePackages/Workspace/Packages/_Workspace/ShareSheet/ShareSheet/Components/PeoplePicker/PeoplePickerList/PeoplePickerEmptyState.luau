local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local reactModule = require(parent.React)
local image = foundationModule.Image
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local assets = foundationCloudAssetsModule.Assets
foundationCloudAssetsModule.preloadAsset("pictograms/find_people")
local findPeople = assets["pictograms/find_people"] or {}

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), image (ref), findPeople (ref)
	local var1 = useTokens()
	local testId = p1.testId or "people-picker-empty-state"
	
	return reactModule.createElement(view, {
		tag = "col align-x-center size-full-0 auto-y padding-y-large",
		LayoutOrder = p1.LayoutOrder,
		testId = testId
	}, {
		Image = reactModule.createElement(image, {
			Image = findPeople.assetId,
			imageStyle = var1.Color.Content.Emphasis,
			ScaleType = Enum.ScaleType.Fit,
			Size = UDim2.fromOffset(320 * var1.Config.UI.Scale, 180 * var1.Config.UI.Scale),
			testId = `{testId}--image`
		})
	})
end