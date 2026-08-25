local parent = script.Parent.Parent
local eventPropagationModule = require(parent.EventPropagation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local createSignal = focusNavigationUtilsModule.createSignal
local shallowEqual = focusNavigationUtilsModule.shallowEqual
local getAncestors = focusNavigationUtilsModule.getAncestors
local mockableWarn = focusNavigationUtilsModule.mockableWarn
local isValidFocusTargetModule = require(script.Parent.isValidFocusTarget)
local _ = require(script.Parent.types)
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: createSignal (ref), eventPropagationModule (ref), t (ref)
	local var4, var5 = createSignal({})
	local var6, var7 = createSignal(p0.getSelection())
	local tbl = setmetatable({
		_silentFocusTarget = nil,
		_silentBlurTarget = nil,
		_eventPropagationService = eventPropagationModule.new(),
		_engineInterface = p0,
		_eventMapByInstance = setmetatable({}, { __mode = "k" }),
		_focusBehaviorByInstance = setmetatable({}, { __mode = "k" }),
		_engineEventConnections = {},
		_fireActiveEventMapSignal = var5,
		_fireFocusedGuiObjectSignal = var7,
		activeEventMap = var4,
		focusedGuiObject = var6
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
	local function forwardInputEvent(p4, p5)
		-- upvalues: self (ref)
		local selection = self._engineInterface.getSelection()
		
		if selection then
			self:_fireInputEvent(selection, p4, p5)
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

function t:_cancelHandler(p6, p7)
	if p7 ~= "blur" and p7 ~= "focus" then
		self._eventPropagationService:propagateEvent(p6, p7, {
			KeyCode = Enum.KeyCode.Unknown,
			UserInputType = Enum.UserInputType.None,
			UserInputState = Enum.UserInputState.Cancel
		}, { synthetic = false, silent = false })
	end
end

function t:_updateActiveEventMap(p8)
	-- upvalues: getAncestors (ref), shallowEqual (ref)
	local t = {}
	local selection = self._engineInterface.getSelection()
	
	if selection then
		local var15 = getAncestors(selection)
		local t_1 = {}
		
		for i_1 = #var15, 1, -1 do
			local var17 = var15[i_1]
			local var18 = self._eventMapByInstance[var17]
			
			if var18 then
				for i, v in var18 do
					t_1[i] = v
					t[i] = nil
				end
			end
			local var19 = self._eventPropagationService:getRegisteredEventHandlers(var17)
			
			if var19 then
				for v, v_1 in t_1 do
					if var19[v_1] then
						t[v] = v_1
					end
				end
			end
		end
	end
	local value = self.activeEventMap:getValue()
	
	if not shallowEqual(value, t) then
		if p8 then
			for i_2, v_1 in value do
				if not t[i_2] then
					self:_cancelHandler(p8, v_1)
				end
			end
		end
		self._fireActiveEventMapSignal(t)
	end
end

function t:registerEventMap(p9, p10)
	-- upvalues: mockableWarn (ref)
	local var21 = self._eventMapByInstance[p9] or {}
	
	for i, v in p10 do
		if var21[i] and var21[i] ~= v and _G.__DEV__ then
			mockableWarn(string.format("New event will replace existing registered event mapped to %s:\n\t     new event: %s\n\texisting event: %s", tostring(i), v, var21[i]))
		end
		var21[i] = v
	end
	self._eventMapByInstance[p9] = var21
	self:_updateActiveEventMap()
end

function t:deregisterEventMap(p11, p12)
	-- upvalues: mockableWarn (ref)
	local var22 = self._eventMapByInstance[p11] or {}
	
	for i, v in p12 do
		if var22[i] == v then
			var22[i] = nil
		elseif _G.__DEV__ then
			mockableWarn(string.format("Cannot deregister non-matching event input %s:\n\t  provided event: %s\n\tregistered event: %s", tostring(i), v, var22[i]))
		end
	end
	self._eventMapByInstance[p11] = var22
	self:_updateActiveEventMap(self.focusedGuiObject:getValue())
end

function t:registerEventHandler(p13, p14, p15, p16)
	self._eventPropagationService:registerEventHandler(p13, p14, p15, p16)
	self:_updateActiveEventMap()
end

function t:deregisterEventHandler(p17, p18, p19, p20)
	self:_cancelHandler(p17, p18)
	self._eventPropagationService:deregisterEventHandler(p17, p18, p19, p20)
	self:_updateActiveEventMap(self.focusedGuiObject:getValue())
end

function t:registerEventHandlers(p21, p22)
	self._eventPropagationService:registerEventHandlers(p21, p22)
	self:_updateActiveEventMap()
end

function t:deregisterEventHandlers(p23, p24)
	for i, v in p24 do
		self:_cancelHandler(p23, i)
	end
	self._eventPropagationService:deregisterEventHandlers(p23, p24)
	self:_updateActiveEventMap(self.focusedGuiObject:getValue())
end

function t:registerFocusBehavior(p25, p26)
	-- upvalues: mockableWarn (ref), isValidFocusTargetModule (ref)
	if _G.__DEV__ then
		local var23 = self._focusBehaviorByInstance[p25]
		
		if var23 ~= nil then
			mockableWarn(string.format("New focus behavior will replace existing registered focus behavior:\n\t     new behavior: %s\n\texisting behavior: %s", tostring(p26), tostring(var23.behavior)))
		end
	end
	self._focusBehaviorByInstance[p25] = {
		behavior = p26,
		connection = p25.SelectionChanged:Connect(function(p27, p28, p29)
			-- upvalues: p25 (ref), p26 (ref), isValidFocusTargetModule (copy), self (ref)
			if p29 and (p27 or p29:IsDescendantOf(p25)) then
				if not p28 or not p28:IsDescendantOf(p25) then
					local var24 = false
					
					for i, v in p26.getTargets() do
						if isValidFocusTargetModule(v) then
							self:focusGuiObject(v, false)
							var24 = true
							break
						end
					end
					if var24 or not p26.onDescendantFocusChanged then
						return
					else
						p26.onDescendantFocusChanged(p29)
						
						return
					end
				elseif p26.onDescendantFocusChanged then
					p26.onDescendantFocusChanged(p29)
				end
			end
		end)
	}
end

function t:deregisterFocusBehavior(p30, p31)
	-- upvalues: mockableWarn (ref)
	local var25 = self._focusBehaviorByInstance[p30]
	
	if _G.__DEV__ then
		if not var25 then
			mockableWarn(string.format("Cannot deregister an unregistered focus behavior:\n\t  provided behavior: %s", tostring(p31)))
		end
		if var25 and var25.behavior ~= p31 then
			mockableWarn(string.format("Cannot deregister non-matching focus behavior:\n\t  provided behavior: %s\n\tregistered behavior: %s", tostring(p31), tostring(var25.behavior)))
		end
	end
	if var25 then
		var25.connection:Disconnect()
		self._focusBehaviorByInstance[p30] = nil
	end
end

function t:focusGuiObject(p32, p33)
	if p33 then
		self._silentBlurTarget = self._engineInterface.getSelection()
		self._silentFocusTarget = p32
	else
		self._silentBlurTarget = nil
		self._silentFocusTarget = nil
	end
	self._engineInterface.setSelection(p32)
end

function t:teardown()
	for i, v in self._engineEventConnections do
		v:Disconnect()
	end
	for i, v_1 in self._focusBehaviorByInstance do
		v_1.connection:Disconnect()
	end
end

function t:canDispatchEvent(p34, p35)
	-- upvalues: getAncestors (ref)
	if not p35 then
		return false
	end
	for i, v in getAncestors(p35) do
		local var26 = self._eventMapByInstance[v]
		
		if var26 then
			for i_1, v_1 in var26 do
				if v_1 == p34 then
					local var27 = self._eventPropagationService:getRegisteredEventHandlers(v)
					
					if var27 and var27[p34] then
						return true
					end
				end
			end
		end
	end
	return false
end

function t:dispatchSyntheticEvent(p36, p37, p38)
	-- upvalues: mockableWarn (ref)
	if p37 then
		if self:canDispatchEvent(p36, p37) then
			self._eventPropagationService:propagateEvent(p37, p36, p38, { synthetic = true, silent = false })
			
			return true
		elseif _G.__DEV__ then
			mockableWarn("dispatchSyntheticEvent: Cannot dispatch event \"" .. p36 .. "\" on target")
		end
		return false
	elseif _G.__DEV__ then
		mockableWarn("dispatchSyntheticEvent: No target object")
	end
	return false
end

return t