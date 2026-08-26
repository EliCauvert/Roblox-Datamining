local corePackagesService = game:GetService("CorePackages")
local shell = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local eventStream = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local userInteractions = require(corePackagesService.Workspace.Packages.Analytics).Events.userInteractions
local pageHeartbeat = require(corePackagesService.Workspace.Packages.Analytics).Events.pageHeartbeat
local contentHistoryModule = require(shell.XboxPrimaryNav:FindFirstChild("contentHistory"))
local xboxPrimaryNavIXPTestModule = require(shell.Experiment.XboxPrimaryNavIXPTest)
local getFIntXboxPrimaryNavABLoggingModule = require(shell.Flags.GetFIntXboxPrimaryNavABLogging)
local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = game:GetService("RbxAnalyticsService")
end)
local eventIngestService = game:GetService("EventIngestService")
local userInputService = game:GetService("UserInputService")
local var2 = eventStream.new(var1)
local t = {
	SetRBXEvent = function(value, p1)
		-- upvalues: userInputService (ref), eventIngestService (ref)
		local var3 = value
		local var4 = p1
		local var5 = nil
		local var6 = nil
		local _, _ = pcall(function()
			-- upvalues: userInputService (copy), var5 (write), var6 (write), var3 (write), var4 (write), eventIngestService (copy)
			if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
				var5 = "console"
				var6 = "XboxOne"
				var3 = var3 or ""
				var4 = var4 or {}
				eventIngestService:SetRBXEvent(var5, var6, var3, var4)
			end
		end)
	end,
	SetRBXEventStream = function(value, p1)
		-- upvalues: userInputService (ref), eventIngestService (ref)
		local var3 = value
		local var4 = p1
		local var5 = nil
		local var6 = nil
		local _, _ = pcall(function()
			-- upvalues: userInputService (copy), var5 (write), var6 (write), var3 (write), var4 (write), eventIngestService (copy)
			if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
				var5 = "console"
				var6 = "XboxOne"
				var3 = var3 or ""
				var4 = var4 or {}
				eventIngestService:SetRBXEventStream(var5, var6, var3, var4)
			end
		end)
	end,
	UpdateHeartbeatObject = function(p1)
		-- upvalues: var1 (write)
		local _, _ = pcall(function()
			-- upvalues: var1 (copy), p1 (ref)
			var1:UpdateHeartbeatObject(p1)
		end)
	end,
	ReportCounter = function(p1, p2)
		-- upvalues: userInputService (ref), var1 (write)
		local var3 = p1
		local var4 = p2
		local _, _ = pcall(function()
			-- upvalues: userInputService (copy), var3 (write), var4 (write), var1 (copy)
			if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
				var3 = var3 or ""
				var3 = "Xbox-" .. tostring(var3)
				var4 = var4 or 1
				var1:ReportCounter(var3, var4)
			end
		end)
	end,
	reportPageChanged = function()
		-- upvalues: userInteractions (ref), var2 (ref)
		userInteractions(var2, "luaPage")
	end,
	reportPageHeartbeat = function(p1, p2)
		-- upvalues: pageHeartbeat (ref), var2 (ref)
		pageHeartbeat(var2, p1, p2)
	end
}
local t_1 = { TenFoot = "tenFoot", Classic = "classic" }

local function _()
	-- upvalues: xboxPrimaryNavIXPTestModule (ref)
	return if xboxPrimaryNavIXPTestModule.isUserEnrolled() then "tenFoot" else "classic"
end

local _ = function(value, p1)
	-- upvalues: userInputService (ref), eventIngestService (ref)
	local var3 = nil
	local var4 = nil
	local ok, _ = pcall(function()
		-- upvalues: userInputService (copy), var3 (write), var4 (write), value (write), p1 (write), eventIngestService (copy)
		if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			var16 = "console"
			var17 = "XboxOne"
			value = value or ""
			p1 = p1 or {}
			eventIngestService:SetRBXEvent(var16, var17, value, p1)
		end
	end)
	
	return ok
end

local _ = function(value, p1)
	-- upvalues: userInputService (ref), eventIngestService (ref)
	local var3 = nil
	local var4 = nil
	local ok, _ = pcall(function()
		-- upvalues: userInputService (copy), var3 (write), var4 (write), value (write), p1 (write), eventIngestService (copy)
		if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			var20 = "console"
			var21 = "XboxOne"
			var18 = var18 or ""
			p1 = p1 or {}
			eventIngestService:SetRBXEventStream(var20, var21, var18, p1)
		end
	end)
	
	return ok
end

local _ = function(_)
	-- upvalues: userInputService (ref), var1 (write)
	local var3 = nil
	local ok, _ = pcall(function()
		-- upvalues: userInputService (copy), var3 (write), var1 (copy)
		if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			var3 = "console"
			var1:ReleaseRBXEventStream(var3)
		end
	end)
	
	return ok
end

local _ = function(p1)
	-- upvalues: var1 (write)
	local ok, _ = pcall(function()
		-- upvalues: var1 (copy), p1 (ref)
		var1:UpdateHeartbeatObject(p1)
	end)
	
	return ok
end

local _ = function(p1, p2)
	-- upvalues: userInputService (ref), var1 (write)
	local ok, _ = pcall(function()
		-- upvalues: userInputService (copy), p1 (write), p2 (write), var1 (copy)
		if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			var22 = var22 or ""
			var22 = "Xbox-" .. tostring(var22)
			p2 = p2 or 1
			var1:ReportCounter(var22, p2)
		end
	end)
	
	return ok
end

function t.reportNavigation(p1, p2, p3)
	-- upvalues: contentHistoryModule (ref), xboxPrimaryNavIXPTestModule (ref), t_1 (ref), userInputService (ref), eventIngestService (ref), getFIntXboxPrimaryNavABLoggingModule (ref)
	local lastContentName = contentHistoryModule:getLastContentName()
	
	if p2 ~= lastContentName then
		local var3 = "Navigation"
		local t = {
			activationType = p1,
			toContent = p2,
			fromContent = lastContentName,
			contentType = p3,
			navigationVersion = if xboxPrimaryNavIXPTestModule.isUserEnrolled() then t_1.TenFoot else t_1.Classic
		}
		local var4 = nil
		local var5 = nil
		local _, _ = pcall(function()
			-- upvalues: userInputService (copy), var4 (write), var5 (write), var3 (write), t (write), eventIngestService (copy)
			if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
				var20 = "console"
				var21 = "XboxOne"
				var18 = var18 or ""
				p8 = p8 or {}
				eventIngestService:SetRBXEventStream(var20, var21, var18, p8)
			end
		end)
		
		if getFIntXboxPrimaryNavABLoggingModule() > 1 then
			print("[ANALYTICS] Navigation", "ActivationType:", p1, "| ContentName:", p2, "| ContentType:", p3, "| PrevContentName:", lastContentName, "| NavigationVersion:", if xboxPrimaryNavIXPTestModule.isUserEnrolled() then t_1.TenFoot else t_1.Classic)
		end
	end
end

local function reportNavigationLoaded(p1)
	-- upvalues: contentHistoryModule (ref), xboxPrimaryNavIXPTestModule (ref), t_1 (ref), userInputService (ref), eventIngestService (ref), getFIntXboxPrimaryNavABLoggingModule (ref)
	local lastContentName = contentHistoryModule:getLastContentName()
	
	if p1 ~= lastContentName then
		local var3 = "NavigationLoaded"
		local t = {
			toContent = p1,
			fromContent = lastContentName,
			navigationVersion = if xboxPrimaryNavIXPTestModule.isUserEnrolled() then t_1.TenFoot else t_1.Classic
		}
		local var4 = nil
		local var5 = nil
		local _, _ = pcall(function()
			-- upvalues: userInputService (copy), var4 (write), var5 (write), var3 (write), t (write), eventIngestService (copy)
			if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
				var20 = "console"
				var21 = "XboxOne"
				var18 = var18 or ""
				p8 = p8 or {}
				eventIngestService:SetRBXEventStream(var20, var21, var18, p8)
			end
		end)
		
		if getFIntXboxPrimaryNavABLoggingModule() > 1 then
			print("[ANALYTICS] NavigationLoaded ContentName:", p1, "| PrevContentName:", lastContentName, "| NavigationVersion:", if xboxPrimaryNavIXPTestModule.isUserEnrolled() then t_1.TenFoot else t_1.Classic)
		end
	end
end

function t.reportNavigationLoaded(p1)
	-- upvalues: xboxPrimaryNavIXPTestModule (ref), reportNavigationLoaded (ref)
	if xboxPrimaryNavIXPTestModule.isUserEnrolled() then
		reportNavigationLoaded(p1)
		
		return
	end
	spawn(function()
		-- upvalues: reportNavigationLoaded (copy), p1 (ref)
		reportNavigationLoaded(p1)
	end)
end

function t.reportBackNavigation(p1)
	-- upvalues: contentHistoryModule (ref), xboxPrimaryNavIXPTestModule (ref), t_1 (ref), userInputService (ref), eventIngestService (ref), getFIntXboxPrimaryNavABLoggingModule (ref)
	local lastContentName = contentHistoryModule:getLastContentName()
	local var3 = "NavigationBack"
	local t = {
		fromContent = p1,
		toContent = lastContentName,
		navigationVersion = if xboxPrimaryNavIXPTestModule.isUserEnrolled() then t_1.TenFoot else t_1.Classic
	}
	local var4 = nil
	local var5 = nil
	local _, _ = pcall(function()
		-- upvalues: userInputService (copy), var4 (write), var5 (write), var3 (write), t (write), eventIngestService (copy)
		if userInputService:GetPlatform() == Enum.Platform.XBoxOne then
			var20 = "console"
			var21 = "XboxOne"
			var18 = var18 or ""
			p8 = p8 or {}
			eventIngestService:SetRBXEventStream(var20, var21, var18, p8)
		end
	end)
	
	if getFIntXboxPrimaryNavABLoggingModule() > 1 then
		print("[ANALYTICS] NavigationBack FromContent:", p1, "| ToContent:", lastContentName, "| NavigationVersion:", if xboxPrimaryNavIXPTestModule.isUserEnrolled() then t_1.TenFoot else t_1.Classic)
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

function t.WidgetNames(p1)
	-- upvalues: t_2 (ref)
	return t_2 and t_2[p1] or p1
end

function t.TabNames(p1)
	-- upvalues: t_3 (ref)
	return t_3 and t_3[p1] or p1
end

return t