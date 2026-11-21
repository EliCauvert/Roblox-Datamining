local BuildExperience = script:FindFirstAncestor("BuildExperience")
local LocalizationModule = require(BuildExperience.Parent.Localization)
local _ = require(BuildExperience.Chat.chatTypes)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local _ = require(BuildExperience.Components.Chat.activityLabelHelpers)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local FFlagCreatorAgentChatMonetizationToolHelpersModule = require(BuildExperience.Flags.FFlagCreatorAgentChatMonetizationToolHelpers)
local FFlagBuildExperienceMonetizationCardFixesModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationCardFixes)
local LocalizationService = game:GetService("LocalizationService")
local NumberLocalization = LocalizationModule.NumberLocalization
local config = {
	title = LocalizationStringsModule.AGENT_DEV_PRODUCT_TITLE,
	create = LocalizationStringsModule.AGENT_DEV_PRODUCT_CREATE,
	update = LocalizationStringsModule.AGENT_DEV_PRODUCT_UPDATE,
	activate = LocalizationStringsModule.AGENT_DEV_PRODUCT_ACTIVATE,
	deactivate = LocalizationStringsModule.AGENT_DEV_PRODUCT_DEACTIVATE
}
local config1 = {
	gamePass = {
		title = LocalizationStringsModule.AGENT_GAME_PASS_TITLE,
		create = LocalizationStringsModule.AGENT_GAME_PASS_CREATE,
		update = LocalizationStringsModule.AGENT_GAME_PASS_UPDATE,
		activate = LocalizationStringsModule.AGENT_GAME_PASS_ACTIVATE,
		deactivate = LocalizationStringsModule.AGENT_GAME_PASS_DEACTIVATE
	},
	subscription = {
		title = LocalizationStringsModule.AGENT_SUBSCRIPTION_TITLE,
		create = LocalizationStringsModule.AGENT_SUBSCRIPTION_CREATE,
		update = LocalizationStringsModule.AGENT_SUBSCRIPTION_UPDATE,
		activate = LocalizationStringsModule.AGENT_SUBSCRIPTION_ACTIVATE,
		deactivate = LocalizationStringsModule.AGENT_SUBSCRIPTION_DEACTIVATE,
		deactivateCancelRenewals = LocalizationStringsModule.AGENT_SUBSCRIPTION_DEACTIVATE_CANCEL_RENEWALS,
		delete = LocalizationStringsModule.AGENT_SUBSCRIPTION_DELETE
	}
}
local config2 = {
	consumable = LocalizationStringsModule.AGENT_SUBSCRIPTION_PRODUCT_TYPE_CONSUMABLE,
	currency = LocalizationStringsModule.AGENT_SUBSCRIPTION_PRODUCT_TYPE_CURRENCY,
	durable = LocalizationStringsModule.AGENT_SUBSCRIPTION_PRODUCT_TYPE_DURABLE
}

local function _(p1, p2)
	return if p2.action == "create" or p2.action == "update" or p2.action == "title" then nil elseif p2.action == "deactivate" and p2.cancelRenewals == true and p1.deactivateCancelRenewals ~= nil then p1.deactivateCancelRenewals else p1[p2.action]
end

local _ = function(p1)
	return p1.itemId or tostring(p1.productId)
end

local function formatSummary(p1, AGENTDEVPRODUCTDESCRIPTION, p2)
	return p1:Format(AGENTDEVPRODUCTDESCRIPTION, p2)
end

local _ = function(p1)
	-- upvalues: NumberLocalization (copy), LocalizationService (copy)
	return NumberLocalization.localize(tostring(p1), LocalizationService.RobloxLocaleId)
end

local function kindText(p1, p2)
	-- upvalues: formatSummary (copy), LocalizationStringsModule (copy), config1 (copy), config (copy)
	return formatSummary(p2, LocalizationStringsModule.AGENT_SUBSCRIPTION_PRODUCT_TYPE, {
		PRODUCT_TYPE = p2:Format((if p1.itemKind == nil then config else config1[p1.itemKind] or config).title, {})
	})
end

local function appendSubscriptionProductType(List, p1, p2)
	-- upvalues: config2 (copy), formatSummary (copy), LocalizationStringsModule (copy)
	if p1.itemKind ~= "subscription" or p1.productType == nil then return end
	local Entry = config2[p1.productType]
	
	if Entry ~= nil then
		table.insert(List, formatSummary(p2, LocalizationStringsModule.AGENT_SUBSCRIPTION_PRODUCT_TYPE, { PRODUCT_TYPE = p2:Format(Entry, {}) }))
		
		return
	end
end

local function devProductSummaryText(p1, p2, p3, p4)
	-- upvalues: NumberLocalization (copy), LocalizationService (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), LocalizationStringsModule (copy), FFlagBuildExperienceMonetizationCardFixesModule (copy), kindText (copy), formatSummary (copy)
	local Action = p1.action
	
	if Action == "create" then
		local Name = p1.name or p3
		local LocalizeResult = if p1.priceInRobux == nil then p4 else NumberLocalization.localize(tostring(p1.priceInRobux), LocalizationService.RobloxLocaleId)
		
		if FFlagBuildExperienceMonetizationNativeUIModule then
			local FormatResult = p2:Format(LocalizationStringsModule.AGENT_DEV_PRODUCT_PRICE, { PRICE = LocalizeResult })
			
			return if FFlagBuildExperienceMonetizationCardFixesModule then `{FormatResult}\n{kindText(p1, p2)}` else FormatResult
		end
		local List = {
			formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_CREATE, { NAME = Name, PRICE = LocalizeResult })
		}
		
		if p1.description ~= nil then
			table.insert(List, formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_DESCRIPTION, { DESCRIPTION = p1.description }))
		end
		return table.concat(List, "\n")
	else
		if Action ~= "update" then
			return if Action == "activate" then formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_ACTIVATE, { PRODUCT_ID = tostring(p1.productId) }) elseif Action == "deactivate" then formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_DEACTIVATE, { PRODUCT_ID = tostring(p1.productId) }) else formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_MANAGE, {})
		end
		local List = {
			formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_UPDATE, { PRODUCT_ID = tostring(p1.productId) })
		}
		
		if p1.name ~= nil then
			table.insert(List, formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_NAME, { NAME = p1.name }))
		end
		if p1.description ~= nil then
			table.insert(List, formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_DESCRIPTION, { DESCRIPTION = p1.description }))
		end
		if p1.priceInRobux ~= nil then
			table.insert(List, formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_PRICE, {
				PRICE = NumberLocalization.localize(tostring(p1.priceInRobux), LocalizationService.RobloxLocaleId)
			}))
		end
		return table.concat(List, "\n")
	end
end

local function itemSummaryText(p1, p2, p3, p4)
	-- upvalues: config1 (copy), config (copy), NumberLocalization (copy), LocalizationService (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), formatSummary (copy), LocalizationStringsModule (copy), FFlagBuildExperienceMonetizationCardFixesModule (copy), kindText (copy), appendSubscriptionProductType (copy)
	local Action = p1.action
	local Config = if p1.itemKind == nil then config else config1[p1.itemKind] or config
	
	if Action == "create" then
		local Name = p1.name or p3
		local LocalizeResult = if p1.priceInRobux == nil then p4 else NumberLocalization.localize(tostring(p1.priceInRobux), LocalizationService.RobloxLocaleId)
		local List = if FFlagBuildExperienceMonetizationNativeUIModule then {
			formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_PRICE, { PRICE = LocalizeResult })
		} else {
			formatSummary(p2, Config.create, { NAME = Name, PRICE = LocalizeResult })
		}
		
		if FFlagBuildExperienceMonetizationCardFixesModule and FFlagBuildExperienceMonetizationNativeUIModule then
			table.insert(List, kindText(p1, p2))
		end
		appendSubscriptionProductType(List, p1, p2)
		
		if FFlagBuildExperienceMonetizationNativeUIModule then
			return table.concat(List, "\n")
		end
		if p1.description ~= nil then
			table.insert(List, formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_DESCRIPTION, { DESCRIPTION = p1.description }))
		end
		return table.concat(List, "\n")
	else
		if Action ~= "update" then
			local DeactivateCancelRenewals = if p1.action == "create" or p1.action == "update" or p1.action == "title" then nil elseif p1.action == "deactivate" and p1.cancelRenewals == true and Config.deactivateCancelRenewals ~= nil then Config.deactivateCancelRenewals else Config[p1.action]
			
			return if DeactivateCancelRenewals == nil then formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_MANAGE, {}) else formatSummary(p2, DeactivateCancelRenewals, { PRODUCT_ID = p1.itemId or tostring(p1.productId) })
		end
		local List = {
			formatSummary(p2, Config.update, { PRODUCT_ID = p1.itemId or tostring(p1.productId) })
		}
		
		if p1.name ~= nil then
			table.insert(List, formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_NAME, { NAME = p1.name }))
		end
		if p1.description ~= nil then
			table.insert(List, formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_DESCRIPTION, { DESCRIPTION = p1.description }))
		end
		if p1.priceInRobux ~= nil then
			table.insert(List, formatSummary(p2, LocalizationStringsModule.AGENT_DEV_PRODUCT_PRICE, {
				PRICE = NumberLocalization.localize(tostring(p1.priceInRobux), LocalizationService.RobloxLocaleId)
			}))
		end
		return table.concat(List, "\n")
	end
end

return {
	summaryKeys = function(p1)
		-- upvalues: config1 (copy), config (copy)
		local Entry = nil
		if p1.itemKind == nil then
			Entry = config
		else
			Entry = config1[p1.itemKind]
			
			if not Entry then
				return config
			end
		end
		return Entry
	end,
	createCardTitle = function(p1, p2, p3, p4)
		-- upvalues: formatSummary (copy), LocalizationStringsModule (copy), NumberLocalization (copy), LocalizationService (copy)
		return formatSummary(p2, LocalizationStringsModule.AGENT_MONETIZATION_CREATE_TITLE, {
			NAME = p1.name or p3,
			PRICE = if p1.priceInRobux == nil then p4 else NumberLocalization.localize(tostring(p1.priceInRobux), LocalizationService.RobloxLocaleId)
		})
	end,
	summaryText = function(p1, p2, p3, p4)
		-- upvalues: FFlagCreatorAgentChatMonetizationToolHelpersModule (copy), devProductSummaryText (copy), itemSummaryText (copy)
		return if FFlagCreatorAgentChatMonetizationToolHelpersModule or p1.itemKind ~= nil then itemSummaryText(p1, p2, p3, p4) else devProductSummaryText(p1, p2, p3, p4)
	end,
	usesCreateCardLayout = function(p1): boolean
		-- upvalues: FFlagBuildExperienceMonetizationCardFixesModule (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy)
		return FFlagBuildExperienceMonetizationCardFixesModule and (FFlagBuildExperienceMonetizationNativeUIModule and p1.action == "create")
	end,
	cardText = function(p1, p2, p3, p4)
		-- upvalues: FFlagBuildExperienceMonetizationCardFixesModule (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), LocalizationStringsModule (copy), NumberLocalization (copy), LocalizationService (copy), FFlagCreatorAgentChatMonetizationToolHelpersModule (copy), devProductSummaryText (copy), itemSummaryText (copy)
		if FFlagBuildExperienceMonetizationCardFixesModule and (FFlagBuildExperienceMonetizationNativeUIModule and p1.action == "create") then
			local FormatResult = p2:Format(LocalizationStringsModule.AGENT_MONETIZATION_CREATE_TITLE, {
				NAME = p1.name or p3,
				PRICE = if p1.priceInRobux == nil then p4 else NumberLocalization.localize(tostring(p1.priceInRobux), LocalizationService.RobloxLocaleId)
			})
			
			return if p1.description == nil or p1.description == "" then FormatResult else `{FormatResult}\n{p1.description}`
		else
			local ItemSummaryTextResult = if FFlagCreatorAgentChatMonetizationToolHelpersModule or p1.itemKind ~= nil then itemSummaryText(p1, p2, p3, p4) else devProductSummaryText(p1, p2, p3, p4)
			
			return if FFlagBuildExperienceMonetizationNativeUIModule and p1.action == "create" then `{p1.name or p3}\n{ItemSummaryTextResult}` else ItemSummaryTextResult
		end
	end
}