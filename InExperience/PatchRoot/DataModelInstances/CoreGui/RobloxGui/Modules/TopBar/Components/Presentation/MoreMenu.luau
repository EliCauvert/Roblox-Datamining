local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local contextActionService = game:GetService("ContextActionService")
local VRService = game:GetService("VRService")
local starterGuiService = game:GetService("StarterGui")
local _ = require(corePackagesService.Packages.Signals)
local _ = require(corePackagesService.Workspace.Packages.Display)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local contextualMenu = UIBloxModule.App.Menu.ContextualMenu
local menuDirection = UIBloxModule.App.Menu.MenuDirection
local images = UIBloxModule.App.ImageSet.Images
local withStyle = UIBloxModule.Core.Style.withStyle
local parent = script.Parent.Parent.Parent
local actions = parent.Actions
local setKeepOutAreaModule = require(actions.SetKeepOutArea)
local removeKeepOutAreaModule = require(actions.RemoveKeepOutArea)
local setMoreMenuOpenModule = require(actions.SetMoreMenuOpen)
local analyticsModule = require(parent.Analytics)
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagTopBarSignalizeKeepOutAreas = coreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local fFlagTopBarSignalizeScreenSize = coreGuiCommonModule.Flags.FFlagTopBarSignalizeScreenSize
local var16 = require(parent.Flags.GetFFlagEnableTopBarAnalytics)()
local constantsModule = require(parent.Constants)
local _ = constantsModule.InputType
local iconButtonModule = require(script.Parent.IconButton)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local modules = robloxGui.Modules
local tenFootInterfaceModule = require(modules.TenFootInterface)
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local emotesMenuMasterModule = require(modules.EmotesMenu.EmotesMenuMaster)
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local var22 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var23 = if not fFlagEnableNewBackpack then require(modules.BackpackScript) else nil
local chatSelectorModule = require(modules.ChatSelector)
local playerListManagerModule = require(modules.PlayerList.PlayerListManager)
local constantsModule_1 = require(modules.EmotesMenu.Constants)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local fFlagMountCoreGuiBackpackModule = require(modules.Flags.FFlagMountCoreGuiBackpack)
local emoteOn = images["icons/controls/emoteOn"]
local emoteOff = images["icons/controls/emoteOff"]
local moreMenu = roactModule.PureComponent:extend("MoreMenu")
moreMenu.validateProps = tModule.strictInterface({
	layoutOrder = tModule.integer,
	moreMenuOpen = tModule.boolean,
	setMoreMenuOpen = tModule.callback,
	screenSize = if fFlagTopBarSignalizeScreenSize then nil else tModule.Vector2,
	isSmallTouchDevice = tModule.boolean,
	topBarEnabled = tModule.boolean,
	leaderboardEnabled = tModule.boolean,
	emotesEnabled = tModule.boolean,
	backpackEnabled = if fFlagMountCoreGuiBackpackModule then nil else tModule.boolean,
	leaderboardOpen = tModule.boolean,
	backpackOpen = tModule.boolean,
	emotesOpen = tModule.boolean,
	setKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else tModule.callback,
	removeKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else tModule.callback
})

function moreMenu.init(p0)
	-- upvalues: roactModule (ref), var16 (ref), analyticsModule (ref), signalsModule (ref), displayModule (ref), fFlagMountCoreGuiBackpackModule (ref), starterGuiService (ref), fFlagTopBarSignalizeKeepOutAreas (ref), coreGuiCommonModule (ref), fFlagTopBarSignalizeScreenSize (ref)
	p0.rootRef = roactModule.createRef()
	
	if var16 then
		p0.analytics = analyticsModule.default
	end
	p0.disposeUiScaleEffect = signalsModule.createEffect(function(p1)
		-- upvalues: displayModule (copy), p0 (ref)
		p0:setState({
			UiScale = displayModule.GetDisplayStore(p1).getUIScale(p1)
		})
	end)
	
	if fFlagMountCoreGuiBackpackModule then
		p0:setState({
			vrShowMenuIcon = false,
			mountBackpack = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)
		})
		starterGuiService.CoreGuiChangedSignal:Connect(function(p2, p3)
			-- upvalues: p0 (ref)
			if p2 == Enum.CoreGuiType.Backpack or p2 == Enum.CoreGuiType.All then
				p0:setState({ mountBackpack = p3 })
			end
		end)
	else
		p0:setState({ vrShowMenuIcon = false })
	end
	p0.chatWasHidden = false
	p0.boundAction = false
	
	function p0.moreButtonActivated()
		-- upvalues: p0 (ref)
		p0.props.setMoreMenuOpen(not p0.props.moreMenuOpen)
		
		if p0.analytics then
			p0.analytics:onMoreMenuActivated()
		end
	end
	
	if fFlagTopBarSignalizeKeepOutAreas then
		p0.keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p0.disposeScreenSize = signalsModule.createEffect(function(p4)
			-- upvalues: p0 (ref), getViewportSize (ref)
			p0:setState({ screenSize = getViewportSize(p4) })
		end)
	end
end

function moreMenu.willUnmount(p5)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeScreenSize then
		p5.disposeScreenSize()
	end
	if p5.disposeUiScaleEffect then
		p5.disposeUiScaleEffect()
	end
end

function moreMenu.renderWithStyle(p6, p7)
	-- upvalues: robloxTranslatorModule (ref), VRService (ref), robloxGui (ref), playerListManagerModule (ref), emoteOn (ref), emoteOff (ref), constantsModule_1 (ref), emotesMenuMasterModule (ref), chatSelectorModule (ref), fFlagMountCoreGuiBackpackModule (ref), fFlagEnableNewBackpack (ref), var22 (ref), var23 (ref), fFlagTopBarSignalizeScreenSize (ref), tenFootInterfaceModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), constantsModule (ref), roactModule (ref), iconButtonModule (ref), contextualMenu (ref), menuDirection (ref), externalEventConnection (ref), VRHub (ref)
	local t = {}
	local var31 = false
	
	if p6.props.leaderboardEnabled then
		table.insert(t, {
			icon = if not p6.props.leaderboardOpen then "rbxasset://textures/ui/TopBar/leaderboardOff.png" else "rbxasset://textures/ui/TopBar/leaderboardOn.png",
			text = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Leaderboard"),
			onActivated = function()
				-- upvalues: p6 (ref), VRService (copy), robloxGui (copy), playerListManagerModule (copy)
				local leaderboardOpen = p6.props.leaderboardOpen
				
				if VRService.VREnabled then
					require(robloxGui.Modules.InGameMenu).openPlayersPage()
				else
					playerListManagerModule:SetVisibility(not playerListManagerModule:GetSetVisible())
					p6.props.setMoreMenuOpen(false)
				end
				if p6.analytics then
					p6.analytics:onLeaderboardActivated(not leaderboardOpen)
				end
			end
		})
		var31 = true
	end
	if p6.props.emotesEnabled then
		local _ = constantsModule_1.EmoteMenuOpenKey
		table.insert(t, {
			icon = if not p6.props.emotesOpen then emoteOff else emoteOn,
			text = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Emotes"),
			onActivated = function()
				-- upvalues: emotesMenuMasterModule (copy), p6 (ref), chatSelectorModule (copy)
				if emotesMenuMasterModule:isOpen() then
					emotesMenuMasterModule:close()
				elseif p6.chatWasHidden then
					chatSelectorModule:SetVisible(true)
					p6.chatWasHidden = false
				end
				emotesMenuMasterModule:open()
				p6.props.setMoreMenuOpen(false)
				
				if p6.analytics then
					p6.analytics:onEmotesActivated(emotesMenuMasterModule:isOpen())
				end
			end
		})
		var31 = true
	end
	if if fFlagMountCoreGuiBackpackModule then p6.state.mountBackpack else p6.props.backpackEnabled then
		table.insert(t, {
			icon = if not p6.props.backpackOpen then "rbxasset://textures/ui/TopBar/inventoryOff.png" else "rbxasset://textures/ui/TopBar/inventoryOn.png",
			text = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Inventory"),
			onActivated = function()
				-- upvalues: fFlagEnableNewBackpack (copy), var22 (copy), p6 (ref), var23 (copy)
				if fFlagEnableNewBackpack then
					var22.toggleVisibility(var22.FeatureName.Backpack)
					p6.props.setMoreMenuOpen(false)
					
					if p6.analytics then
						p6.analytics:onInventoryActivated(var22.getVisibility(var22.FeatureName.Backpack))
						
						return
					end
				else
					var23:OpenClose()
					p6.props.setMoreMenuOpen(false)
					
					if p6.analytics then
						p6.analytics:onInventoryActivated(var23.IsOpen)
					end
				end
			end
		})
		var31 = true
	end
	local var32 = if fFlagTopBarSignalizeScreenSize then p6.state.screenSize else p6.props.screenSize
	local var33 = if var32.X < 450 then UDim2.new(0, var32.X - 24, 0, var32.Y) else UDim2.new(0, 324, 0, var32.Y)
	local var34 = if not p6.props.moreMenuOpen then "rbxasset://textures/ui/TopBar/moreOff.png" else "rbxasset://textures/ui/TopBar/moreOn.png"
	local var35 = not tenFootInterfaceModule:IsEnabled() and (p6.props.topBarEnabled and (var31 and not VRService.VREnabled))
	
	local var36 = function(p8)
		-- upvalues: var35 (ref), fFlagTopBarSignalizeKeepOutAreas (copy), p6 (ref), constantsModule (copy)
		if var35 and p8 then
			if fFlagTopBarSignalizeKeepOutAreas then
				p6.keepOutAreasStore.setKeepOutArea(constantsModule.MoreMenuKeepOutAreaId, p8.AbsolutePosition, p8.AbsoluteSize)
				
				return
			end
			p6.props.setKeepOutArea(constantsModule.MoreMenuKeepOutAreaId, p8.AbsolutePosition, p8.AbsoluteSize)
			
			return
		elseif fFlagTopBarSignalizeKeepOutAreas then
			p6.keepOutAreasStore.removeKeepOutArea(constantsModule.MoreMenuKeepOutAreaId)
			
			return
		end
		p6.props.removeKeepOutArea(constantsModule.MoreMenuKeepOutAreaId)
	end
	
	if p6.rootRef.current then
		var36(p6.rootRef.current)
	end
	return roactModule.createElement("Frame", {
		Visible = var35,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 32, 1, 0),
		LayoutOrder = p6.props.layoutOrder,
		[roactModule.Change.AbsoluteSize] = var36,
		[roactModule.Change.AbsolutePosition] = var36,
		[roactModule.Ref] = p6.rootRef
	}, {
		OpenButton = roactModule.createElement(iconButtonModule, {
			iconSize = 24,
			icon = var34,
			onActivated = p6.moreButtonActivated
		}),
		MoreMenuContainer = roactModule.createElement("Frame", {
			ZIndex = 3,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, 12, 0, 0),
			Size = var33,
			AnchorPoint = Vector2.new(1, 0)
		}, {
			ContextualMenu = roactModule.createElement(contextualMenu, {
				closeBackgroundVisible = false,
				buttonProps = t,
				open = p6.props.moreMenuOpen,
				menuDirection = menuDirection.Down,
				openPositionY = UDim.new(0, constantsModule.TopBarHeight * p6.state.UiScale + 12),
				background = p7.Theme.BackgroundUIContrast,
				screenSize = var32,
				onDismiss = function()
					-- upvalues: p6 (ref), playerListManagerModule (copy)
					p6.props.setMoreMenuOpen(false)
					playerListManagerModule:SetMinimized(false)
				end
			})
		}),
		ShowTopBarListener = roactModule.createElement(externalEventConnection, {
			event = VRHub.ShowTopBarChanged.Event,
			callback = function()
				-- upvalues: p6 (ref), VRService (copy), VRHub (copy), var31 (write)
				p6:setState({
					vrShowMenuIcon = VRService.VREnabled and (VRHub.ShowTopBar and var31)
				})
			end
		})
	})
end

function moreMenu.render(p9)
	-- upvalues: withStyle (ref)
	return withStyle(function(p10)
		-- upvalues: p9 (ref)
		return p9:renderWithStyle(p10)
	end)
end

function moreMenu.updateActionBound(p11)
	-- upvalues: contextActionService (ref)
	if p11.props.moreMenuOpen then
		contextActionService:BindCoreAction("CloseMoreMenuAction", function(_, p12, _)
			-- upvalues: p11 (ref)
			if p12 == Enum.UserInputState.Begin then
				p11.props.setMoreMenuOpen(false)
				
				return Enum.ContextActionResult.Sink
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.KeyCode.Escape)
		p11.boundAction = true
		
		return
	elseif p11.boundAction then
		contextActionService:UnbindCoreAction("CloseMoreMenuAction")
		p11.boundAction = false
	end
end

function moreMenu.didUpdate(p13, p14, _)
	-- upvalues: playerListManagerModule (ref), fFlagTopBarSignalizeScreenSize (ref), chatSelectorModule (ref)
	if p13.props.moreMenuOpen ~= p14.moreMenuOpen then
		playerListManagerModule:SetMinimized(p13.props.moreMenuOpen)
		p13:updateActionBound()
		
		if (if fFlagTopBarSignalizeScreenSize then p13.state.screenSize else p13.props.screenSize).X < 600 then
			if p13.props.moreMenuOpen and chatSelectorModule:GetVisibility() then
				p13.chatWasHidden = true
				chatSelectorModule:SetVisible(false)
				
				return
			elseif not p13.props.moreMenuOpen and p13.chatWasHidden then
				chatSelectorModule:SetVisible(true)
				p13.chatWasHidden = false
			end
		end
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p15)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), fFlagMountCoreGuiBackpackModule (ref)
	return {
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p15.displayOptions.screenSize,
		moreMenuOpen = p15.moreMenu.open,
		isSmallTouchDevice = p15.displayOptions.isSmallTouchDevice,
		topBarEnabled = p15.displayOptions.topbarEnabled,
		leaderboardEnabled = p15.coreGuiEnabled[Enum.CoreGuiType.PlayerList],
		emotesEnabled = p15.moreMenu.emotesEnabled and p15.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu],
		backpackEnabled = if fFlagMountCoreGuiBackpackModule then nil else p15.coreGuiEnabled[Enum.CoreGuiType.Backpack],
		leaderboardOpen = p15.moreMenu.leaderboardOpen,
		backpackOpen = p15.moreMenu.backpackOpen,
		emotesOpen = p15.moreMenu.emotesOpen
	}
end, function(p16)
	-- upvalues: setMoreMenuOpenModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), setKeepOutAreaModule (ref), removeKeepOutAreaModule (ref)
	return {
		setMoreMenuOpen = function(value)
			-- upvalues: p16 (ref), setMoreMenuOpenModule (copy)
			return p16(setMoreMenuOpenModule(value))
		end,
		setKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p17, p18, p19)
			-- upvalues: p16 (ref), setKeepOutAreaModule (copy)
			return p16(setKeepOutAreaModule(p17, p18, p19))
		end,
		removeKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p20)
			-- upvalues: p16 (ref), removeKeepOutAreaModule (copy)
			return p16(removeKeepOutAreaModule(p20))
		end
	}
end)(moreMenu)