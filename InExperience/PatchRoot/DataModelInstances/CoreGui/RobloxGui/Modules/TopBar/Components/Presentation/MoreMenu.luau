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
local var1 = require(parent.Flags.GetFFlagEnableTopBarAnalytics)()
local constantsModule = require(parent.Constants)
local _ = constantsModule.InputType
local iconButtonModule = require(script.Parent.IconButton)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local modules = robloxGui.Modules
local tenFootInterfaceModule = require(modules.TenFootInterface)
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local emotesMenuMasterModule = require(modules.EmotesMenu.EmotesMenuMaster)
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local var2 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var3 = if not fFlagEnableNewBackpack then require(modules.BackpackScript) else nil
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

function moreMenu.init(p1)
	-- upvalues: roactModule (ref), var1 (ref), analyticsModule (ref), signalsModule (ref), displayModule (ref), fFlagMountCoreGuiBackpackModule (ref), starterGuiService (ref), fFlagTopBarSignalizeKeepOutAreas (ref), coreGuiCommonModule (ref), fFlagTopBarSignalizeScreenSize (ref)
	p1.rootRef = roactModule.createRef()
	
	if var1 then
		p1.analytics = analyticsModule.default
	end
	p1.disposeUiScaleEffect = signalsModule.createEffect(function(p2)
		-- upvalues: displayModule (copy), p1 (ref)
		p1:setState({
			UiScale = displayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
	
	if fFlagMountCoreGuiBackpackModule then
		p1:setState({
			vrShowMenuIcon = false,
			mountBackpack = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)
		})
		starterGuiService.CoreGuiChangedSignal:Connect(function(p2, p3)
			-- upvalues: p1 (ref)
			if p2 == Enum.CoreGuiType.Backpack or p2 == Enum.CoreGuiType.All then
				p1:setState({ mountBackpack = p3 })
			end
		end)
	else
		p1:setState({ vrShowMenuIcon = false })
	end
	p1.chatWasHidden = false
	p1.boundAction = false
	
	function p0.moreButtonActivated()
		-- upvalues: p1 (ref)
		p1.props.setMoreMenuOpen(not p1.props.moreMenuOpen)
		
		if p1.analytics then
			p1.analytics:onMoreMenuActivated()
		end
	end
	
	if fFlagTopBarSignalizeKeepOutAreas then
		p1.keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = signalsModule.createEffect(function(p2)
			-- upvalues: p1 (ref), getViewportSize (ref)
			p1:setState({ screenSize = getViewportSize(p2) })
		end)
	end
end

function moreMenu.willUnmount(p1)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
end

function moreMenu.renderWithStyle(p1, p2)
	-- upvalues: robloxTranslatorModule (ref), VRService (ref), robloxGui (ref), playerListManagerModule (ref), emoteOn (ref), emoteOff (ref), constantsModule_1 (ref), emotesMenuMasterModule (ref), chatSelectorModule (ref), fFlagMountCoreGuiBackpackModule (ref), fFlagEnableNewBackpack (ref), var2 (ref), var3 (ref), fFlagTopBarSignalizeScreenSize (ref), tenFootInterfaceModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), constantsModule (ref), roactModule (ref), iconButtonModule (ref), contextualMenu (ref), menuDirection (ref), externalEventConnection (ref), VRHub (ref)
	local t = {}
	local var4 = false
	
	if p1.props.leaderboardEnabled then
		table.insert(t, {
			icon = if not p1.props.leaderboardOpen then "rbxasset://textures/ui/TopBar/leaderboardOff.png" else "rbxasset://textures/ui/TopBar/leaderboardOn.png",
			text = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Leaderboard"),
			onActivated = function()
				-- upvalues: p1 (ref), VRService (copy), robloxGui (copy), playerListManagerModule (copy)
				local leaderboardOpen = p1.props.leaderboardOpen
				
				if VRService.VREnabled then
					require(robloxGui.Modules.InGameMenu).openPlayersPage()
				else
					playerListManagerModule:SetVisibility(not playerListManagerModule:GetSetVisible())
					p1.props.setMoreMenuOpen(false)
				end
				if p1.analytics then
					p1.analytics:onLeaderboardActivated(not leaderboardOpen)
				end
			end
		})
		var4 = true
	end
	if p1.props.emotesEnabled then
		local _ = constantsModule_1.EmoteMenuOpenKey
		table.insert(t, {
			icon = if not p1.props.emotesOpen then emoteOff else emoteOn,
			text = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Emotes"),
			onActivated = function()
				-- upvalues: emotesMenuMasterModule (copy), p1 (ref), chatSelectorModule (copy)
				if emotesMenuMasterModule:isOpen() then
					emotesMenuMasterModule:close()
				elseif p1.chatWasHidden then
					chatSelectorModule:SetVisible(true)
					p1.chatWasHidden = false
				end
				emotesMenuMasterModule:open()
				p1.props.setMoreMenuOpen(false)
				
				if p1.analytics then
					p1.analytics:onEmotesActivated(emotesMenuMasterModule:isOpen())
				end
			end
		})
		var4 = true
	end
	if if fFlagMountCoreGuiBackpackModule then p1.state.mountBackpack else p1.props.backpackEnabled then
		table.insert(t, {
			icon = if not p1.props.backpackOpen then "rbxasset://textures/ui/TopBar/inventoryOff.png" else "rbxasset://textures/ui/TopBar/inventoryOn.png",
			text = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Inventory"),
			onActivated = function()
				-- upvalues: fFlagEnableNewBackpack (copy), var2 (copy), p1 (ref), var3 (copy)
				if fFlagEnableNewBackpack then
					var2.toggleVisibility(var2.FeatureName.Backpack)
					p1.props.setMoreMenuOpen(false)
					
					if p1.analytics then
						p1.analytics:onInventoryActivated(var2.getVisibility(var2.FeatureName.Backpack))
						
						return
					end
				else
					var3:OpenClose()
					p1.props.setMoreMenuOpen(false)
					
					if p1.analytics then
						p1.analytics:onInventoryActivated(var3.IsOpen)
					end
				end
			end
		})
		var4 = true
	end
	local var5 = if fFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize
	local var6 = if var5.X < 450 then UDim2.new(0, var5.X - 24, 0, var5.Y) else UDim2.new(0, 324, 0, var5.Y)
	local var7 = if not p1.props.moreMenuOpen then "rbxasset://textures/ui/TopBar/moreOff.png" else "rbxasset://textures/ui/TopBar/moreOn.png"
	local var8 = not tenFootInterfaceModule:IsEnabled() and (p1.props.topBarEnabled and (var4 and not VRService.VREnabled))
	
	local var9 = function(p3)
		-- upvalues: var8 (ref), fFlagTopBarSignalizeKeepOutAreas (copy), p1 (ref), constantsModule (copy)
		if var8 and p3 then
			if fFlagTopBarSignalizeKeepOutAreas then
				p1.keepOutAreasStore.setKeepOutArea(constantsModule.MoreMenuKeepOutAreaId, p3.AbsolutePosition, p3.AbsoluteSize)
				
				return
			end
			p1.props.setKeepOutArea(constantsModule.MoreMenuKeepOutAreaId, p3.AbsolutePosition, p3.AbsoluteSize)
			
			return
		elseif fFlagTopBarSignalizeKeepOutAreas then
			p1.keepOutAreasStore.removeKeepOutArea(constantsModule.MoreMenuKeepOutAreaId)
			
			return
		end
		p1.props.removeKeepOutArea(constantsModule.MoreMenuKeepOutAreaId)
	end
	
	if p1.rootRef.current then
		var9(p1.rootRef.current)
	end
	return roactModule.createElement("Frame", {
		Visible = var8,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 32, 1, 0),
		LayoutOrder = p1.props.layoutOrder,
		[roactModule.Change.AbsoluteSize] = var9,
		[roactModule.Change.AbsolutePosition] = var9,
		[roactModule.Ref] = p1.rootRef
	}, {
		OpenButton = roactModule.createElement(iconButtonModule, {
			iconSize = 24,
			icon = var7,
			onActivated = p1.moreButtonActivated
		}),
		MoreMenuContainer = roactModule.createElement("Frame", {
			ZIndex = 3,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, 12, 0, 0),
			Size = var6,
			AnchorPoint = Vector2.new(1, 0)
		}, {
			ContextualMenu = roactModule.createElement(contextualMenu, {
				closeBackgroundVisible = false,
				buttonProps = t,
				open = p1.props.moreMenuOpen,
				menuDirection = menuDirection.Down,
				openPositionY = UDim.new(0, constantsModule.TopBarHeight * p1.state.UiScale + 12),
				background = p2.Theme.BackgroundUIContrast,
				screenSize = var5,
				onDismiss = function()
					-- upvalues: p1 (ref), playerListManagerModule (copy)
					p1.props.setMoreMenuOpen(false)
					playerListManagerModule:SetMinimized(false)
				end
			})
		}),
		ShowTopBarListener = roactModule.createElement(externalEventConnection, {
			event = VRHub.ShowTopBarChanged.Event,
			callback = function()
				-- upvalues: p1 (ref), VRService (copy), VRHub (copy), var4 (write)
				p1:setState({
					vrShowMenuIcon = VRService.VREnabled and (VRHub.ShowTopBar and var4)
				})
			end
		})
	})
end

function moreMenu.render(p1)
	-- upvalues: withStyle (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithStyle(p2)
	end)
end

function moreMenu.updateActionBound(p1)
	-- upvalues: contextActionService (ref)
	if p1.props.moreMenuOpen then
		contextActionService:BindCoreAction("CloseMoreMenuAction", function(_, p2, _)
			-- upvalues: p1 (ref)
			if p2 == Enum.UserInputState.Begin then
				p1.props.setMoreMenuOpen(false)
				
				return Enum.ContextActionResult.Sink
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.KeyCode.Escape)
		p1.boundAction = true
		
		return
	elseif p1.boundAction then
		contextActionService:UnbindCoreAction("CloseMoreMenuAction")
		p1.boundAction = false
	end
end

function moreMenu.didUpdate(p1, p2, _)
	-- upvalues: playerListManagerModule (ref), fFlagTopBarSignalizeScreenSize (ref), chatSelectorModule (ref)
	if p1.props.moreMenuOpen ~= p2.moreMenuOpen then
		playerListManagerModule:SetMinimized(p1.props.moreMenuOpen)
		p1:updateActionBound()
		
		if (if fFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize).X < 600 then
			if p1.props.moreMenuOpen and chatSelectorModule:GetVisibility() then
				p1.chatWasHidden = true
				chatSelectorModule:SetVisible(false)
				
				return
			elseif not p1.props.moreMenuOpen and p1.chatWasHidden then
				chatSelectorModule:SetVisible(true)
				p1.chatWasHidden = false
			end
		end
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p1)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), fFlagMountCoreGuiBackpackModule (ref)
	return {
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p1.displayOptions.screenSize,
		moreMenuOpen = p1.moreMenu.open,
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice,
		topBarEnabled = p1.displayOptions.topbarEnabled,
		leaderboardEnabled = p1.coreGuiEnabled[Enum.CoreGuiType.PlayerList],
		emotesEnabled = p1.moreMenu.emotesEnabled and p1.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu],
		backpackEnabled = if fFlagMountCoreGuiBackpackModule then nil else p1.coreGuiEnabled[Enum.CoreGuiType.Backpack],
		leaderboardOpen = p1.moreMenu.leaderboardOpen,
		backpackOpen = p1.moreMenu.backpackOpen,
		emotesOpen = p1.moreMenu.emotesOpen
	}
end, function(p1)
	-- upvalues: setMoreMenuOpenModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), setKeepOutAreaModule (ref), removeKeepOutAreaModule (ref)
	return {
		setMoreMenuOpen = function(value)
			-- upvalues: p1 (ref), setMoreMenuOpenModule (copy)
			return p1(setMoreMenuOpenModule(value))
		end,
		setKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p2, p3, p4)
			-- upvalues: p1 (ref), setKeepOutAreaModule (copy)
			return p1(setKeepOutAreaModule(p2, p3, p4))
		end,
		removeKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p2)
			-- upvalues: p1 (ref), removeKeepOutAreaModule (copy)
			return p1(removeKeepOutAreaModule(p2))
		end
	}
end)(moreMenu)