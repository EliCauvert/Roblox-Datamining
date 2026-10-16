local FFlagAXCatalogBackgroundsSupport = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceFlags).FFlagAXCatalogBackgroundsSupport
local ResolveWidgetListWindowSizeModule = require(script.Parent.Utils.resolveWidgetListWindowSize)
local _Vector2 = Vector2.new(game:DefineFastInt("AXLooksImageOffsetMultiplierX", 500) / 1000, game:DefineFastInt("AXLooksImageOffsetMultiplierY", 750) / 1000)
local AXLooksImageZoomRatio = game:DefineFastInt("AXLooksImageZoom", 1250) / 1000
local config = {
	MAX_TO_RENDER_PER_BATCH = 1,
	UPDATE_CELLS_BATCHING_PERIOD = 30,
	SCROLL_EVENT_THROTTLE = 0,
	WINDOW_SIZE = game:DefineFastInt("WidgetListWindowSize", 21),
	INITIAL_NUM_TO_RENDER = if game:DefineFastFlag("AXUseFIntForWidgetListInitialNumToRender", false) then game:DefineFastInt("WidgetListInitialNumToRender", 8) else 8
}

if game:DefineFastFlag("AXWidgetListWindowSizeByMemoryTier", false) then
	config.WINDOW_SIZE = ResolveWidgetListWindowSizeModule(config.WINDOW_SIZE)
end
local config1 = {
	[tostring(Enum.AssetType.TShirt.Value)] = "Feature.Avatar.Label.ClassicTShirts",
	[tostring(Enum.AssetType.Hat.Value)] = "Feature.Avatar.Label.Hat",
	[tostring(Enum.AssetType.HairAccessory.Value)] = "Feature.Avatar.Label.Hair",
	[tostring(Enum.AssetType.FaceAccessory.Value)] = "Feature.Avatar.Label.Face",
	[tostring(Enum.AssetType.NeckAccessory.Value)] = "Feature.Avatar.Label.Neck",
	[tostring(Enum.AssetType.ShoulderAccessory.Value)] = "Feature.Avatar.Label.Shoulder",
	[tostring(Enum.AssetType.FrontAccessory.Value)] = "Feature.Avatar.Label.Front",
	[tostring(Enum.AssetType.BackAccessory.Value)] = "Feature.Avatar.Label.Back",
	[tostring(Enum.AssetType.WaistAccessory.Value)] = "Feature.Avatar.Label.Waist",
	[tostring(Enum.AssetType.Shirt.Value)] = "Feature.Avatar.Label.ClassicShirts",
	[tostring(Enum.AssetType.Pants.Value)] = "Feature.Avatar.Label.ClassicPants",
	[tostring(Enum.AssetType.Gear.Value)] = "Feature.Avatar.Label.Gear",
	[tostring(Enum.AssetType.Head.Value)] = "Feature.Avatar.Label.Head",
	[tostring(Enum.AssetType.Face.Value)] = "Feature.Avatar.Label.Face",
	[tostring(Enum.AssetType.Torso.Value)] = "Feature.Avatar.Label.Torso",
	[tostring(Enum.AssetType.RightArm.Value)] = "Feature.Avatar.Label.RightArms",
	[tostring(Enum.AssetType.LeftArm.Value)] = "Feature.Avatar.Label.LeftArms",
	[tostring(Enum.AssetType.LeftLeg.Value)] = "Feature.Avatar.Label.LeftLegs",
	[tostring(Enum.AssetType.RightLeg.Value)] = "Feature.Avatar.Label.RightLegs",
	[tostring(Enum.AssetType.ClimbAnimation.Value)] = "Feature.Avatar.Label.Climb",
	[tostring(Enum.AssetType.FallAnimation.Value)] = "Feature.Avatar.Label.Fall",
	[tostring(Enum.AssetType.IdleAnimation.Value)] = "Feature.Avatar.Label.Idle",
	[tostring(Enum.AssetType.JumpAnimation.Value)] = "Feature.Avatar.Label.Jump",
	[tostring(Enum.AssetType.RunAnimation.Value)] = "Feature.Avatar.Label.Run",
	[tostring(Enum.AssetType.SwimAnimation.Value)] = "Feature.Avatar.Label.Swim",
	[tostring(Enum.AssetType.WalkAnimation.Value)] = "Feature.Avatar.Label.Walk",
	[tostring(Enum.AssetType.EmoteAnimation.Value)] = "Feature.Avatar.Label.Emote",
	[tostring(Enum.AssetType.TShirtAccessory.Value)] = "Feature.Avatar.Label.TShirt",
	[tostring(Enum.AssetType.ShirtAccessory.Value)] = "Feature.Avatar.Label.Shirt",
	[tostring(Enum.AssetType.PantsAccessory.Value)] = "Feature.Avatar.Label.Pants",
	[tostring(Enum.AssetType.JacketAccessory.Value)] = "Feature.Avatar.Label.Jacket",
	[tostring(Enum.AssetType.SweaterAccessory.Value)] = "Feature.Avatar.Label.Sweater",
	[tostring(Enum.AssetType.ShortsAccessory.Value)] = "Feature.Avatar.Label.Shorts",
	[tostring(Enum.AssetType.LeftShoeAccessory.Value)] = "Feature.Avatar.Label.LeftShoe",
	[tostring(Enum.AssetType.RightShoeAccessory.Value)] = "Feature.Avatar.Label.RightShoe",
	[tostring(Enum.AssetType.DressSkirtAccessory.Value)] = "Feature.Avatar.Label.DressesAndSkirts",
	[tostring(Enum.AssetType.EyelashAccessory.Value)] = "Feature.Catalog.Label.Eyelash",
	[tostring(Enum.AssetType.EyebrowAccessory.Value)] = "Feature.Catalog.Label.Eyebrow",
	[tostring(Enum.AssetType.EyeMakeup.Value)] = "Feature.Catalog.Label.EyeMakeup",
	[tostring(Enum.AssetType.LipMakeup.Value)] = "Feature.Catalog.Label.LipMakeup",
	[tostring(Enum.AssetType.FaceMakeup.Value)] = "Feature.Catalog.Label.FaceMakeup",
	[tostring(Enum.AssetType.MoodAnimation.Value)] = "Feature.Avatar.Label.Mood",
	[tostring(Enum.AssetType.DynamicHead.Value)] = "Feature.Avatar.Label.DynamicHead"
}

if FFlagAXCatalogBackgroundsSupport then
	config1[tostring(Enum.AssetType.AvatarBackground.Value)] = "Feature.Avatar.Label.Backgrounds"
end
return {
	CATALOG_RESULTS_HORIZONTAL_MARGIN = 15,
	WIDGET_COLUMN_PADDING = 10,
	COUNTERS = {
		TimeoutStatusPromptShown = "TimeoutStatusPromptShown",
		ItemsUnavailablePromptShown = "ItemsUnavailablePromptShown",
		FetchFaeFeatureAccessError = "FetchFaeFeatureAccessError",
		MarketplaceBreakpointMeasured = "MarketplaceBreakpointMeasured",
		LookImpressionMissingLookType = "LookImpressionMissingLookType",
		CatalogPageSecondVariantFetched = "CatalogPageSecondVariantFetched",
		CatalogOffersBanner = {
			fetchSucceeded = "CatalogOffersBannerFetchSucceeded",
			fetchFailed = "CatalogOffersBannerFetchFailed"
		}
	},
	LOOKS_IMAGE_OFFSET_MULTIPLIERS = _Vector2,
	LOOKS_IMAGE_ZOOM = AXLooksImageZoomRatio,
	ASSET_TYPE_LOCALIZED = config1,
	BUNDLE_TYPE_LOCALIZED = {
		[tostring(Enum.BundleType.BodyParts.Value)] = "Feature.Catalog.Label.Body",
		[tostring(Enum.BundleType.Animations.Value)] = "Feature.Catalog.Label.Animation",
		[tostring(Enum.BundleType.Shoes.Value)] = "Feature.Avatar.Label.Shoes",
		[tostring(Enum.BundleType.DynamicHead.Value)] = "Feature.Catalog.Label.DynamicHeads"
	},
	FLATLIST_CONFIGS = config,
	OFFERS_LOCALIZED = {
		OfferApplied = "Feature.Catalog.Label.OfferApplied",
		OfferAppliedTooltip = "Feature.Catalog.Text.OfferAppliedToHighestItem"
	}
}