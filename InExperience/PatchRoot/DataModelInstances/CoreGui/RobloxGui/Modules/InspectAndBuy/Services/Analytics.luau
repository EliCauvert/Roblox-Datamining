local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CryoModule = require(CorePackages.Packages.Cryo)
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local EventStreamReporter = require(CorePackages.Workspace.Packages.TelemetryService).EventStreamReporter
local FFlagAXEnableInspectAndBuyVersionAnalyticsModule = require(script.Parent.Parent.Flags.FFlagAXEnableInspectAndBuyVersionAnalytics)
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local UnifiedLoggingSurface = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local ItemTypeEnum = require(CorePackages.Workspace.Packages.AvatarExperienceModel).Enums.ItemTypeEnum
local TIMEDOPTIONBYDAYS = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Constants.TIMED_OPTION_BY_DAYS
local AXUnifiedEventFilter = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).AXUnifiedEventFilter
local UnifiedEventCounterAggregator = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventCounterAggregator
local FFlagAXUnifiedEventCounters = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXUnifiedEventCounters
local AnalyticsModule = {}
AnalyticsModule.__index = AnalyticsModule

function AnalyticsModule.__tostring(): string
	return "Service(Analytics)"
end

function AnalyticsModule.new(InspecteeUid, Ctx, p1)
	-- upvalues: AnalyticsModule (copy), EventStreamReporter (copy), Default (copy), Players (copy), FFlagAXEnableInspectAndBuyVersionAnalyticsModule (copy), UnifiedEventLogEnums (copy), TIMEDOPTIONBYDAYS (copy), ItemTypeEnum (copy), UserInputService (copy), HttpService (copy), RunService (copy), RbxAnalyticsService (copy)
	local t = {}
	setmetatable(t, AnalyticsModule)
	t.eventStream = EventStreamReporter.new(Default)
	t.pid = tostring(game.PlaceId)
	t.uid = tostring(Players.LocalPlayer.UserId)
	t.feature = "inspectAndBuy"
	t.inspecteeUid = InspecteeUid
	t.ctx = Ctx
	t.version = if FFlagAXEnableInspectAndBuyVersionAnalyticsModule then p1 else nil
	
	function t.reportOpenInspectMenu()
		-- upvalues: t (copy)
		t:report("inspectUser", {})
	end
	
	function t.reportTryOnButtonClicked(ItemType, ItemID)
		-- upvalues: t (copy)
		t:report("tryItem", { itemType = ItemType, itemID = ItemID })
	end
	
	function t.reportFavoriteItem(ItemType, ItemID, Favorite, Success, FailureReason, FavoriteCount)
		-- upvalues: t (copy)
		t:report("favoriteItem", {
			itemType = ItemType,
			itemID = ItemID,
			favorite = Favorite,
			success = Success,
			failureReason = FailureReason,
			favoriteCount = FavoriteCount
		})
	end
	
	function t.reportPurchaseAttempt(ItemType, ItemID)
		-- upvalues: t (copy)
		t:report("purchaseAttemptItem", { itemType = ItemType, itemID = ItemID })
	end
	
	function t.reportPurchaseAttemptUnifiedEvent(ItemType, ItemID, p2)
		-- upvalues: t (copy), UnifiedEventLogEnums (upval), TIMEDOPTIONBYDAYS (upval), ItemTypeEnum (upval)
		t:reportUnifiedEvent({
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
			itemId = ItemID,
			itemType = ItemType,
			organicTimedOption = if p2.timedOptionDays == nil then nil else TIMEDOPTIONBYDAYS[p2.timedOptionDays],
			assetType = if ItemType == ItemTypeEnum.Asset then p2.itemSubType else nil,
			bundleType = if ItemType == ItemTypeEnum.Bundle then p2.itemSubType else nil,
			organicItemPrice = p2.price or 0
		})
		t:report("purchaseAttemptItem", { itemType = ItemType, itemID = ItemID })
	end
	
	function t.reportPurchaseSuccessUnifiedEvent(ItemType, ItemID, p2)
		-- upvalues: t (copy), UnifiedEventLogEnums (upval), TIMEDOPTIONBYDAYS (upval), ItemTypeEnum (upval)
		t:reportUnifiedEvent({
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_SUCCESS,
			itemId = ItemID,
			itemType = ItemType,
			organicTimedOption = if p2.timedOptionDays == nil then nil else TIMEDOPTIONBYDAYS[p2.timedOptionDays],
			assetType = if ItemType == ItemTypeEnum.Asset then p2.itemSubType else nil,
			bundleType = if ItemType == ItemTypeEnum.Bundle then p2.itemSubType else nil,
			organicItemPrice = p2.price or 0
		})
		t:report("purchaseSuccessItem", { itemType = ItemType, itemID = ItemID })
	end
	
	function t.reportPurchaseSuccess(ItemType, ItemID)
		-- upvalues: t (copy)
		t:report("purchaseSuccessItem", { itemType = ItemType, itemID = ItemID })
	end
	
	function t.reportItemDetailPageOpened(ItemType, ItemID)
		-- upvalues: t (copy)
		t:report("itemDetailView", { itemType = ItemType, itemID = ItemID })
	end
	
	t.platformStr = (function(): string
		-- upvalues: UserInputService (upval), HttpService (upval)
		local Platform = UserInputService:GetPlatform()
		local Amazon = "Unknown"
		
		if Platform == Enum.Platform.Windows then
			Amazon = "Windows"
			
			return Amazon
		end
		if Platform == Enum.Platform.OSX then
			Amazon = "OSX"
			
			return Amazon
		end
		if Platform == Enum.Platform.IOS then
			Amazon = "IOS"
			
			return Amazon
		end
		if Platform == Enum.Platform.Android then
			local UserAgent: string = HttpService:GetUserAgent()
			Amazon = if string.find(UserAgent, "AmazonAppStore") then "Amazon" else "Android"
			
			if string.find(UserAgent, "OculusQuest3Store") then
				Amazon = "Quest"
				
				return Amazon
			end
		else
			if Platform == Enum.Platform.XBoxOne or Platform == Enum.Platform.XBox360 then
				Amazon = "XBox"
				
				return Amazon
			end
			if Platform == Enum.Platform.UWP then
				Amazon = "UWP"
				
				return Amazon
			end
			if Platform == Enum.Platform.PS4 or Platform == Enum.Platform.PS3 or Platform == Enum.Platform.PS5 then
				Amazon = "PlayStation"
			end
		end
		return Amazon
	end)()
	
	function t.sendCounter(Text)
		-- upvalues: RunService (upval), t (copy), RbxAnalyticsService (upval)
		if not RunService:IsStudio() then
			RbxAnalyticsService:ReportCounter("inspectAndBuy" .. "_" .. t.platformStr .. "_" .. Text)
			
			return
		end
	end
	
	return t
end

function AnalyticsModule:report(p1, p2)
	-- upvalues: FFlagAXEnableInspectAndBuyVersionAnalyticsModule (copy), CryoModule (copy)
	self.eventStream:sendTelemetryEvent(self.ctx, p1, (CryoModule.Dictionary.join({
		feature = "inspectAndBuy",
		event_sender_api = 2,
		pid = self.pid,
		uid = self.uid,
		inspecteeUid = self.inspecteeUid,
		inspectAndBuyVersion = if FFlagAXEnableInspectAndBuyVersionAnalyticsModule then self.version else nil
	}, p2)))
end

function AnalyticsModule:reportUnifiedEvent(p1)
	-- upvalues: UnifiedLoggingSurface (copy), CryoModule (copy), FFlagAXUnifiedEventCounters (copy), UnifiedEventCounterAggregator (copy), AXUnifiedEventFilter (copy), UnifiedEventLogConstants (copy)
	local JoinResult = CryoModule.Dictionary.join({
		surface = UnifiedLoggingSurface.IN_EXPERIENCE_INSPECT_BUY
	}, p1)
	
	if FFlagAXUnifiedEventCounters then
		UnifiedEventCounterAggregator.record(JoinResult, AXUnifiedEventFilter.filter(JoinResult, { skipReporting = true }))
	end
	self.eventStream:sendTelemetryEvent(self.ctx, UnifiedEventLogConstants.EVENT_NAME, JoinResult)
end

return AnalyticsModule