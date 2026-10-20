local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local ScrollSectionModule = require(AvatarExperienceProfilePictureEditor.Components.ScrollSection)
local _ = require(AvatarExperienceProfilePictureEditor.Components.SectionTitle.SectionTitle)
local SectionHeaderModule = require(AvatarExperienceProfilePictureEditor.Components.SectionTitle.SectionHeader)
local AssetPickerGridModule = require(AvatarExperienceProfilePictureEditor.Components.AssetPicker.AssetPickerGrid)
local GetAssetPickerStatusModule = require(AvatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)

return function(p1)
	-- upvalues: ReactModule (copy), ScrollSectionModule (copy), View (copy), SectionHeaderModule (copy), AssetPickerGridModule (copy), GetAssetPickerStatusModule (copy)
	return ReactModule.createElement(ScrollSectionModule, {
		pinHeader = true,
		layoutOrder = p1.layoutOrder,
		useInternalScroll = p1.useInternalScroll,
		header = ReactModule.createElement(View, { tag = "auto-xy padding-x-xlarge" }, {
			Title = ReactModule.createElement(SectionHeaderModule, {
				title = p1.title,
				leadingIconName = p1.titleLeadingIconName,
				onBack = p1.onTitleBack
			})
		})
	}, {
		Grid = ReactModule.createElement(AssetPickerGridModule, {
			status = GetAssetPickerStatusModule(p1.gridProps.isLoading, p1.gridProps.hasError),
			onRetry = p1.gridProps.onRetry,
			bannerComponent = p1.gridProps.bannerComponent,
			items = p1.gridProps.items,
			selectedId = p1.gridProps.selectedId,
			onSelect = p1.gridProps.onSelect,
			onDetailsActivated = p1.gridProps.onDetailsActivated,
			tileSize = p1.gridProps.tileSize,
			containerWidth = p1.gridProps.containerWidth,
			layoutOrder = p1.gridProps.layoutOrder
		})
	})
end