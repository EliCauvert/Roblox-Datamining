local Parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local PictogramsCollaborators = require(Parent.FoundationCloudAssets).Assets["pictograms/collaborators"]

function EmptyState(p1) --[[ Line: 16 ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), PictogramsCollaborators (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		noAvatars = "Feature.AvatarSwitcher.Message.NoAvatars",
		addAvatars = "Feature.AvatarSwitcher.Message.AddAvatars"
	})
	
	return ReactModule.createElement(FoundationModule.View, { tag = "size-full" }, {
		Header = p1.headerSlot,
		Content = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy position-center-center anchor-center-center col align-x-center"
		}, {
			Image = ReactModule.createElement(FoundationModule.Image, {
				LayoutOrder = 1,
				Image = PictogramsCollaborators.assetId,
				Size = UDim2.fromOffset(PictogramsCollaborators.size.X / 3, PictogramsCollaborators.size.Y / 3)
			}),
			Text = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-title-large padding-bottom-small",
				LayoutOrder = 2,
				Text = UseLocalizationResult.noAvatars
			}),
			SubText = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-body-medium",
				LayoutOrder = 3,
				Text = UseLocalizationResult.addAvatars
			})
		})
	})
end

return EmptyState