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
local var1 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var2 = if not fFlagEnableNewBackpack then require(robloxGui.Modules.BackpackScript) else nil
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
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local appChatEnabledChromeDropdownFtuxTooltip = game:DefineFastFlag("AppChatEnabledChromeDropdownFtuxTooltip", false)
local avatarSwitcherFtuxTooltip = game:DefineFastFlag("AvatarSwitcherFtuxTooltip", false)
local fFlagEnableInExperienceShop = game:DefineFastFlag("InExperienceShopFtuxTooltip", false) and sharedFlagsModule.FFlagEnableInExperienceShop
local fFlagMenuOfferTooltip = sharedFlagsModule.FFlagMenuOfferTooltip
local useInExperienceOfferExposureModule = require(chrome.Integrations.InExperienceShop.useInExperienceOfferExposure)
local var3 = if fFlagEnableInExperienceShop then require(chrome.Integrations.InExperienceShop.InExperienceShopFtuxTooltip) else nil
local menuOfferTooltipModule = nil
local usePublishShopAvailabilityModule = nil

if fFlagMenuOfferTooltip then
	menuOfferTooltipModule = require(chrome.Integrations.InExperienceShop.MenuOfferTooltip)
	usePublishShopAvailabilityModule = require(chrome.Integrations.InExperienceShop.usePublishShopAvailability)
end
local var4
local unibarConnectTooltipPriority = game:DefineFastInt("UnibarConnectTooltipPriority", 2000)
local var5 = getFFlagEnableAppChatInExperience() and (appChatEnabledChromeDropdownFtuxTooltip and getShouldShowPlatformChatBasedOnPolicyModule())
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local inExperienceUIVRIXP = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local SELFIE_VIEW_ID = constantsModule.SELFIE_VIEW_ID
local var6 = mappedSignal.new(playerListManagerModule:GetSetVisibleChangedEvent().Event, function()
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
	isActivated = var6,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), var6 (ref)
			return commonIconModule("icons/controls/leaderboardOff", "icons/controls/leaderboardOn", var6)
		end
	}
}), Enum.CoreGuiType.PlayerList)
local var7 = mappedSignal.new(emotesMenuMasterModule.EmotesMenuToggled.Event, function()
	-- upvalues: emotesMenuMasterModule (ref)
	return emotesMenuMasterModule:isOpen()
end)
local var8 = serviceModule:register({
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
	isActivated = var7,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), var7 (ref)
			return commonIconModule("icons/controls/emoteOff", "icons/controls/emoteOn", var7)
		end
	}
})
local var9 = false
local menuIsVisible = emotesMenuMasterModule.MenuIsVisible

function updateEmoteAvailability()
	-- upvalues: var9 (write), menuIsVisible (write), var8 (ref)
	if var9 and menuIsVisible then
		var8.availability:available()
		
		return
	end
	var8.availability:unavailable()
end

chromeUtilsModule.setCoreGuiAvailability(var8, Enum.CoreGuiType.EmotesMenu, function(p1)
	-- upvalues: var9 (write)
	var9 = p1
	updateEmoteAvailability()
end)
emotesMenuMasterModule.MenuVisibilityChanged.Event:Connect(function()
	-- upvalues: menuIsVisible (write), emotesMenuMasterModule (ref)
	menuIsVisible = emotesMenuMasterModule.MenuIsVisible
	updateEmoteAvailability()
end)
local var10 = if not fFlagEnableNewBackpack then mappedSignal.new(var2.StateChanged.Event, function()
	-- upvalues: var2 (ref)
	return var2.IsOpen
end) else nil
local _ = nil

if fFlagEnableNewBackpack then
	local var11 = signal.new()
	var1.onVisibilityChanged(var1.FeatureName.Backpack, function()
		-- upvalues: var11 (ref)
		var11:fire()
		
		return nil
	end)
	var4 = mappedSignal.new(var11, function()
		-- upvalues: var1 (ref)
		return var1.getVisibility(var1.FeatureName.Backpack)
	end)
else
	var4 = var10
end
if fFlagEnableSideSheet and fFlagSideSheetFocusNav and fFlagEnableConsoleExpControls then
	var4:connect(function(p1)
		-- upvalues: serviceModule (ref)
		serviceModule:setHideShortcutBar("Backpack", p1)
	end)
end
chromeUtilsModule.setCoreGuiAvailability(serviceModule:register({
	id = "backpack",
	label = "CoreScripts.TopBar.Inventory",
	sideSheetPlacement = sideSheetPlacement.Page,
	activated = function(_)
		-- upvalues: fFlagEnableNewBackpack (ref), var1 (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chromeIntegrationUtilsModule (ref), var2 (ref)
		if fFlagEnableNewBackpack then
			if var1.getVisibility(var1.FeatureName.Backpack) then
				var1.toggleVisibility(var1.FeatureName.Backpack)
				
				return
			elseif isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then
				var1.toggleVisibility(var1.FeatureName.Backpack)
				
				return
			end
			chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
				-- upvalues: var1 (copy)
				var1.toggleVisibility(var1.FeatureName.Backpack)
			end)
			
			return
		elseif var2.IsOpen then
			var2:OpenClose()
			
			return
		elseif isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then
			var2:OpenClose()
			
			return
		end
		chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
			-- upvalues: var2 (copy)
			var2:OpenClose()
		end)
	end,
	isActivated = var4,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), fixInventoryFilledIcon (ref), var10 (ref)
			return commonIconModule("icons/menu/inventoryOff", if fixInventoryFilledIcon then "icons/menu/inventoryOn" else "icons/menu/inventory", var10)
		end
	}
}), Enum.CoreGuiType.Backpack)
local var12 = serviceModule:register({
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
	-- upvalues: var12 (ref)
	if p1 then
		var12.availability:available()
		
		return
	end
	var12.availability:unavailable()
end

task.defer(function()
	-- upvalues: robloxGui (ref)
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	settingsHubModule.RespawnBehaviourChangedEvent.Event:connect(updateRespawn)
	updateRespawn(settingsHubModule:GetRespawnBehaviour())
end)
local var13 = serviceModule:currentSubMenu()
local var14 = mappedSignal.new(var13:signal(), function()
	-- upvalues: var13 (ref)
	return var13:get() == "nine_dot"
end)

if serviceModule:orderAlignment():get() == Enum.HorizontalAlignment.Right then
	var14:connect(function(p1)
		-- upvalues: playerListManagerModule (ref)
		playerListManagerModule:SetMinimized(p1)
	end)
end
function HamburgerButton(p1)
	-- upvalues: useStyle (ref), fFlagMenuOfferTooltip (ref), reactModule (ref), usePublishShopAvailabilityModule (write), useInExperienceOfferExposureModule (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), var14 (ref), useMappedSignal (ref), var5 (ref), commonFtuxTooltipModule (ref), unibarConnectTooltipPriority (ref), getFFlagIsSquadEnabled (ref), getFStringConnectTooltipLocalStorageKeyModule (ref), getFIntRobloxConnectFtuxShowDelayMsModule (ref), getFIntRobloxConnectFtuxDismissDelayMsModule (ref), fFlagShowGameAgeRating (ref), useAppPolicy (ref), fFlagEnableSideSheet (ref), selectionCursorProvider (ref), menuIconModule (ref), imageSetLabel (ref), images (ref), selfieViewModule (ref), serviceModule (ref), SELFIE_VIEW_ID (ref), avatarSwitcherFtuxTooltip (ref), avatarSwitcherFtuxTooltipModule (ref), fFlagEnableInExperienceShop (ref), var3 (write), menuOfferTooltipModule (write)
	local toggleTransition = p1.toggleTransition
	local var15 = useStyle()
	local var16 = nil
	
	if fFlagMenuOfferTooltip then
		var16 = reactModule.useRef(nil)
		usePublishShopAvailabilityModule()
		useInExperienceOfferExposureModule()
	end
	local ICON_SIZE, MEDIUM_ICON_SIZE
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var17 = unibarStyle.use()
		ICON_SIZE = var17.ICON_SIZE
		MEDIUM_ICON_SIZE = var17.MEDIUM_ICON_SIZE
	else
		ICON_SIZE = constantsModule.ICON_SIZE
		MEDIUM_ICON_SIZE = constantsModule.MEDIUM_ICON_SIZE
	end
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, ICON_SIZE, 0, ICON_SIZE),
		ref = if fFlagMenuOfferTooltip then var16 else nil,
		BackgroundColor3 = var15.Theme.BackgroundOnHover.Color,
		BackgroundTransparency = toggleTransition:map(function(p2)
			-- upvalues: var15 (ref)
			return 1 - (1 - var15.Theme.BackgroundOnHover.Transparency) * p2
		end)
	}, {
		reactModule.createElement("UICorner", { Name = "Corner", CornerRadius = UDim.new(1, 0) }),
		if fFlagEnableSideSheet then reactModule.createElement(selectionCursorProvider, {}, {
			Icon = reactModule.createElement(menuIconModule, {
				showBadgeOver12 = if fFlagShowGameAgeRating then useAppPolicy(function(p2)
					return p2.getShowGameAgeRating()
				end) else useAppPolicy(function(p2)
					return p2.getShowBadgeOver12()
				end)
			})
		}) else nil,
		if not fFlagEnableSideSheet then reactModule.createElement(imageSetLabel, {
			Name = "Overflow",
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = images["icons/common/hamburgermenu"],
			Size = toggleTransition:map(function(p2)
				-- upvalues: ICON_SIZE (write)
				p2 = 1 - p2
				
				return UDim2.new(0, ICON_SIZE * p2, 0, ICON_SIZE * p2)
			end),
			ImageColor3 = var15.Theme.IconEmphasis.Color,
			ImageTransparency = toggleTransition:map(function(p2)
				-- upvalues: var15 (ref)
				return p2 * var15.Theme.IconEmphasis.Transparency
			end)
		}) else nil,
		if not fFlagEnableSideSheet then reactModule.createElement(imageSetLabel, {
			Name = "Close",
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = images["icons/navigation/close"],
			Size = toggleTransition:map(function(p2)
				-- upvalues: MEDIUM_ICON_SIZE (write)
				return UDim2.new(0, MEDIUM_ICON_SIZE * p2, 0, MEDIUM_ICON_SIZE * p2)
			end),
			ImageColor3 = var15.Theme.IconEmphasis.Color,
			ImageTransparency = toggleTransition:map(function(p2)
				-- upvalues: var15 (ref)
				return (1 - p2) * var15.Theme.IconEmphasis.Transparency
			end)
		}) else nil,
		if selfieViewModule.useCameraOn() and not serviceModule:isWindowOpen(SELFIE_VIEW_ID) and not (var14 and useMappedSignal(var14) or false) then reactModule.createElement(selfieViewModule.CameraStatusDot, {
			Name = "CameraStatusDot",
			ZIndex = 2,
			Position = UDim2.new(1, -4, 1, -7)
		}) else nil,
		if var5 then commonFtuxTooltipModule({
			id = "CONNECT_TOOLTIP",
			priority = unibarConnectTooltipPriority,
			isIconVisible = p1.visible,
			headerKey = if getFFlagIsSquadEnabled() then "CoreScripts.FTUX.Heading.CheckOutRobloxParty" else "CoreScripts.FTUX.Heading.CheckOutRobloxConnect",
			bodyKey = if getFFlagIsSquadEnabled() then "CoreScripts.FTUX.Label.PartyWithYourFriendsAnytime" else "CoreScripts.FTUX.Label.ChatWithYourFriendsAnytime",
			localStorageKey = getFStringConnectTooltipLocalStorageKeyModule(),
			showDelay = getFIntRobloxConnectFtuxShowDelayMsModule(),
			dismissDelay = getFIntRobloxConnectFtuxDismissDelayMsModule()
		}) else nil,
		if avatarSwitcherFtuxTooltip then reactModule.createElement(avatarSwitcherFtuxTooltipModule, { visible = p1.visible }) else nil,
		if fFlagEnableInExperienceShop then reactModule.createElement(var3, { visible = p1.visible }) else nil,
		if fFlagMenuOfferTooltip then reactModule.createElement(menuOfferTooltipModule, { anchorRef = var16, visible = p1.visible }) else nil
	})
end

return serviceModule:register({
	id = "nine_dot",
	initialAvailability = serviceModule.AvailabilitySignal.Pinned,
	label = if fFlagEnableSideSheet then "CoreScripts.TopBar.RobloxMenu" else "CoreScripts.TopBar.MoreMenu",
	sideSheetPlacement = sideSheetPlacement.None,
	hotkeyCodes = if fFlagEnableSideSheet then { Enum.KeyCode.Escape } else nil,
	isActivated = var14,
	components = {
		Icon = function(p1)
			-- upvalues: reactModule (ref)
			return reactModule.createElement(HamburgerButton, p1)
		end
	}
})