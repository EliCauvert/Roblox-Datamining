local corePackagesService = game:GetService("CorePackages")
local shell = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local eventStream = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local userInteractions = require(corePackagesService.Workspace.Packages.Analytics).Events.userInteractions
local pageHeartbeat = require(corePackagesService.Workspace.Packages.Analytics).Events.pageHeartbeat
local contentHistoryModule = require(shell.XboxPrimaryNav:FindFirstChild("contentHistory"))
local xboxPrimaryNavIXPTestModule = require(shell.Experiment.XboxPrimaryNavIXPTest)
local getFIntXboxPrimaryNavABLoggingModule = require(shell.Flags.GetFIntXboxPrimaryNavABLogging)
local var5 = nil
pcall(function() --[[ line: 22 ]]
	-- upvalues: var5 (write)
	var5 = game:GetService("RbxAnalyticsService")
end)
local eventIngestService = game:GetService("EventIngestService")
local userInputService = game:GetService("UserInputService")
local var8 = eventStream.new(var5)
local t = {
	SetRBXEvent = function(value, p0) --[[ line: 108 ]]
		-- upvalues: userInputService (ref), eventIngestService (ref)
		local var14 = value
		local var15 = p0
		local var16 = nil
		local var17 = nil
		local _, _ = pcall(function() --[[ line: 46 ]]
			-- upvalues: userInputService (copy), var16 (write), var17 (write), var14 (write), var15 (write), eventIngestService (copy)
			if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
				var16 = "console"
				var17 = "XboxOne"
				var14 = var14 or ""
				var15 = var15 or {}
				eventIngestService:SetRBXEvent(var16, var17, var14, var15)
			end
		end)
	end,
	SetRBXEventStream = function(value, p1) --[[ line: 113 ]]
		-- upvalues: userInputService (ref), eventIngestService (ref)
		local var18 = value
		local var19 = p1
		local var20 = nil
		local var21 = nil
		local _, _ = pcall(function() --[[ line: 61 ]]
			-- upvalues: userInputService (copy), var20 (write), var21 (write), var18 (write), var19 (write), eventIngestService (copy)
			if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
				var20 = "console"
				var21 = "XboxOne"
				var18 = var18 or ""
				var19 = var19 or {}
				eventIngestService:SetRBXEventStream(var20, var21, var18, var19)
			end
		end)
	end,
	UpdateHeartbeatObject = function(p2) --[[ line: 117 ]]
		-- upvalues: var5 (write)
		local _, _ = pcall(function() --[[ line: 87 ]]
			-- upvalues: var5 (copy), p2 (ref)
			var5:UpdateHeartbeatObject(p2)
		end)
	end,
	ReportCounter = function(p3, p4) --[[ line: 122 ]]
		-- upvalues: userInputService (ref), var5 (write)
		local var22 = p3
		local var23 = p4
		local _, _ = pcall(function() --[[ line: 95 ]]
			-- upvalues: userInputService (copy), var22 (write), var23 (write), var5 (copy)
			if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
				var22 = var22 or ""
				var22 = "Xbox-" .. tostring(var22)
				var23 = var23 or 1
				var5:ReportCounter(var22, var23)
			end
		end)
	end,
	reportPageChanged = function() --[[ line: 126 ]]
		-- upvalues: userInteractions (ref), var8 (ref)
		userInteractions(var8, "luaPage")
	end,
	reportPageHeartbeat = function(p5, p6) --[[ line: 131 ]]
		-- upvalues: pageHeartbeat (ref), var8 (ref)
		pageHeartbeat(var8, p5, p6)
	end
}
local t_1 = { TenFoot = "tenFoot", Classic = "classic" }

local function _() --[[ line: 35 | named "getNavigationVersion" ]]
	-- upvalues: xboxPrimaryNavIXPTestModule (ref)
	return if xboxPrimaryNavIXPTestModule.isUserEnrolled() then "tenFoot" else "classic"
end

local _ = function(value, p7) --[[ line: 44 | named "setRBXEvent" ]]
	-- upvalues: userInputService (ref), eventIngestService (ref)
	local var24 = nil
	local var25 = nil
	local ok, _ = pcall(function() --[[ line: 46 ]]
		-- upvalues: userInputService (copy), var24 (write), var25 (write), value (write), p7 (write), eventIngestService (copy)
		if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			var16 = "console"
			var17 = "XboxOne"
			value = value or ""
			p7 = p7 or {}
			eventIngestService:SetRBXEvent(var16, var17, value, p7)
		end
	end)
	
	return ok
end

local _ = function(value, p8) --[[ line: 59 | named "setRBXEventStream" ]]
	-- upvalues: userInputService (ref), eventIngestService (ref)
	local var26 = nil
	local var27 = nil
	local ok, _ = pcall(function() --[[ line: 61 ]]
		-- upvalues: userInputService (copy), var26 (write), var27 (write), value (write), p8 (write), eventIngestService (copy)
		if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			var20 = "console"
			var21 = "XboxOne"
			var18 = var18 or ""
			p8 = p8 or {}
			eventIngestService:SetRBXEventStream(var20, var21, var18, p8)
		end
	end)
	
	return ok
end

local _ = function(_) --[[ line: 74 | named "releaseRBXEventStream" ]]
	-- upvalues: userInputService (ref), var5 (write)
	local var28 = nil
	local ok, _ = pcall(function() --[[ line: 76 ]]
		-- upvalues: userInputService (copy), var28 (write), var5 (copy)
		if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			var28 = "console"
			var5:ReleaseRBXEventStream(var28)
		end
	end)
	
	return ok
end

local _ = function(p9) --[[ line: 86 | named "updateHeartbeatObject" ]]
	-- upvalues: var5 (write)
	local ok, _ = pcall(function() --[[ line: 87 ]]
		-- upvalues: var5 (copy), p9 (ref)
		var5:UpdateHeartbeatObject(p9)
	end)
	
	return ok
end

local _ = function(p10, p11) --[[ line: 94 | named "reportCounter" ]]
	-- upvalues: userInputService (ref), var5 (write)
	local ok, _ = pcall(function() --[[ line: 95 ]]
		-- upvalues: userInputService (copy), p10 (write), p11 (write), var5 (copy)
		if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			var22 = var22 or ""
			var22 = "Xbox-" .. tostring(var22)
			p11 = p11 or 1
			var5:ReportCounter(var22, p11)
		end
	end)
	
	return ok
end

function t.reportNavigation(p12, p13, p14) --[[ line: 135 ]]
	-- upvalues: contentHistoryModule (ref), xboxPrimaryNavIXPTestModule (ref), t_1 (ref), userInputService (ref), eventIngestService (ref), getFIntXboxPrimaryNavABLoggingModule (ref)
	local lastContentName = contentHistoryModule:getLastContentName()
	
	if p13 ~= lastContentName then
		local var30 = "Navigation"
		local t = {
			activationType = p12,
			toContent = p13,
			fromContent = lastContentName,
			contentType = p14,
			navigationVersion = if xboxPrimaryNavIXPTestModule.isUserEnrolled() then t_1.TenFoot else t_1.Classic
		}
		local var32 = nil
		local var33 = nil
		local _, _ = pcall(function() --[[ line: 61 ]]
			-- upvalues: userInputService (copy), var32 (write), var33 (write), var30 (write), t (write), eventIngestService (copy)
			if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
				var20 = "console"
				var21 = "XboxOne"
				var18 = var18 or ""
				p8 = p8 or {}
				eventIngestService:SetRBXEventStream(var20, var21, var18, p8)
			end
		end)
		
		if getFIntXboxPrimaryNavABLoggingModule() > 1 then
			print("[ANALYTICS] Navigation", "ActivationType:", p12, "| ContentName:", p13, "| ContentType:", p14, "| PrevContentName:", lastContentName, "| NavigationVersion:", if xboxPrimaryNavIXPTestModule.isUserEnrolled() then t_1.TenFoot else t_1.Classic)
		end
	end
end

local function reportNavigationLoaded(p15) --[[ line: 153 ]]
	-- upvalues: contentHistoryModule (ref), xboxPrimaryNavIXPTestModule (ref), t_1 (ref), userInputService (ref), eventIngestService (ref), getFIntXboxPrimaryNavABLoggingModule (ref)
	local lastContentName = contentHistoryModule:getLastContentName()
	
	if p15 ~= lastContentName then
		local var35 = "NavigationLoaded"
		local t = {
			toContent = p15,
			fromContent = lastContentName,
			navigationVersion = if xboxPrimaryNavIXPTestModule.isUserEnrolled() then t_1.TenFoot else t_1.Classic
		}
		local var37 = nil
		local var38 = nil
		local _, _ = pcall(function() --[[ line: 61 ]]
			-- upvalues: userInputService (copy), var37 (write), var38 (write), var35 (write), t (write), eventIngestService (copy)
			if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
				var20 = "console"
				var21 = "XboxOne"
				var18 = var18 or ""
				p8 = p8 or {}
				eventIngestService:SetRBXEventStream(var20, var21, var18, p8)
			end
		end)
		
		if getFIntXboxPrimaryNavABLoggingModule() > 1 then
			print("[ANALYTICS] NavigationLoaded ContentName:", p15, "| PrevContentName:", lastContentName, "| NavigationVersion:", if xboxPrimaryNavIXPTestModule.isUserEnrolled() then t_1.TenFoot else t_1.Classic)
		end
	end
end

function t.reportNavigationLoaded(p16) --[[ line: 174 ]]
	-- upvalues: xboxPrimaryNavIXPTestModule (ref), reportNavigationLoaded (ref)
	if xboxPrimaryNavIXPTestModule.isUserEnrolled() then
		reportNavigationLoaded(p16)
		
		return
	end
	spawn(function() --[[ line: 178 ]]
		-- upvalues: reportNavigationLoaded (copy), p16 (ref)
		reportNavigationLoaded(p16)
	end)
end

function t.reportBackNavigation(p17) --[[ line: 182 ]]
	-- upvalues: contentHistoryModule (ref), xboxPrimaryNavIXPTestModule (ref), t_1 (ref), userInputService (ref), eventIngestService (ref), getFIntXboxPrimaryNavABLoggingModule (ref)
	local lastContentName = contentHistoryModule:getLastContentName()
	local var40 = "NavigationBack"
	local t = {
		fromContent = p17,
		toContent = lastContentName,
		navigationVersion = if xboxPrimaryNavIXPTestModule.isUserEnrolled() then t_1.TenFoot else t_1.Classic
	}
	local var42 = nil
	local var43 = nil
	local _, _ = pcall(function() --[[ line: 61 ]]
		-- upvalues: userInputService (copy), var42 (write), var43 (write), var40 (write), t (write), eventIngestService (copy)
		if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			var20 = "console"
			var21 = "XboxOne"
			var18 = var18 or ""
			p8 = p8 or {}
			eventIngestService:SetRBXEventStream(var20, var21, var18, p8)
		end
	end)
	
	if getFIntXboxPrimaryNavABLoggingModule() > 1 then
		print("[ANALYTICS] NavigationBack FromContent:", p17, "| ToContent:", lastContentName, "| NavigationVersion:", if xboxPrimaryNavIXPTestModule.isUserEnrolled() then t_1.TenFoot else t_1.Classic)
	end
end

local t_2 = {
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
local t_3 = {
	HomeId = "HomeTab",
	AvatarId = "AvatarTab",
	DiscoverId = "DiscoverTab",
	FriendsId = "FriendsTab",
	StoreId = "StoreTab",
	SearchId = "SearchTab",
	SettingsId = "SettingsTab"
}

function t.WidgetNames(p18) --[[ line: 251 ]]
	-- upvalues: t_2 (ref)
	return t_2 and t_2[p18] or p18
end

function t.TabNames(p19) --[[ line: 259 ]]
	-- upvalues: t_3 (ref)
	return t_3 and t_3[p19] or p19
end

return t