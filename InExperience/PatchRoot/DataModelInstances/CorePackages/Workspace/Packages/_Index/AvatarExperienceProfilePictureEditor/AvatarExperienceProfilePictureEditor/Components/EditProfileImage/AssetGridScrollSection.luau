local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local scrollSectionModule = require(avatarExperienceProfilePictureEditor.Components.ScrollSection)
local _ = require(avatarExperienceProfilePictureEditor.Components.SectionTitle.SectionTitle)
local sectionHeaderModule = require(avatarExperienceProfilePictureEditor.Components.SectionTitle.SectionHeader)
local assetPickerGridModule = require(avatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerGrid)
local getAssetPickerStatusModule = require(avatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)

return function(value)
	-- upvalues: reactModule (ref), scrollSectionModule (ref), view (ref), sectionHeaderModule (ref), assetPickerGridModule (ref), getAssetPickerStatusModule (ref)
	return reactModule.createElement(scrollSectionModule, {
		pinHeader = true,
		layoutOrder = value.layoutOrder,
		useInternalScroll = value.useInternalScroll,
		header = reactModule.createElement(view, { tag = "auto-xy padding-x-xlarge" }, {
			Title = reactModule.createElement(sectionHeaderModule, {
				title = value.title,
				leadingIconName = value.titleLeadingIconName,
				onBack = value.onTitleBack
			})
		})
	}, {
		Grid = reactModule.createElement(assetPickerGridModule, {
			status = getAssetPickerStatusModule(value.gridProps.isLoading, value.gridProps.hasError),
			onRetry = value.gridProps.onRetry,
			bannerComponent = value.gridProps.bannerComponent,
			items = value.gridProps.items,
			selectedId = value.gridProps.selectedId,
			onSelect = value.gridProps.onSelect,
			onDetailsActivated = value.gridProps.onDetailsActivated,
			tileSize = value.gridProps.tileSize,
			containerWidth = value.gridProps.containerWidth,
			layoutOrder = value.gridProps.layoutOrder
		})
	})
end