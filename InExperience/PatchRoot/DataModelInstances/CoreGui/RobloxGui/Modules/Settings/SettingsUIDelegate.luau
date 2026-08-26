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
local var1 = nil

local _ = function()
	-- upvalues: var1 (write), getStyleTokensModule (ref)
	if var1 == nil then
		var1 = getStyleTokensModule()
	end
	return var1
end

local function _(value, p1, p2, p3)
	if p1 ~= nil then
		p1[p2] = value[p2]
		value[p2] = p3
	end
end

local _ = function(p1, p2, p3)
	if p2 ~= nil then
		p1[p3] = p2[p3]
	end
end

local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local t_1 = {
		_originalShieldConfig = nil,
		_backgroundUICorner = nil,
		_vrEnabled = false,
		_surfaceGuiEnabledConnection = nil,
		_topBarConnection = nil,
		_userGui = nil,
		_openVRMenuHandler = nil,
		_settingsHub = p1,
		_windowsVisibilityValues = {},
		_windowsDisconnectCallbacks = {},
		_originalVersionTextSizes = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:enableVR()
	-- upvalues: panelType (ref), UIManager (ref), observableModule (ref), create (ref), themeModule (ref), corePackagesService (ref), robloxGui (ref)
	local var2 = UIManager.getInstance():createUI({
		panelType = panelType.MoreMenu,
		screenGuiProps = {
			Name = "MoreMenu",
			ResetOnSpawn = false,
			DisplayOrder = -1,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}
	})
	
	if var2 == nil then return end
	local panelObject = var2.panelObject
	local var3 = observableModule.ObservableValue.new(self._settingsHub.Visible)
	self._surfaceGuiEnabledConnection = var3:connect(function()
		-- upvalues: panelObject (ref), var3 (ref)
		panelObject.Enabled = var3:get()
	end)
	self:connectWindowsVisibility(var3)
	UIManager.getInstance():connectPanelVisibility(panelType.MoreMenu, var3)
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
		local var4 = observableModule.ObservableValue.new(VRHub.ShowTopBar)
		self._topBarConnection = VRHub.ShowTopBarChanged.Event:connect(function()
			-- upvalues: var4 (ref), VRHub (ref)
			var4:set(VRHub.ShowTopBar)
		end)
		UIManager.getInstance():connectTopBarVisibility(var4)
		local serviceModule = require(robloxGui.Modules.Chrome.ChromeShared.Service)
		serviceModule:onTriggerVRToggleButton():connect(function(p1)
			-- upvalues: VRHub (ref)
			VRHub:SetShowTopBar(p1)
		end)
		serviceModule:connectTopBarVisibility(var4)
	end
	self:setVersionTextSize()
end

function t:isInputEventNeededBySettings(p1, p2, p3)
	-- upvalues: robloxGui (ref)
	if self._vrEnabled then
		if self._userGui == nil then
			self._userGui = require(robloxGui.Modules.VR.UserGui)
		end
		if self._userGui:isInputNeededForOpenVRMenu(p3) then
			if self._openVRMenuHandler == nil then
				self._openVRMenuHandler = self._userGui:getOpenVRMenuHandler()
			end
			self._openVRMenuHandler(p1, p2, p3)
			
			return false
		else
			return p3.KeyCode == Enum.KeyCode.Thumbstick2
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
	local var2 = themeModule.HubPadding()
	local var3 = 0
	
	if var2 and var2.PaddingLeft then
		var3 += var2.PaddingLeft.Offset
	end
	if var2 and var2.PaddingRight then
		var3 += var2.PaddingRight.Offset
	end
	return UIManager.getInstance():getPanelSizeInPixel(panelType.MoreMenu).X - var3
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
	-- upvalues: var1 (write), getStyleTokensModule (ref), spatialUIDarkenBackgroundTransparency (ref), themeModule (ref)
	if not self._vrEnabled then
		return {
			Color = themeModule.color("DarkenBackground"),
			Transparency = themeModule.transparency("DarkenBackground")
		}
	elseif var1 == nil then
		var1 = getStyleTokensModule()
	end
	return {
		Color = var1.Color.OverMedia.OverMedia_100.Color3,
		Transparency = math.min(math.max(spatialUIDarkenBackgroundTransparency, 0), 100) / 100
	}
end

function t:getBottomButtonSize(p1)
	return if self._vrEnabled then math.min(p1, 233) else p1
end

function t:updatePanelVisibility(p1)
	-- upvalues: inExperienceUIVRIXP (ref), fFlagSpatialUIFixMenuPanelChatExclusiveModule (ref), chatSelectorModule (ref), panelType (ref)
	for i, v in self._windowsVisibilityValues do
		if v then
			if inExperienceUIVRIXP:isMovePanelToCenter() and fFlagSpatialUIFixMenuPanelChatExclusiveModule then
				chatSelectorModule:HideTemp(panelType.MoreMenu, true)
			end
			p1:set(true)
			
			return
		end
	end
	if inExperienceUIVRIXP:isMovePanelToCenter() and fFlagSpatialUIFixMenuPanelChatExclusiveModule then
		chatSelectorModule:HideTemp(panelType.MoreMenu, false)
	end
	p1:set(false)
end

local var2 = function(p2)
	-- upvalues: corePackagesService (ref), inExperienceUIVRIXP (ref), spatialUIFixGameInviteChatExclusive (ref), chatSelectorModule (ref)
	local eventConnection = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteModalManager.ToggleGameInviteModalEvent.Event:Connect(function(p3)
		-- upvalues: p2 (ref), inExperienceUIVRIXP (copy), spatialUIFixGameInviteChatExclusive (copy), chatSelectorModule (copy)
		p2("GameInvite", p3)
		
		if inExperienceUIVRIXP:isMovePanelToCenter() and spatialUIFixGameInviteChatExclusive then
			if p3 then
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

local var3 = function(p2)
	local guiService = game:GetService("GuiService")
	local inspectPlayerFromUserIdWithCtxRequestConnection = guiService.InspectPlayerFromUserIdWithCtxRequest:Connect(function()
		-- upvalues: p2 (ref)
		p2("InspectAndBuy", true)
	end)
	local closeInspectMenuRequestConnection = guiService.CloseInspectMenuRequest:Connect(function()
		-- upvalues: p2 (ref)
		p2("InspectAndBuy", false)
	end)
	local inspectMenuEnabledChangedSignalConnection = guiService.InspectMenuEnabledChangedSignal:Connect(function(p3)
		-- upvalues: p2 (ref)
		if not p3 then
			p2("InspectAndBuy", false)
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

function t:connectWindowsVisibility(p2)
	-- upvalues: var2 (ref), var3 (ref)
	local var4 = function(p3, p4)
		-- upvalues: self (ref), p2 (ref)
		self._windowsVisibilityValues[p3] = p4
		self:updatePanelVisibility(p2)
	end
	
	for i, v in {
		function(p3)
			-- upvalues: self (ref)
			local settingsShowSignalConnection = self._settingsHub.SettingsShowSignal:connect(function(p4)
				-- upvalues: p3 (ref)
				p3("SettingsHub", p4)
			end)
			
			return function()
				-- upvalues: settingsShowSignalConnection (write)
				if settingsShowSignalConnection then
					settingsShowSignalConnection:Disconnect()
					settingsShowSignalConnection = nil
				end
			end
		end,
		var2,
		var3
	} do
		table.insert(self._windowsDisconnectCallbacks, v(var4))
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

local _ = function(p3)
	-- upvalues: coreScriptVersionEnabledEngineFeature (ref)
	p3.Size = if coreScriptVersionEnabledEngineFeature then UDim2.new(0, p3.TextBounds.X + 6, 1, 0) else UDim2.new(0.2, -6, 1, 0)
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