local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local t = {
	ItemType = { Asset = "Asset", Outfit = "Outfit" },
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
local var1 = nil
local var2 = nil

local function _(p1, p2, p3)
	-- upvalues: rbxAnalyticsService (ref), var1 (write), var2 (write)
	rbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = p1,
		action = p2,
		element = p3,
		itemType = var1,
		itemSubType = var2
	})
end

function t.setItemDetails(value, p1)
	-- upvalues: var1 (write), var2 (write)
	var1 = value
	var2 = p1
end

function t.sendPageLoad(p1)
	-- upvalues: t (ref), rbxAnalyticsService (ref), var1 (write), var2 (write)
	rbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		element = nil,
		section = p1,
		action = t.Action.PageLoad,
		itemType = var1,
		itemSubType = var2
	})
end

function t.sendFieldTouched(p1, p2)
	-- upvalues: t (ref), rbxAnalyticsService (ref), var1 (write), var2 (write)
	rbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = p1,
		action = t.Action.FieldTouched,
		element = p2,
		itemType = var1,
		itemSubType = var2
	})
end

function t.sendButtonClicked(p1, p2)
	-- upvalues: t (ref), rbxAnalyticsService (ref), var1 (write), var2 (write)
	rbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = p1,
		action = t.Action.ButtonClicked,
		element = p2,
		itemType = var1,
		itemSubType = var2
	})
end

return t