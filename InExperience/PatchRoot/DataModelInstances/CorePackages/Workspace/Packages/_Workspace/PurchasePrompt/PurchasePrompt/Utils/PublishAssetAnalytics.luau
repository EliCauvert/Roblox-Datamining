local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local t = {
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

local function _(p1, p2, p3)
	-- upvalues: rbxAnalyticsService (ref)
	rbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", { section = p1, action = p2, element = p3 })
end

function t.sendPageLoad(p1)
	-- upvalues: t (ref), rbxAnalyticsService (ref)
	rbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", { element = nil, section = p1, action = t.Action.PageLoad })
end

function t.sendFieldTouched(p1, p2)
	-- upvalues: t (ref), rbxAnalyticsService (ref)
	rbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = p1,
		action = t.Action.FieldTouched,
		element = p2
	})
end

function t.sendButtonClicked(p1, p2)
	-- upvalues: t (ref), rbxAnalyticsService (ref)
	rbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = p1,
		action = t.Action.ButtonClicked,
		element = p2
	})
end

return t