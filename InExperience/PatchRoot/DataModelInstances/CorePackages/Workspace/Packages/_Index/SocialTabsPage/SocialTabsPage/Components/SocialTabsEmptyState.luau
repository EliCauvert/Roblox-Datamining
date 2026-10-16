local Parent = script:FindFirstAncestor("SocialTabsPage").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local Assets = FoundationCloudAssetsModule.Assets
FoundationCloudAssetsModule.preloadAsset("pictograms/collaborators")
local PictogramsCollaborators = Assets["pictograms/collaborators"] or {}

return function(p1) --[[ Line: 24 | Named "SocialTabsEmptyState" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy), PictogramsCollaborators (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, { tag = "col align-x-center align-y-center size-full" }, {
		EmptyContainer = ReactModule.createElement(View, { tag = "col align-x-center size-full-0 auto-y" }, {
			Illustration = ReactModule.createElement(Image, {
				LayoutOrder = 1,
				tag = "position-top-center anchor-top-center",
				Image = PictogramsCollaborators.assetId,
				imageStyle = UseTokensResult.Color.Content.Emphasis,
				ScaleType = Enum.ScaleType.Fit,
				Size = UDim2.new(0, 320 * UseTokensResult.Config.UI.Scale, 0, 180 * UseTokensResult.Config.UI.Scale)
			}),
			EmptyText = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium",
				Text = p1.text
			})
		})
	})
end