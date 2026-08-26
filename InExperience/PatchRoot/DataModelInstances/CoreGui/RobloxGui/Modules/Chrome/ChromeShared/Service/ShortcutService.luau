local chromeUtilsModule = require(script:FindFirstAncestor("ChromeShared").Service.ChromeUtils)
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local var1 = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local _ = require(corePackagesService.Workspace.Packages.Chrome)
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local availabilitySignal = chromeUtilsModule.AvailabilitySignal
local availabilitySignalState = chromeUtilsModule.AvailabilitySignalState
local fFlagGamepadIconSupportCheck = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagGamepadIconSupportCheck
local t = {}
t.__index = t

local function _(p1)
	return function(p2, p3, _)
		-- upvalues: p1 (ref)
		if p3 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		for i, v in p1._shortcuts do
			if v.actionName and v.actionName == p2 then
				return p1:activateShortcut(i) or Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end
end

function t.new()
	-- upvalues: signal (ref), t (ref)
	return setmetatable({
		_shortcuts = {},
		_shortcutBarList = {},
		_shortcutBarHiddenOverrides = {},
		onShortcutBarChanged = signal.new(),
		_boundShortcuts = {}
	}, t)
end

function t:registerShortcut(p2)
	-- upvalues: var1 (ref), availabilitySignal (ref), availabilitySignalState (ref), userInputService (ref)
	if self._shortcuts[p2.id] then
		warn(string.format("shortcut " .. p3.id .. " already registered", debug.traceback()))
	end
	if p2.label then
		p2.label = var1:Format(p2.label)
	end
	p2.displayPriority = p2.displayPriority or 0
	
	if p2.availability == nil then
		p2.availability = availabilitySignal.new(availabilitySignalState.Available)
	end
	p2.availability:connect(function()
		-- upvalues: self (ref), p2 (ref)
		self:shortcutChanged(p2)
	end)
	p2.icon = userInputService:GetImageForKeyCode(p2.keyCode)
	self._shortcuts[p2.id] = p2
end

function t:activateShortcut(p2)
	if self._shortcuts[p2] then
		local var2 = self._shortcuts[p2]
		
		return if var2.activated then var2.activated() else nil
	end
end

function t:shortcutChanged(_)
	self:updateShortcutBar(self:getCurrentShortcutBar())
end

function t:updateShortcutBar(p2)
	self:_unbindAllShortcuts()
	self._currentShortcutBar = p2
	
	if self._shortcutBarHidden then
		self.onShortcutBarChanged:fire(nil)
		
		return
	end
	self.onShortcutBarChanged:fire(p2)
	
	if p2 and self._shortcutBarList[p2] then
		self:_bindShortcutBar(p2)
	end
end

function t:configureShortcutBar(p2, p3)
	self._shortcutBarList[p2] = p3
end

function t:setShortcutBar(p2)
	if self._currentShortcutBar ~= p2 then
		self:updateShortcutBar(p2)
	end
end

function t:setHideShortcutBar(p2, p3)
	if self._shortcutBarHiddenOverrides[p2] ~= p3 then
		if p3 then
			self._shortcutBarHiddenOverrides[p2] = p3
		else
			self._shortcutBarHiddenOverrides[p2] = nil
		end
		local var2 = false
		
		for i, v in pairs(self._shortcutBarHiddenOverrides) do
			if v then
				var2 = true
				break
			end
		end
		self._shortcutBarHidden = var2
		self:updateShortcutBar(self._currentShortcutBar)
	end
end

function t:getHideShortcutBar()
	return self._shortcutBarHidden
end

function t:getShortcut(p4)
	return self._shortcuts[p4]
end

function t:getShortcutsFromBar(p4, _)
	-- upvalues: availabilitySignalState (ref), fFlagGamepadIconSupportCheck (ref), userInputService (ref)
	if not p4 then
		return {}
	end
	local t = {}
	
	for i, v in self._shortcutBarList[p4] do
		if self._shortcuts[v] then
			local var3 = self._shortcuts[v]
			
			if var3.availability:get() ~= availabilitySignalState.Unavailable and (not fFlagGamepadIconSupportCheck or userInputService:GamepadSupports(userInputService:GetLastInputType(), var3.keyCode)) then
				table.insert(t, var3)
			end
		else
			warn(string.format("shortcut " .. v .. " not found", debug.traceback()))
		end
	end
	return t
end

function t:getCurrentShortcutBar()
	return self._currentShortcutBar
end

function t:_bindShortcutBar(p5)
	-- upvalues: availabilitySignalState (ref)
	for i, v in self._shortcutBarList[p5] do
		local var4 = self._shortcuts[v]
		
		if var4 and var4.actionName then
			self:_unbindShortcut(v)
			
			if var4.availability:get() ~= availabilitySignalState.Unavailable then
				self:_bindShortcut(v)
			end
		end
	end
end

function t:_unbindShortcutBar(p6)
	if p6 then
		for i, v in self._shortcutBarList[p6] do
			local var5 = self._shortcuts[v]
			
			if var5 and var5.actionName then
				self:_unbindShortcut(v)
			end
		end
	end
end

function t:_bindShortcut(p7)
	-- upvalues: contextActionService (ref)
	local var6 = self._shortcuts[p7]
	
	if var6 and var6.actionName then
		contextActionService:BindCoreAction(var6.actionName, function(p8, p9, _)
			-- upvalues: self (ref)
			if p9 ~= Enum.UserInputState.Begin then
				return Enum.ContextActionResult.Pass
			end
			for i, v in self._shortcuts do
				if v.actionName and v.actionName == p8 then
					return self:activateShortcut(i) or Enum.ContextActionResult.Sink
				end
			end
			return Enum.ContextActionResult.Pass
		end, false, var6.keyCode)
		self._boundShortcuts[var6.actionName] = true
	end
end

function t:_unbindShortcut(p8)
	-- upvalues: contextActionService (ref)
	local var7 = self._shortcuts[p8]
	
	if var7 and var7.actionName then
		contextActionService:UnbindCoreAction(var7.actionName)
		self._boundShortcuts[var7.actionName] = false
	end
end

function t:_unbindAllShortcuts()
	-- upvalues: contextActionService (ref)
	for i, v in self._boundShortcuts do
		if v then
			contextActionService:UnbindCoreAction(i)
			self._boundShortcuts[i] = false
		end
	end
end

return t