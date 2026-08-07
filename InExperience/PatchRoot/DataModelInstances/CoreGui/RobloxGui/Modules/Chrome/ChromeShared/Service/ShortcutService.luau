local chromeUtilsModule = require(script:FindFirstAncestor("ChromeShared").Service.ChromeUtils)
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local var4 = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local _ = require(corePackagesService.Workspace.Packages.Chrome)
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local availabilitySignal = chromeUtilsModule.AvailabilitySignal
local availabilitySignalState = chromeUtilsModule.AvailabilitySignalState
local fFlagGamepadIconSupportCheck = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagGamepadIconSupportCheck
local t = {}
t.__index = t

local function _(p0) --[[ line: 79 | named "_handleShortcutEvent" ]]
	return function(p1, p2, _) --[[ line: 80 ]]
		-- upvalues: p0 (ref)
		if p2 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		for i, v in p0._shortcuts do
			if v.actionName and v.actionName == p1 then
				return p0:activateShortcut(i) or Enum.ContextActionResult.Sink
			end
		end
		return Enum.ContextActionResult.Pass
	end
end

function t.new() --[[ line: 94 ]]
	-- upvalues: signal (ref), t (ref)
	return setmetatable({
		_shortcuts = {},
		_shortcutBarList = {},
		_shortcutBarHiddenOverrides = {},
		onShortcutBarChanged = signal.new(),
		_boundShortcuts = {}
	}, t)
end

function t:registerShortcut(p3) --[[ line: 108 ]]
	-- upvalues: var4 (ref), availabilitySignal (ref), availabilitySignalState (ref), userInputService (ref)
	if self._shortcuts[p3.id] then
		warn(string.format("shortcut " .. p3.id .. " already registered", debug.traceback()))
	end
	if p3.label then
		p3.label = var4:Format(p3.label)
	end
	p3.displayPriority = p3.displayPriority or 0
	
	if p3.availability == nil then
		p3.availability = availabilitySignal.new(availabilitySignalState.Available)
	end
	p3.availability:connect(function() --[[ line: 122 ]]
		-- upvalues: self (ref), p3 (ref)
		self:shortcutChanged(p3)
	end)
	p3.icon = userInputService:GetImageForKeyCode(p3.keyCode)
	self._shortcuts[p3.id] = p3
end

function t:activateShortcut(p4) --[[ line: 131 ]]
	if self._shortcuts[p4] then
		local var6 = self._shortcuts[p4]
		
		return if var6.activated then var6.activated() else nil
	end
end

function t:shortcutChanged(_) --[[ line: 142 ]]
	self:updateShortcutBar(self:getCurrentShortcutBar())
end

function t:updateShortcutBar(p5) --[[ line: 146 ]]
	self:_unbindAllShortcuts()
	self._currentShortcutBar = p5
	
	if self._shortcutBarHidden then
		self.onShortcutBarChanged:fire(nil)
		
		return
	end
	self.onShortcutBarChanged:fire(p5)
	
	if p5 and self._shortcutBarList[p5] then
		self:_bindShortcutBar(p5)
	end
end

function t:configureShortcutBar(p6, p7) --[[ line: 161 ]]
	self._shortcutBarList[p6] = p7
end

function t:setShortcutBar(p8) --[[ line: 165 ]]
	if self._currentShortcutBar ~= p8 then
		self:updateShortcutBar(p8)
	end
end

function t:setHideShortcutBar(p9, p10) --[[ line: 171 ]]
	if self._shortcutBarHiddenOverrides[p9] ~= p10 then
		if p10 then
			self._shortcutBarHiddenOverrides[p9] = p10
		else
			self._shortcutBarHiddenOverrides[p9] = nil
		end
		local var7 = false
		
		for i, v in pairs(self._shortcutBarHiddenOverrides) do
			if v then
				var7 = true
				break
			end
		end
		self._shortcutBarHidden = var7
		self:updateShortcutBar(self._currentShortcutBar)
	end
end

function t:getHideShortcutBar() --[[ line: 192 ]]
	return self._shortcutBarHidden
end

function t:getShortcut(p11) --[[ line: 196 ]]
	return self._shortcuts[p11]
end

function t:getShortcutsFromBar(p12, _) --[[ line: 200 ]]
	-- upvalues: availabilitySignalState (ref), fFlagGamepadIconSupportCheck (ref), userInputService (ref)
	if not p12 then
		return {}
	end
	local t = {}
	
	for i, v in self._shortcutBarList[p12] do
		if self._shortcuts[v] then
			local var9 = self._shortcuts[v]
			
			if var9.availability:get() ~= availabilitySignalState.Unavailable and (not fFlagGamepadIconSupportCheck or userInputService:GamepadSupports(userInputService:GetLastInputType(), var9.keyCode)) then
				table.insert(t, var9)
			end
		else
			warn(string.format("shortcut " .. v .. " not found", debug.traceback()))
		end
	end
	return t
end

function t:getCurrentShortcutBar() --[[ line: 229 ]]
	return self._currentShortcutBar
end

function t:_bindShortcutBar(p13) --[[ line: 233 ]]
	-- upvalues: availabilitySignalState (ref)
	for i, v in self._shortcutBarList[p13] do
		local var10 = self._shortcuts[v]
		
		if var10 and var10.actionName then
			self:_unbindShortcut(v)
			
			if var10.availability:get() ~= availabilitySignalState.Unavailable then
				self:_bindShortcut(v)
			end
		end
	end
end

function t:_unbindShortcutBar(p14) --[[ line: 247 ]]
	if p14 then
		for i, v in self._shortcutBarList[p14] do
			local var11 = self._shortcuts[v]
			
			if var11 and var11.actionName then
				self:_unbindShortcut(v)
			end
		end
	end
end

function t:_bindShortcut(p15) --[[ line: 258 ]]
	-- upvalues: contextActionService (ref)
	local var12 = self._shortcuts[p15]
	
	if var12 and var12.actionName then
		contextActionService:BindCoreAction(var12.actionName, function(p16, p17, _) --[[ line: 80 ]]
			-- upvalues: self (ref)
			if p17 ~= Enum.UserInputState.Begin then
				return Enum.ContextActionResult.Pass
			end
			for i, v in self._shortcuts do
				if v.actionName and v.actionName == p16 then
					return self:activateShortcut(i) or Enum.ContextActionResult.Sink
				end
			end
			return Enum.ContextActionResult.Pass
		end, false, var12.keyCode)
		self._boundShortcuts[var12.actionName] = true
	end
end

function t:_unbindShortcut(p18) --[[ line: 266 ]]
	-- upvalues: contextActionService (ref)
	local var13 = self._shortcuts[p18]
	
	if var13 and var13.actionName then
		contextActionService:UnbindCoreAction(var13.actionName)
		self._boundShortcuts[var13.actionName] = false
	end
end

function t:_unbindAllShortcuts() --[[ line: 274 ]]
	-- upvalues: contextActionService (ref)
	for i, v in self._boundShortcuts do
		if v then
			contextActionService:UnbindCoreAction(i)
			self._boundShortcuts[i] = false
		end
	end
end

return t