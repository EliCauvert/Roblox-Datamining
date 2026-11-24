local CreatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)
local LocalToolStepsModule = require(script.Parent.localToolSteps)
local UnifiedMonetizationToolModule = require(script.Parent.unifiedMonetizationTool)
local StudioManageDevProductTool = CreatorAgentChatModule.StudioManageDevProductTool
local StudioManageGamePassTool = CreatorAgentChatModule.StudioManageGamePassTool
local StudioManageSubscriptionTool = CreatorAgentChatModule.StudioManageSubscriptionTool
local StudioManageMonetizationTool = CreatorAgentChatModule.StudioManageMonetizationTool

local function _(p1)
	return {
		action = p1.action,
		name = p1.name,
		description = p1.description,
		priceInRobux = p1.priceInRobux,
		productId = p1.productId,
		imageAssetId = p1.imageAssetId
	}
end

local _ = function(p1): boolean
	return p1.createAndGoLive == true
end

local function fromGamePass(ParseInputResult)
	return if ParseInputResult.createAndGoLive == true then nil else {
		itemKind = "gamePass",
		action = ParseInputResult.action,
		name = ParseInputResult.name,
		description = ParseInputResult.description,
		priceInRobux = ParseInputResult.priceInRobux,
		imageAssetId = ParseInputResult.imageAssetId,
		itemId = if ParseInputResult.gamePassId == nil then nil else tostring(ParseInputResult.gamePassId)
	}
end

local function fromSubscription(ParseInputResult)
	return if ParseInputResult.createAndGoLive == true then nil else {
		itemKind = "subscription",
		action = ParseInputResult.action,
		name = ParseInputResult.name,
		description = ParseInputResult.description,
		priceInRobux = ParseInputResult.priceInRobux,
		imageAssetId = ParseInputResult.imageAssetId,
		productType = ParseInputResult.productType,
		cancelRenewals = ParseInputResult.cancelRenewals,
		itemId = ParseInputResult.subscriptionId
	}
end

local function fromMonetization(RawInput)
	-- upvalues: StudioManageMonetizationTool (copy), UnifiedMonetizationToolModule (copy), fromGamePass (copy), fromSubscription (copy)
	local ResolveKindResult = StudioManageMonetizationTool.resolveKind(RawInput)
	local ToolsByKindEntry = if ResolveKindResult == nil then nil else UnifiedMonetizationToolModule.toolsByKind[ResolveKindResult]
	local ParseInputResult = if ToolsByKindEntry == nil then nil else ToolsByKindEntry.parseInput(RawInput)
	
	return if ParseInputResult == nil then nil elseif ResolveKindResult == "gamePass" then fromGamePass(ParseInputResult) elseif ResolveKindResult == "subscription" then fromSubscription(ParseInputResult) else {
		action = ParseInputResult.action,
		name = ParseInputResult.name,
		description = ParseInputResult.description,
		priceInRobux = ParseInputResult.priceInRobux,
		productId = ParseInputResult.productId,
		imageAssetId = ParseInputResult.imageAssetId
	}
end

return {
	getFields = function(p1)
		-- upvalues: LocalToolStepsModule (copy), StudioManageMonetizationTool (copy), fromMonetization (copy), StudioManageGamePassTool (copy), fromGamePass (copy), StudioManageSubscriptionTool (copy), fromSubscription (copy), StudioManageDevProductTool (copy)
		local DevProductToolName = LocalToolStepsModule.getDevProductToolName(p1)
		
		if DevProductToolName == nil or p1 == nil then
			return nil
		end
		local RawInput = p1.rawInput
		
		if DevProductToolName == "manage_monetization" then
			return if StudioManageMonetizationTool == nil then nil else fromMonetization(RawInput)
		elseif DevProductToolName == "manage_game_pass" then
			local ParseInputResult = if StudioManageGamePassTool == nil then nil else StudioManageGamePassTool.parseInput(RawInput)
			
			return if ParseInputResult == nil then nil else fromGamePass(ParseInputResult)
		elseif DevProductToolName == "manage_subscription" then
			local ParseInputResult = if StudioManageSubscriptionTool == nil then nil else StudioManageSubscriptionTool.parseInput(RawInput)
			
			return if ParseInputResult == nil then nil else fromSubscription(ParseInputResult)
		else
			local ParseManageDevProductInputResult = StudioManageDevProductTool.parseManageDevProductInput(RawInput)
			
			return if ParseManageDevProductInputResult == nil then nil else {
				action = ParseManageDevProductInputResult.action,
				name = ParseManageDevProductInputResult.name,
				description = ParseManageDevProductInputResult.description,
				priceInRobux = ParseManageDevProductInputResult.priceInRobux,
				productId = ParseManageDevProductInputResult.productId,
				imageAssetId = ParseManageDevProductInputResult.imageAssetId
			}
		end
	end
}