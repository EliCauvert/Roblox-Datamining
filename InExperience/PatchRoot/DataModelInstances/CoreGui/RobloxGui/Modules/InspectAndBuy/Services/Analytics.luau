local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local default = require(corePackagesService.Workspace.Packages.LoggingProtocol).default
local eventStreamReporter = require(corePackagesService.Workspace.Packages.TelemetryService).EventStreamReporter
local fFlagAXEnableInspectAndBuyVersionAnalyticsModule = require(script.Parent.Parent.Flags.FFlagAXEnableInspectAndBuyVersionAnalytics)
local unifiedEventLogEnums = require(corePackagesService.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local unifiedLoggingSurface = require(corePackagesService.Workspace.Packages.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local unifiedEventLogConstants = require(corePackagesService.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local itemTypeEnum = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum
local TIMED_OPTION_BY_DAYS = require(corePackagesService.Workspace.Packages.AvatarExperienceAnalytics).Constants.TIMED_OPTION_BY_DAYS
local _ = {
	SEND_EVENT_DEFERRED = 0,
	SEND_EVENT_IMMEDIATELY = 1,
	SEND_ROBLOX_TELEMETRY_EVENT = 2
}
local t = {}
t.__index = t

function t.__tostring()
	return "Service(Analytics)"
end

function t.new(p1, p2, p3)
	-- upvalues: t (ref), eventStreamReporter (ref), default (ref), playersService (ref), fFlagAXEnableInspectAndBuyVersionAnalyticsModule (ref), unifiedEventLogEnums (ref), TIMED_OPTION_BY_DAYS (ref), itemTypeEnum (ref), userInputService (ref), httpService (ref), runService (ref), rbxAnalyticsService (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.eventStream = eventStreamReporter.new(default)
	t_1.pid = tostring(game.PlaceId)
	t_1.uid = tostring(playersService.LocalPlayer.UserId)
	t_1.feature = "inspectAndBuy"
	t_1.inspecteeUid = p1
	t_1.ctx = p2
	t_1.version = if fFlagAXEnableInspectAndBuyVersionAnalyticsModule then p3 else nil
	
	function t_1.reportOpenInspectMenu()
		-- upvalues: t_1 (ref)
		t_1:report("inspectUser", {})
	end
	
	function t_1.reportTryOnButtonClicked(p4, p5)
		-- upvalues: t_1 (ref)
		t_1:report("tryItem", { itemType = p4, itemID = p5 })
	end
	
	function t_1.reportFavoriteItem(p4, p5, p6, p7, p8, p9)
		-- upvalues: t_1 (ref)
		t_1:report("favoriteItem", {
			itemType = p4,
			itemID = p5,
			favorite = p6,
			success = p7,
			failureReason = p8,
			favoriteCount = p9
		})
	end
	
	function t_1.reportPurchaseAttempt(p4, p5)
		-- upvalues: t_1 (ref)
		t_1:report("purchaseAttemptItem", { itemType = p4, itemID = p5 })
	end
	
	function t_1.reportPurchaseAttemptUnifiedEvent(p4, p5, p6)
		-- upvalues: t_1 (ref), unifiedEventLogEnums (copy), TIMED_OPTION_BY_DAYS (copy), itemTypeEnum (copy)
		t_1:reportUnifiedEvent({
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
			itemId = p5,
			itemType = p4,
			organicTimedOption = if p6.timedOptionDays ~= nil then nil else TIMED_OPTION_BY_DAYS[p6.timedOptionDays],
			assetType = if p4 == itemTypeEnum.Asset then p6.itemSubType else nil,
			bundleType = if p4 == itemTypeEnum.Bundle then p6.itemSubType else nil,
			organicItemPrice = p6.price or 0
		})
		t_1:report("purchaseAttemptItem", { itemType = p4, itemID = p5 })
	end
	
	function t_1.reportPurchaseSuccessUnifiedEvent(p4, p5, p6)
		-- upvalues: t_1 (ref), unifiedEventLogEnums (copy), TIMED_OPTION_BY_DAYS (copy), itemTypeEnum (copy)
		t_1:reportUnifiedEvent({
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_SUCCESS,
			itemId = p5,
			itemType = p4,
			organicTimedOption = if p6.timedOptionDays ~= nil then nil else TIMED_OPTION_BY_DAYS[p6.timedOptionDays],
			assetType = if p4 == itemTypeEnum.Asset then p6.itemSubType else nil,
			bundleType = if p4 == itemTypeEnum.Bundle then p6.itemSubType else nil,
			organicItemPrice = p6.price or 0
		})
		t_1:report("purchaseSuccessItem", { itemType = p4, itemID = p5 })
	end
	
	function t_1.reportPurchaseSuccess(p4, p5)
		-- upvalues: t_1 (ref)
		t_1:report("purchaseSuccessItem", { itemType = p4, itemID = p5 })
	end
	
	function t_1.reportItemDetailPageOpened(p4, p5)
		-- upvalues: t_1 (ref)
		t_1:report("itemDetailView", { itemType = p4, itemID = p5 })
	end
	
	t_1.platformStr = (function()
		-- upvalues: userInputService (copy), httpService (copy)
		local platform = userInputService:GetPlatform()
		local var1 = "Unknown"
		
		if platform == Enum.Platform.Windows then
			var1 = "Windows"
			
			return var1
		elseif platform == Enum.Platform.OSX then
			var1 = "OSX"
			
			return var1
		elseif platform == Enum.Platform.IOS then
			var1 = "IOS"
			
			return var1
		elseif platform == Enum.Platform.Android then
			local userAgent = httpService:GetUserAgent()
			var1 = if string.find(userAgent, "AmazonAppStore") then "Amazon" else "Android"
			
			if string.find(userAgent, "OculusQuest3Store") then
				var1 = "Quest"
				
				return var1
			end
		elseif platform == Enum.Platform.XBoxOne or platform == Enum.Platform.XBox360 then
			var1 = "XBox"
			
			return var1
		elseif platform == Enum.Platform.UWP then
			var1 = "UWP"
			
			return var1
		elseif platform == Enum.Platform.PS4 or platform == Enum.Platform.PS3 or platform == Enum.Platform.PS5 then
			var1 = "PlayStation"
		end
		return var1
	end)()
	
	function t_1.sendCounter(p4)
		-- upvalues: runService (copy), t_1 (ref), rbxAnalyticsService (copy)
		if runService:IsStudio() then
			return
		end
		rbxAnalyticsService:ReportCounter("inspectAndBuy" .. "_" .. t_1.platformStr .. "_" .. p23)
	end
	
	return t_1
end

function t:report(p1, p2)
	-- upvalues: fFlagAXEnableInspectAndBuyVersionAnalyticsModule (ref), cryoModule (ref)
	self.eventStream:sendTelemetryEvent(self.ctx, p1, cryoModule.Dictionary.join({
		feature = "inspectAndBuy",
		event_sender_api = 2,
		pid = self.pid,
		uid = self.uid,
		inspecteeUid = self.inspecteeUid,
		inspectAndBuyVersion = if fFlagAXEnableInspectAndBuyVersionAnalyticsModule then self.version else nil
	}, p2))
end

function t:reportUnifiedEvent(p1)
	-- upvalues: unifiedLoggingSurface (ref), cryoModule (ref), unifiedEventLogConstants (ref)
	self.eventStream:sendTelemetryEvent(self.ctx, unifiedEventLogConstants.EVENT_NAME, cryoModule.Dictionary.join({
		surface = unifiedLoggingSurface.IN_EXPERIENCE_INSPECT_BUY
	}, p1))
end

return t