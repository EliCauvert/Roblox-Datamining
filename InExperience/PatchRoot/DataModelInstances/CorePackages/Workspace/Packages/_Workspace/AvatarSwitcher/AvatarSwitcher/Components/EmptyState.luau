local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local collaborators = require(parent.FoundationCloudAssets).Assets["pictograms/collaborators"]

function EmptyState(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), foundationModule (ref), collaborators (ref)
	local var1 = useLocalization({
		noAvatars = "Feature.AvatarSwitcher.Message.NoAvatars",
		addAvatars = "Feature.AvatarSwitcher.Message.AddAvatars"
	})
	
	return reactModule.createElement(foundationModule.View, { tag = "size-full" }, {
		Header = p1.headerSlot,
		Content = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy position-center-center anchor-center-center col align-x-center"
		}, {
			Image = reactModule.createElement(foundationModule.Image, {
				LayoutOrder = 1,
				Image = collaborators.assetId,
				Size = UDim2.fromOffset(collaborators.size.X / 3, collaborators.size.Y / 3)
			}),
			Text = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-large padding-bottom-small",
				LayoutOrder = 2,
				Text = var1.noAvatars
			}),
			SubText = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-body-medium",
				LayoutOrder = 3,
				Text = var1.addAvatars
			})
		})
	})
end

return EmptyState