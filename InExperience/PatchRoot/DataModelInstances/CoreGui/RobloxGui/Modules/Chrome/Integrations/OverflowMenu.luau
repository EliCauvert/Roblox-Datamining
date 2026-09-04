local var1
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
local var2 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var3 = if not fFlagEnableNewBackpack then require(robloxGui.Modules.BackpackScript) else nil
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
local flagsModule = require(chrome.ChromeShared.Flags)
local fFlagTokenizeUnibarConstantsWithStyleProvider = flagsModule.FFlagTokenizeUnibarConstantsWithStyleProvider
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagShowGameAgeRating = sharedFlagsModule.FFlagShowGameAgeRating
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local appChatEnabledChromeDropdownFtuxTooltip = game:DefineFastFlag("AppChatEnabledChromeDropdownFtuxTooltip", false)
local avatarSwitcherFtuxTooltip = game:DefineFastFlag("AvatarSwitcherFtuxTooltip", false)
local fFlagEnableInExperienceShop = game:DefineFastFlag("InExperienceShopFtuxTooltip", false) and sharedFlagsModule.FFlagEnableInExperienceShop
local fFlagMenuOfferTooltip = sharedFlagsModule.FFlagMenuOfferTooltip
local fFlagChromeNineDotActivityIndicator = sharedFlagsModule.FFlagOfferNineDotActivityIndicator and flagsModule.FFlagChromeNineDotActivityIndicator
local useInExperienceOfferExposureModule = require(chrome.Integrations.InExperienceShop.useInExperienceOfferExposure)
local var4 = if fFlagChromeNineDotActivityIndicator then require(chrome.Integrations.InExperienceShop.useOfferNineDotActivityIndicator) else nil
local var5 = if fFlagEnableInExperienceShop then require(chrome.Integrations.InExperienceShop.InExperienceShopFtuxTooltip) else nil
local var6 = if fFlagMenuOfferTooltip then require(chrome.Integrations.InExperienceShop.MenuOfferTooltip) else nil
local var7 = if fFlagMenuOfferTooltip or fFlagChromeNineDotActivityIndicator then require(chrome.Integrations.InExperienceShop.usePublishShopAvailability) else nil
local unibarConnectTooltipPriority = game:DefineFastInt("UnibarConnectTooltipPriority", 2000)
local var8 = getFFlagEnableAppChatInExperience() and (appChatEnabledChromeDropdownFtuxTooltip and getShouldShowPlatformChatBasedOnPolicyModule())
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local inExperienceUIVRIXP = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local SELFIE_VIEW_ID = constantsModule.SELFIE_VIEW_ID
local var9 = mappedSignal.new(playerListManagerModule:GetSetVisibleChangedEvent().Event, function()
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
	isActivated = var9,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), var9 (ref)
			return commonIconModule("icons/controls/leaderboardOff", "icons/controls/leaderboardOn", var9)
		end
	}
}), Enum.CoreGuiType.PlayerList)
local var10 = mappedSignal.new(emotesMenuMasterModule.EmotesMenuToggled.Event, function()
	-- upvalues: emotesMenuMasterModule (ref)
	return emotesMenuMasterModule:isOpen()
end)
local var11 = serviceModule:register({
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
	isActivated = var10,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), var10 (ref)
			return commonIconModule("icons/controls/emoteOff", "icons/controls/emoteOn", var10)
		end
	}
})
local var12 = false
local menuIsVisible = emotesMenuMasterModule.MenuIsVisible

function updateEmoteAvailability()
	-- upvalues: var12 (write), menuIsVisible (write), var11 (ref)
	if var12 and menuIsVisible then
		var11.availability:available()
		
		return
	end
	var11.availability:unavailable()
end

chromeUtilsModule.setCoreGuiAvailability(var11, Enum.CoreGuiType.EmotesMenu, function(p1)
	-- upvalues: var12 (write)
	var12 = p1
	updateEmoteAvailability()
end)
emotesMenuMasterModule.MenuVisibilityChanged.Event:Connect(function()
	-- upvalues: menuIsVisible (write), emotesMenuMasterModule (ref)
	menuIsVisible = emotesMenuMasterModule.MenuIsVisible
	updateEmoteAvailability()
end)
local var13 = if not fFlagEnableNewBackpack then mappedSignal.new(var3.StateChanged.Event, function()
	-- upvalues: var3 (ref)
	return var3.IsOpen
end) else nil
local _ = nil

if fFlagEnableNewBackpack then
	local var14 = signal.new()
	var2.onVisibilityChanged(var2.FeatureName.Backpack, function()
		-- upvalues: var14 (ref)
		var14:fire()
		
		return nil
	end)
	var1 = mappedSignal.new(var14, function()
		-- upvalues: var2 (ref)
		return var2.getVisibility(var2.FeatureName.Backpack)
	end)
else
	var1 = var13
end
if fFlagEnableSideSheet and fFlagSideSheetFocusNav and fFlagEnableConsoleExpControls then
	var1:connect(function(p1)
		-- upvalues: serviceModule (ref)
		serviceModule:setHideShortcutBar("Backpack", p1)
	end)
end
chromeUtilsModule.setCoreGuiAvailability(serviceModule:register({
	id = "backpack",
	label = "CoreScripts.TopBar.Inventory",
	sideSheetPlacement = sideSheetPlacement.Page,
	activated = function(_)
		-- upvalues: fFlagEnableNewBackpack (ref), var2 (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chromeIntegrationUtilsModule (ref), var3 (ref)
		if fFlagEnableNewBackpack then
			if var2.getVisibility(var2.FeatureName.Backpack) then
				var2.toggleVisibility(var2.FeatureName.Backpack)
				
				return
			elseif isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then
				var2.toggleVisibility(var2.FeatureName.Backpack)
				
				return
			end
			chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
				-- upvalues: var2 (copy)
				var2.toggleVisibility(var2.FeatureName.Backpack)
			end)
			
			return
		elseif var3.IsOpen then
			var3:OpenClose()
			
			return
		elseif isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then
			var3:OpenClose()
			
			return
		end
		chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
			-- upvalues: var3 (copy)
			var3:OpenClose()
		end)
	end,
	isActivated = var1,
	components = {
		Icon = function(_)
			-- upvalues: commonIconModule (ref), fixInventoryFilledIcon (ref), var13 (ref)
			return commonIconModule("icons/menu/inventoryOff", if fixInventoryFilledIcon then "icons/menu/inventoryOn" else "icons/menu/inventory", var13)
		end
	}
}), Enum.CoreGuiType.Backpack)
local var15 = serviceModule:register({
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
	-- upvalues: var15 (ref)
	if p1 then
		var15.availability:available()
		
		return
	end
	var15.availability:unavailable()
end

task.defer(function()
	-- upvalues: robloxGui (ref)
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	settingsHubModule.RespawnBehaviourChangedEvent.Event:connect(updateRespawn)
	updateRespawn(settingsHubModule:GetRespawnBehaviour())
end)
local var16 = serviceModule:currentSubMenu()
local var17 = mappedSignal.new(var16:signal(), function()
	-- upvalues: var16 (ref)
	return var16:get() == "nine_dot"
end)

if serviceModule:orderAlignment():get() == Enum.HorizontalAlignment.Right then
	var17:connect(function(p1)
		-- upvalues: playerListManagerModule (ref)
		playerListManagerModule:SetMinimized(p1)
	end)
end
function HamburgerButton(p1)
	-- upvalues: useStyle (ref), fFlagMenuOfferTooltip (ref), reactModule (ref), fFlagChromeNineDotActivityIndicator (ref), var7 (write), useInExperienceOfferExposureModule (ref), var4 (write), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), var17 (ref), useMappedSignal (ref), var8 (ref), commonFtuxTooltipModule (ref), unibarConnectTooltipPriority (ref), getFFlagIsSquadEnabled (ref), getFStringConnectTooltipLocalStorageKeyModule (ref), getFIntRobloxConnectFtuxShowDelayMsModule (ref), getFIntRobloxConnectFtuxDismissDelayMsModule (ref), fFlagShowGameAgeRating (ref), useAppPolicy (ref), fFlagEnableSideSheet (ref), selectionCursorProvider (ref), menuIconModule (ref), imageSetLabel (ref), images (ref), selfieViewModule (ref), serviceModule (ref), SELFIE_VIEW_ID (ref), avatarSwitcherFtuxTooltip (ref), avatarSwitcherFtuxTooltipModule (ref), fFlagEnableInExperienceShop (ref), var5 (write), var6 (write)
	local toggleTransition = p1.toggleTransition
	local var18 = useStyle()
	local var19 = if fFlagMenuOfferTooltip then reactModule.useRef(nil) else nil
	
	if fFlagMenuOfferTooltip or fFlagChromeNineDotActivityIndicator then
		var7()
		useInExperienceOfferExposureModule()
	end
	if fFlagChromeNineDotActivityIndicator then
		var4()
	end
	local ICON_SIZE, MEDIUM_ICON_SIZE
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var20 = unibarStyle.use()
		ICON_SIZE = var20.ICON_SIZE
		MEDIUM_ICON_SIZE = var20.MEDIUM_ICON_SIZE
	else
		ICON_SIZE = constantsModule.ICON_SIZE
		MEDIUM_ICON_SIZE = constantsModule.MEDIUM_ICON_SIZE
	end
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, ICON_SIZE, 0, ICON_SIZE),
		ref = if fFlagMenuOfferTooltip then var19 else nil,
		BackgroundColor3 = var18.Theme.BackgroundOnHover.Color,
		BackgroundTransparency = toggleTransition:map(function(p2)
			-- upvalues: var18 (ref)
			return 1 - (1 - var18.Theme.BackgroundOnHover.Transparency) * p2
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
			ImageColor3 = var18.Theme.IconEmphasis.Color,
			ImageTransparency = toggleTransition:map(function(p2)
				-- upvalues: var18 (ref)
				return p2 * var18.Theme.IconEmphasis.Transparency
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
			ImageColor3 = var18.Theme.IconEmphasis.Color,
			ImageTransparency = toggleTransition:map(function(p2)
				-- upvalues: var18 (ref)
				return (1 - p2) * var18.Theme.IconEmphasis.Transparency
			end)
		}) else nil,
		if selfieViewModule.useCameraOn() and not serviceModule:isWindowOpen(SELFIE_VIEW_ID) and not (var17 and useMappedSignal(var17) or false) then reactModule.createElement(selfieViewModule.CameraStatusDot, {
			Name = "CameraStatusDot",
			ZIndex = 2,
			Position = UDim2.new(1, -4, 1, -7)
		}) else nil,
		if var8 then commonFtuxTooltipModule({
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
		if fFlagEnableInExperienceShop then reactModule.createElement(var5, { visible = p1.visible }) else nil,
		if fFlagMenuOfferTooltip then reactModule.createElement(var6, { anchorRef = var19, visible = p1.visible }) else nil
	})
end

return serviceModule:register({
	id = "nine_dot",
	initialAvailability = serviceModule.AvailabilitySignal.Pinned,
	label = if fFlagEnableSideSheet then "CoreScripts.TopBar.RobloxMenu" else "CoreScripts.TopBar.MoreMenu",
	sideSheetPlacement = sideSheetPlacement.None,
	hotkeyCodes = if fFlagEnableSideSheet then { Enum.KeyCode.Escape } else nil,
	isActivated = var17,
	components = {
		Icon = function(p1)
			-- upvalues: reactModule (ref)
			return reactModule.createElement(HamburgerButton, p1)
		end
	}
})