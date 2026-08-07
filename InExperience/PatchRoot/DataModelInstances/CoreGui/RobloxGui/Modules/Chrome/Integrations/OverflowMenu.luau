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
local fFlagChromeActivatedMappedSignal = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal
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
local fixIntegrationActivated1 = game:DefineFastFlag("FixIntegrationActivated1", false)
local fixInventoryFilledIcon = game:DefineFastFlag("FixInventoryFilledIcon", false)
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local appChatEnabledChromeDropdownFtuxTooltip = game:DefineFastFlag("AppChatEnabledChromeDropdownFtuxTooltip", false)
local avatarSwitcherFtuxTooltip = game:DefineFastFlag("AvatarSwitcherFtuxTooltip", false)
local fFlagEnableInExperienceShop = game:DefineFastFlag("InExperienceShopFtuxTooltip", false) and sharedFlagsModule.FFlagEnableInExperienceShop
local var31 = if fFlagEnableInExperienceShop then require(chrome.Integrations.InExperienceShop.InExperienceShopFtuxTooltip) else nil
local unibarConnectTooltipPriority = game:DefineFastInt("UnibarConnectTooltipPriority", 2000)
local var33 = getFFlagEnableAppChatInExperience() and (appChatEnabledChromeDropdownFtuxTooltip and getShouldShowPlatformChatBasedOnPolicyModule())
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local inExperienceUIVRIXP = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local SELFIE_VIEW_ID = constantsModule.SELFIE_VIEW_ID
local var34 = mappedSignal.new(playerListManagerModule:GetSetVisibleChangedEvent().Event, function() --[[ line: 86 ]]
	-- upvalues: playerListManagerModule (ref)
	return playerListManagerModule:GetSetVisible()
end)
chromeUtilsModule.setCoreGuiAvailability(serviceModule:register({
	id = "leaderboard",
	label = "CoreScripts.TopBar.Leaderboard",
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = function(_) --[[ line: 94 ]]
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
		chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function() --[[ line: 105 ]]
			-- upvalues: playerListManagerModule (copy)
			playerListManagerModule:SetVisibility(not playerListManagerModule:GetSetVisible())
		end)
	end,
	isActivated = if fFlagChromeActivatedMappedSignal then var34 else function() --[[ line: 114 ]]
		-- upvalues: var34 (ref)
		return var34:get()
	end,
	components = {
		Icon = function(_) --[[ line: 118 ]]
			-- upvalues: commonIconModule (ref), var34 (ref)
			return commonIconModule("icons/controls/leaderboardOff", "icons/controls/leaderboardOn", var34)
		end
	}
}), Enum.CoreGuiType.PlayerList)
local var35 = mappedSignal.new(emotesMenuMasterModule.EmotesMenuToggled.Event, function() --[[ line: 125 ]]
	-- upvalues: emotesMenuMasterModule (ref)
	return emotesMenuMasterModule:isOpen()
end)
local var36 = serviceModule:register({
	id = "emotes",
	label = "CoreScripts.TopBar.Emotes",
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = function(_) --[[ line: 132 ]]
		-- upvalues: emotesMenuMasterModule (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chromeIntegrationUtilsModule (ref)
		if emotesMenuMasterModule:isOpen() then
			emotesMenuMasterModule:close()
			
			return
		elseif isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then
			emotesMenuMasterModule:open()
			
			return
		end
		chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function() --[[ line: 139 ]]
			-- upvalues: emotesMenuMasterModule (copy)
			emotesMenuMasterModule:open()
		end)
	end,
	isActivated = if fFlagChromeActivatedMappedSignal then var35 else function() --[[ line: 147 ]]
		-- upvalues: var35 (ref)
		return var35:get()
	end,
	components = {
		Icon = function(_) --[[ line: 151 ]]
			-- upvalues: commonIconModule (ref), var35 (ref)
			return commonIconModule("icons/controls/emoteOff", "icons/controls/emoteOn", var35)
		end
	}
})
local var37 = false
local menuIsVisible = emotesMenuMasterModule.MenuIsVisible

function updateEmoteAvailability() --[[ line: 160 ]]
	-- upvalues: var37 (write), menuIsVisible (write), var36 (ref)
	if var37 and menuIsVisible then
		var36.availability:available()
		
		return
	end
	var36.availability:unavailable()
end

chromeUtilsModule.setCoreGuiAvailability(var36, Enum.CoreGuiType.EmotesMenu, function(p0) --[[ line: 168 ]]
	-- upvalues: var37 (write)
	var37 = p0
	updateEmoteAvailability()
end)
emotesMenuMasterModule.MenuVisibilityChanged.Event:Connect(function() --[[ line: 173 ]]
	-- upvalues: menuIsVisible (write), emotesMenuMasterModule (ref)
	menuIsVisible = emotesMenuMasterModule.MenuIsVisible
	updateEmoteAvailability()
end)
local var38 = if not fFlagEnableNewBackpack then mappedSignal.new(var16.StateChanged.Event, function() --[[ line: 179 ]]
	-- upvalues: var16 (ref)
	return var16.IsOpen
end) else nil
local var39 = nil

if fFlagChromeActivatedMappedSignal then
	if fFlagEnableNewBackpack then
		local var40 = signal.new()
		var15.onVisibilityChanged(var15.FeatureName.Backpack, function() --[[ line: 188 ]]
			-- upvalues: var40 (ref)
			var40:fire()
			
			return nil
		end)
		var39 = mappedSignal.new(var40, function() --[[ line: 192 ]]
			-- upvalues: var15 (ref)
			return var15.getVisibility(var15.FeatureName.Backpack)
		end)
	else
		var39 = var38
	end
end
chromeUtilsModule.setCoreGuiAvailability(serviceModule:register({
	id = "backpack",
	label = "CoreScripts.TopBar.Inventory",
	sideSheetPlacement = sideSheetPlacement.Page,
	activated = function(_) --[[ line: 203 ]]
		-- upvalues: fFlagEnableNewBackpack (ref), var15 (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), inExperienceUIVRIXP (ref), chromeIntegrationUtilsModule (ref), var16 (ref)
		if fFlagEnableNewBackpack then
			if var15.getVisibility(var15.FeatureName.Backpack) then
				var15.toggleVisibility(var15.FeatureName.Backpack)
				
				return
			elseif isInExperienceUIVREnabled and isSpatial() and not inExperienceUIVRIXP:isMovePanelToCenter() then
				var15.toggleVisibility(var15.FeatureName.Backpack)
				
				return
			end
			chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function() --[[ line: 211 ]]
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
		chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function() --[[ line: 223 ]]
			-- upvalues: var16 (copy)
			var16:OpenClose()
		end)
	end,
	isActivated = if fFlagChromeActivatedMappedSignal then var39 else function() --[[ line: 232 ]]
		-- upvalues: fFlagEnableNewBackpack (ref), var15 (ref), var38 (ref)
		return if fFlagEnableNewBackpack then var15.getVisibility(var15.FeatureName.Backpack) else var38:get()
	end,
	components = {
		Icon = function(_) --[[ line: 239 ]]
			-- upvalues: commonIconModule (ref), fixInventoryFilledIcon (ref), var38 (ref)
			return commonIconModule("icons/menu/inventoryOff", if fixInventoryFilledIcon then "icons/menu/inventoryOn" else "icons/menu/inventory", var38)
		end
	}
}), Enum.CoreGuiType.Backpack)
local var41 = serviceModule:register({
	id = "respawn",
	label = "CoreScripts.InGameMenu.QuickActions.Respawn",
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = function(_) --[[ line: 254 ]]
		-- upvalues: respawnUtilsModule (ref)
		respawnUtilsModule.respawnPage()
	end,
	isActivated = if fFlagChromeActivatedMappedSignal then respawnUtilsModule.respawnPageOpenSignal else function() --[[ line: 259 ]]
		-- upvalues: respawnUtilsModule (ref)
		return respawnUtilsModule.respawnPageOpenSignal:get()
	end,
	components = {
		Icon = function(_) --[[ line: 263 ]]
			-- upvalues: commonIconModule (ref)
			return commonIconModule("icons/actions/respawn")
		end
	}
})

function updateRespawn(p1) --[[ line: 269 ]]
	-- upvalues: var41 (ref)
	if p1 then
		var41.availability:available()
		
		return
	end
	var41.availability:unavailable()
end

task.defer(function() --[[ line: 277 ]]
	-- upvalues: robloxGui (ref)
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	settingsHubModule.RespawnBehaviourChangedEvent.Event:connect(updateRespawn)
	updateRespawn(settingsHubModule:GetRespawnBehaviour())
end)
local var42 = serviceModule:currentSubMenu()
local var43 = mappedSignal.new(var42:signal(), function() --[[ line: 284 ]]
	-- upvalues: var42 (ref)
	return var42:get() == "nine_dot"
end)

if serviceModule:orderAlignment():get() == Enum.HorizontalAlignment.Right then
	var43:connect(function(p2) --[[ line: 289 ]]
		-- upvalues: playerListManagerModule (ref)
		playerListManagerModule:SetMinimized(p2)
	end)
end
function HamburgerButton(p3) --[[ line: 294 ]]
	-- upvalues: useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), var43 (ref), useMappedSignal (ref), var33 (ref), commonFtuxTooltipModule (ref), unibarConnectTooltipPriority (ref), getFFlagIsSquadEnabled (ref), getFStringConnectTooltipLocalStorageKeyModule (ref), getFIntRobloxConnectFtuxShowDelayMsModule (ref), getFIntRobloxConnectFtuxDismissDelayMsModule (ref), useAppPolicy (ref), reactModule (ref), fFlagEnableSideSheet (ref), selectionCursorProvider (ref), menuIconModule (ref), imageSetLabel (ref), images (ref), selfieViewModule (ref), serviceModule (ref), SELFIE_VIEW_ID (ref), avatarSwitcherFtuxTooltip (ref), avatarSwitcherFtuxTooltipModule (ref), fFlagEnableInExperienceShop (ref), var31 (write)
	local ICON_SIZE, MEDIUM_ICON_SIZE
	local toggleTransition = p3.toggleTransition
	local var45 = useStyle()
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var46 = unibarStyle.use()
		ICON_SIZE = var46.ICON_SIZE
		MEDIUM_ICON_SIZE = var46.MEDIUM_ICON_SIZE
	else
		ICON_SIZE = constantsModule.ICON_SIZE
		MEDIUM_ICON_SIZE = constantsModule.MEDIUM_ICON_SIZE
	end
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, ICON_SIZE, 0, ICON_SIZE),
		BackgroundColor3 = var45.Theme.BackgroundOnHover.Color,
		BackgroundTransparency = toggleTransition:map(function(p4) --[[ line: 339 ]]
			-- upvalues: var45 (ref)
			return 1 - (1 - var45.Theme.BackgroundOnHover.Transparency) * p4
		end)
	}, {
		reactModule.createElement("UICorner", { Name = "Corner", CornerRadius = UDim.new(1, 0) }),
		if fFlagEnableSideSheet then reactModule.createElement(selectionCursorProvider, {}, {
			Icon = reactModule.createElement(menuIconModule, {
				showBadgeOver12 = useAppPolicy(function(p5) --[[ line: 331 ]]
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
			Size = toggleTransition:map(function(p6) --[[ line: 361 ]]
				-- upvalues: ICON_SIZE (write)
				p6 = 1 - p6
				
				return UDim2.new(0, ICON_SIZE * p6, 0, ICON_SIZE * p6)
			end),
			ImageColor3 = var45.Theme.IconEmphasis.Color,
			ImageTransparency = toggleTransition:map(function(p7) --[[ line: 367 ]]
				-- upvalues: var45 (ref)
				return p7 * var45.Theme.IconEmphasis.Transparency
			end)
		}) else nil,
		if not fFlagEnableSideSheet then reactModule.createElement(imageSetLabel, {
			Name = "Close",
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = images["icons/navigation/close"],
			Size = toggleTransition:map(function(p8) --[[ line: 379 ]]
				-- upvalues: MEDIUM_ICON_SIZE (write)
				return UDim2.new(0, MEDIUM_ICON_SIZE * p8, 0, MEDIUM_ICON_SIZE * p8)
			end),
			ImageColor3 = var45.Theme.IconEmphasis.Color,
			ImageTransparency = toggleTransition:map(function(p9) --[[ line: 384 ]]
				-- upvalues: var45 (ref)
				return (1 - p9) * var45.Theme.IconEmphasis.Transparency
			end)
		}) else nil,
		if selfieViewModule.useCameraOn() and not serviceModule:isWindowOpen(SELFIE_VIEW_ID) and not (var43 and useMappedSignal(var43) or false) then reactModule.createElement(selfieViewModule.CameraStatusDot, {
			Name = "CameraStatusDot",
			ZIndex = 2,
			Position = UDim2.new(1, -4, 1, -7)
		}) else nil,
		if var33 then commonFtuxTooltipModule({
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
		if fFlagEnableInExperienceShop then reactModule.createElement(var31, { visible = p3.visible }) else nil
	})
end

return serviceModule:register({
	id = "nine_dot",
	initialAvailability = serviceModule.AvailabilitySignal.Pinned,
	label = if fFlagEnableSideSheet then "CoreScripts.TopBar.RobloxMenu" else "CoreScripts.TopBar.MoreMenu",
	sideSheetPlacement = sideSheetPlacement.None,
	hotkeyCodes = if fFlagEnableSideSheet then { Enum.KeyCode.Escape } else nil,
	isActivated = if fFlagChromeActivatedMappedSignal then var43 elseif fixIntegrationActivated1 then function() --[[ line: 421 ]]
		-- upvalues: var43 (ref)
		return var43:get()
	end else nil,
	components = {
		Icon = function(p10) --[[ line: 426 ]]
			-- upvalues: reactModule (ref)
			return reactModule.createElement(HamburgerButton, p10)
		end
	}
})