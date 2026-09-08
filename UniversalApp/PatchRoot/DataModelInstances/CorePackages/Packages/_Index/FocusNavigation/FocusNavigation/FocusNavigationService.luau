local parent = script.Parent.Parent
local eventPropagationModule = require(parent.EventPropagation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigationRefocusSuppression = require(parent.SafeFlags).createGetFFlag("FocusNavigationRefocusSuppression")
local createSignal = focusNavigationUtilsModule.createSignal
local shallowEqual = focusNavigationUtilsModule.shallowEqual
local getAncestors = focusNavigationUtilsModule.getAncestors
local mockableWarn = focusNavigationUtilsModule.mockableWarn
local isValidFocusTargetModule = require(script.Parent.isValidFocusTarget)
local _ = require(script.Parent.types)
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: createSignal (ref), eventPropagationModule (ref), t (ref)
	local var1, var2 = createSignal({})
	local var3, var4 = createSignal(p1.getSelection())
	local tbl = setmetatable({
		_silentFocusTarget = nil,
		_silentBlurTarget = nil,
		_eventPropagationService = eventPropagationModule.new(),
		_engineInterface = p1,
		_eventMapByInstance = setmetatable({}, { __mode = "k" }),
		_focusBehaviorByInstance = setmetatable({}, { __mode = "k" }),
		_engineEventConnections = {},
		_shouldSuppressContainerRefocus = if p2 then p2.shouldSuppressContainerRefocus else nil,
		_fireActiveEventMapSignal = var2,
		_fireFocusedGuiObjectSignal = var4,
		activeEventMap = var1,
		focusedGuiObject = var3
	}, t)
	tbl:_connectToInputEvents()
	
	return tbl
end

function t:_fireInputEvent(p1, p2, p3)
	local keyCode = self.activeEventMap:getValue()[p2.KeyCode]
	
	if keyCode then
		self._eventPropagationService:propagateEvent(p1, keyCode, {
			Delta = p2.Delta,
			KeyCode = p2.KeyCode,
			Position = p2.Position,
			UserInputState = p2.UserInputState,
			UserInputType = p2.UserInputType,
			wasProcessed = p3
		}, { synthetic = false, silent = false })
	end
end

function t:_connectToInputEvents()
	local function forwardInputEvent(p1, p2)
		-- upvalues: self (ref)
		local selection = self._engineInterface.getSelection()
		
		if selection then
			self:_fireInputEvent(selection, p1, p2)
		end
	end
	
	table.insert(self._engineEventConnections, self._engineInterface.InputBegan:Connect(forwardInputEvent))
	table.insert(self._engineEventConnections, self._engineInterface.InputChanged:Connect(forwardInputEvent))
	table.insert(self._engineEventConnections, self._engineInterface.InputEnded:Connect(forwardInputEvent))
	table.insert(self._engineEventConnections, self._engineInterface.SelectionChanged:Connect(function()
		-- upvalues: self (ref)
		local value = self.focusedGuiObject:getValue()
		local selection = self._engineInterface.getSelection()
		
		if value then
			self._eventPropagationService:propagateEvent(value, "blur", nil, {
				synthetic = false,
				silent = self._silentBlurTarget == value
			})
			self._silentBlurTarget = nil
		end
		self._fireFocusedGuiObjectSignal(selection)
		
		if selection then
			self._eventPropagationService:propagateEvent(selection, "focus", nil, {
				synthetic = false,
				silent = selection == self._silentFocusTarget
			})
			self._silentFocusTarget = nil
		end
		self:_updateActiveEventMap(value)
	end))
end

function t:_cancelHandler(p1, p2)
	if p2 ~= "blur" and p2 ~= "focus" then
		self._eventPropagationService:propagateEvent(p1, p2, {
			KeyCode = Enum.KeyCode.None,
			UserInputType = Enum.UserInputType.None,
			UserInputState = Enum.UserInputState.Cancel
		}, { synthetic = false, silent = false })
	end
end

function t:_updateActiveEventMap(p1)
	-- upvalues: getAncestors (ref), shallowEqual (ref)
	local t = {}
	local selection = self._engineInterface.getSelection()
	
	if selection then
		local var1 = getAncestors(selection)
		local t_1 = {}
		
		for i_1 = #var1, 1, -1 do
			local var2 = var1[i_1]
			local var3 = self._eventMapByInstance[var2]
			
			if var3 then
				for i, v in var3 do
					t_1[i] = v
					t[i] = nil
				end
			end
			local var4 = self._eventPropagationService:getRegisteredEventHandlers(var2)
			
			if var4 then
				for v, v_1 in t_1 do
					if var4[v_1] then
						t[v] = v_1
					end
				end
			end
		end
	end
	local value = self.activeEventMap:getValue()
	
	if not shallowEqual(value, t) then
		if p1 then
			for i_2, v_1 in value do
				if not t[i_2] then
					self:_cancelHandler(p1, v_1)
				end
			end
		end
		self._fireActiveEventMapSignal(t)
	end
end

function t:registerEventMap(p2, p3)
	-- upvalues: mockableWarn (ref)
	local var5 = self._eventMapByInstance[p2] or {}
	
	for i, v in p3 do
		if var5[i] and var5[i] ~= v and _G.__DEV__ then
			mockableWarn(string.format("New event will replace existing registered event mapped to %s:\n\t     new event: %s\n\texisting event: %s", tostring(i), v, var5[i]))
		end
		var5[i] = v
	end
	self._eventMapByInstance[p2] = var5
	self:_updateActiveEventMap()
end

function t:deregisterEventMap(p4, p5)
	-- upvalues: mockableWarn (ref)
	local var6 = self._eventMapByInstance[p4] or {}
	
	for i, v in p5 do
		if var6[i] == v then
			var6[i] = nil
		elseif _G.__DEV__ then
			mockableWarn(string.format("Cannot deregister non-matching event input %s:\n\t  provided event: %s\n\tregistered event: %s", tostring(i), v, var6[i]))
		end
	end
	self._eventMapByInstance[p4] = var6
	self:_updateActiveEventMap(self.focusedGuiObject:getValue())
end

function t:registerEventHandler(p6, p7, p8, p9)
	self._eventPropagationService:registerEventHandler(p6, p7, p8, p9)
	self:_updateActiveEventMap()
end

function t:deregisterEventHandler(p6, p7, p8, p9)
	self:_cancelHandler(p6, p7)
	self._eventPropagationService:deregisterEventHandler(p6, p7, p8, p9)
	self:_updateActiveEventMap(self.focusedGuiObject:getValue())
end

function t:registerEventHandlers(p6, p7)
	self._eventPropagationService:registerEventHandlers(p6, p7)
	self:_updateActiveEventMap()
end

function t:deregisterEventHandlers(p6, p7)
	for i, v in p7 do
		self:_cancelHandler(p6, i)
	end
	self._eventPropagationService:deregisterEventHandlers(p6, p7)
	self:_updateActiveEventMap(self.focusedGuiObject:getValue())
end

function t:registerFocusBehavior(p8, p9)
	-- upvalues: mockableWarn (ref), focusNavigationRefocusSuppression (ref), isValidFocusTargetModule (ref)
	if _G.__DEV__ then
		local var7 = self._focusBehaviorByInstance[p8]
		
		if var7 ~= nil then
			mockableWarn(string.format("New focus behavior will replace existing registered focus behavior:\n\t     new behavior: %s\n\texisting behavior: %s", tostring(p9), tostring(var7.behavior)))
		end
	end
	self._focusBehaviorByInstance[p8] = {
		behavior = p9,
		connection = p8.SelectionChanged:Connect(function(p10, p11, p12)
			-- upvalues: p8 (ref), focusNavigationRefocusSuppression (copy), self (ref), p9 (ref), isValidFocusTargetModule (copy)
			if p12 and (p10 or p12:IsDescendantOf(p8)) then
				if not p11 or not p11:IsDescendantOf(p8) then
					local var8 = false
					
					if not (if focusNavigationRefocusSuppression() then self._shouldSuppressContainerRefocus and self._shouldSuppressContainerRefocus() else false) then
						for i, v in p9.getTargets() do
							if isValidFocusTargetModule(v) then
								self:focusGuiObject(v, false)
								var8 = true
								break
							end
						end
					end
					if var8 or not p9.onDescendantFocusChanged then
						return
					else
						p9.onDescendantFocusChanged(p12)
						
						return
					end
				elseif p9.onDescendantFocusChanged then
					p9.onDescendantFocusChanged(p12)
				end
			end
		end)
	}
end

function t:deregisterFocusBehavior(p10, p11)
	-- upvalues: mockableWarn (ref)
	local var8 = self._focusBehaviorByInstance[p10]
	
	if _G.__DEV__ then
		if not var8 then
			mockableWarn(string.format("Cannot deregister an unregistered focus behavior:\n\t  provided behavior: %s", tostring(p11)))
		end
		if var8 and var8.behavior ~= p11 then
			mockableWarn(string.format("Cannot deregister non-matching focus behavior:\n\t  provided behavior: %s\n\tregistered behavior: %s", tostring(p11), tostring(var8.behavior)))
		end
	end
	if var8 then
		var8.connection:Disconnect()
		self._focusBehaviorByInstance[p10] = nil
	end
end

function t:focusGuiObject(p10, p11)
	if p11 then
		self._silentBlurTarget = self._engineInterface.getSelection()
		self._silentFocusTarget = p10
	else
		self._silentBlurTarget = nil
		self._silentFocusTarget = nil
	end
	self._engineInterface.setSelection(p10)
end

function t:teardown()
	for i, v in self._engineEventConnections do
		v:Disconnect()
	end
	for i, v_1 in self._focusBehaviorByInstance do
		v_1.connection:Disconnect()
	end
end

function t:canDispatchEvent(p10, p11)
	-- upvalues: getAncestors (ref)
	if not p11 then
		return false
	end
	for i, v in getAncestors(p11) do
		local var8 = self._eventMapByInstance[v]
		
		if var8 then
			for i_1, v_1 in var8 do
				if v_1 == p10 then
					local var9 = self._eventPropagationService:getRegisteredEventHandlers(v)
					
					if var9 and var9[p10] then
						return true
					end
				end
			end
		end
	end
	return false
end

function t:dispatchSyntheticEvent(p12, p13, p14)
	-- upvalues: mockableWarn (ref)
	if p13 then
		if self:canDispatchEvent(p12, p13) then
			self._eventPropagationService:propagateEvent(p13, p12, p14, { synthetic = true, silent = false })
			
			return true
		elseif _G.__DEV__ then
			mockableWarn("dispatchSyntheticEvent: Cannot dispatch event \"" .. p37 .. "\" on target")
		end
		return false
	elseif _G.__DEV__ then
		mockableWarn("dispatchSyntheticEvent: No target object")
	end
	return false
end

return t