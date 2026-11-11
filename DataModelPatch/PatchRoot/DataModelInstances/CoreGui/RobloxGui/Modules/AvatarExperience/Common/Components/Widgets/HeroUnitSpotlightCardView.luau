local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local BackgroundLayers = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).BackgroundLayersComponents.BackgroundLayers
local View = FoundationModule.View
local Button = FoundationModule.Button
local HeroUnitHeaderModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.Widgets.HeroUnitHeader)

local function HeroUnitSpotlightCardView(p1)
	-- upvalues: ReactModule (copy), View (copy), BackgroundLayers (copy), HeroUnitHeaderModule (copy), Button (copy)
	return ReactModule.createElement(View, {
		Size = UDim2.new(1, 0, 0, p1.cardHeight),
		onActivated = p1.onTryOn,
		tag = {
			["radius-large clip"] = true,
			["stroke-thick stroke-system-contrast"] = p1.isSelected
		},
		ref = p1.cardRef
	}, {
		Backgrounds = if p1.backgroundLayers and #p1.backgroundLayers > 0 then ReactModule.createElement(View, { ZIndex = 0, tag = "size-full radius-large clip" }, {
			Layers = ReactModule.createElement(BackgroundLayers, {
				ZIndex = 0,
				backgroundLayers = p1.backgroundLayers,
				cornerRadius = p1.cornerRadius,
				imageScaleType = Enum.ScaleType.Crop
			})
		}) else nil,
		ContentColumn = ReactModule.createElement(View, {
			ZIndex = 2,
			tag = `col align-x-left size-full {p1.cardPaddingTag}`
		}, {
			Header = ReactModule.createElement(HeroUnitHeaderModule, {
				centerTitleGroup = true,
				titleText = p1.titleText,
				titleTag = p1.titleTag,
				descriptionText = p1.descriptionText,
				descriptionTag = p1.descriptionTag,
				titleGroupGapTag = p1.titleGroupGapTag,
				priceInRobux = p1.priceInRobux,
				availableUntil = p1.availableUntil,
				bottomSlot = ReactModule.createElement(Button, {
					text = p1.detailsButtonText,
					size = p1.buttonSize,
					onActivated = p1.onOpenDetails
				})
			})
		})
	})
end

return if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixCatalogTileThumbnailFlash then ReactModule.memo(HeroUnitSpotlightCardView) else HeroUnitSpotlightCardView