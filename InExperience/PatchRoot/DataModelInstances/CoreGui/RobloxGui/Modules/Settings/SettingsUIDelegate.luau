local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CorePackages = game:GetService("CorePackages")
local ObservableModule = require(CorePackages.Workspace.Packages.Observable)
local VrSpatialUiModule = require(CorePackages.Workspace.Packages.VrSpatialUi)
local PanelType = VrSpatialUiModule.Constants.PanelType
local UIManager = VrSpatialUiModule.UIManager
local ThemeModule = require(script.Parent.Theme)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local _ = require(CorePackages.Packages.UIBlox)
local GetStyleTokensModule = require(RobloxGui.Modules.Chrome.ChromeShared.Utility.GetStyleTokens)
local ChatSelectorModule = require(RobloxGui.Modules.ChatSelector)
local CoreScriptVersionEnabledEngineFeature = game:GetEngineFeature("CoreScriptVersionEnabled")
local SpatialUIDarkenBackgroundTransparency = game:DefineFastInt("SpatialUIDarkenBackgroundTransparency", 0)
local SpatialUIVersionTextSizeScaled = game:DefineFastInt("SpatialUIVersionTextSizeScaled", 1400)
local InExperienceUIVRIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local FFlagSpatialUIFixMenuPanelChatExclusiveModule = require(RobloxGui.Modules.Settings.Flags.FFlagSpatialUIFixMenuPanelChatExclusive)
local SpatialUIFixGameInviteChatExclusive = game:DefineFastFlag("SpatialUIFixGameInviteChatExclusive", false)
local v1 = nil

local function _() --[[ Line: 37 ]]
	-- upvalues: v1 (ref), GetStyleTokensModule (copy)
	if v1 == nil then
		v1 = GetStyleTokensModule()
	end
	return v1
end

local _ = function(p1, p2, Key, p3) --[[ Line: 44 | Named "setFieldWithBackup" ]]
	if p2 ~= nil then
		p2[Key] = p1[Key]
		p1[Key] = p3
	end
end

local _ = function(p1, p2, Key) --[[ Line: 57 | Named "restoreFieldFromBackup" ]]
	if p2 ~= nil then
		p1[Key] = p2[Key]
	end
end

local SettingsUIDelegateModule = {}
SettingsUIDelegateModule.__index = SettingsUIDelegateModule

function SettingsUIDelegateModule.new(_settingsHub) --[[ Line: 66 ]]
	-- upvalues: SettingsUIDelegateModule (copy)
	local config = {
		_originalShieldConfig = nil,
		_backgroundUICorner = nil,
		_vrEnabled = false,
		_surfaceGuiEnabledConnection = nil,
		_topBarConnection = nil,
		_userGui = nil,
		_openVRMenuHandler = nil,
		_settingsHub = _settingsHub,
		_windowsVisibilityValues = {},
		_windowsDisconnectCallbacks = {},
		_originalVersionTextSizes = {}
	}
	setmetatable(config, SettingsUIDelegateModule)
	
	return config
end

function SettingsUIDelegateModule:enableVR() --[[ Line: 84 ]]
	-- upvalues: PanelType (copy), UIManager (copy), ObservableModule (copy), CreateFunction (copy), ThemeModule (copy), CorePackages (copy), RobloxGui (copy)
	local UI = UIManager.getInstance():createUI({
		panelType = PanelType.MoreMenu,
		screenGuiProps = {
			Name = "MoreMenu",
			ResetOnSpawn = false,
			DisplayOrder = -1,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}
	})
	
	if UI == nil then return end
	local PanelObject = UI.panelObject
	local NewResult = ObservableModule.ObservableValue.new(self._settingsHub.Visible)
	self._surfaceGuiEnabledConnection = NewResult:connect(function() --[[ Line: 100 ]]
		-- upvalues: PanelObject (copy), NewResult (copy)
		PanelObject.Enabled = NewResult:get()
	end)
	self:connectWindowsVisibility(NewResult)
	UIManager.getInstance():connectPanelVisibility(PanelType.MoreMenu, NewResult)
	self._originalShieldConfig = {}
	local ClippingShield = self._settingsHub.ClippingShield
	local OriginalShieldConfig = self._originalShieldConfig
	
	if OriginalShieldConfig ~= nil then
		OriginalShieldConfig.Parent = ClippingShield.Parent
		ClippingShield.Parent = PanelObject
	end
	local ClippingShield1 = self._settingsHub.ClippingShield
	local OriginalShieldConfig1 = self._originalShieldConfig
	local _UDim2 = UDim2.new(1, 0, 1, 0)
	
	if OriginalShieldConfig1 ~= nil then
		OriginalShieldConfig1.Size = ClippingShield1.Size
		ClippingShield1.Size = _UDim2
	end
	local ClippingShield2 = self._settingsHub.ClippingShield
	local OriginalShieldConfig2 = self._originalShieldConfig
	local _UDim21 = UDim2.new(0, 0, 0, 0)
	
	if OriginalShieldConfig2 ~= nil then
		OriginalShieldConfig2.Position = ClippingShield2.Position
		ClippingShield2.Position = _UDim21
	end
	if self._settingsHub.DarkenBackground then
		self._backgroundUICorner = CreateFunction("UICorner")({
			CornerRadius = ThemeModule.MenuContainerCornerRadius,
			Parent = self._settingsHub.DarkenBackground
		})
	end
	self._vrEnabled = true
	
	if self._topBarConnection == nil then
		local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
		local NewResult1 = ObservableModule.ObservableValue.new(VRHub.ShowTopBar)
		self._topBarConnection = VRHub.ShowTopBarChanged.Event:connect(function() --[[ Line: 121 ]]
			-- upvalues: NewResult1 (copy), VRHub (copy)
			NewResult1:set(VRHub.ShowTopBar)
		end)
		UIManager.getInstance():connectTopBarVisibility(NewResult1)
		local ServiceModule = require(RobloxGui.Modules.Chrome.ChromeShared.Service)
		ServiceModule:onTriggerVRToggleButton():connect(function(p1) --[[ Line: 128 ]]
			-- upvalues: VRHub (copy)
			VRHub:SetShowTopBar(p1)
		end)
		ServiceModule:connectTopBarVisibility(NewResult1)
	end
	self:setVersionTextSize()
end

function SettingsUIDelegateModule:isInputEventNeededBySettings(p1, p2, Input): boolean --[[ Line: 136 ]]
	-- upvalues: RobloxGui (copy)
	if self._vrEnabled then
		if self._userGui == nil then
			self._userGui = require(RobloxGui.Modules.VR.UserGui)
		end
		if self._userGui:isInputNeededForOpenVRMenu(Input) then
			if self._openVRMenuHandler == nil then
				self._openVRMenuHandler = self._userGui:getOpenVRMenuHandler()
			end
			self._openVRMenuHandler(p1, p2, Input)
			
			return false
		elseif Input.KeyCode == Enum.KeyCode.Thumbstick2 then
			return true
		end
	end
	return false
end

function SettingsUIDelegateModule:disableVR() --[[ Line: 157 ]]
	-- upvalues: UIManager (copy), PanelType (copy)
	if not self._vrEnabled then return end
	local ClippingShield = self._settingsHub.ClippingShield
	local OriginalShieldConfig = self._originalShieldConfig
	
	if OriginalShieldConfig ~= nil then
		ClippingShield.Parent = OriginalShieldConfig.Parent
	end
	local ClippingShield1 = self._settingsHub.ClippingShield
	local OriginalShieldConfig1 = self._originalShieldConfig
	
	if OriginalShieldConfig1 ~= nil then
		ClippingShield1.Size = OriginalShieldConfig1.Size
	end
	local ClippingShield2 = self._settingsHub.ClippingShield
	local OriginalShieldConfig2 = self._originalShieldConfig
	
	if OriginalShieldConfig2 ~= nil then
		ClippingShield2.Position = OriginalShieldConfig2.Position
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
	UIManager.getInstance():disconnectPanelVisibility(PanelType.MoreMenu)
	self:restoreVersionTextSize()
	self._vrEnabled = false
end

function SettingsUIDelegateModule:getAspectRatio() --[[ Line: 179 ]]
	-- upvalues: UIManager (copy), PanelType (copy)
	if self._vrEnabled then
		local PanelSizeInPixel = UIManager.getInstance():getPanelSizeInPixel(PanelType.MoreMenu)
		
		return PanelSizeInPixel.X / PanelSizeInPixel.Y
	else
		return 1.3333333333333333
	end
end

function SettingsUIDelegateModule:getHubBarSize(): number --[[ Line: 188 ]]
	-- upvalues: ThemeModule (copy), UIManager (copy), PanelType (copy)
	if not self._vrEnabled then
		return 800
	end
	local HubPaddingResult = ThemeModule.HubPadding()
	local NewOffset = 0
	
	if HubPaddingResult and HubPaddingResult.PaddingLeft then
		NewOffset += HubPaddingResult.PaddingLeft.Offset
	end
	if HubPaddingResult and HubPaddingResult.PaddingRight then
		NewOffset += HubPaddingResult.PaddingRight.Offset
	end
	return UIManager.getInstance():getPanelSizeInPixel(PanelType.MoreMenu).X - NewOffset
end

function SettingsUIDelegateModule.getMenuContainerPositionOverride(p1) --[[ Line: 205 ]]
	return if p1._vrEnabled then {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.X
	} else nil
end

function SettingsUIDelegateModule.getFullScreenSize(p1) --[[ Line: 218 ]]
	-- upvalues: UIManager (copy), PanelType (copy), RobloxGui (copy)
	return if p1._vrEnabled then UIManager.getInstance():getPanelSizeInPixel(PanelType.MoreMenu).Y else RobloxGui.AbsoluteSize.y
end

function SettingsUIDelegateModule:getDarkBackgroundTheme() --[[ Line: 227 ]]
	-- upvalues: v1 (ref), GetStyleTokensModule (copy), SpatialUIDarkenBackgroundTransparency (copy), ThemeModule (copy)
	if not self._vrEnabled then
		return {
			Color = ThemeModule.color("DarkenBackground"),
			Transparency = ThemeModule.transparency("DarkenBackground")
		}
	end
	if v1 == nil then
		v1 = GetStyleTokensModule()
	end
	return {
		Color = v1.Color.OverMedia.OverMedia_100.Color3,
		Transparency = math.min(math.max(SpatialUIDarkenBackgroundTransparency, 0), 100) / 100
	}
end

function SettingsUIDelegateModule.getBottomButtonSize(p1, p2: number): number --[[ Line: 243 ]]
	return if p1._vrEnabled then math.min(p2, 233) else p2
end

function SettingsUIDelegateModule.updatePanelVisibility(p1, p2) --[[ Line: 251 ]]
	-- upvalues: InExperienceUIVRIXP (copy), FFlagSpatialUIFixMenuPanelChatExclusiveModule (copy), ChatSelectorModule (copy), PanelType (copy)
	for _, windowsVisibilityValue in p1._windowsVisibilityValues do
		if windowsVisibilityValue then
			if InExperienceUIVRIXP:isMovePanelToCenter() and FFlagSpatialUIFixMenuPanelChatExclusiveModule then
				ChatSelectorModule:HideTemp(PanelType.MoreMenu, true)
			end
			p2:set(true)
			
			return
		end
	end
	if InExperienceUIVRIXP:isMovePanelToCenter() and FFlagSpatialUIFixMenuPanelChatExclusiveModule then
		ChatSelectorModule:HideTemp(PanelType.MoreMenu, false)
	end
	p2:set(false)
end

local function v20(Callback) --[[ Line: 268 ]]
	-- upvalues: CorePackages (copy), InExperienceUIVRIXP (copy), SpatialUIFixGameInviteChatExclusive (copy), ChatSelectorModule (copy)
	local EventConnection = require(CorePackages.Workspace.Packages.GameInvite).GameInviteModalManager.ToggleGameInviteModalEvent.Event:Connect(function(p3) --[[ Line: 271 ]]
		-- upvalues: Callback (copy), InExperienceUIVRIXP (upval), SpatialUIFixGameInviteChatExclusive (upval), ChatSelectorModule (upval)
		Callback("GameInvite", p3)
		
		if InExperienceUIVRIXP:isMovePanelToCenter() and SpatialUIFixGameInviteChatExclusive then
			if p3 then
				ChatSelectorModule:HideTemp("SettingsMenu", true)
				
				return
			end
			ChatSelectorModule:HideTemp("SettingsMenu", false)
		end
	end)
	
	return function() --[[ Line: 283 ]]
		-- upvalues: EventConnection (ref)
		if EventConnection then
			EventConnection:Disconnect()
			EventConnection = nil
		end
	end
end

local function v21(Callback) --[[ Line: 291 ]]
	local GuiService = game:GetService("GuiService")
	local InspectPlayerFromUserIdWithCtxRequestConnection = GuiService.InspectPlayerFromUserIdWithCtxRequest:Connect(function() --[[ Line: 294 ]]
		-- upvalues: Callback (copy)
		Callback("InspectAndBuy", true)
	end)
	local CloseInspectMenuRequestConnection = GuiService.CloseInspectMenuRequest:Connect(function() --[[ Line: 297 ]]
		-- upvalues: Callback (copy)
		Callback("InspectAndBuy", false)
	end)
	local InspectMenuEnabledChangedSignalConnection = GuiService.InspectMenuEnabledChangedSignal:Connect(function(Enabled) --[[ Line: 300 ]]
		-- upvalues: Callback (copy)
		if not Enabled then
			Callback("InspectAndBuy", false)
		end
	end)
	
	return function() --[[ Line: 306 ]]
		-- upvalues: InspectPlayerFromUserIdWithCtxRequestConnection (ref), CloseInspectMenuRequestConnection (ref), InspectMenuEnabledChangedSignalConnection (ref)
		if InspectPlayerFromUserIdWithCtxRequestConnection then
			InspectPlayerFromUserIdWithCtxRequestConnection:Disconnect()
			InspectPlayerFromUserIdWithCtxRequestConnection = nil
		end
		if CloseInspectMenuRequestConnection then
			CloseInspectMenuRequestConnection:Disconnect()
			CloseInspectMenuRequestConnection = nil
		end
		if InspectMenuEnabledChangedSignalConnection then
			InspectMenuEnabledChangedSignalConnection:Disconnect()
			InspectMenuEnabledChangedSignalConnection = nil
		end
	end
end

function SettingsUIDelegateModule:connectWindowsVisibility(NewResult) --[[ Line: 322 ]]
	-- upvalues: v20 (copy), v21 (copy)
	local function v52(p3, p4) --[[ Line: 323 ]]
		-- upvalues: self (copy), NewResult (copy)
		self._windowsVisibilityValues[p3] = p4
		self:updatePanelVisibility(NewResult)
	end
	
	for _, value in {
		function(Callback) --[[ Line: 328 ]]
			-- upvalues: self (copy)
			local SettingsShowSignalConnection = self._settingsHub.SettingsShowSignal:connect(function(p3) --[[ Line: 329 ]]
				-- upvalues: Callback (copy)
				Callback("SettingsHub", p3)
			end)
			
			return function() --[[ Line: 333 ]]
				-- upvalues: SettingsShowSignalConnection (ref)
				if SettingsShowSignalConnection then
					SettingsShowSignalConnection:Disconnect()
					SettingsShowSignalConnection = nil
				end
			end
		end,
		v20,
		v21
	} do
		table.insert(self._windowsDisconnectCallbacks, (value(v52)))
	end
end

function SettingsUIDelegateModule:disconnectWindowsVisibility() --[[ Line: 353 ]]
	for _, windowsDisconnectCallback in self._windowsDisconnectCallbacks do
		windowsDisconnectCallback()
	end
	self._windowsDisconnectCallbacks = {}
	self._windowsVisibilityValues = {}
end

function SettingsUIDelegateModule:isOpenCloseAnimationAllowed(): boolean --[[ Line: 361 ]]
	return not self._vrEnabled
end

function SettingsUIDelegateModule:getMenuContainerExtraSpace() --[[ Line: 369 ]]
	if self._vrEnabled then
		local MenuContainerPadding = self._settingsHub.MenuContainerPadding
		
		return MenuContainerPadding.PaddingTop.Offset + MenuContainerPadding.PaddingBottom.Offset
	else
		return 0
	end
end

local _ = function(Label) --[[ Line: 378 | Named "refreshVersionTextLabelSize" ]]
	-- upvalues: CoreScriptVersionEnabledEngineFeature (copy)
	local _UDim2 = UDim2.new(0.2, -6, 1, 0)
	Label.Size = if CoreScriptVersionEnabledEngineFeature then UDim2.new(0, Label.TextBounds.X + 6, 1, 0) else _UDim2
end

function SettingsUIDelegateModule:setVersionTextSize() --[[ Line: 384 ]]
	-- upvalues: ThemeModule (copy), SpatialUIVersionTextSizeScaled (copy), CoreScriptVersionEnabledEngineFeature (copy)
	for _, Label in self._settingsHub.VersionContainer:GetChildren() do
		if Label:IsA("TextLabel") then
			self._originalVersionTextSizes[Label] = Label.TextSize
			Label.TextSize = ThemeModule.textSize(SpatialUIVersionTextSizeScaled / 100)
			local _UDim2 = UDim2.new(0.2, -6, 1, 0)
			Label.Size = if CoreScriptVersionEnabledEngineFeature then UDim2.new(0, Label.TextBounds.X + 6, 1, 0) else _UDim2
		end
	end
end

function SettingsUIDelegateModule:restoreVersionTextSize() --[[ Line: 395 ]]
	-- upvalues: CoreScriptVersionEnabledEngineFeature (copy)
	for _, Label in self._settingsHub.VersionContainer:GetChildren() do
		if Label:IsA("TextLabel") and self._originalVersionTextSizes[Label] then
			Label.TextSize = self._originalVersionTextSizes[Label]
			local _UDim2 = UDim2.new(0.2, -6, 1, 0)
			Label.Size = if CoreScriptVersionEnabledEngineFeature then UDim2.new(0, Label.TextBounds.X + 6, 1, 0) else _UDim2
			self._originalVersionTextSizes[Label] = nil
		end
	end
	self._originalVersionTextSizes = {}
end

return SettingsUIDelegateModule