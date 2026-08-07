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

local function _(p0, p1, p2) --[[ line: 26 | named "sendEvent" ]]
	-- upvalues: rbxAnalyticsService (ref)
	rbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", { section = p0, action = p1, element = p2 })
end

function t.sendPageLoad(p3) --[[ line: 34 ]]
	-- upvalues: t (ref), rbxAnalyticsService (ref)
	rbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", { element = nil, section = p3, action = t.Action.PageLoad })
end

function t.sendFieldTouched(p4, p5) --[[ line: 38 ]]
	-- upvalues: t (ref), rbxAnalyticsService (ref)
	rbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = p4,
		action = t.Action.FieldTouched,
		element = p5
	})
end

function t.sendButtonClicked(p6, p7) --[[ line: 42 ]]
	-- upvalues: t (ref), rbxAnalyticsService (ref)
	rbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = p6,
		action = t.Action.ButtonClicked,
		element = p7
	})
end

return t