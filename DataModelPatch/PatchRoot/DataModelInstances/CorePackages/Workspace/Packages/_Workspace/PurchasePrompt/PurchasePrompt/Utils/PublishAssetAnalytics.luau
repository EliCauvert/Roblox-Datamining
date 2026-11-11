local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local PublishAssetAnalyticsModule = {
	Section = {
		BuyCreationPage = "buy_creation_page",
		BuyItemModal = "buy_item_modal",
		ProcessCompleteModal = "process_complete_modal"
	},
	Action = {
		FieldTouched = "field_touched",
		ButtonClicked = "button_clicked",
		PageLoad = "page_load"
	},
	Element = {
		Name = "name",
		Description = "description",
		X = "x",
		Expand = "expand",
		Buy = "buy",
		Cancel = "cancel"
	}
}

local function _(Section, Action, Element)
	-- upvalues: RbxAnalyticsService (copy)
	RbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", { section = Section, action = Action, element = Element })
end

function PublishAssetAnalyticsModule.sendPageLoad(Section)
	-- upvalues: PublishAssetAnalyticsModule (copy), RbxAnalyticsService (copy)
	RbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		element = nil,
		section = Section,
		action = PublishAssetAnalyticsModule.Action.PageLoad
	})
end

function PublishAssetAnalyticsModule.sendFieldTouched(Section, Element)
	-- upvalues: PublishAssetAnalyticsModule (copy), RbxAnalyticsService (copy)
	RbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = Section,
		action = PublishAssetAnalyticsModule.Action.FieldTouched,
		element = Element
	})
end

function PublishAssetAnalyticsModule.sendButtonClicked(Section, Element)
	-- upvalues: PublishAssetAnalyticsModule (copy), RbxAnalyticsService (copy)
	RbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = Section,
		action = PublishAssetAnalyticsModule.Action.ButtonClicked,
		element = Element
	})
end

return PublishAssetAnalyticsModule