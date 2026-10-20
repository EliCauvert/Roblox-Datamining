local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalizationService = game:GetService("LocalizationService")
local StarterGui = game:GetService("StarterGui")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local LocalPlayer = Players.LocalPlayer

if not LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local SignalsModule = require(CorePackages.Packages.Signals)
local InExperienceTopBarModule = require(CorePackages.Workspace.Packages.InExperienceTopBar)
local Parent = script.Parent
local Parent1 = Parent.Parent
local Actions = Parent.Actions
local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local Features = if FFlagEnableNewBackpack then require(CorePackages.Workspace.Packages.System).Features else nil
local BackpackScriptModule = if FFlagEnableNewBackpack then nil else require(Parent1.BackpackScript)
local ChatSelectorModule = require(Parent1.ChatSelector)
local TenFootInterfaceModule = require(Parent1.TenFootInterface)
local ConstantsModule = require(Parent1.TopBar.Constants)
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local FFlagTopBarSignalizeSetCores = InExperienceTopBarModule.Flags.FFlagTopBarSignalizeSetCores
local Constants = require(CorePackages.Packages.UIBlox).App.Style.Constants
local UiModeStyleProvider = require(CorePackages.Workspace.Packages.Style).UiModeStyleProvider
local CanPlayEmotesModule = require(Parent.Utility.CanPlayEmotes)
local ConstantsModule1 = require(Parent.Constants)
local EmotesMenuModule = require(Parent.Components.EmotesMenu)
local EmotesMenuReducerModule = require(Parent.Reducers.EmotesMenuReducer)
local OpenMenuModule = require(Parent.Thunks.OpenMenu)
local HideMenuModule = require(Actions.HideMenu)
local EmotesChangedModule = require(Actions.EmotesChanged)
local EquippedEmotesChangedModule = require(Actions.EquippedEmotesChanged)
local NumberEmotesLoadedChangedModule = require(Actions.NumberEmotesLoadedChanged)
local SetGuiInsetModule = require(Actions.SetGuiInset)
local SetLayoutModule = require(Actions.SetLayout)
local SetLocaleModule = require(Actions.SetLocale)
local EmotesStayOpenWithChat = game:DefineFastFlag("EmotesStayOpenWithChat", false)
local Module = {}
Module.__index = Module

local function _(): boolean
	-- upvalues: RunService (copy)
	return RunService:IsClient() and (not RunService:IsEdit() and not RunService:IsRunMode())
end

function Module:isOpen()
	return self.store:getState().displayOptions.menuVisible
end

function Module:isEmotesLoaded(): boolean
	return self.store:getState().emotesPage.numberEmotesLoaded > 0
end

function Module:open()
	-- upvalues: OpenMenuModule (copy)
	self.store:dispatch(OpenMenuModule())
end

function Module:close()
	-- upvalues: HideMenuModule (copy)
	self.store:dispatch(HideMenuModule())
end

function Module:setTopBarEnabled(TopBarEnabled)
	-- upvalues: StarterGui (copy)
	self.topBarEnabled = TopBarEnabled
	local CoreGuiEnabled = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu)
	
	if TopBarEnabled and CoreGuiEnabled and self.canPlayEmotes then
		self:_mount()
		
		return
	else
		self:_unmount()
	end
end

function Module._connectCoreGuiListeners(p1)
	-- upvalues: FFlagEnableNewBackpack (copy), Features (copy), BackpackScriptModule (copy), EmotesStayOpenWithChat (copy), ChatSelectorModule (copy), InExperienceAppChatModalModule (copy)
	if FFlagEnableNewBackpack then
		Features.onVisibilityChanged(Features.FeatureName.Backpack, function(p2)
			-- upvalues: p1 (copy)
			if not p2 then return end
			if p1:isOpen() then
				p1:close()
			end
		end)
	else
		BackpackScriptModule.StateChanged.Event:Connect(function(p2)
			-- upvalues: p1 (copy)
			if not p2 then return end
			if p1:isOpen() then
				p1:close()
			end
		end)
	end
	if not EmotesStayOpenWithChat then
		ChatSelectorModule.VisibilityStateChanged:connect(function(p2)
			-- upvalues: p1 (copy)
			if not p2 then return end
			if p1:isOpen() then
				p1:close()
			end
		end)
	end
	if not EmotesStayOpenWithChat then
		InExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p2)
			-- upvalues: p1 (copy)
			if p2 and p1:isOpen() then
				p1:close()
			end
		end)
	end
end

function Module._connectApiListeners(p1)
	-- upvalues: StarterGui (copy), GuiService (copy)
	StarterGui.CoreGuiChangedSignal:connect(function(CoreGuiType, Enabled)
		-- upvalues: p1 (copy)
		if not p1.topBarEnabled then return end
		if not p1.canPlayEmotes then return end
		if CoreGuiType == Enum.CoreGuiType.EmotesMenu or CoreGuiType == Enum.CoreGuiType.All then
			if Enabled then
				p1:_mount()
				
				return
			end
			p1:_unmount()
		end
	end)
	GuiService.EmotesMenuOpenChanged:Connect(function(IsOpen)
		-- upvalues: p1 (copy)
		if IsOpen then
			if not p1:isOpen() then
				p1:open()
				
				return
			end
		elseif p1:isOpen() then
			p1:close()
		end
	end)
end

function Module:_onEquippedEmotesChanged(EquippedEmotes)
	-- upvalues: EquippedEmotesChangedModule (copy)
	self.store:dispatch(EquippedEmotesChangedModule(EquippedEmotes))
end

function Module:_onEmotesChanged(Emotes)
	-- upvalues: EmotesChangedModule (copy)
	self.store:dispatch(EmotesChangedModule(Emotes))
end

function Module:_onNumberEmotesLoadedChanged(NumberEmotesLoaded: number)
	-- upvalues: NumberEmotesLoadedChangedModule (copy)
	self.store:dispatch(NumberEmotesLoadedChangedModule(NumberEmotesLoaded))
	self.EmotesLoaded:Fire(NumberEmotesLoaded > 0)
end

function Module:_onHumanoidDescriptionChanged(HumanoidDescription)
	if self.equippedEmotesChangedConn then
		self.equippedEmotesChangedConn:Disconnect()
		self.equippedEmotesChangedConn = nil
	end
	if self.emotesChangedConn then
		self.emotesChangedConn:Disconnect()
		self.emotesChangedConn = nil
	end
	if self.numberEmotesLoadedChangedConn then
		self.numberEmotesLoadedChangedConn:Disconnect()
		self.numberEmotesLoadedChangedConn = nil
	end
	if self.humanoidDescriptionAncestryConn then
		self.humanoidDescriptionAncestryConn:Disconnect()
		self.humanoidDescriptionAncestryConn = nil
	end
	if HumanoidDescription then
		self.equippedEmotesChangedConn = HumanoidDescription.EquippedEmotesChanged:Connect(function(NewEquippedEmotes)
			-- upvalues: self (copy)
			self:_onEquippedEmotesChanged(NewEquippedEmotes)
		end)
		self:_onEquippedEmotesChanged(HumanoidDescription:GetEquippedEmotes())
		self.emotesChangedConn = HumanoidDescription.EmotesChanged:Connect(function(NewEmotes)
			-- upvalues: self (copy)
			self:_onEmotesChanged(NewEmotes)
		end)
		self:_onEmotesChanged(HumanoidDescription:GetEmotes())
		self.numberEmotesLoadedChangedConn = HumanoidDescription:GetPropertyChangedSignal("NumberEmotesLoaded"):Connect(function(p1)
			-- upvalues: self (copy)
			self:_onNumberEmotesLoadedChanged(p1)
		end)
		self:_onNumberEmotesLoadedChanged(HumanoidDescription.NumberEmotesLoaded)
		self.humanoidDescriptionAncestryConn = HumanoidDescription.AncestryChanged:Connect(function(Child, NewParent)
			-- upvalues: HumanoidDescription (copy), self (copy)
			if Child == HumanoidDescription and NewParent == nil then
				self:_onHumanoidDescriptionChanged(nil)
			end
		end)
		
		return
	else
		self:_onEquippedEmotesChanged({})
		self:_onEmotesChanged({})
		self:_onNumberEmotesLoadedChanged(-1)
	end
end

function Module:_onHumanoidChanged(Humanoid)
	if self.humanoidChildAddedConn then
		self.humanoidChildAddedConn:Disconnect()
		self.humanoidChildAddedConn = nil
	end
	if self.humanoidAncestryChangedConn then
		self.humanoidAncestryChangedConn:Disconnect()
		self.humanoidAncestryChangedConn = nil
	end
	if not Humanoid then
		self:_onHumanoidDescriptionChanged(nil)
		
		return
	end
	self.humanoidChildAddedConn = Humanoid.ChildAdded:Connect(function(Child)
		-- upvalues: self (copy)
		if Child:IsA("HumanoidDescription") then
			self:_onHumanoidDescriptionChanged(Child)
		end
	end)
	local HumanoidDescription = Humanoid:FindFirstChildOfClass("HumanoidDescription")
	
	if HumanoidDescription then
		self:_onHumanoidDescriptionChanged(HumanoidDescription)
	end
	self.humanoidAncestryChangedConn = Humanoid.AncestryChanged:Connect(function(Child, NewParent)
		-- upvalues: Humanoid (copy), self (copy)
		if Child == Humanoid and NewParent == nil then
			self:_onHumanoidChanged(nil)
		end
	end)
end

function Module:_onCharacterAdded(Character)
	if self.characterChildAddedConn then
		self.characterChildAddedConn:Disconnect()
		self.characterChildAddedConn = nil
	end
	self.characterChildAddedConn = Character.ChildAdded:Connect(function(Child: Humanoid)
		-- upvalues: self (copy)
		if Child:IsA("Humanoid") then
			self:_onHumanoidChanged(Child)
		end
	end)
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
	
	if Humanoid then
		self:_onHumanoidChanged(Humanoid)
	end
end

function Module:_connectListeners()
	-- upvalues: LocalPlayer (ref), LocalizationService (copy), SetLocaleModule (copy), CanPlayEmotesModule (copy), StarterGui (copy), FFlagTopBarSignalizeSetCores (copy), SignalsModule (copy), InExperienceTopBarModule (copy)
	self:_connectCoreGuiListeners()
	self:_connectApiListeners()
	LocalPlayer.CharacterAdded:Connect(function(Character)
		-- upvalues: self (copy)
		self:_onCharacterAdded(Character)
	end)
	
	if LocalPlayer.Character then
		self:_onCharacterAdded(LocalPlayer.Character)
	end
	LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
		-- upvalues: self (copy), SetLocaleModule (upval), LocalizationService (upval)
		self.store:dispatch(SetLocaleModule(LocalizationService.RobloxLocaleId))
	end)
	CanPlayEmotesModule.ChangedEvent.Event:connect(function(CanPlayEmotes)
		-- upvalues: self (copy), StarterGui (upval)
		self.canPlayEmotes = CanPlayEmotes
		local CoreGuiEnabled = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu)
		
		if CanPlayEmotes and self.topBarEnabled and CoreGuiEnabled then
			self:_mount()
			
			return
		else
			self:_unmount()
		end
	end)
	
	if FFlagTopBarSignalizeSetCores then
		self.disposeEffect = SignalsModule.createEffect(function(p1)
			-- upvalues: InExperienceTopBarModule (upval), self (copy)
			local GetTopBarStoreFunction = InExperienceTopBarModule.Stores.GetTopBarStore
			
			if GetTopBarStoreFunction then
				self:setTopBarEnabled(GetTopBarStoreFunction(p1).getTopBarCoreGuiEnabled(p1))
			end
		end)
	end
end

function Module:_onStateChanged(p1, p2)
	-- upvalues: GuiService (copy)
	if p2.displayOptions.menuVisible ~= p1.displayOptions.menuVisible then
		self.EmotesMenuToggled:Fire(p1.displayOptions.menuVisible)
		GuiService:SetEmotesMenuOpen(p1.displayOptions.menuVisible)
	end
end

function Module:_mount()
	-- upvalues: Constants (copy), RoactModule (copy), RoactRoduxModule (copy), UiModeStyleProvider (copy), EmotesMenuModule (copy), RobloxGui (copy)
	local Style = {
		themeName = Constants.ThemeName.Dark,
		fontName = Constants.FontName.Gotham
	}
	
	if not self.instance then
		self.instance = RoactModule.mount(RoactModule.createElement("Folder", { Name = "EmotesMenu" }, (RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = self.store }, {
			StyleProvider = RoactModule.createElement(UiModeStyleProvider, { style = Style }, { EmotesMenu = RoactModule.createElement(EmotesMenuModule) })
		}))), RobloxGui, "EmotesMenu")
		self.MenuIsVisible = true
		self.MenuVisibilityChanged:Fire(true)
	end
end

function Module:_unmount()
	-- upvalues: RoactModule (copy)
	if self.instance then
		RoactModule.unmount(self.instance)
		self.instance = nil
		self.MenuIsVisible = false
		self.MenuVisibilityChanged:Fire(false)
	end
end

function Module.new()
	-- upvalues: Module (copy), CanPlayEmotesModule (copy), RoduxModule (copy), EmotesMenuReducerModule (copy), RunService (copy), SetLocaleModule (copy), LocalizationService (copy), TenFootInterfaceModule (copy), SetLayoutModule (copy), ConstantsModule1 (copy), ConstantsModule (copy), RobloxGui (copy), SetGuiInsetModule (copy)
	local self = setmetatable({}, Module)
	self.canPlayEmotes = CanPlayEmotesModule.Value
	self.topBarEnabled = true
	self.EmotesMenuToggled = Instance.new("BindableEvent")
	self.MenuIsVisible = false
	self.MenuVisibilityChanged = Instance.new("BindableEvent")
	self.EmotesLoaded = Instance.new("BindableEvent")
	self.store = RoduxModule.Store.new(EmotesMenuReducerModule, {}, { RoduxModule.thunkMiddleware })
	
	if not RunService:IsClient() or (RunService:IsEdit() or RunService:IsRunMode()) then
		return self
	end
	self.store.changed:connect(function(Value, p1)
		-- upvalues: self (copy)
		self:_onStateChanged(Value, p1)
	end)
	self.store:dispatch(SetLocaleModule(LocalizationService.RobloxLocaleId))
	
	if TenFootInterfaceModule:IsEnabled() then
		self.store:dispatch(SetLayoutModule(ConstantsModule1.Layout.TenFoot))
	end
	local ApplyDisplayScaleResult = ConstantsModule.ApplyDisplayScale(ConstantsModule.TopBarHeight)
	
	if not RobloxGui.IgnoreGuiInset then
		self.store:dispatch(SetGuiInsetModule(ApplyDisplayScaleResult))
	end
	self:_mount()
	self:_connectListeners()
	
	return self
end

return Module.new()