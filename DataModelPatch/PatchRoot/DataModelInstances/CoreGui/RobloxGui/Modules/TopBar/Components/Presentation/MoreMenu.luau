local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local VRService = game:GetService("VRService")
local StarterGui = game:GetService("StarterGui")
local _ = require(CorePackages.Packages.Signals)
local _ = require(CorePackages.Workspace.Packages.Display)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local Parent = script.Parent.Parent.Parent
local Actions = Parent.Actions
local SetKeepOutAreaModule = require(Actions.SetKeepOutArea)
local RemoveKeepOutAreaModule = require(Actions.RemoveKeepOutArea)
local SetMoreMenuOpenModule = require(Actions.SetMoreMenuOpen)
local AnalyticsModule = require(Parent.Analytics)
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FFlagTopBarSignalizeKeepOutAreas = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local FFlagTopBarSignalizeScreenSize = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeScreenSize
local v1 = require(Parent.Flags.GetFFlagEnableTopBarAnalytics)()
local ConstantsModule = require(Parent.Constants)
local _ = ConstantsModule.InputType
local IconButtonModule = require(script.Parent.IconButton)
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Modules = RobloxGui.Modules
local TenFootInterfaceModule = require(Modules.TenFootInterface)
local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
local EmotesMenuMasterModule = require(Modules.EmotesMenu.EmotesMenuMaster)
local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local Features = if FFlagEnableNewBackpack then require(CorePackages.Workspace.Packages.System).Features else nil
local BackpackScriptModule = if FFlagEnableNewBackpack then nil else require(Modules.BackpackScript)
local ChatSelectorModule = require(Modules.ChatSelector)
local PlayerListManagerModule = require(Modules.PlayerList.PlayerListManager)
local ConstantsModule1 = require(Modules.EmotesMenu.Constants)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local FFlagMountCoreGuiBackpackModule = require(Modules.Flags.FFlagMountCoreGuiBackpack)
local IconsControlsEmoteOn = Images["icons/controls/emoteOn"]
local IconsControlsEmoteOff = Images["icons/controls/emoteOff"]
local MoreMenu = RoactModule.PureComponent:extend("MoreMenu")
MoreMenu.validateProps = TModule.strictInterface({
	layoutOrder = TModule.integer,
	moreMenuOpen = TModule.boolean,
	setMoreMenuOpen = TModule.callback,
	screenSize = if FFlagTopBarSignalizeScreenSize then nil else TModule.Vector2,
	isSmallTouchDevice = TModule.boolean,
	topBarEnabled = TModule.boolean,
	leaderboardEnabled = TModule.boolean,
	emotesEnabled = TModule.boolean,
	backpackEnabled = if FFlagMountCoreGuiBackpackModule then nil else TModule.boolean,
	leaderboardOpen = TModule.boolean,
	backpackOpen = TModule.boolean,
	emotesOpen = TModule.boolean,
	setKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else TModule.callback,
	removeKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else TModule.callback
})

function MoreMenu.init(p1)
	-- upvalues: RoactModule (copy), v1 (copy), AnalyticsModule (copy), SignalsModule (copy), DisplayModule (copy), FFlagMountCoreGuiBackpackModule (copy), StarterGui (copy), FFlagTopBarSignalizeKeepOutAreas (copy), CoreGuiCommonModule (copy), FFlagTopBarSignalizeScreenSize (copy)
	p1.rootRef = RoactModule.createRef()
	
	if v1 then
		p1.analytics = AnalyticsModule.default
	end
	p1.disposeUiScaleEffect = SignalsModule.createEffect(function(p2)
		-- upvalues: DisplayModule (upval), p1 (copy)
		p1:setState({
			UiScale = DisplayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
	
	if FFlagMountCoreGuiBackpackModule then
		p1:setState({
			vrShowMenuIcon = false,
			mountBackpack = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)
		})
		StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, MountBackpack)
			-- upvalues: p1 (copy)
			if CoreGuiType == Enum.CoreGuiType.Backpack or CoreGuiType == Enum.CoreGuiType.All then
				p1:setState({ mountBackpack = MountBackpack })
			end
		end)
	else
		p1:setState({ vrShowMenuIcon = false })
	end
	p1.chatWasHidden = false
	p1.boundAction = false
	
	function p1.moreButtonActivated()
		-- upvalues: p1 (copy)
		p1.props.setMoreMenuOpen(not p1.props.moreMenuOpen)
		
		if p1.analytics then
			p1.analytics:onMoreMenuActivated()
		end
	end
	
	if FFlagTopBarSignalizeKeepOutAreas then
		p1.keepOutAreasStore = CoreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
	if FFlagTopBarSignalizeScreenSize then
		local GetViewportSizeFunction = DisplayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = SignalsModule.createEffect(function(p2)
			-- upvalues: p1 (copy), GetViewportSizeFunction (copy)
			p1:setState({ screenSize = GetViewportSizeFunction(p2) })
		end)
	end
end

function MoreMenu.willUnmount(p1)
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy)
	if FFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
end

function MoreMenu.renderWithStyle(p1, p2)
	-- upvalues: RobloxTranslatorModule (copy), VRService (copy), RobloxGui (copy), PlayerListManagerModule (copy), IconsControlsEmoteOn (copy), IconsControlsEmoteOff (copy), ConstantsModule1 (copy), EmotesMenuMasterModule (copy), ChatSelectorModule (copy), FFlagMountCoreGuiBackpackModule (copy), FFlagEnableNewBackpack (copy), Features (copy), BackpackScriptModule (copy), FFlagTopBarSignalizeScreenSize (copy), TenFootInterfaceModule (copy), FFlagTopBarSignalizeKeepOutAreas (copy), ConstantsModule (copy), RoactModule (copy), IconButtonModule (copy), ContextualMenu (copy), MenuDirection (copy), ExternalEventConnection (copy), VRHub (copy)
	local List = {}
	local Flag = false
	
	if p1.props.leaderboardEnabled then
		table.insert(List, {
			icon = if p1.props.leaderboardOpen then "rbxasset://textures/ui/TopBar/leaderboardOn.png" else "rbxasset://textures/ui/TopBar/leaderboardOff.png",
			text = RobloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Leaderboard"),
			onActivated = function()
				-- upvalues: p1 (copy), VRService (upval), RobloxGui (upval), PlayerListManagerModule (upval)
				local LeaderboardOpen = p1.props.leaderboardOpen
				
				if VRService.VREnabled then
					require(RobloxGui.Modules.InGameMenu).openPlayersPage()
				else
					PlayerListManagerModule:SetVisibility(not PlayerListManagerModule:GetSetVisible())
					p1.props.setMoreMenuOpen(false)
				end
				if p1.analytics then
					p1.analytics:onLeaderboardActivated(not LeaderboardOpen)
				end
			end
		})
		Flag = true
	end
	if p1.props.emotesEnabled then
		local _ = ConstantsModule1.EmoteMenuOpenKey
		table.insert(List, {
			icon = if p1.props.emotesOpen then IconsControlsEmoteOn else IconsControlsEmoteOff,
			text = RobloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Emotes"),
			onActivated = function()
				-- upvalues: EmotesMenuMasterModule (upval), p1 (copy), ChatSelectorModule (upval)
				if EmotesMenuMasterModule:isOpen() then
					EmotesMenuMasterModule:close()
				else
					if p1.chatWasHidden then
						ChatSelectorModule:SetVisible(true)
						p1.chatWasHidden = false
					end
					EmotesMenuMasterModule:open()
				end
				p1.props.setMoreMenuOpen(false)
				
				if p1.analytics then
					p1.analytics:onEmotesActivated(EmotesMenuMasterModule:isOpen())
				end
			end
		})
		Flag = true
	end
	if if FFlagMountCoreGuiBackpackModule then p1.state.mountBackpack else p1.props.backpackEnabled then
		table.insert(List, {
			icon = if p1.props.backpackOpen then "rbxasset://textures/ui/TopBar/inventoryOn.png" else "rbxasset://textures/ui/TopBar/inventoryOff.png",
			text = RobloxTranslatorModule:FormatByKey("CoreScripts.TopBar.Inventory"),
			onActivated = function()
				-- upvalues: FFlagEnableNewBackpack (upval), Features (upval), p1 (copy), BackpackScriptModule (upval)
				if FFlagEnableNewBackpack then
					Features.toggleVisibility(Features.FeatureName.Backpack)
					p1.props.setMoreMenuOpen(false)
					
					if p1.analytics then
						p1.analytics:onInventoryActivated(Features.getVisibility(Features.FeatureName.Backpack))
						
						return
					end
				else
					BackpackScriptModule:OpenClose()
					p1.props.setMoreMenuOpen(false)
					
					if p1.analytics then
						p1.analytics:onInventoryActivated(BackpackScriptModule.IsOpen)
					end
				end
			end
		})
		Flag = true
	end
	local ScreenSize = if FFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize
	local _UDim2: UDim2 = if ScreenSize.X < 450 then UDim2.new(0, ScreenSize.X - 24, 0, ScreenSize.Y) else UDim2.new(0, 324, 0, ScreenSize.Y)
	local MoreOnPng: string = if p1.props.moreMenuOpen then "rbxasset://textures/ui/TopBar/moreOn.png" else "rbxasset://textures/ui/TopBar/moreOff.png"
	local NoVREnabled: boolean = not TenFootInterfaceModule:IsEnabled() and (p1.props.topBarEnabled and (Flag and not VRService.VREnabled))
	
	local function v52(Frame: Frame)
		-- upvalues: NoVREnabled (copy), FFlagTopBarSignalizeKeepOutAreas (upval), p1 (copy), ConstantsModule (upval)
		if NoVREnabled and Frame then
			if FFlagTopBarSignalizeKeepOutAreas then
				p1.keepOutAreasStore.setKeepOutArea(ConstantsModule.MoreMenuKeepOutAreaId, Frame.AbsolutePosition, Frame.AbsoluteSize)
				
				return
			else
				p1.props.setKeepOutArea(ConstantsModule.MoreMenuKeepOutAreaId, Frame.AbsolutePosition, Frame.AbsoluteSize)
				
				return
			end
		elseif FFlagTopBarSignalizeKeepOutAreas then
			p1.keepOutAreasStore.removeKeepOutArea(ConstantsModule.MoreMenuKeepOutAreaId)
			
			return
		else
			p1.props.removeKeepOutArea(ConstantsModule.MoreMenuKeepOutAreaId)
		end
	end
	
	if p1.rootRef.current then
		v52(p1.rootRef.current)
	end
	return RoactModule.createElement("Frame", {
		Visible = NoVREnabled,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 32, 1, 0),
		LayoutOrder = p1.props.layoutOrder,
		[RoactModule.Change.AbsoluteSize] = v52,
		[RoactModule.Change.AbsolutePosition] = v52,
		[RoactModule.Ref] = p1.rootRef
	}, {
		OpenButton = RoactModule.createElement(IconButtonModule, {
			iconSize = 24,
			icon = MoreOnPng,
			onActivated = p1.moreButtonActivated
		}),
		MoreMenuContainer = RoactModule.createElement("Frame", {
			ZIndex = 3,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, 12, 0, 0),
			Size = _UDim2,
			AnchorPoint = Vector2.new(1, 0)
		}, {
			ContextualMenu = RoactModule.createElement(ContextualMenu, {
				closeBackgroundVisible = false,
				buttonProps = List,
				open = p1.props.moreMenuOpen,
				menuDirection = MenuDirection.Down,
				openPositionY = UDim.new(0, ConstantsModule.TopBarHeight * p1.state.UiScale + 12),
				background = p2.Theme.BackgroundUIContrast,
				screenSize = ScreenSize,
				onDismiss = function()
					-- upvalues: p1 (copy), PlayerListManagerModule (upval)
					p1.props.setMoreMenuOpen(false)
					PlayerListManagerModule:SetMinimized(false)
				end
			})
		}),
		ShowTopBarListener = RoactModule.createElement(ExternalEventConnection, {
			event = VRHub.ShowTopBarChanged.Event,
			callback = function()
				-- upvalues: p1 (copy), VRService (upval), VRHub (upval), Flag (ref)
				p1:setState({
					vrShowMenuIcon = VRService.VREnabled and (VRHub.ShowTopBar and Flag)
				})
			end
		})
	})
end

function MoreMenu.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithStyle(p2)
	end)
end

function MoreMenu.updateActionBound(p1)
	-- upvalues: ContextActionService (copy)
	if p1.props.moreMenuOpen then
		ContextActionService:BindCoreAction("CloseMoreMenuAction", function(_, UserInputState, _)
			-- upvalues: p1 (copy)
			if UserInputState == Enum.UserInputState.Begin then
				p1.props.setMoreMenuOpen(false)
				
				return Enum.ContextActionResult.Sink
			else
				return Enum.ContextActionResult.Pass
			end
		end, false, Enum.KeyCode.Escape)
		p1.boundAction = true
		
		return
	end
	if p1.boundAction then
		ContextActionService:UnbindCoreAction("CloseMoreMenuAction")
		p1.boundAction = false
	end
end

function MoreMenu.didUpdate(p1, p2, _)
	-- upvalues: PlayerListManagerModule (copy), FFlagTopBarSignalizeScreenSize (copy), ChatSelectorModule (copy)
	if p1.props.moreMenuOpen ~= p2.moreMenuOpen then
		PlayerListManagerModule:SetMinimized(p1.props.moreMenuOpen)
		p1:updateActionBound()
		
		if (if FFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize).X < 600 then
			if p1.props.moreMenuOpen and ChatSelectorModule:GetVisibility() then
				p1.chatWasHidden = true
				ChatSelectorModule:SetVisible(false)
				
				return
			end
			if not p1.props.moreMenuOpen and p1.chatWasHidden then
				ChatSelectorModule:SetVisible(true)
				p1.chatWasHidden = false
			end
		end
	end
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1)
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy), FFlagMountCoreGuiBackpackModule (copy)
	return {
		screenSize = if FFlagTopBarSignalizeScreenSize then nil else p1.displayOptions.screenSize,
		moreMenuOpen = p1.moreMenu.open,
		isSmallTouchDevice = p1.displayOptions.isSmallTouchDevice,
		topBarEnabled = p1.displayOptions.topbarEnabled,
		leaderboardEnabled = p1.coreGuiEnabled[Enum.CoreGuiType.PlayerList],
		emotesEnabled = p1.moreMenu.emotesEnabled and p1.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu],
		backpackEnabled = if FFlagMountCoreGuiBackpackModule then nil else p1.coreGuiEnabled[Enum.CoreGuiType.Backpack],
		leaderboardOpen = p1.moreMenu.leaderboardOpen,
		backpackOpen = p1.moreMenu.backpackOpen,
		emotesOpen = p1.moreMenu.emotesOpen
	}
end, function(Callback)
	-- upvalues: SetMoreMenuOpenModule (copy), FFlagTopBarSignalizeKeepOutAreas (copy), SetKeepOutAreaModule (copy), RemoveKeepOutAreaModule (copy)
	return {
		setMoreMenuOpen = function(p1)
			-- upvalues: Callback (copy), SetMoreMenuOpenModule (upval)
			return Callback(SetMoreMenuOpenModule(p1))
		end,
		setKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else function(p1, p2, p3)
			-- upvalues: Callback (copy), SetKeepOutAreaModule (upval)
			return Callback(SetKeepOutAreaModule(p1, p2, p3))
		end,
		removeKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else function(p1)
			-- upvalues: Callback (copy), RemoveKeepOutAreaModule (upval)
			return Callback(RemoveKeepOutAreaModule(p1))
		end
	}
end)(MoreMenu)