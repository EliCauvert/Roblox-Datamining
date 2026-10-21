local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local FriendsOwnedChip = require(Parent.SocialProof).Chips.FriendsOwnedChip
local SduiErrorType = require(Parent.SduiCoreSystem).SduiErrors.SduiErrorType
local config = { Asset = "Asset", Bundle = "Bundle" }

local function _(p1)
	return if typeof(p1) == "number" then tostring(p1) elseif typeof(p1) == "string" and p1 ~= "" then p1 else nil
end

return ReactModule.memo(function(p1)
	-- upvalues: config (copy), ReactModule (copy), SduiErrorType (copy), FriendsOwnedChip (copy)
	local ItemId = p1.itemId
	local Text = if typeof(ItemId) == "number" then tostring(ItemId) elseif typeof(ItemId) == "string" and ItemId ~= "" then ItemId else nil
	local ItemType = p1.itemType
	local Entry = if ItemType then config[ItemType] else nil
	local HasEntry: boolean = Text ~= nil and Entry ~= nil
	local SduiContext = p1.sduiContext
	ReactModule.useEffect(function()
		-- upvalues: HasEntry (copy), SduiContext (copy), SduiErrorType (upval), ItemType (copy), Text (copy)
		if not HasEntry then
			SduiContext.dependencies.logger.reportError(SduiErrorType.InvalidProps, {
				name = "FriendsOwnedChip",
				message = `Unsupported item: {ItemType} {Text}`
			}, SduiContext.appPage)
			
			return
		end
	end, { HasEntry, SduiContext, ItemType, Text })
	
	return if Text == nil or Entry == nil then nil else ReactModule.createElement(FriendsOwnedChip, {
		fromProfile = false,
		itemId = Text,
		itemType = Entry,
		layoutOrder = p1.layoutOrder
	})
end)