return {
	ExperienceStoreEventName = "experienceStoreProducts",
	StoreEnums = {
		LocationType = { Store = "STORE_PAGE", Edp = "EXPERIENCE_DETAILS_PAGE" },
		ActionType = {
			Impression = "IMPRESSION",
			ItemClick = "ITEM_CLICK",
			PurchaseAttemptClick = "PURCHASE_ATTEMPT_CLICK",
			SeeMoreClick = "SEE_MORE_CLICK"
		},
		ProductType = {
			GamePasses = "GAME_PASS",
			DeveloperProducts = "DEVELOPER_PRODUCTS",
			Subscriptions = "DEVELOPER_SUBSCRIPTIONS"
		}
	},
	ImpressionsTags = {
		GamePasses = "STORE_GAME_PASSES_IMPRESSIONS",
		DeveloperProducts = "STORE_DEVELOPER_PRODUCTS_IMPRESSIONS",
		Subscriptions = "STORE_SUBSCRIPTIONS_IMPRESSIONS",
		Preview = "STORE_PREVIEW_IMPRESSIONS"
	}
}