local var38
local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local serviceModule = require(chrome.Service)
local chromeUtilsModule = require(chrome.ChromeShared.Service.ChromeUtils)
local chromeIntegrationUtilsModule = require(chrome.Integrations.ChromeIntegrationUtils)
local respawnUtilsModule = require(chrome.Integrations.RespawnUtils)
local mappedSignal = chromeUtilsModule.MappedSignal
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local chromeModule = require(corePackagesService.Workspace.Packages.Chrome)
local sideSheetPlacement = chromeModule.Enums.SideSheetPlacement
local commonIconModule = require(chrome.Integrations.CommonIcon)
local commonFtuxTooltipModule = require(chrome.Integrations.CommonFtuxTooltip)
local avatarSwitcherFtuxTooltipModule = require(chrome.Integrations.AvatarSwitcher.AvatarSwitcherFtuxTooltip)
local VRService = game:GetService("VRService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local playerListManagerModule = require(robloxGui.Modules.PlayerList.PlayerListManager)
local emotesMenuMasterModule = require(robloxGui.Modules.EmotesMenu.EmotesMenuMaster)
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local var15 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var16 = if not fFlagEnableNewBackpack then require(robloxGui.Modules.BackpackScript) else nil
local useMappedSignal = chromeModule.Hooks.useMappedSignal
local getFFlagIsSquadEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local useAppPolicy = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local menuIconModule = require(robloxGui.Modules.TopBar.ComponentsV2.MenuIcon)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local selectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local selfieViewModule = require(robloxGui.Modules.SelfieView)
local getFStringConnectTooltipLocalStorageKeyModule = require(chrome.Flags.GetFStringConnectTooltipLocalStorageKey)
local getFIntRobloxConnectFtuxShowDelayMsModule = require(chrome.Flags.GetFIntRobloxConnectFtuxShowDelayMs)
local getFIntRobloxConnectFtuxDismissDelayMsModule = require(chrome.Flags.GetFIntRobloxConnectFtuxDismissDelayMs)
local getFFlagEnableAppChatInExperience = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local getShouldShowPlatformChatBasedOnPolicyModule = require(chrome.Flags.GetShouldShowPlatformChatBasedOnPolicy)
local fixInventoryFilledIcon = game:DefineFastFlag("FixInventoryFilledIcon", false)
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagShowGameAgeRating = sharedFlagsModule.FFlagShowGameAgeRating
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local appChatEnabledChromeDropdownFtuxTooltip = game:DefineFastFlag("AppChatEnabledChromeDropdownFtuxTooltip", false)
local avatarSwitcherFtuxTooltip = game:DefineFastFlag("AvatarSwitcherFtuxTooltip", false)
local fFlagEnableInExperienceShop = game:DefineFastFlag("InExperienceShopFtuxTooltip", false) and sharedFlagsModule.FFlagEnableInExperienceShop
local var30 = if fFlagEnableInExperienceShop then require(chrome.Integrations.InExperienceShop.InExperienceShopFtuxTooltip) else nil
local unibarConnectTooltipPriority = game:DefineFastInt("UnibarConnectTooltipPriority", 2000)
local var32 = getFFlagEnableAppChatInExperience() and (appChatEnabledChromeDropdownFtuxTooltip and getShouldShowPlatformChatBasedOnPolicyModule())
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local inExperienceUIVRIXP = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local SELFIE_VIEW_ID = constantsModule.SELFIE_VIEW_ID
local var33 = mappedSignal.new(playerListManagerModule:GetSetVisibleChangedEvent().Event, function()
	-- upvalues: playerListManagerModule (ref)
	return playerListManagerModule:GetSetVisible()
end)
chromeUtilsModule.setCoreGuiAvailability(serviceModule:register({
	id = "leaderboard",
	label = "CoreScripts.TopBar.Leaderboard",
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = function(_)
		-- upvalues: isInExperienceUIVREnabled (ref), VRService (ref), robloxGui (ref), playerListManagerModule (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chromeIntegrationUtilsModule (ref)
		if not isInExperienceUIVREnabled and VRService.VREnabled then
			require(robloxGui.Modules.InGameMenu).openPlayersPage()
			
			return
		elseif playerListManagerModule:GetSetVisible() then
			playerListManagerModule:SetVisibility(not playerListManagerModule:GetSetVisible())
			
			return
		elseif isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then
			playerListManagerModule:SetVisibility(not playerListManagerModule:GetSetVisible())
			
			return
		end
		chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
			-- upvalues: playerListManagerModule (copy)
			playerListManagerModule:SetVisibility(not playerListManagerModule:GetSetVisible())
		end)
	end,
	isActivated = var33,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), var33 (ref)
			return commonIconModule("icons/controls/leaderboardOff", "icons/controls/leaderboardOn", var33)
		end
	}
}), Enum.CoreGuiType.PlayerList)
local var34 = mappedSignal.new(emotesMenuMasterModule.EmotesMenuToggled.Event, function()
	-- upvalues: emotesMenuMasterModule (ref)
	return emotesMenuMasterModule:isOpen()
end)
local var35 = serviceModule:register({
	id = "emotes",
	label = "CoreScripts.TopBar.Emotes",
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = function(_)
		-- upvalues: emotesMenuMasterModule (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chromeIntegrationUtilsModule (ref)
		if emotesMenuMasterModule:isOpen() then
			emotesMenuMasterModule:close()
			
			return
		elseif isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then
			emotesMenuMasterModule:open()
			
			return
		end
		chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
			-- upvalues: emotesMenuMasterModule (copy)
			emotesMenuMasterModule:open()
		end)
	end,
	isActivated = var34,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), var34 (ref)
			return commonIconModule("icons/controls/emoteOff", "icons/controls/emoteOn", var34)
		end
	}
})
local var36 = false
local menuIsVisible = emotesMenuMasterModule.MenuIsVisible

function updateEmoteAvailability()
	-- upvalues: var36 (write), menuIsVisible (write), var35 (ref)
	if var36 and menuIsVisible then
		var35.availability:available()
		
		return
	end
	var35.availability:unavailable()
end

chromeUtilsModule.setCoreGuiAvailability(var35, Enum.CoreGuiType.EmotesMenu, function(p0)
	-- upvalues: var36 (write)
	var36 = p0
	updateEmoteAvailability()
end)
emotesMenuMasterModule.MenuVisibilityChanged.Event:Connect(function()
	-- upvalues: menuIsVisible (write), emotesMenuMasterModule (ref)
	menuIsVisible = emotesMenuMasterModule.MenuIsVisible
	updateEmoteAvailability()
end)
local var37 = if not fFlagEnableNewBackpack then mappedSignal.new(var16.StateChanged.Event, function()
	-- upvalues: var16 (ref)
	return var16.IsOpen
end) else nil
local _ = nil

if fFlagEnableNewBackpack then
	local var39 = signal.new()
	var15.onVisibilityChanged(var15.FeatureName.Backpack, function()
		-- upvalues: var39 (ref)
		var39:fire()
		
		return nil
	end)
	var38 = mappedSignal.new(var39, function()
		-- upvalues: var15 (ref)
		return var15.getVisibility(var15.FeatureName.Backpack)
	end)
else
	var38 = var37
end
chromeUtilsModule.setCoreGuiAvailability(serviceModule:register({
	id = "backpack",
	label = "CoreScripts.TopBar.Inventory",
	sideSheetPlacement = sideSheetPlacement.Page,
	activated = function(_)
		-- upvalues: fFlagEnableNewBackpack (ref), var15 (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chromeIntegrationUtilsModule (ref), var16 (ref)
		if fFlagEnableNewBackpack then
			if var15.getVisibility(var15.FeatureName.Backpack) then
				var15.toggleVisibility(var15.FeatureName.Backpack)
				
				return
			elseif isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then
				var15.toggleVisibility(var15.FeatureName.Backpack)
				
				return
			end
			chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
				-- upvalues: var15 (copy)
				var15.toggleVisibility(var15.FeatureName.Backpack)
			end)
			
			return
		elseif var16.IsOpen then
			var16:OpenClose()
			
			return
		elseif isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then
			var16:OpenClose()
			
			return
		end
		chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
			-- upvalues: var16 (copy)
			var16:OpenClose()
		end)
	end,
	isActivated = var38,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), fixInventoryFilledIcon (ref), var37 (ref)
			return commonIconModule("icons/menu/inventoryOff", if fixInventoryFilledIcon then "icons/menu/inventoryOn" else "icons/menu/inventory", var37)
		end
	}
}), Enum.CoreGuiType.Backpack)
local var40 = serviceModule:register({
	id = "respawn",
	label = "CoreScripts.InGameMenu.QuickActions.Respawn",
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = function(_)
		-- upvalues: respawnUtilsModule (ref)
		respawnUtilsModule.respawnPage()
	end,
	isActivated = respawnUtilsModule.respawnPageOpenSignal,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref)
			return commonIconModule("icons/actions/respawn")
		end
	}
})

function updateRespawn(p1)
	-- upvalues: var40 (ref)
	if p1 then
		var40.availability:available()
		
		return
	end
	var40.availability:unavailable()
end

task.defer(function()
	-- upvalues: robloxGui (ref)
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	settingsHubModule.RespawnBehaviourChangedEvent.Event:connect(updateRespawn)
	updateRespawn(settingsHubModule:GetRespawnBehaviour())
end)
local var41 = serviceModule:currentSubMenu()
local var42 = mappedSignal.new(var41:signal(), function()
	-- upvalues: var41 (ref)
	return var41:get() == "nine_dot"
end)

if serviceModule:orderAlignment():get() == Enum.HorizontalAlignment.Right then
	var42:connect(function(p2)
		-- upvalues: playerListManagerModule (ref)
		playerListManagerModule:SetMinimized(p2)
	end)
end
function HamburgerButton(p3)
	-- upvalues: useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), var42 (ref), useMappedSignal (ref), var32 (ref), commonFtuxTooltipModule (ref), unibarConnectTooltipPriority (ref), getFFlagIsSquadEnabled (ref), getFStringConnectTooltipLocalStorageKeyModule (ref), getFIntRobloxConnectFtuxShowDelayMsModule (ref), getFIntRobloxConnectFtuxDismissDelayMsModule (ref), fFlagShowGameAgeRating (ref), useAppPolicy (ref), reactModule (ref), fFlagEnableSideSheet (ref), selectionCursorProvider (ref), menuIconModule (ref), imageSetLabel (ref), images (ref), selfieViewModule (ref), serviceModule (ref), SELFIE_VIEW_ID (ref), avatarSwitcherFtuxTooltip (ref), avatarSwitcherFtuxTooltipModule (ref), fFlagEnableInExperienceShop (ref), var30 (write)
	local ICON_SIZE, MEDIUM_ICON_SIZE
	local toggleTransition = p3.toggleTransition
	local var44 = useStyle()
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var45 = unibarStyle.use()
		ICON_SIZE = var45.ICON_SIZE
		MEDIUM_ICON_SIZE = var45.MEDIUM_ICON_SIZE
	else
		ICON_SIZE = constantsModule.ICON_SIZE
		MEDIUM_ICON_SIZE = constantsModule.MEDIUM_ICON_SIZE
	end
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, ICON_SIZE, 0, ICON_SIZE),
		BackgroundColor3 = var44.Theme.BackgroundOnHover.Color,
		BackgroundTransparency = toggleTransition:map(function(p4)
			-- upvalues: var44 (ref)
			return 1 - (1 - var44.Theme.BackgroundOnHover.Transparency) * p4
		end)
	}, {
		reactModule.createElement("UICorner", { Name = "Corner", CornerRadius = UDim.new(1, 0) }),
		if fFlagEnableSideSheet then reactModule.createElement(selectionCursorProvider, {}, {
			Icon = reactModule.createElement(menuIconModule, {
				showBadgeOver12 = if fFlagShowGameAgeRating then useAppPolicy(function(p6)
					return p6.getShowGameAgeRating()
				end) else useAppPolicy(function(p5)
					return p5.getShowBadgeOver12()
				end)
			})
		}) else nil,
		if not fFlagEnableSideSheet then reactModule.createElement(imageSetLabel, {
			Name = "Overflow",
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = images["icons/common/hamburgermenu"],
			Size = toggleTransition:map(function(p7)
				-- upvalues: ICON_SIZE (write)
				p7 = 1 - p7
				
				return UDim2.new(0, ICON_SIZE * p7, 0, ICON_SIZE * p7)
			end),
			ImageColor3 = var44.Theme.IconEmphasis.Color,
			ImageTransparency = toggleTransition:map(function(p8)
				-- upvalues: var44 (ref)
				return p8 * var44.Theme.IconEmphasis.Transparency
			end)
		}) else nil,
		if not fFlagEnableSideSheet then reactModule.createElement(imageSetLabel, {
			Name = "Close",
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = images["icons/navigation/close"],
			Size = toggleTransition:map(function(p9)
				-- upvalues: MEDIUM_ICON_SIZE (write)
				return UDim2.new(0, MEDIUM_ICON_SIZE * p9, 0, MEDIUM_ICON_SIZE * p9)
			end),
			ImageColor3 = var44.Theme.IconEmphasis.Color,
			ImageTransparency = toggleTransition:map(function(p10)
				-- upvalues: var44 (ref)
				return (1 - p10) * var44.Theme.IconEmphasis.Transparency
			end)
		}) else nil,
		if selfieViewModule.useCameraOn() and not serviceModule:isWindowOpen(SELFIE_VIEW_ID) and not (var42 and useMappedSignal(var42) or false) then reactModule.createElement(selfieViewModule.CameraStatusDot, {
			Name = "CameraStatusDot",
			ZIndex = 2,
			Position = UDim2.new(1, -4, 1, -7)
		}) else nil,
		if var32 then commonFtuxTooltipModule({
			id = "CONNECT_TOOLTIP",
			priority = unibarConnectTooltipPriority,
			isIconVisible = p3.visible,
			headerKey = if getFFlagIsSquadEnabled() then "CoreScripts.FTUX.Heading.CheckOutRobloxParty" else "CoreScripts.FTUX.Heading.CheckOutRobloxConnect",
			bodyKey = if getFFlagIsSquadEnabled() then "CoreScripts.FTUX.Label.PartyWithYourFriendsAnytime" else "CoreScripts.FTUX.Label.ChatWithYourFriendsAnytime",
			localStorageKey = getFStringConnectTooltipLocalStorageKeyModule(),
			showDelay = getFIntRobloxConnectFtuxShowDelayMsModule(),
			dismissDelay = getFIntRobloxConnectFtuxDismissDelayMsModule()
		}) else nil,
		if avatarSwitcherFtuxTooltip then reactModule.createElement(avatarSwitcherFtuxTooltipModule, { visible = p3.visible }) else nil,
		if fFlagEnableInExperienceShop then reactModule.createElement(var30, { visible = p3.visible }) else nil
	})
end

return serviceModule:register({
	id = "nine_dot",
	initialAvailability = serviceModule.AvailabilitySignal.Pinned,
	label = if fFlagEnableSideSheet then "CoreScripts.TopBar.RobloxMenu" else "CoreScripts.TopBar.MoreMenu",
	sideSheetPlacement = sideSheetPlacement.None,
	hotkeyCodes = if fFlagEnableSideSheet then { Enum.KeyCode.Escape } else nil,
	isActivated = var42,
	components = {
		Icon = function(p11)
			-- upvalues: reactModule (ref)
			return reactModule.createElement(HamburgerButton, p11)
		end
	}
})