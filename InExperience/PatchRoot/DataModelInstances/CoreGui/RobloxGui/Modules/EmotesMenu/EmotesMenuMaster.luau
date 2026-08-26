local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local localizationService = game:GetService("LocalizationService")
local starterGuiService = game:GetService("StarterGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local localPlayer = playersService.LocalPlayer

if not localPlayer then
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local signalsModule = require(corePackagesService.Packages.Signals)
local inExperienceTopBarModule = require(corePackagesService.Workspace.Packages.InExperienceTopBar)
local colorMode = require(corePackagesService.Packages.Foundation).Enums.ColorMode
local parent = script.Parent
local parent_1 = parent.Parent
local actions = parent.Actions
local components = parent.Components
local reducers = parent.Reducers
local thunks = parent.Thunks
local utility = parent.Utility
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local var1 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var2 = if not fFlagEnableNewBackpack then require(parent_1.BackpackScript) else nil
local chatSelectorModule = require(parent_1.ChatSelector)
local tenFootInterfaceModule = require(parent_1.TenFootInterface)
local constantsModule = require(parent_1.TopBar.Constants)
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local fFlagTopBarSignalizeSetCores = inExperienceTopBarModule.Flags.FFlagTopBarSignalizeSetCores
local constants = UIBloxModule.App.Style.Constants
local uiModeStyleProvider = require(corePackagesService.Workspace.Packages.Style).UiModeStyleProvider
local canPlayEmotesModule = require(utility.CanPlayEmotes)
local constantsModule_1 = require(parent.Constants)
local emotesMenuModule = require(components.EmotesMenu)
local emotesMenuReducerModule = require(reducers.EmotesMenuReducer)
local openMenuModule = require(thunks.OpenMenu)
local hideMenuModule = require(actions.HideMenu)
local emotesChangedModule = require(actions.EmotesChanged)
local equippedEmotesChangedModule = require(actions.EquippedEmotesChanged)
local numberEmotesLoadedChangedModule = require(actions.NumberEmotesLoadedChanged)
local setGuiInsetModule = require(actions.SetGuiInset)
local setLayoutModule = require(actions.SetLayout)
local setLocaleModule = require(actions.SetLocale)
local emotesStayOpenWithChat = game:DefineFastFlag("EmotesStayOpenWithChat", false)
local t = {}
t.__index = t

local function _()
	-- upvalues: runService (ref)
	return runService:IsClient() and (not runService:IsEdit() and not runService:IsRunMode())
end

function t:isOpen()
	return self.store:getState().displayOptions.menuVisible
end

function t:isEmotesLoaded()
	return self.store:getState().emotesPage.numberEmotesLoaded > 0
end

function t:open()
	-- upvalues: openMenuModule (ref)
	self.store:dispatch(openMenuModule())
end

function t:close()
	-- upvalues: hideMenuModule (ref)
	self.store:dispatch(hideMenuModule())
end

function t:setTopBarEnabled(p1)
	-- upvalues: starterGuiService (ref)
	self.topBarEnabled = p1
	
	if p1 and starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu) and self.canPlayEmotes then
		self:_mount()
		
		return
	end
	self:_unmount()
end

function t._connectCoreGuiListeners(p1)
	-- upvalues: fFlagEnableNewBackpack (ref), var1 (ref), var2 (ref), emotesStayOpenWithChat (ref), chatSelectorModule (ref), inExperienceAppChatModalModule (ref)
	if fFlagEnableNewBackpack then
		var1.onVisibilityChanged(var1.FeatureName.Backpack, function(p2)
			-- upvalues: p1 (ref)
			if not p2 then return end
			if p1:isOpen() then
				p1:close()
			end
		end)
	else
		var2.StateChanged.Event:Connect(function(p2)
			-- upvalues: p1 (ref)
			if not p2 then return end
			if p1:isOpen() then
				p1:close()
			end
		end)
	end
	if not emotesStayOpenWithChat then
		chatSelectorModule.VisibilityStateChanged:connect(function(p2)
			-- upvalues: p1 (ref)
			if not p2 then return end
			if p1:isOpen() then
				p1:close()
			end
		end)
	end
	if not emotesStayOpenWithChat then
		inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p2)
			-- upvalues: p1 (ref)
			if p2 and p1:isOpen() then
				p1:close()
			end
		end)
	end
end

function t._connectApiListeners(p1)
	-- upvalues: starterGuiService (ref), guiService (ref)
	starterGuiService.CoreGuiChangedSignal:connect(function(p2, p3)
		-- upvalues: p1 (ref)
		if not p1.topBarEnabled then return end
		if not p1.canPlayEmotes then return end
		if p2 == Enum.CoreGuiType.EmotesMenu or p2 == Enum.CoreGuiType.All then
			if p3 then
				p1:_mount()
				
				return
			end
			p1:_unmount()
		end
	end)
	guiService.EmotesMenuOpenChanged:Connect(function(p2)
		-- upvalues: p1 (ref)
		if p2 then
			if p1:isOpen() then
				return
			else
				p1:open()
				
				return
			end
		elseif p1:isOpen() then
			p1:close()
		end
	end)
end

function t:_onEquippedEmotesChanged(p1)
	-- upvalues: equippedEmotesChangedModule (ref)
	self.store:dispatch(equippedEmotesChangedModule(p1))
end

function t:_onEmotesChanged(p1)
	-- upvalues: emotesChangedModule (ref)
	self.store:dispatch(emotesChangedModule(p1))
end

function t:_onNumberEmotesLoadedChanged(p1)
	-- upvalues: numberEmotesLoadedChangedModule (ref)
	self.store:dispatch(numberEmotesLoadedChangedModule(p1))
	self.EmotesLoaded:Fire(p1 > 0)
end

function t:_onHumanoidDescriptionChanged(p1)
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
	if p1 then
		self.equippedEmotesChangedConn = p1.EquippedEmotesChanged:Connect(function(p2)
			-- upvalues: self (ref)
			self:_onEquippedEmotesChanged(p2)
		end)
		self:_onEquippedEmotesChanged(p1:GetEquippedEmotes())
		self.emotesChangedConn = p1.EmotesChanged:Connect(function(p2)
			-- upvalues: self (ref)
			self:_onEmotesChanged(p2)
		end)
		self:_onEmotesChanged(p1:GetEmotes())
		self.numberEmotesLoadedChangedConn = p1:GetPropertyChangedSignal("NumberEmotesLoaded"):Connect(function(p2)
			-- upvalues: self (ref)
			self:_onNumberEmotesLoadedChanged(p2)
		end)
		self:_onNumberEmotesLoadedChanged(p1.NumberEmotesLoaded)
		self.humanoidDescriptionAncestryConn = p1.AncestryChanged:Connect(function(p2, p3)
			-- upvalues: p1 (ref), self (ref)
			if p2 == p1 and p3 == nil then
				self:_onHumanoidDescriptionChanged(nil)
			end
		end)
		
		return
	end
	self:_onEquippedEmotesChanged({})
	self:_onEmotesChanged({})
	self:_onNumberEmotesLoadedChanged(-1)
end

function t:_onHumanoidChanged(p1)
	if self.humanoidChildAddedConn then
		self.humanoidChildAddedConn:Disconnect()
		self.humanoidChildAddedConn = nil
	end
	if self.humanoidAncestryChangedConn then
		self.humanoidAncestryChangedConn:Disconnect()
		self.humanoidAncestryChangedConn = nil
	end
	if not p1 then
		self:_onHumanoidDescriptionChanged(nil)
		
		return
	end
	self.humanoidChildAddedConn = p1.ChildAdded:Connect(function(p2)
		-- upvalues: self (ref)
		if p2:IsA("HumanoidDescription") then
			self:_onHumanoidDescriptionChanged(p2)
		end
	end)
	local humanoidDescription = p1:FindFirstChildOfClass("HumanoidDescription")
	
	if humanoidDescription then
		self:_onHumanoidDescriptionChanged(humanoidDescription)
	end
	self.humanoidAncestryChangedConn = p1.AncestryChanged:Connect(function(p2, p3)
		-- upvalues: p1 (ref), self (ref)
		if p2 == p1 and p3 == nil then
			self:_onHumanoidChanged(nil)
		end
	end)
end

function t:_onCharacterAdded(p1)
	if self.characterChildAddedConn then
		self.characterChildAddedConn:Disconnect()
		self.characterChildAddedConn = nil
	end
	self.characterChildAddedConn = p1.ChildAdded:Connect(function(p2)
		-- upvalues: self (ref)
		if p2:IsA("Humanoid") then
			self:_onHumanoidChanged(p2)
		end
	end)
	local humanoid = p1:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		self:_onHumanoidChanged(humanoid)
	end
end

function t:_connectListeners()
	-- upvalues: localPlayer (write), localizationService (ref), setLocaleModule (ref), canPlayEmotesModule (ref), starterGuiService (ref), fFlagTopBarSignalizeSetCores (ref), signalsModule (ref), inExperienceTopBarModule (ref)
	self:_connectCoreGuiListeners()
	self:_connectApiListeners()
	localPlayer.CharacterAdded:Connect(function(p1)
		-- upvalues: self (ref)
		self:_onCharacterAdded(p1)
	end)
	
	if localPlayer.Character then
		self:_onCharacterAdded(localPlayer.Character)
	end
	localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
		-- upvalues: self (ref), setLocaleModule (copy), localizationService (copy)
		self.store:dispatch(setLocaleModule(localizationService.RobloxLocaleId))
	end)
	canPlayEmotesModule.ChangedEvent.Event:connect(function(p1)
		-- upvalues: self (ref), starterGuiService (copy)
		self.canPlayEmotes = p1
		
		if p1 and self.topBarEnabled and starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu) then
			self:_mount()
			
			return
		end
		self:_unmount()
	end)
	
	if fFlagTopBarSignalizeSetCores then
		self.disposeEffect = signalsModule.createEffect(function(p1)
			-- upvalues: inExperienceTopBarModule (copy), self (ref)
			local getTopBarStore = inExperienceTopBarModule.Stores.GetTopBarStore
			
			if getTopBarStore then
				self:setTopBarEnabled(getTopBarStore(p1).getTopBarCoreGuiEnabled(p1))
			end
		end)
	end
end

function t:_onStateChanged(p1, p2)
	-- upvalues: guiService (ref)
	if p2.displayOptions.menuVisible ~= p1.displayOptions.menuVisible then
		self.EmotesMenuToggled:Fire(p1.displayOptions.menuVisible)
		guiService:SetEmotesMenuOpen(p1.displayOptions.menuVisible)
	end
end

function t:_mount()
	-- upvalues: colorMode (ref), constants (ref), roactModule (ref), roactRoduxModule (ref), uiModeStyleProvider (ref), emotesMenuModule (ref), robloxGui (ref)
	local t = {
		themeName = colorMode.Dark,
		fontName = constants.FontName.Gotham
	}
	
	if not self.instance then
		self.instance = roactModule.mount(roactModule.createElement("Folder", { Name = "EmotesMenu" }, roactModule.createElement(roactRoduxModule.StoreProvider, { store = self.store }, {
			StyleProvider = roactModule.createElement(uiModeStyleProvider, { style = t }, { EmotesMenu = roactModule.createElement(emotesMenuModule) })
		})), robloxGui, "EmotesMenu")
		self.MenuIsVisible = true
		self.MenuVisibilityChanged:Fire(true)
	end
end

function t:_unmount()
	-- upvalues: roactModule (ref)
	if self.instance then
		roactModule.unmount(self.instance)
		self.instance = nil
		self.MenuIsVisible = false
		self.MenuVisibilityChanged:Fire(false)
	end
end

function t.new()
	-- upvalues: t (ref), canPlayEmotesModule (ref), roduxModule (ref), emotesMenuReducerModule (ref), runService (ref), setLocaleModule (ref), localizationService (ref), tenFootInterfaceModule (ref), setLayoutModule (ref), constantsModule_1 (ref), constantsModule (ref), robloxGui (ref), setGuiInsetModule (ref)
	local tbl = setmetatable({}, t)
	tbl.canPlayEmotes = canPlayEmotesModule.Value
	tbl.topBarEnabled = true
	tbl.EmotesMenuToggled = Instance.new("BindableEvent")
	tbl.MenuIsVisible = false
	tbl.MenuVisibilityChanged = Instance.new("BindableEvent")
	tbl.EmotesLoaded = Instance.new("BindableEvent")
	tbl.store = roduxModule.Store.new(emotesMenuReducerModule, {}, { roduxModule.thunkMiddleware })
	
	if not runService:IsClient() or (runService:IsEdit() or runService:IsRunMode()) then
		return tbl
	end
	tbl.store.changed:connect(function(p1, p2)
		-- upvalues: tbl (ref)
		tbl:_onStateChanged(p1, p2)
	end)
	tbl.store:dispatch(setLocaleModule(localizationService.RobloxLocaleId))
	
	if tenFootInterfaceModule:IsEnabled() then
		tbl.store:dispatch(setLayoutModule(constantsModule_1.Layout.TenFoot))
	end
	local var3 = constantsModule.ApplyDisplayScale(constantsModule.TopBarHeight)
	
	if not robloxGui.IgnoreGuiInset then
		tbl.store:dispatch(setGuiInsetModule(var3))
	end
	tbl:_mount()
	tbl:_connectListeners()
	
	return tbl
end

return t.new()