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

function t.__tostring() --[[ line: 40 ]]
	return "Service(Analytics)"
end

function t.new(p0, p1, p2) --[[ line: 46 ]]
	-- upvalues: t (ref), eventStreamReporter (ref), default (ref), playersService (ref), fFlagAXEnableInspectAndBuyVersionAnalyticsModule (ref), unifiedEventLogEnums (ref), TIMED_OPTION_BY_DAYS (ref), itemTypeEnum (ref), userInputService (ref), httpService (ref), runService (ref), rbxAnalyticsService (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1.eventStream = eventStreamReporter.new(default)
	t_1.pid = tostring(game.PlaceId)
	t_1.uid = tostring(playersService.LocalPlayer.UserId)
	t_1.feature = "inspectAndBuy"
	t_1.inspecteeUid = p0
	t_1.ctx = p1
	t_1.version = if fFlagAXEnableInspectAndBuyVersionAnalyticsModule then p2 else nil
	
	function t_1.reportOpenInspectMenu() --[[ line: 60 ]]
		-- upvalues: t_1 (ref)
		t_1:report("inspectUser", {})
	end
	
	function t_1.reportTryOnButtonClicked(p3, p4) --[[ line: 67 ]]
		-- upvalues: t_1 (ref)
		t_1:report("tryItem", { itemType = p3, itemID = p4 })
	end
	
	function t_1.reportFavoriteItem(p5, p6, p7, p8, p9, p10) --[[ line: 77 ]]
		-- upvalues: t_1 (ref)
		t_1:report("favoriteItem", {
			itemType = p5,
			itemID = p6,
			favorite = p7,
			success = p8,
			failureReason = p9,
			favoriteCount = p10
		})
	end
	
	function t_1.reportPurchaseAttempt(p11, p12) --[[ line: 91 ]]
		-- upvalues: t_1 (ref)
		t_1:report("purchaseAttemptItem", { itemType = p11, itemID = p12 })
	end
	
	function t_1.reportPurchaseAttemptUnifiedEvent(p13, p14, p15) --[[ line: 101 ]]
		-- upvalues: t_1 (ref), unifiedEventLogEnums (copy), TIMED_OPTION_BY_DAYS (copy), itemTypeEnum (copy)
		t_1:reportUnifiedEvent({
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
			itemId = p14,
			itemType = p13,
			organicTimedOption = if p15.timedOptionDays ~= nil then nil else TIMED_OPTION_BY_DAYS[p15.timedOptionDays],
			assetType = if p13 == itemTypeEnum.Asset then p15.itemSubType else nil,
			bundleType = if p13 == itemTypeEnum.Bundle then p15.itemSubType else nil,
			organicItemPrice = p15.price or 0
		})
		t_1:report("purchaseAttemptItem", { itemType = p13, itemID = p14 })
	end
	
	function t_1.reportPurchaseSuccessUnifiedEvent(p16, p17, p18) --[[ line: 123 ]]
		-- upvalues: t_1 (ref), unifiedEventLogEnums (copy), TIMED_OPTION_BY_DAYS (copy), itemTypeEnum (copy)
		t_1:reportUnifiedEvent({
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_SUCCESS,
			itemId = p17,
			itemType = p16,
			organicTimedOption = if p18.timedOptionDays ~= nil then nil else TIMED_OPTION_BY_DAYS[p18.timedOptionDays],
			assetType = if p16 == itemTypeEnum.Asset then p18.itemSubType else nil,
			bundleType = if p16 == itemTypeEnum.Bundle then p18.itemSubType else nil,
			organicItemPrice = p18.price or 0
		})
		t_1:report("purchaseSuccessItem", { itemType = p16, itemID = p17 })
	end
	
	function t_1.reportPurchaseSuccess(p19, p20) --[[ line: 145 ]]
		-- upvalues: t_1 (ref)
		t_1:report("purchaseSuccessItem", { itemType = p19, itemID = p20 })
	end
	
	function t_1.reportItemDetailPageOpened(p21, p22) --[[ line: 159 ]]
		-- upvalues: t_1 (ref)
		t_1:report("itemDetailView", { itemType = p21, itemID = p22 })
	end
	
	t_1.platformStr = (function() --[[ line: 169 | named "getPlatformString" ]]
		-- upvalues: userInputService (copy), httpService (copy)
		local platform = userInputService:GetPlatform()
		local var11 = "Unknown"
		
		if platform == Enum.Platform.Windows then
			var11 = "Windows"
			
			return var11
		elseif platform == Enum.Platform.OSX then
			var11 = "OSX"
			
			return var11
		elseif platform == Enum.Platform.IOS then
			var11 = "IOS"
			
			return var11
		elseif platform == Enum.Platform.Android then
			local userAgent = httpService:GetUserAgent()
			var11 = if string.find(userAgent, "AmazonAppStore") then "Amazon" else "Android"
			
			if string.find(userAgent, "OculusQuest3Store") then
				var11 = "Quest"
				
				return var11
			end
		elseif platform == Enum.Platform.XBoxOne or platform == Enum.Platform.XBox360 then
			var11 = "XBox"
			
			return var11
		elseif platform == Enum.Platform.UWP then
			var11 = "UWP"
			
			return var11
		elseif platform == Enum.Platform.PS4 or platform == Enum.Platform.PS3 or platform == Enum.Platform.PS5 then
			var11 = "PlayStation"
		end
		return var11
	end)()
	
	function t_1.sendCounter(p23) --[[ line: 202 ]]
		-- upvalues: runService (copy), t_1 (ref), rbxAnalyticsService (copy)
		if runService:IsStudio() then
			return
		end
		rbxAnalyticsService:ReportCounter("inspectAndBuy" .. "_" .. t_1.platformStr .. "_" .. p23)
	end
	
	return t_1
end

function t:report(p24, p25) --[[ line: 214 ]]
	-- upvalues: fFlagAXEnableInspectAndBuyVersionAnalyticsModule (ref), cryoModule (ref)
	self.eventStream:sendTelemetryEvent(self.ctx, p24, cryoModule.Dictionary.join({
		feature = "inspectAndBuy",
		event_sender_api = 2,
		pid = self.pid,
		uid = self.uid,
		inspecteeUid = self.inspecteeUid,
		inspectAndBuyVersion = if fFlagAXEnableInspectAndBuyVersionAnalyticsModule then self.version else nil
	}, p25))
end

function t:reportUnifiedEvent(p26) --[[ line: 228 ]]
	-- upvalues: unifiedLoggingSurface (ref), cryoModule (ref), unifiedEventLogConstants (ref)
	self.eventStream:sendTelemetryEvent(self.ctx, unifiedEventLogConstants.EVENT_NAME, cryoModule.Dictionary.join({
		surface = unifiedLoggingSurface.IN_EXPERIENCE_INSPECT_BUY
	}, p26))
end

return t