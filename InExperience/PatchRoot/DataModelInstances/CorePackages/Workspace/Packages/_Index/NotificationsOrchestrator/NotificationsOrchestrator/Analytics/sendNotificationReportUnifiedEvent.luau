local HttpService = game:GetService("HttpService")
local NotificationsOrchestrator = script:FindFirstAncestor("NotificationsOrchestrator")
local Parent = NotificationsOrchestrator.Parent
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local MarketplaceUnifiedAction = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums.MarketplaceUnifiedAction
local SendPassthroughUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendPassthroughUnifiedEventLog
local SendUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLog
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local _ = require(NotificationsOrchestrator.Types)
local config = {
	suppressed = true,
	submitDropped = true,
	capReached = true,
	promoteDropped = true,
	revoked = true
}

local function _(p1)
	return if p1 == nil then nil else tostring(p1)
end

local _ = function(p1)
	-- upvalues: MarketplaceUnifiedAction (copy), config (copy)
	return if p1.eventType == "mounted" then nil elseif p1.eventType == "viewed" then MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION elseif p1.eventType == "activated" or p1.eventType == "dismissed" then MarketplaceUnifiedAction.UI_ELEMENT_CLICK elseif p1.eventType == "queued" then 12 elseif config[p1.eventType] then 13 else nil
end

local function metadataFor(p1)
	-- upvalues: HttpService (copy)
	local Reason = p1.reason
	local Text = if Reason == nil then nil else tostring(Reason)
	local ActionId = p1.actionId
	local Text1 = if ActionId == nil then nil else tostring(ActionId)
	local Handle = p1.handle
	local Text2 = if Handle == nil then nil else tostring(Handle)
	local LifecycleKey = p1.lifecycleKey
	local Text3 = if LifecycleKey == nil then nil else tostring(LifecycleKey)
	local Source = p1.source
	
	return HttpService:JSONEncode({
		eventType = tostring(p1.eventType),
		reason = Text,
		actionId = Text1,
		handle = Text2,
		lifecycleKey = Text3,
		source = if Source == nil then nil else tostring(Source)
	})
end

return {
	send = function(p1)
		-- upvalues: MarketplaceUnifiedAction (copy), config (copy), UnifiedLoggingSurface (copy), metadataFor (copy), AvatarExperienceAnalyticsModule (copy), SendPassthroughUnifiedEventLogFunction (copy), SendUnifiedEventLogFunction (copy)
		local UIELEMENTIMPRESSION = if p1.eventType == "mounted" then nil elseif p1.eventType == "viewed" then MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION elseif p1.eventType == "activated" or p1.eventType == "dismissed" then MarketplaceUnifiedAction.UI_ELEMENT_CLICK elseif p1.eventType == "queued" then 12 elseif config[p1.eventType] then 13 else nil
		
		if UIELEMENTIMPRESSION == nil then return end
		local config1 = {
			action = UIELEMENTIMPRESSION,
			surface = UnifiedLoggingSurface.IN_EXPERIENCE_NOTIFICATIONS,
			elementName = p1.slot,
			elementMetadata = metadataFor(p1),
			universeId = game.GameId,
			itemId = p1.itemId,
			itemType = p1.itemType
		}
		
		if AvatarExperienceAnalyticsModule.Flags.FFlagAXUnifiedEventStrictPayloads then
			SendPassthroughUnifiedEventLogFunction(config1)
			
			return
		else
			SendUnifiedEventLogFunction(config1)
		end
	end
}