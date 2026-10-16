local ChromeUtilsModule = require(script:FindFirstAncestor("ChromeShared").Service.ChromeUtils)
local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local NewResult = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local _ = require(CorePackages.Workspace.Packages.Chrome)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local AvailabilitySignal = ChromeUtilsModule.AvailabilitySignal
local AvailabilitySignalState = ChromeUtilsModule.AvailabilitySignalState
local FFlagGamepadIconSupportCheck = require(CorePackages.Workspace.Packages.SharedFlags).FFlagGamepadIconSupportCheck
local ShortcutService = {}
ShortcutService.__index = ShortcutService

local function _(p1) --[[ Line: 79 | Named "_handleShortcutEvent" ]]
	return function(ActionName, UserInputState, _) --[[ Line: 80 ]]
		-- upvalues: p1 (copy)
		if UserInputState ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		for i, shortcut in p1._shortcuts do
			if shortcut.actionName and shortcut.actionName == ActionName then
				return p1:activateShortcut(i) or Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end
end

function ShortcutService.new() --[[ Line: 94 ]]
	-- upvalues: Signal (copy), ShortcutService (copy)
	return (setmetatable({
		_shortcuts = {},
		_shortcutBarList = {},
		_shortcutBarHiddenOverrides = {},
		onShortcutBarChanged = Signal.new(),
		_boundShortcuts = {}
	}, ShortcutService))
end

function ShortcutService:registerShortcut(p2) --[[ Line: 108 ]]
	-- upvalues: NewResult (copy), AvailabilitySignal (copy), AvailabilitySignalState (copy), UserInputService (copy)
	if self._shortcuts[p2.id] then
		warn(string.format("shortcut " .. p2.id .. " already registered", debug.traceback()))
	end
	if p2.label then
		p2.label = NewResult:Format(p2.label)
	end
	p2.displayPriority = p2.displayPriority or 0
	
	if p2.availability == nil then
		p2.availability = AvailabilitySignal.new(AvailabilitySignalState.Available)
	end
	p2.availability:connect(function() --[[ Line: 122 ]]
		-- upvalues: self (copy), p2 (copy)
		self:shortcutChanged(p2)
	end)
	p2.icon = UserInputService:GetImageForKeyCode(p2.keyCode)
	self._shortcuts[p2.id] = p2
end

function ShortcutService:activateShortcut(p2) --[[ Line: 131 ]]
	if self._shortcuts[p2] then
		local Shortcut = self._shortcuts[p2]
		
		if Shortcut.activated then
			return Shortcut.activated()
		end
	end
	return nil
end

function ShortcutService:shortcutChanged(_) --[[ Line: 142 ]]
	self:updateShortcutBar(self:getCurrentShortcutBar())
end

function ShortcutService:updateShortcutBar(CurrentShortcutBar) --[[ Line: 146 ]]
	self:_unbindAllShortcuts()
	self._currentShortcutBar = CurrentShortcutBar
	
	if self._shortcutBarHidden then
		self.onShortcutBarChanged:fire(nil)
		
		return
	end
	self.onShortcutBarChanged:fire(CurrentShortcutBar)
	
	if CurrentShortcutBar and self._shortcutBarList[CurrentShortcutBar] then
		self:_bindShortcutBar(CurrentShortcutBar)
	end
end

function ShortcutService:configureShortcutBar(p2, p3) --[[ Line: 161 ]]
	self._shortcutBarList[p2] = p3
end

function ShortcutService:setShortcutBar(CurrentShortcutBar) --[[ Line: 165 ]]
	if self._currentShortcutBar ~= CurrentShortcutBar then
		self:updateShortcutBar(CurrentShortcutBar)
	end
end

function ShortcutService:setHideShortcutBar(p2, ShortcutBarHiddenOverride) --[[ Line: 171 ]]
	if self._shortcutBarHiddenOverrides[p2] ~= ShortcutBarHiddenOverride then
		if ShortcutBarHiddenOverride then
			self._shortcutBarHiddenOverrides[p2] = ShortcutBarHiddenOverride
		else
			self._shortcutBarHiddenOverrides[p2] = nil
		end
		local _shortcutBarHidden = false
		
		for _, shortcutBarHiddenOverride in pairs(self._shortcutBarHiddenOverrides) do
			if shortcutBarHiddenOverride then
				_shortcutBarHidden = true
				break
			end
		end
		self._shortcutBarHidden = _shortcutBarHidden
		self:updateShortcutBar(self._currentShortcutBar)
	end
end

function ShortcutService:getHideShortcutBar() --[[ Line: 192 ]]
	return self._shortcutBarHidden
end

function ShortcutService:getShortcut(p3) --[[ Line: 196 ]]
	return self._shortcuts[p3]
end

function ShortcutService:getShortcutsFromBar(p3, _) --[[ Line: 200 ]]
	-- upvalues: AvailabilitySignalState (copy), FFlagGamepadIconSupportCheck (copy), UserInputService (copy)
	if not p3 then
		return {}
	end
	local List = {}
	
	for _, value in self._shortcutBarList[p3] do
		if self._shortcuts[value] then
			local Shortcut = self._shortcuts[value]
			
			if Shortcut.availability:get() ~= AvailabilitySignalState.Unavailable and (not FFlagGamepadIconSupportCheck or UserInputService:GamepadSupports(UserInputService:GetLastInputType(), Shortcut.keyCode)) then
				table.insert(List, Shortcut)
			end
		else
			warn(string.format("shortcut " .. value .. " not found", debug.traceback()))
		end
	end
	return List
end

function ShortcutService:getCurrentShortcutBar() --[[ Line: 229 ]]
	return self._currentShortcutBar
end

function ShortcutService:_bindShortcutBar(_currentShortcutBar) --[[ Line: 233 ]]
	-- upvalues: AvailabilitySignalState (copy)
	for _, value in self._shortcutBarList[_currentShortcutBar] do
		local Shortcut = self._shortcuts[value]
		
		if Shortcut and Shortcut.actionName then
			self:_unbindShortcut(value)
			
			if Shortcut.availability:get() ~= AvailabilitySignalState.Unavailable then
				self:_bindShortcut(value)
			end
		end
	end
end

function ShortcutService:_unbindShortcutBar(p4) --[[ Line: 247 ]]
	if p4 then
		for _, value in self._shortcutBarList[p4] do
			local Shortcut = self._shortcuts[value]
			
			if Shortcut and Shortcut.actionName then
				self:_unbindShortcut(value)
			end
		end
	end
end

function ShortcutService:_bindShortcut(p5) --[[ Line: 258 ]]
	-- upvalues: ContextActionService (copy)
	local Shortcut = self._shortcuts[p5]
	
	if Shortcut and Shortcut.actionName then
		ContextActionService:BindCoreAction(Shortcut.actionName, function(ActionName, UserInputState, _) --[[ Line: 80 ]]
			-- upvalues: self (copy)
			if UserInputState ~= Enum.UserInputState.Begin then
				return Enum.ContextActionResult.Pass
			end
			for i, shortcut in self._shortcuts do
				if shortcut.actionName and shortcut.actionName == ActionName then
					return self:activateShortcut(i) or Enum.ContextActionResult.Sink
				end
			end
			return Enum.ContextActionResult.Pass
		end, false, Shortcut.keyCode)
		self._boundShortcuts[Shortcut.actionName] = true
	end
end

function ShortcutService:_unbindShortcut(p6) --[[ Line: 266 ]]
	-- upvalues: ContextActionService (copy)
	local Shortcut = self._shortcuts[p6]
	
	if Shortcut and Shortcut.actionName then
		ContextActionService:UnbindCoreAction(Shortcut.actionName)
		self._boundShortcuts[Shortcut.actionName] = false
	end
end

function ShortcutService:_unbindAllShortcuts() --[[ Line: 274 ]]
	-- upvalues: ContextActionService (copy)
	for i, boundShortcut in self._boundShortcuts do
		if boundShortcut then
			ContextActionService:UnbindCoreAction(i)
			self._boundShortcuts[i] = false
		end
	end
end

return ShortcutService