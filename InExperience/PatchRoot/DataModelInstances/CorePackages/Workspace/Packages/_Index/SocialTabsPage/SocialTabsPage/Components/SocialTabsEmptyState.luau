local parent = script:FindFirstAncestor("SocialTabsPage").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local image = foundationModule.Image
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local assets = foundationCloudAssetsModule.Assets
foundationCloudAssetsModule.preloadAsset("pictograms/collaborators")
local collaborators = assets["pictograms/collaborators"] or {}

return function(value)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), image (ref), collaborators (ref), text (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, { tag = "col align-x-center align-y-center size-full" }, {
		EmptyContainer = reactModule.createElement(view, { tag = "col align-x-center size-full-0 auto-y" }, {
			Illustration = reactModule.createElement(image, {
				LayoutOrder = 1,
				tag = "position-top-center anchor-top-center",
				Image = collaborators.assetId,
				imageStyle = var1.Color.Content.Emphasis,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.new(0, 320 * var1.Config.UI.Scale, 0, 180 * var1.Config.UI.Scale)
			}),
			EmptyText = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium",
				Text = value.text
			})
		})
	})
end