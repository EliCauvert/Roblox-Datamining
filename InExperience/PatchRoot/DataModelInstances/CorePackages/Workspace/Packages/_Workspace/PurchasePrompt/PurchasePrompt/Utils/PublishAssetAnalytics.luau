local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local IECFunnelContextIds = game:DefineFastFlag("IECFunnelContextIds", false)
local ItemDetails = nil
local ItemDetails1 = nil

local function sendEvent(Section, Action, Element)
	-- upvalues: RbxAnalyticsService (copy), ItemDetails (ref), ItemDetails1 (ref), IECFunnelContextIds (copy)
	RbxAnalyticsService:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
		section = Section,
		action = Action,
		element = Element,
		itemType = ItemDetails,
		itemSubType = ItemDetails1,
		universeid = if IECFunnelContextIds then tostring(game.GameId) else nil,
		placeid = if IECFunnelContextIds then tostring(game.PlaceId) else nil,
		sessionid = if IECFunnelContextIds then RbxAnalyticsService:GetSessionId() else nil
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
		-- upvalues: ItemDetails (ref), ItemDetails1 (ref)
		ItemDetails = Value
		ItemDetails1 = Value1
	end
}

function PublishAssetAnalyticsModule.sendPageLoad(Section)
	-- upvalues: sendEvent (copy), PublishAssetAnalyticsModule (copy)
	sendEvent(Section, PublishAssetAnalyticsModule.Action.PageLoad)
end

function PublishAssetAnalyticsModule.sendFieldTouched(Section, Element)
	-- upvalues: sendEvent (copy), PublishAssetAnalyticsModule (copy)
	sendEvent(Section, PublishAssetAnalyticsModule.Action.FieldTouched, Element)
end

function PublishAssetAnalyticsModule.sendButtonClicked(Section, Element)
	-- upvalues: sendEvent (copy), PublishAssetAnalyticsModule (copy)
	sendEvent(Section, PublishAssetAnalyticsModule.Action.ButtonClicked, Element)
end

return PublishAssetAnalyticsModule