local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local FFlagAXTallTilesForMakeupLooks = AvatarExperienceFlagsModule.FFlagAXTallTilesForMakeupLooks
local FFlagAXTallTilesForAdvancedBodiesWidget = AvatarExperienceFlagsModule.FFlagAXTallTilesForAdvancedBodiesWidget
local FFlagAXHeroWidget = AvatarExperienceFlagsModule.FFlagAXHeroWidget
local WidgetConstantsModule = {
	Templates = {
		ItemGroup = "ItemGroup",
		Carousel = "Carousel",
		Button = "Button",
		HeroUnit = if FFlagAXHeroWidget then "HeroUnit" else nil
	},
	Types = {
		ProfilePictureEditorWidget = "ProfilePictureEditorWidget",
		TrendingWidget = "TrendingWidget",
		NewToMarketplaceWidget = "NewToMarketplaceWidget",
		SearchToLooksWidget = "SearchToLooksWidget",
		SearchToAvatarLooksWidget = "SearchToAvatarLooksWidget",
		InExperienceShopWidget = "InExperienceShopWidget",
		SearchToCommunityLooksWidget = "SearchToCommunityLooksWidget",
		PersonalizedAvatarLooksWidget = "PersonalizedAvatarLooksWidget",
		SortsPersonalizedAvatarLooksWidget = "SortsPersonalizedAvatarLooksWidget",
		MySharedAvatarsWidget = "MySharedAvatarsWidget",
		OrganicContent = "OrganicContent",
		SearchLandingPageRecentlyViewedWidget = "SearchLandingPageRecentlyViewedWidget",
		MakeupLooksWidget = if FFlagAXTallTilesForMakeupLooks then "MakeupTabWidget" else nil,
		AdvancedBodiesWidget = if FFlagAXTallTilesForAdvancedBodiesWidget then "AdvancedBodiesWidget" else nil
	},
	ActionType = {
		IMPRESSION = 0,
		ITEM_CLICK = 1,
		WIDGET_CLICK = 2,
		PURCHASE_SUCCESS = 3,
		ITEM_DESELECTED = 4,
		PURCHASE_ATTEMPT = 5
	},
	ContentType = {
		Asset = "Asset",
		Bundle = "Bundle",
		Experience = "Experience",
		Look = "Look"
	}
}
WidgetConstantsModule.TypeToImageInfo = {
	[WidgetConstantsModule.Types.ProfilePictureEditorWidget] = {
		backgroundImageDark = "rbxasset://textures/AvatarEditorImages/AvatarEditor.png",
		backgroundImageLight = "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png",
		contentImageDark = "rbxasset://textures/ui/AvatarExperience/Profile_Picture_Group.png",
		contentImageLight = "rbxasset://textures/ui/AvatarExperience/Profile_Picture_Group_Light.png",
		rowScale = 0.7,
		widthHeightRatio = 1.91
	}
}
WidgetConstantsModule.ContextWidgets = {
	MySharedAvatars = {
		Title = "Feature.Avatar.Heading.MySharedAvatarsTitle",
		RequestId = "4e42a6c6-84d9-4a0c-863d-8c1c12158645",
		WidgetId = "MySharedAvatars:b813405f-6790-4c9e-b2b2-20a1fce10a67",
		Context = "MySharedAvatars",
		Tooltip = "Feature.Avatar.Label.MyPostedAvatars.Tooltip"
	},
	SearchLandingPageRecentlyViewedWidget = {
		RequestId = "f47ac10b-58cc-4372-a567-0e02b2c3d479",
		WidgetId = "SearchLandingPageRecentlyViewedWidget:e7d3a8b4-9c3b-4f6a-8b6e-1d2f3c4e5f6a",
		Context = "SearchLandingPageRecentlyViewedWidget"
	}
}
WidgetConstantsModule.WidgetExposureMetadata = if FFlagAXHeroWidget then AvatarExperienceCommonModule.Constants.IXP_WIDGET_LAYER_EXPOSURE else { AttributeKey = "IXP_LAYER", TagName = "WIDGET" }

return WidgetConstantsModule