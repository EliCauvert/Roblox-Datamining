local CorePackages = game:GetService("CorePackages")
local Shell = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local EventStream = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local UserInteractionsFunction = require(CorePackages.Workspace.Packages.Analytics).Events.userInteractions
local PageHeartbeatFunction = require(CorePackages.Workspace.Packages.Analytics).Events.pageHeartbeat
local ContentHistoryModule = require(Shell.XboxPrimaryNav:FindFirstChild("contentHistory"))
local XboxPrimaryNavIXPTestModule = require(Shell.Experiment.XboxPrimaryNavIXPTest)
local GetFIntXboxPrimaryNavABLoggingModule = require(Shell.Flags.GetFIntXboxPrimaryNavABLogging)
local RbxAnalyticsService = nil
pcall(function() --[[ Line: 22 ]]
	-- upvalues: RbxAnalyticsService (ref)
	RbxAnalyticsService = game:GetService("RbxAnalyticsService")
end)
local EventIngestService = game:GetService("EventIngestService")
local UserInputService = game:GetService("UserInputService")
local NewEventStream = EventStream.new(RbxAnalyticsService)
local config = { TenFoot = "tenFoot", Classic = "classic" }

local function _(): string --[[ Line: 35 | Named "getNavigationVersion" ]]
	-- upvalues: XboxPrimaryNavIXPTestModule (copy)
	return if XboxPrimaryNavIXPTestModule.isUserEnrolled() then "tenFoot" else "classic"
end

local _ = function(p1, p2) --[[ Line: 44 | Named "setRBXEvent" ]]
	-- upvalues: UserInputService (copy), EventIngestService (copy)
	local v1 = nil
	local v2 = nil
	local Success, _ = pcall(function() --[[ Line: 46 ]]
		-- upvalues: UserInputService (upval), v1 (ref), v2 (ref), p1 (ref), p2 (ref), EventIngestService (upval)
		if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
			v1 = "console"
			v2 = "XboxOne"
			p1 = p1 or ""
			p2 = p2 or {}
			EventIngestService:SetRBXEvent(v1, v2, p1, p2)
		end
	end)
	
	return Success
end

local _ = function(p1, p2) --[[ Line: 59 | Named "setRBXEventStream" ]]
	-- upvalues: UserInputService (copy), EventIngestService (copy)
	local v1 = nil
	local v2 = nil
	local Success, _ = pcall(function() --[[ Line: 61 ]]
		-- upvalues: UserInputService (upval), v1 (ref), v2 (ref), p1 (ref), p2 (ref), EventIngestService (upval)
		if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
			v1 = "console"
			v2 = "XboxOne"
			p1 = p1 or ""
			p2 = p2 or {}
			EventIngestService:SetRBXEventStream(v1, v2, p1, p2)
		end
	end)
	
	return Success
end

local _ = function(_) --[[ Line: 74 | Named "releaseRBXEventStream" ]]
	-- upvalues: UserInputService (copy), RbxAnalyticsService (ref)
	local v1 = nil
	local Success, _ = pcall(function() --[[ Line: 76 ]]
		-- upvalues: UserInputService (upval), v1 (ref), RbxAnalyticsService (upval)
		if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
			v1 = "console"
			RbxAnalyticsService:ReleaseRBXEventStream(v1)
		end
	end)
	
	return Success
end

local _ = function(p1) --[[ Line: 86 | Named "updateHeartbeatObject" ]]
	-- upvalues: RbxAnalyticsService (ref)
	local Success, _ = pcall(function() --[[ Line: 87 ]]
		-- upvalues: RbxAnalyticsService (upval), p1 (copy)
		RbxAnalyticsService:UpdateHeartbeatObject(p1)
	end)
	
	return Success
end

local _ = function(p1, p2) --[[ Line: 94 | Named "reportCounter" ]]
	-- upvalues: UserInputService (copy), RbxAnalyticsService (ref)
	local Success, _ = pcall(function() --[[ Line: 95 ]]
		-- upvalues: UserInputService (upval), p1 (ref), p2 (ref), RbxAnalyticsService (upval)
		if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
			p1 = p1 or ""
			p1 = "Xbox-" .. tostring(p1)
			p2 = p2 or 1
			RbxAnalyticsService:ReportCounter(p1, p2)
		end
	end)
	
	return Success
end

local function reportNavigationLoaded(ToContent) --[[ Line: 153 ]]
	-- upvalues: ContentHistoryModule (copy), XboxPrimaryNavIXPTestModule (copy), config (copy), UserInputService (copy), EventIngestService (copy), GetFIntXboxPrimaryNavABLoggingModule (copy)
	local LastContentName = ContentHistoryModule:getLastContentName()
	
	if ToContent ~= LastContentName then
		local v1 = "NavigationLoaded"
		local config1 = {
			toContent = ToContent,
			fromContent = LastContentName,
			navigationVersion = if XboxPrimaryNavIXPTestModule.isUserEnrolled() then config.TenFoot else config.Classic
		}
		local v2 = nil
		local v3 = nil
		local _, _ = pcall(function() --[[ Line: 61 ]]
			-- upvalues: UserInputService (upval), v2 (ref), v3 (ref), v1 (ref), config1 (ref), EventIngestService (upval)
			if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
				v2 = "console"
				v3 = "XboxOne"
				v1 = v1 or ""
				config1 = config1 or {}
				EventIngestService:SetRBXEventStream(v2, v3, v1, config1)
			end
		end)
		
		if GetFIntXboxPrimaryNavABLoggingModule() > 1 then
			print("[ANALYTICS] NavigationLoaded ContentName:", ToContent, "| PrevContentName:", LastContentName, "| NavigationVersion:", if XboxPrimaryNavIXPTestModule.isUserEnrolled() then config.TenFoot else config.Classic)
		end
	end
end

local config1 = {
	WidgetId = "WidgetName",
	AppHubId = "AppHub",
	AvatarEditorScreenId = "AvatarEditorScreen",
	AvatarPaneId = "AvatarPane",
	AvatarTileId = "AvatarTile",
	BadgeOverlayId = "BadgeOverlay",
	BaseCarouselScreenId = "BaseCarouselScreen",
	BaseOverlayId = "BaseOverlay",
	BaseTileId = "BaseTile",
	ConfirmPromptId = "ConfirmPrompt",
	DisableCrossplayOverlayId = "DisableCrossplayOverlay",
	EnableCrossplayOverlayId = "EnableCrossplayOverlay",
	EngagementScreenId = "EngagementScreen",
	ErrorOverlayId = "ErrorOverlay",
	GameDetailId = "GameDetail",
	GameGenreScreenId = "GameGenreScreen",
	GamesPaneId = "GamesPane",
	GameSearchScreenId = "GameSearchScreen",
	HomePaneId = "HomePane",
	ImageOverlayId = "ImageOverlay",
	LinkAccountScreenId = "LinkAccountScreen",
	NoActionOverlayId = "NoActionOverlay",
	OutfitTileId = "OutfitTile",
	OverscanScreenId = "OverscanScreen",
	PurchasePackagePromptId = "PurchasePackagePrompt",
	ReportOverlayId = "ReportOverlay",
	RobuxBalanceOverlayId = "RobuxBalanceOverlay",
	SetAccountCredentialsScreenId = "SetAccountCredentialsScreen",
	SettingsScreenId = "SettingsScreen",
	SideBarId = "SideBar",
	SignInScreenId = "SignInScreen",
	SocialPaneId = "SocialPane",
	StorePaneId = "StorePane",
	TabDockId = "TabDock",
	UnlinkAccountOverlayId = "UnlinkAccountOverlay",
	UnlinkAccountScreenId = "UnlinkAccountScreen",
	TwoFactorScreen = "TwoFactorScreen",
	CrossDeviceLoginScreen = "CrossDeviceLoginScreen",
	StoreScreenId = "StoreScreen",
	SearchScreenId = "SearchScreen",
	PartyUiId = "PartyUi"
}
local config2 = {
	HomeId = "HomeTab",
	AvatarId = "AvatarTab",
	DiscoverId = "DiscoverTab",
	FriendsId = "FriendsTab",
	StoreId = "StoreTab",
	SearchId = "SearchTab",
	SettingsId = "SettingsTab"
}

return {
	SetRBXEvent = function(EventName, Target) --[[ Line: 108 ]]
		-- upvalues: UserInputService (copy), EventIngestService (copy)
		local EventName1 = EventName
		local AdditionalArgs = Target
		local Target1 = nil
		local EventContext = nil
		local _, _ = pcall(function() --[[ Line: 46 ]]
			-- upvalues: UserInputService (upval), Target1 (ref), EventContext (ref), EventName1 (ref), AdditionalArgs (ref), EventIngestService (upval)
			if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
				Target1 = "console"
				EventContext = "XboxOne"
				EventName1 = EventName1 or ""
				AdditionalArgs = AdditionalArgs or {}
				EventIngestService:SetRBXEvent(Target1, EventContext, EventName1, AdditionalArgs)
			end
		end)
	end,
	SetRBXEventStream = function(p1, Target) --[[ Line: 113 ]]
		-- upvalues: UserInputService (copy), EventIngestService (copy)
		local v1 = p1
		local Target1 = Target
		local v2 = nil
		local v3 = nil
		local _, _ = pcall(function() --[[ Line: 61 ]]
			-- upvalues: UserInputService (upval), v2 (ref), v3 (ref), v1 (ref), Target1 (ref), EventIngestService (upval)
			if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
				v2 = "console"
				v3 = "XboxOne"
				v1 = v1 or ""
				Target1 = Target1 or {}
				EventIngestService:SetRBXEventStream(v2, v3, v1, Target1)
			end
		end)
	end,
	UpdateHeartbeatObject = function(p1) --[[ Line: 117 ]]
		-- upvalues: RbxAnalyticsService (ref)
		local _, _ = pcall(function() --[[ Line: 87 ]]
			-- upvalues: RbxAnalyticsService (upval), p1 (copy)
			RbxAnalyticsService:UpdateHeartbeatObject(p1)
		end)
	end,
	ReportCounter = function(CounterName, CounterName1) --[[ Line: 122 ]]
		-- upvalues: UserInputService (copy), RbxAnalyticsService (ref)
		local Text = CounterName
		local Amount = CounterName1
		local _, _ = pcall(function() --[[ Line: 95 ]]
			-- upvalues: UserInputService (upval), Text (ref), Amount (ref), RbxAnalyticsService (upval)
			if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
				Text = Text or ""
				Text = "Xbox-" .. tostring(Text)
				Amount = Amount or 1
				RbxAnalyticsService:ReportCounter(Text, Amount)
			end
		end)
	end,
	reportPageChanged = function() --[[ Line: 126 ]]
		-- upvalues: UserInteractionsFunction (copy), NewEventStream (copy)
		UserInteractionsFunction(NewEventStream, "luaPage")
	end,
	reportPageHeartbeat = function(p1, p2) --[[ Line: 131 ]]
		-- upvalues: PageHeartbeatFunction (copy), NewEventStream (copy)
		PageHeartbeatFunction(NewEventStream, p1, p2)
	end,
	reportNavigation = function(ActivationType, ToContent, ContentType) --[[ Line: 135 ]]
		-- upvalues: ContentHistoryModule (copy), XboxPrimaryNavIXPTestModule (copy), config (copy), UserInputService (copy), EventIngestService (copy), GetFIntXboxPrimaryNavABLoggingModule (copy)
		local LastContentName = ContentHistoryModule:getLastContentName()
		
		if ToContent ~= LastContentName then
			local v1 = "Navigation"
			local config1 = {
				activationType = ActivationType,
				toContent = ToContent,
				fromContent = LastContentName,
				contentType = ContentType,
				navigationVersion = if XboxPrimaryNavIXPTestModule.isUserEnrolled() then config.TenFoot else config.Classic
			}
			local v2 = nil
			local v3 = nil
			local _, _ = pcall(function() --[[ Line: 61 ]]
				-- upvalues: UserInputService (upval), v2 (ref), v3 (ref), v1 (ref), config1 (ref), EventIngestService (upval)
				if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
					v2 = "console"
					v3 = "XboxOne"
					v1 = v1 or ""
					config1 = config1 or {}
					EventIngestService:SetRBXEventStream(v2, v3, v1, config1)
				end
			end)
			
			if GetFIntXboxPrimaryNavABLoggingModule() > 1 then
				print("[ANALYTICS] Navigation", "ActivationType:", ActivationType, "| ContentName:", ToContent, "| ContentType:", ContentType, "| PrevContentName:", LastContentName, "| NavigationVersion:", if XboxPrimaryNavIXPTestModule.isUserEnrolled() then config.TenFoot else config.Classic)
			end
		end
	end,
	reportNavigationLoaded = function(ToContent) --[[ Line: 174 ]]
		-- upvalues: XboxPrimaryNavIXPTestModule (copy), reportNavigationLoaded (copy)
		if XboxPrimaryNavIXPTestModule.isUserEnrolled() then
			reportNavigationLoaded(ToContent)
			
			return
		else
			spawn(function() --[[ Line: 178 ]]
				-- upvalues: reportNavigationLoaded (upval), ToContent (copy)
				reportNavigationLoaded(ToContent)
			end)
		end
	end,
	reportBackNavigation = function(FromContent) --[[ Line: 182 ]]
		-- upvalues: ContentHistoryModule (copy), XboxPrimaryNavIXPTestModule (copy), config (copy), UserInputService (copy), EventIngestService (copy), GetFIntXboxPrimaryNavABLoggingModule (copy)
		local LastContentName = ContentHistoryModule:getLastContentName()
		local EventName = "NavigationBack"
		local config1 = {
			fromContent = FromContent,
			toContent = LastContentName,
			navigationVersion = if XboxPrimaryNavIXPTestModule.isUserEnrolled() then config.TenFoot else config.Classic
		}
		local Target = nil
		local EventContext = nil
		local _, _ = pcall(function() --[[ Line: 61 ]]
			-- upvalues: UserInputService (upval), Target (ref), EventContext (ref), EventName (ref), config1 (ref), EventIngestService (upval)
			if UserInputService:GetPlatform() == Enum.Platform.XBoxOne then
				Target = "console"
				EventContext = "XboxOne"
				EventName = EventName or ""
				config1 = config1 or {}
				EventIngestService:SetRBXEventStream(Target, EventContext, EventName, config1)
			end
		end)
		
		if GetFIntXboxPrimaryNavABLoggingModule() > 1 then
			print("[ANALYTICS] NavigationBack FromContent:", FromContent, "| ToContent:", LastContentName, "| NavigationVersion:", if XboxPrimaryNavIXPTestModule.isUserEnrolled() then config.TenFoot else config.Classic)
		end
	end,
	WidgetNames = function(p1) --[[ Line: 251 ]]
		-- upvalues: config1 (copy)
		return (if config1 then config1[p1] else config1) or p1
	end,
	TabNames = function(p1) --[[ Line: 259 ]]
		-- upvalues: config2 (copy)
		return (if config2 then config2[p1] else config2) or p1
	end
}