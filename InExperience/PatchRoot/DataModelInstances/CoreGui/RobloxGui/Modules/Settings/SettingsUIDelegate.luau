local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local observableModule = require(corePackagesService.Workspace.Packages.Observable)
local vrSpatialUiModule = require(corePackagesService.Workspace.Packages.VrSpatialUi)
local panelType = vrSpatialUiModule.Constants.PanelType
local UIManager = vrSpatialUiModule.UIManager
local themeModule = require(script.Parent.Theme)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local _ = require(corePackagesService.Packages.UIBlox)
local getStyleTokensModule = require(robloxGui.Modules.Chrome.ChromeShared.Utility.GetStyleTokens)
local chatSelectorModule = require(robloxGui.Modules.ChatSelector)
local coreScriptVersionEnabledEngineFeature = game:GetEngineFeature("CoreScriptVersionEnabled")
local spatialUIDarkenBackgroundTransparency = game:DefineFastInt("SpatialUIDarkenBackgroundTransparency", 0)
local spatialUIVersionTextSizeScaled = game:DefineFastInt("SpatialUIVersionTextSizeScaled", 1400)
local inExperienceUIVRIXP = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local fFlagSpatialUIFixMenuPanelChatExclusiveModule = require(robloxGui.Modules.Settings.Flags.FFlagSpatialUIFixMenuPanelChatExclusive)
local spatialUIFixGameInviteChatExclusive = game:DefineFastFlag("SpatialUIFixGameInviteChatExclusive", false)
local _ = { HUB_BAR_WIDTH = 800, ASPECT_RATIO = 1.333333333333 }
local _ = { BOTTOM_BUTTON_MAX_SIZE_IN_PIXEL = 233 }
local var12 = nil

local _ = function()
	-- upvalues: var12 (write), getStyleTokensModule (ref)
	if var12 == nil then
		var12 = getStyleTokensModule()
	end
	return var12
end

local function _(value, p0, p1, p2)
	if p0 ~= nil then
		p0[p1] = value[p1]
		value[p1] = p2
	end
end

local _ = function(p3, p4, p5)
	if p4 ~= nil then
		p3[p5] = p4[p5]
	end
end

local t = {}
t.__index = t

function t.new(p6)
	-- upvalues: t (ref)
	local t_1 = {
		_originalShieldConfig = nil,
		_backgroundUICorner = nil,
		_vrEnabled = false,
		_surfaceGuiEnabledConnection = nil,
		_topBarConnection = nil,
		_userGui = nil,
		_openVRMenuHandler = nil,
		_settingsHub = p6,
		_windowsVisibilityValues = {},
		_windowsDisconnectCallbacks = {},
		_originalVersionTextSizes = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:enableVR()
	-- upvalues: panelType (ref), UIManager (ref), observableModule (ref), create (ref), themeModule (ref), corePackagesService (ref), robloxGui (ref)
	local var17 = UIManager.getInstance():createUI({
		panelType = panelType.MoreMenu,
		screenGuiProps = {
			Name = "MoreMenu",
			ResetOnSpawn = false,
			DisplayOrder = -1,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}
	})
	
	if var17 == nil then return end
	local panelObject = var17.panelObject
	local var18 = observableModule.ObservableValue.new(self._settingsHub.Visible)
	self._surfaceGuiEnabledConnection = var18:connect(function()
		-- upvalues: panelObject (ref), var18 (ref)
		panelObject.Enabled = var18:get()
	end)
	self:connectWindowsVisibility(var18)
	UIManager.getInstance():connectPanelVisibility(panelType.MoreMenu, var18)
	self._originalShieldConfig = {}
	local clippingShield = self._settingsHub.ClippingShield
	local originalShieldConfig = self._originalShieldConfig
	
	if originalShieldConfig ~= nil then
		originalShieldConfig.Parent = clippingShield.Parent
		clippingShield.Parent = panelObject
	end
	local clippingShield_1 = self._settingsHub.ClippingShield
	local originalShieldConfig_1 = self._originalShieldConfig
	local uDim2 = UDim2.new(1, 0, 1, 0)
	
	if originalShieldConfig_1 ~= nil then
		originalShieldConfig_1.Size = clippingShield_1.Size
		clippingShield_1.Size = uDim2
	end
	local clippingShield_2 = self._settingsHub.ClippingShield
	local originalShieldConfig_2 = self._originalShieldConfig
	local uDim2_1 = UDim2.new(0, 0, 0, 0)
	
	if originalShieldConfig_2 ~= nil then
		originalShieldConfig_2.Position = clippingShield_2.Position
		clippingShield_2.Position = uDim2_1
	end
	if self._settingsHub.DarkenBackground then
		self._backgroundUICorner = create("UICorner")({
			CornerRadius = themeModule.MenuContainerCornerRadius,
			Parent = self._settingsHub.DarkenBackground
		})
	end
	self._vrEnabled = true
	
	if self._topBarConnection == nil then
		local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
		local var21 = observableModule.ObservableValue.new(VRHub.ShowTopBar)
		self._topBarConnection = VRHub.ShowTopBarChanged.Event:connect(function()
			-- upvalues: var21 (ref), VRHub (ref)
			var21:set(VRHub.ShowTopBar)
		end)
		UIManager.getInstance():connectTopBarVisibility(var21)
		local serviceModule = require(robloxGui.Modules.Chrome.ChromeShared.Service)
		serviceModule:onTriggerVRToggleButton():connect(function(p7)
			-- upvalues: VRHub (ref)
			VRHub:SetShowTopBar(p7)
		end)
		serviceModule:connectTopBarVisibility(var21)
	end
	self:setVersionTextSize()
end

function t:isInputEventNeededBySettings(p8, p9, p10)
	-- upvalues: robloxGui (ref)
	if self._vrEnabled then
		if self._userGui == nil then
			self._userGui = require(robloxGui.Modules.VR.UserGui)
		end
		if self._userGui:isInputNeededForOpenVRMenu(p10) then
			if self._openVRMenuHandler == nil then
				self._openVRMenuHandler = self._userGui:getOpenVRMenuHandler()
			end
			self._openVRMenuHandler(p8, p9, p10)
			
			return false
		else
			return p10.KeyCode == Enum.KeyCode.Thumbstick2
		end
	end
end

function t:disableVR()
	-- upvalues: UIManager (ref), panelType (ref)
	if not self._vrEnabled then return end
	local clippingShield = self._settingsHub.ClippingShield
	local originalShieldConfig = self._originalShieldConfig
	
	if originalShieldConfig ~= nil then
		clippingShield.Parent = originalShieldConfig.Parent
	end
	local clippingShield_1 = self._settingsHub.ClippingShield
	local originalShieldConfig_1 = self._originalShieldConfig
	
	if originalShieldConfig_1 ~= nil then
		clippingShield_1.Size = originalShieldConfig_1.Size
	end
	local clippingShield_2 = self._settingsHub.ClippingShield
	local originalShieldConfig_2 = self._originalShieldConfig
	
	if originalShieldConfig_2 ~= nil then
		clippingShield_2.Position = originalShieldConfig_2.Position
	end
	self._originalShieldConfig = nil
	
	if self._backgroundUICorner then
		self._backgroundUICorner.Parent = nil
		self._backgroundUICorner = nil
	end
	if self._surfaceGuiEnabledConnection ~= nil then
		self._surfaceGuiEnabledConnection:disconnect()
	end
	self._openVRMenuHandler = nil
	self:disconnectWindowsVisibility()
	UIManager.getInstance():disconnectPanelVisibility(panelType.MoreMenu)
	self:restoreVersionTextSize()
	self._vrEnabled = false
end

function t:getAspectRatio()
	-- upvalues: UIManager (ref), panelType (ref)
	if self._vrEnabled then
		local moreMenuPanelSizeInPixel = UIManager.getInstance():getPanelSizeInPixel(panelType.MoreMenu)
		
		return moreMenuPanelSizeInPixel.X / moreMenuPanelSizeInPixel.Y
	end
	return 1.333333333333
end

function t:getHubBarSize()
	-- upvalues: themeModule (ref), UIManager (ref), panelType (ref)
	if not self._vrEnabled then
		return 800
	end
	local var24 = themeModule.HubPadding()
	local var25 = 0
	
	if var24 and var24.PaddingLeft then
		var25 += var24.PaddingLeft.Offset
	end
	if var24 and var24.PaddingRight then
		var25 += var24.PaddingRight.Offset
	end
	return UIManager.getInstance():getPanelSizeInPixel(panelType.MoreMenu).X - var25
end

function t:getMenuContainerPositionOverride()
	return if self._vrEnabled then {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.X
	} else nil
end

function t:getFullScreenSize()
	-- upvalues: UIManager (ref), panelType (ref), robloxGui (ref)
	return if self._vrEnabled then UIManager.getInstance():getPanelSizeInPixel(panelType.MoreMenu).Y else robloxGui.AbsoluteSize.y
end

function t:getDarkBackgroundTheme()
	-- upvalues: var12 (write), getStyleTokensModule (ref), spatialUIDarkenBackgroundTransparency (ref), themeModule (ref)
	if not self._vrEnabled then
		return {
			Color = themeModule.color("DarkenBackground"),
			Transparency = themeModule.transparency("DarkenBackground")
		}
	elseif var12 == nil then
		var12 = getStyleTokensModule()
	end
	return {
		Color = var12.Color.OverMedia.OverMedia_100.Color3,
		Transparency = math.min(math.max(spatialUIDarkenBackgroundTransparency, 0), 100) / 100
	}
end

function t:getBottomButtonSize(p11)
	return if self._vrEnabled then math.min(p11, 233) else p11
end

function t:updatePanelVisibility(p12)
	-- upvalues: inExperienceUIVRIXP (ref), fFlagSpatialUIFixMenuPanelChatExclusiveModule (ref), chatSelectorModule (ref), panelType (ref)
	for i, v in self._windowsVisibilityValues do
		if v then
			if inExperienceUIVRIXP:isMovePanelToCenter() and fFlagSpatialUIFixMenuPanelChatExclusiveModule then
				chatSelectorModule:HideTemp(panelType.MoreMenu, true)
			end
			p12:set(true)
			
			return
		end
	end
	if inExperienceUIVRIXP:isMovePanelToCenter() and fFlagSpatialUIFixMenuPanelChatExclusiveModule then
		chatSelectorModule:HideTemp(panelType.MoreMenu, false)
	end
	p12:set(false)
end

local var14 = function(p13)
	-- upvalues: corePackagesService (ref), inExperienceUIVRIXP (ref), spatialUIFixGameInviteChatExclusive (ref), chatSelectorModule (ref)
	local eventConnection = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteModalManager.ToggleGameInviteModalEvent.Event:Connect(function(p14)
		-- upvalues: p13 (ref), inExperienceUIVRIXP (copy), spatialUIFixGameInviteChatExclusive (copy), chatSelectorModule (copy)
		p13("GameInvite", p14)
		
		if inExperienceUIVRIXP:isMovePanelToCenter() and spatialUIFixGameInviteChatExclusive then
			if p14 then
				chatSelectorModule:HideTemp("SettingsMenu", true)
				
				return
			end
			chatSelectorModule:HideTemp("SettingsMenu", false)
		end
	end)
	
	return function()
		-- upvalues: eventConnection (write)
		if eventConnection then
			eventConnection:Disconnect()
			eventConnection = nil
		end
	end
end

local var15 = function(p15)
	local guiService = game:GetService("GuiService")
	local inspectPlayerFromUserIdWithCtxRequestConnection = guiService.InspectPlayerFromUserIdWithCtxRequest:Connect(function()
		-- upvalues: p15 (ref)
		p15("InspectAndBuy", true)
	end)
	local closeInspectMenuRequestConnection = guiService.CloseInspectMenuRequest:Connect(function()
		-- upvalues: p15 (ref)
		p15("InspectAndBuy", false)
	end)
	local inspectMenuEnabledChangedSignalConnection = guiService.InspectMenuEnabledChangedSignal:Connect(function(p16)
		-- upvalues: p15 (ref)
		if not p16 then
			p15("InspectAndBuy", false)
		end
	end)
	
	return function()
		-- upvalues: inspectPlayerFromUserIdWithCtxRequestConnection (write), closeInspectMenuRequestConnection (write), inspectMenuEnabledChangedSignalConnection (write)
		if inspectPlayerFromUserIdWithCtxRequestConnection then
			inspectPlayerFromUserIdWithCtxRequestConnection:Disconnect()
			inspectPlayerFromUserIdWithCtxRequestConnection = nil
		end
		if closeInspectMenuRequestConnection then
			closeInspectMenuRequestConnection:Disconnect()
			closeInspectMenuRequestConnection = nil
		end
		if inspectMenuEnabledChangedSignalConnection then
			inspectMenuEnabledChangedSignalConnection:Disconnect()
			inspectMenuEnabledChangedSignalConnection = nil
		end
	end
end

function t:connectWindowsVisibility(p17)
	-- upvalues: var14 (ref), var15 (ref)
	local var31 = function(p18, p19)
		-- upvalues: self (ref), p17 (ref)
		self._windowsVisibilityValues[p18] = p19
		self:updatePanelVisibility(p17)
	end
	
	for i, v in {
		function(p20)
			-- upvalues: self (ref)
			local settingsShowSignalConnection = self._settingsHub.SettingsShowSignal:connect(function(p21)
				-- upvalues: p20 (ref)
				p20("SettingsHub", p21)
			end)
			
			return function()
				-- upvalues: settingsShowSignalConnection (write)
				if settingsShowSignalConnection then
					settingsShowSignalConnection:Disconnect()
					settingsShowSignalConnection = nil
				end
			end
		end,
		var14,
		var15
	} do
		table.insert(self._windowsDisconnectCallbacks, v(var31))
	end
end

function t:disconnectWindowsVisibility()
	for i, v in self._windowsDisconnectCallbacks do
		v()
	end
	self._windowsDisconnectCallbacks = {}
	self._windowsVisibilityValues = {}
end

function t:isOpenCloseAnimationAllowed()
	return self._vrEnabled
end

function t:getMenuContainerExtraSpace()
	if self._vrEnabled then
		local menuContainerPadding = self._settingsHub.MenuContainerPadding
		
		return menuContainerPadding.PaddingTop.Offset + menuContainerPadding.PaddingBottom.Offset
	end
	return 0
end

local _ = function(p22)
	-- upvalues: coreScriptVersionEnabledEngineFeature (ref)
	p22.Size = if coreScriptVersionEnabledEngineFeature then UDim2.new(0, p22.TextBounds.X + 6, 1, 0) else UDim2.new(0.2, -6, 1, 0)
end

function t:setVersionTextSize()
	-- upvalues: themeModule (ref), spatialUIVersionTextSizeScaled (ref), coreScriptVersionEnabledEngineFeature (ref)
	for i, v in self._settingsHub.VersionContainer:GetChildren() do
		if v:IsA("TextLabel") then
			self._originalVersionTextSizes[v] = v.TextSize
			v.TextSize = themeModule.textSize(spatialUIVersionTextSizeScaled / 100)
			v.Size = if coreScriptVersionEnabledEngineFeature then UDim2.new(0, v.TextBounds.X + 6, 1, 0) else UDim2.new(0.2, -6, 1, 0)
		end
	end
end

function t:restoreVersionTextSize()
	-- upvalues: coreScriptVersionEnabledEngineFeature (ref)
	for i, v in self._settingsHub.VersionContainer:GetChildren() do
		if v:IsA("TextLabel") and self._originalVersionTextSizes[v] then
			v.TextSize = self._originalVersionTextSizes[v]
			v.Size = if coreScriptVersionEnabledEngineFeature then UDim2.new(0, v.TextBounds.X + 6, 1, 0) else UDim2.new(0.2, -6, 1, 0)
			self._originalVersionTextSizes[v] = nil
		end
	end
	self._originalVersionTextSizes = {}
end

return t