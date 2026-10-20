local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local ItemType = nil
local ItemSubType = nil

local function _(Section, Action, Element)
	-- upvalues: RbxAnalyticsService (copy), ItemType (ref), ItemSubType (ref)
	RbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = Section,
		action = Action,
		element = Element,
		itemType = ItemType,
		itemSubType = ItemSubType
	})
end

local PublishAssetAnalyticsModule = {
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
	},
	setItemDetails = function(Value, Value1)
		-- upvalues: ItemType (ref), ItemSubType (ref)
		ItemType = Value
		ItemSubType = Value1
	end
}

function PublishAssetAnalyticsModule.sendPageLoad(Section)
	-- upvalues: PublishAssetAnalyticsModule (copy), RbxAnalyticsService (copy), ItemType (ref), ItemSubType (ref)
	RbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		element = nil,
		section = Section,
		action = PublishAssetAnalyticsModule.Action.PageLoad,
		itemType = ItemType,
		itemSubType = ItemSubType
	})
end

function PublishAssetAnalyticsModule.sendFieldTouched(Section, Element)
	-- upvalues: PublishAssetAnalyticsModule (copy), RbxAnalyticsService (copy), ItemType (ref), ItemSubType (ref)
	RbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = Section,
		action = PublishAssetAnalyticsModule.Action.FieldTouched,
		element = Element,
		itemType = ItemType,
		itemSubType = ItemSubType
	})
end

function PublishAssetAnalyticsModule.sendButtonClicked(Section, Element)
	-- upvalues: PublishAssetAnalyticsModule (copy), RbxAnalyticsService (copy), ItemType (ref), ItemSubType (ref)
	RbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = Section,
		action = PublishAssetAnalyticsModule.Action.ButtonClicked,
		element = Element,
		itemType = ItemType,
		itemSubType = ItemSubType
	})
end

return PublishAssetAnalyticsModule