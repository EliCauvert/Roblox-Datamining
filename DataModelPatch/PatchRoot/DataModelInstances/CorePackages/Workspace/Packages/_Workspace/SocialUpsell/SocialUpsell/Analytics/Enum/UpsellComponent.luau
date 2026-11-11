return {
	Banner = "Banner",
	Modal = "Modal",
	PushNotifUI = "PushNotifUI",
	Carousel = if require(script:FindFirstAncestor("SocialUpsell").Parent.SharedFlags).FFlagLuaAppCarouselAmpUpsellSubtitleClickAnalytics then "Carousel" else nil
}