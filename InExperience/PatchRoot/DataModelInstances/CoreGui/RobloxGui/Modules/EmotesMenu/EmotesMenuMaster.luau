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
local var14 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var15 = if not fFlagEnableNewBackpack then require(parent_1.BackpackScript) else nil
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

local function _() --[[ line: 71 | named "isClient" ]]
	-- upvalues: runService (ref)
	return runService:IsClient() and (not runService:IsEdit() and not runService:IsRunMode())
end

function t:isOpen() --[[ line: 75 ]]
	return self.store:getState().displayOptions.menuVisible
end

function t:isEmotesLoaded() --[[ line: 79 ]]
	return self.store:getState().emotesPage.numberEmotesLoaded > 0
end

function t:open() --[[ line: 83 ]]
	-- upvalues: openMenuModule (ref)
	self.store:dispatch(openMenuModule())
end

function t:close() --[[ line: 87 ]]
	-- upvalues: hideMenuModule (ref)
	self.store:dispatch(hideMenuModule())
end

function t:setTopBarEnabled(p0) --[[ line: 91 ]]
	-- upvalues: starterGuiService (ref)
	self.topBarEnabled = p0
	
	if p0 and starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu) and self.canPlayEmotes then
		self:_mount()
		
		return
	end
	self:_unmount()
end

function t._connectCoreGuiListeners(p1) --[[ line: 102 ]]
	-- upvalues: fFlagEnableNewBackpack (ref), var14 (ref), var15 (ref), emotesStayOpenWithChat (ref), chatSelectorModule (ref), inExperienceAppChatModalModule (ref)
	if fFlagEnableNewBackpack then
		var14.onVisibilityChanged(var14.FeatureName.Backpack, function(p2) --[[ line: 104 ]]
			-- upvalues: p1 (ref)
			if not p2 then return end
			if p1:isOpen() then
				p1:close()
			end
		end)
	else
		var15.StateChanged.Event:Connect(function(p3) --[[ line: 114 ]]
			-- upvalues: p1 (ref)
			if not p3 then return end
			if p1:isOpen() then
				p1:close()
			end
		end)
	end
	if not emotesStayOpenWithChat then
		chatSelectorModule.VisibilityStateChanged:connect(function(p4) --[[ line: 126 ]]
			-- upvalues: p1 (ref)
			if not p4 then return end
			if p1:isOpen() then
				p1:close()
			end
		end)
	end
	if not emotesStayOpenWithChat then
		inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p5) --[[ line: 138 ]]
			-- upvalues: p1 (ref)
			if p5 and p1:isOpen() then
				p1:close()
			end
		end)
	end
end

function t._connectApiListeners(p6) --[[ line: 146 ]]
	-- upvalues: starterGuiService (ref), guiService (ref)
	starterGuiService.CoreGuiChangedSignal:connect(function(p7, p8) --[[ line: 147 ]]
		-- upvalues: p6 (ref)
		if not p6.topBarEnabled then return end
		if not p6.canPlayEmotes then return end
		if p7 == Enum.CoreGuiType.EmotesMenu or p7 == Enum.CoreGuiType.All then
			if p8 then
				p6:_mount()
				
				return
			end
			p6:_unmount()
		end
	end)
	guiService.EmotesMenuOpenChanged:Connect(function(p9) --[[ line: 165 ]]
		-- upvalues: p6 (ref)
		if p9 then
			if p6:isOpen() then
				return
			else
				p6:open()
				
				return
			end
		elseif p6:isOpen() then
			p6:close()
		end
	end)
end

function t:_onEquippedEmotesChanged(p10) --[[ line: 178 ]]
	-- upvalues: equippedEmotesChangedModule (ref)
	self.store:dispatch(equippedEmotesChangedModule(p10))
end

function t:_onEmotesChanged(p11) --[[ line: 182 ]]
	-- upvalues: emotesChangedModule (ref)
	self.store:dispatch(emotesChangedModule(p11))
end

function t:_onNumberEmotesLoadedChanged(p12) --[[ line: 186 ]]
	-- upvalues: numberEmotesLoadedChangedModule (ref)
	self.store:dispatch(numberEmotesLoadedChangedModule(p12))
	self.EmotesLoaded:Fire(p12 > 0)
end

function t:_onHumanoidDescriptionChanged(p13) --[[ line: 191 ]]
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
	if p13 then
		self.equippedEmotesChangedConn = p13.EquippedEmotesChanged:Connect(function(p14) --[[ line: 213 ]]
			-- upvalues: self (ref)
			self:_onEquippedEmotesChanged(p14)
		end)
		self:_onEquippedEmotesChanged(p13:GetEquippedEmotes())
		self.emotesChangedConn = p13.EmotesChanged:Connect(function(p15) --[[ line: 218 ]]
			-- upvalues: self (ref)
			self:_onEmotesChanged(p15)
		end)
		self:_onEmotesChanged(p13:GetEmotes())
		self.numberEmotesLoadedChangedConn = p13:GetPropertyChangedSignal("NumberEmotesLoaded"):Connect(function(p16) --[[ line: 225 ]]
			-- upvalues: self (ref)
			self:_onNumberEmotesLoadedChanged(p16)
		end)
		self:_onNumberEmotesLoadedChanged(p13.NumberEmotesLoaded)
		self.humanoidDescriptionAncestryConn = p13.AncestryChanged:Connect(function(p17, p18) --[[ line: 230 ]]
			-- upvalues: p13 (ref), self (ref)
			if p17 == p13 and p18 == nil then
				self:_onHumanoidDescriptionChanged(nil)
			end
		end)
		
		return
	end
	self:_onEquippedEmotesChanged({})
	self:_onEmotesChanged({})
	self:_onNumberEmotesLoadedChanged(-1)
end

function t:_onHumanoidChanged(p19) --[[ line: 242 ]]
	if self.humanoidChildAddedConn then
		self.humanoidChildAddedConn:Disconnect()
		self.humanoidChildAddedConn = nil
	end
	if self.humanoidAncestryChangedConn then
		self.humanoidAncestryChangedConn:Disconnect()
		self.humanoidAncestryChangedConn = nil
	end
	if not p19 then
		self:_onHumanoidDescriptionChanged(nil)
		
		return
	end
	self.humanoidChildAddedConn = p19.ChildAdded:Connect(function(p20) --[[ line: 254 ]]
		-- upvalues: self (ref)
		if p20:IsA("HumanoidDescription") then
			self:_onHumanoidDescriptionChanged(p20)
		end
	end)
	local humanoidDescription = p19:FindFirstChildOfClass("HumanoidDescription")
	
	if humanoidDescription then
		self:_onHumanoidDescriptionChanged(humanoidDescription)
	end
	self.humanoidAncestryChangedConn = p19.AncestryChanged:Connect(function(p21, p22) --[[ line: 265 ]]
		-- upvalues: p19 (ref), self (ref)
		if p21 == p19 and p22 == nil then
			self:_onHumanoidChanged(nil)
		end
	end)
end

function t:_onCharacterAdded(p23) --[[ line: 275 ]]
	if self.characterChildAddedConn then
		self.characterChildAddedConn:Disconnect()
		self.characterChildAddedConn = nil
	end
	self.characterChildAddedConn = p23.ChildAdded:Connect(function(p24) --[[ line: 281 ]]
		-- upvalues: self (ref)
		if p24:IsA("Humanoid") then
			self:_onHumanoidChanged(p24)
		end
	end)
	local humanoid = p23:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		self:_onHumanoidChanged(humanoid)
	end
end

function t:_connectListeners() --[[ line: 293 ]]
	-- upvalues: localPlayer (write), localizationService (ref), setLocaleModule (ref), canPlayEmotesModule (ref), starterGuiService (ref), fFlagTopBarSignalizeSetCores (ref), signalsModule (ref), inExperienceTopBarModule (ref)
	self:_connectCoreGuiListeners()
	self:_connectApiListeners()
	localPlayer.CharacterAdded:Connect(function(p25) --[[ line: 297 ]]
		-- upvalues: self (ref)
		self:_onCharacterAdded(p25)
	end)
	
	if localPlayer.Character then
		self:_onCharacterAdded(localPlayer.Character)
	end
	localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ line: 305 ]]
		-- upvalues: self (ref), setLocaleModule (copy), localizationService (copy)
		self.store:dispatch(setLocaleModule(localizationService.RobloxLocaleId))
	end)
	canPlayEmotesModule.ChangedEvent.Event:connect(function(p26) --[[ line: 309 ]]
		-- upvalues: self (ref), starterGuiService (copy)
		self.canPlayEmotes = p26
		
		if p26 and self.topBarEnabled and starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu) then
			self:_mount()
			
			return
		end
		self:_unmount()
	end)
	
	if fFlagTopBarSignalizeSetCores then
		self.disposeEffect = signalsModule.createEffect(function(p27) --[[ line: 321 ]]
			-- upvalues: inExperienceTopBarModule (copy), self (ref)
			local getTopBarStore = inExperienceTopBarModule.Stores.GetTopBarStore
			
			if getTopBarStore then
				self:setTopBarEnabled(getTopBarStore(p27).getTopBarCoreGuiEnabled(p27))
			end
		end)
	end
end

function t:_onStateChanged(p28, p29) --[[ line: 330 ]]
	-- upvalues: guiService (ref)
	if p29.displayOptions.menuVisible ~= p28.displayOptions.menuVisible then
		self.EmotesMenuToggled:Fire(p28.displayOptions.menuVisible)
		guiService:SetEmotesMenuOpen(p28.displayOptions.menuVisible)
	end
end

function t:_mount() --[[ line: 338 ]]
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

function t:_unmount() --[[ line: 366 ]]
	-- upvalues: roactModule (ref)
	if self.instance then
		roactModule.unmount(self.instance)
		self.instance = nil
		self.MenuIsVisible = false
		self.MenuVisibilityChanged:Fire(false)
	end
end

function t.new() --[[ line: 376 ]]
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
	tbl.store.changed:connect(function(p30, p31) --[[ line: 406 ]]
		-- upvalues: tbl (ref)
		tbl:_onStateChanged(p30, p31)
	end)
	tbl.store:dispatch(setLocaleModule(localizationService.RobloxLocaleId))
	
	if tenFootInterfaceModule:IsEnabled() then
		tbl.store:dispatch(setLayoutModule(constantsModule_1.Layout.TenFoot))
	end
	local var38 = constantsModule.ApplyDisplayScale(constantsModule.TopBarHeight)
	
	if not robloxGui.IgnoreGuiInset then
		tbl.store:dispatch(setGuiInsetModule(var38))
	end
	tbl:_mount()
	tbl:_connectListeners()
	
	return tbl
end

return t.new()