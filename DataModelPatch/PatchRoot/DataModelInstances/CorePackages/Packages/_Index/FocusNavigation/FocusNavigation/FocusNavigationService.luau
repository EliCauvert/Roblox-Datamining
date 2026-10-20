local Parent = script.Parent.Parent
local EventPropagationModule = require(Parent.EventPropagation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local CreateSignalFunction = FocusNavigationUtilsModule.createSignal
local ShallowEqualFunction = FocusNavigationUtilsModule.shallowEqual
local GetAncestorsFunction = FocusNavigationUtilsModule.getAncestors
local MockableWarnFunction = FocusNavigationUtilsModule.mockableWarn
local IsValidFocusTargetModule = require(script.Parent.isValidFocusTarget)
local _ = require(script.Parent.types)
local FocusNavigationService = {}
FocusNavigationService.__index = FocusNavigationService

function FocusNavigationService.new(_engineInterface)
	-- upvalues: CreateSignalFunction (copy), EventPropagationModule (copy), FocusNavigationService (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction(_engineInterface.getSelection())
	local self = setmetatable({
		_silentFocusTarget = nil,
		_silentBlurTarget = nil,
		_eventPropagationService = EventPropagationModule.new(),
		_engineInterface = _engineInterface,
		_eventMapByInstance = setmetatable({}, { __mode = "k" }),
		_focusBehaviorByInstance = setmetatable({}, { __mode = "k" }),
		_engineEventConnections = {},
		_fireActiveEventMapSignal = Signal2,
		_fireFocusedGuiObjectSignal = Signal2_1,
		activeEventMap = Signal,
		focusedGuiObject = Signal1
	}, FocusNavigationService)
	self:_connectToInputEvents()
	
	return self
end

function FocusNavigationService:_fireInputEvent(Selection, Input, WasProcessed)
	local Entry = self.activeEventMap:getValue()[Input.KeyCode]
	
	if Entry then
		self._eventPropagationService:propagateEvent(Selection, Entry, {
			Delta = Input.Delta,
			KeyCode = Input.KeyCode,
			Position = Input.Position,
			UserInputState = Input.UserInputState,
			UserInputType = Input.UserInputType,
			wasProcessed = WasProcessed
		}, { synthetic = false, silent = false })
	end
end

function FocusNavigationService:_connectToInputEvents()
	local function forwardInputEvent(Input, GameProcessed)
		-- upvalues: self (copy)
		local Selection = self._engineInterface.getSelection()
		
		if Selection then
			self:_fireInputEvent(Selection, Input, GameProcessed)
		end
	end
	
	table.insert(self._engineEventConnections, self._engineInterface.InputBegan:Connect(forwardInputEvent))
	table.insert(self._engineEventConnections, self._engineInterface.InputChanged:Connect(forwardInputEvent))
	table.insert(self._engineEventConnections, self._engineInterface.InputEnded:Connect(forwardInputEvent))
	table.insert(self._engineEventConnections, self._engineInterface.SelectionChanged:Connect(function()
		-- upvalues: self (copy)
		local Value = self.focusedGuiObject:getValue()
		local Selection = self._engineInterface.getSelection()
		
		if Value then
			self._eventPropagationService:propagateEvent(Value, "blur", nil, {
				synthetic = false,
				silent = self._silentBlurTarget == Value
			})
			self._silentBlurTarget = nil
		end
		self._fireFocusedGuiObjectSignal(Selection)
		
		if Selection then
			self._eventPropagationService:propagateEvent(Selection, "focus", nil, {
				synthetic = false,
				silent = Selection == self._silentFocusTarget
			})
			self._silentFocusTarget = nil
		end
		self:_updateActiveEventMap(Value)
	end))
end

function FocusNavigationService:_cancelHandler(p1, p2)
	if p2 ~= "blur" and p2 ~= "focus" then
		self._eventPropagationService:propagateEvent(p1, p2, {
			KeyCode = Enum.KeyCode.Unknown,
			UserInputType = Enum.UserInputType.None,
			UserInputState = Enum.UserInputState.Cancel
		}, { synthetic = false, silent = false })
	end
end

function FocusNavigationService:_updateActiveEventMap(SilentBlurTarget)
	-- upvalues: GetAncestorsFunction (copy), ShallowEqualFunction (copy)
	local t = {}
	local Selection = self._engineInterface.getSelection()
	
	if Selection then
		local Ancestors = GetAncestorsFunction(Selection)
		local t1 = {}
		
		for i = #Ancestors, 1, -1 do
			local Ancestor = Ancestors[i]
			local EventMapByInstanceEntry = self._eventMapByInstance[Ancestor]
			
			if EventMapByInstanceEntry then
				for i1, value in EventMapByInstanceEntry do
					t1[i1] = value
					t[i1] = nil
				end
			end
			local RegisteredEventHandlers = self._eventPropagationService:getRegisteredEventHandlers(Ancestor)
			
			if RegisteredEventHandlers then
				for i2, value1 in t1 do
					if RegisteredEventHandlers[value1] then
						t[i2] = value1
					end
				end
			end
		end
	end
	local Value = self.activeEventMap:getValue()
	
	if not ShallowEqualFunction(Value, t) then
		if SilentBlurTarget then
			for i3, value2 in Value do
				if not t[i3] then
					self:_cancelHandler(SilentBlurTarget, value2)
				end
			end
		end
		self._fireActiveEventMapSignal(t)
	end
end

function FocusNavigationService:registerEventMap(p1, List)
	-- upvalues: MockableWarnFunction (copy)
	local EventMapByInstanceEntry = self._eventMapByInstance[p1] or {}
	for i, value in List do
		if EventMapByInstanceEntry[i] and EventMapByInstanceEntry[i] ~= value and _G.__DEV__ then
			MockableWarnFunction(string.format("New event will replace existing registered event mapped to %s:\n\t     new event: %s\n\texisting event: %s", tostring(i), value, EventMapByInstanceEntry[i]))
		end
		EventMapByInstanceEntry[i] = value
	end
	self._eventMapByInstance[p1] = EventMapByInstanceEntry
	self:_updateActiveEventMap()
end

function FocusNavigationService:deregisterEventMap(p2, List)
	-- upvalues: MockableWarnFunction (copy)
	local EventMapByInstanceEntry = self._eventMapByInstance[p2] or {}
	for i, value in List do
		if EventMapByInstanceEntry[i] == value then
			EventMapByInstanceEntry[i] = nil
		elseif _G.__DEV__ then
			MockableWarnFunction(string.format("Cannot deregister non-matching event input %s:\n\t  provided event: %s\n\tregistered event: %s", tostring(i), value, EventMapByInstanceEntry[i]))
		end
	end
	self._eventMapByInstance[p2] = EventMapByInstanceEntry
	self:_updateActiveEventMap(self.focusedGuiObject:getValue())
end

function FocusNavigationService:registerEventHandler(p3, p4, p5, p6)
	self._eventPropagationService:registerEventHandler(p3, p4, p5, p6)
	self:_updateActiveEventMap()
end

function FocusNavigationService:deregisterEventHandler(p3, p4, p5, p6)
	self:_cancelHandler(p3, p4)
	self._eventPropagationService:deregisterEventHandler(p3, p4, p5, p6)
	self:_updateActiveEventMap(self.focusedGuiObject:getValue())
end

function FocusNavigationService:registerEventHandlers(p3, p4)
	self._eventPropagationService:registerEventHandlers(p3, p4)
	self:_updateActiveEventMap()
end

function FocusNavigationService:deregisterEventHandlers(p3, List)
	for i, _ in List do
		self:_cancelHandler(p3, i)
	end
	self._eventPropagationService:deregisterEventHandlers(p3, List)
	self:_updateActiveEventMap(self.focusedGuiObject:getValue())
end

function FocusNavigationService:registerFocusBehavior(Ancestor, Behavior)
	-- upvalues: MockableWarnFunction (copy), IsValidFocusTargetModule (copy)
	if _G.__DEV__ then
		local FocusBehaviorByInstanceEntry = self._focusBehaviorByInstance[Ancestor]
		
		if FocusBehaviorByInstanceEntry ~= nil then
			MockableWarnFunction(string.format("New focus behavior will replace existing registered focus behavior:\n\t     new behavior: %s\n\texisting behavior: %s", tostring(Behavior), (tostring(FocusBehaviorByInstanceEntry.behavior))))
		end
	end
	self._focusBehaviorByInstance[Ancestor] = {
		behavior = Behavior,
		connection = Ancestor.SelectionChanged:Connect(function(p4, Object, Object1)
			-- upvalues: Ancestor (copy), Behavior (copy), IsValidFocusTargetModule (upval), self (copy)
			if Object1 and (p4 or Object1:IsDescendantOf(Ancestor)) then
				if not Object or not Object:IsDescendantOf(Ancestor) then
					local Flag = false
					
					for _, value in Behavior.getTargets() do
						if IsValidFocusTargetModule(value) then
							self:focusGuiObject(value, false)
							Flag = true
							break
						end
					end
					if not Flag and Behavior.onDescendantFocusChanged then
						Behavior.onDescendantFocusChanged(Object1)
						
						return
					end
				elseif Behavior.onDescendantFocusChanged then
					Behavior.onDescendantFocusChanged(Object1)
				end
			end
		end)
	}
end

function FocusNavigationService:deregisterFocusBehavior(p4, Behavior)
	-- upvalues: MockableWarnFunction (copy)
	local FocusBehaviorByInstanceEntry = self._focusBehaviorByInstance[p4]
	
	if _G.__DEV__ then
		if not FocusBehaviorByInstanceEntry then
			MockableWarnFunction(string.format("Cannot deregister an unregistered focus behavior:\n\t  provided behavior: %s", (tostring(Behavior))))
		end
		if FocusBehaviorByInstanceEntry and FocusBehaviorByInstanceEntry.behavior ~= Behavior then
			MockableWarnFunction(string.format("Cannot deregister non-matching focus behavior:\n\t  provided behavior: %s\n\tregistered behavior: %s", tostring(Behavior), (tostring(FocusBehaviorByInstanceEntry.behavior))))
		end
	end
	if FocusBehaviorByInstanceEntry then
		FocusBehaviorByInstanceEntry.connection:Disconnect()
		self._focusBehaviorByInstance[p4] = nil
	end
end

function FocusNavigationService:focusGuiObject(_silentFocusTarget, p4)
	if p4 then
		self._silentBlurTarget = self._engineInterface.getSelection()
		self._silentFocusTarget = _silentFocusTarget
	else
		self._silentBlurTarget = nil
		self._silentFocusTarget = nil
	end
	self._engineInterface.setSelection(_silentFocusTarget)
end

function FocusNavigationService.teardown(p4)
	for _, engineEventConnection in p4._engineEventConnections do
		engineEventConnection:Disconnect()
	end
	for _, value in p4._focusBehaviorByInstance do
		value.connection:Disconnect()
	end
end

function FocusNavigationService:canDispatchEvent(p5, p6): boolean
	-- upvalues: GetAncestorsFunction (copy)
	if not p6 then
		return false
	end
	for _, value in GetAncestorsFunction(p6) do
		local EventMapByInstanceEntry = self._eventMapByInstance[value]
		
		if EventMapByInstanceEntry then
			for _, value1 in EventMapByInstanceEntry do
				if value1 == p5 then
					local RegisteredEventHandlers = self._eventPropagationService:getRegisteredEventHandlers(value)
					
					if RegisteredEventHandlers and RegisteredEventHandlers[p5] then
						return true
					end
				end
			end
		end
	end
	return false
end

function FocusNavigationService:dispatchSyntheticEvent(Text, p7, p8): boolean
	-- upvalues: MockableWarnFunction (copy)
	if p7 then
		if self:canDispatchEvent(Text, p7) then
			self._eventPropagationService:propagateEvent(p7, Text, p8, { synthetic = true, silent = false })
			
			return true
		end
		if _G.__DEV__ then
			MockableWarnFunction("dispatchSyntheticEvent: Cannot dispatch event \"" .. Text .. "\" on target")
		end
		return false
	else
		if _G.__DEV__ then
			MockableWarnFunction("dispatchSyntheticEvent: No target object")
		end
		return false
	end
end

return FocusNavigationService