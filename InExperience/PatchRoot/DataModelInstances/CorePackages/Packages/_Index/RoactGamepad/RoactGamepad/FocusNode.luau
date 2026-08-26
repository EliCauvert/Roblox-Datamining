local cryoModule = require(script.Parent.Parent.Cryo)
local focusControllerInternalApiModule = require(script.Parent.FocusControllerInternalApi)
local inputBindingsEqualModule = require(script.Parent.inputBindingsEqual)
local debugPrintModule = require(script.Parent.debugPrint)
local configModule = require(script.Parent.Config)
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref)
	local focusController = nil
	
	if p1.parentFocusNode ~= nil then
		focusController = p1.parentFocusNode.focusController
	elseif p1.focusController == nil then
		error("Cannot create node without focus manager")
	else
		focusController = p1.focusController
	end
	local tbl = setmetatable({
		lastFocused = nil,
		focusController = focusController,
		ref = p2
	}, t)
	tbl:updateNavProps(p1)
	
	return tbl
end

function t:__getFocusControllerInternal()
	-- upvalues: focusControllerInternalApiModule (ref)
	return self.focusController[focusControllerInternalApiModule]
end

function t:__findDefaultChildNode()
	local layoutOrder
	local var1 = 1e999
	local var2 = nil
	local var3 = self:__getFocusControllerInternal():getChildren(self)
	local value = self.ref:getValue()
	
	for i, v in pairs(var3) do
		local value_1 = i:getValue()
	end
	if var2 ~= nil then
		return var2
	end
	for i_1, v_1 in pairs(var3) do
		if i_1:getValue() ~= nil then
			return v_1
		end
	end
	return nil
end

function t:updateNavProps(p1)
	-- upvalues: inputBindingsEqualModule (ref)
	local var4 = p1.restorePreviousChildFocus ~= nil and p1.restorePreviousChildFocus
	local inputBindings = self.inputBindings
	self.defaultChildRef = p1.defaultChild
	self.restorePreviousChildFocus = var4
	self.inputBindings = p1.inputBindings or {}
	local focusControllerInternal = self:__getFocusControllerInternal()
	
	if focusControllerInternal:isNodeFocused(self) and not inputBindingsEqualModule(inputBindings, self.inputBindings) then
		focusControllerInternal:updateInputBindings()
	end
end

function t:focus()
	-- upvalues: configModule (ref), cryoModule (ref), debugPrintModule (ref)
	if not configModule.Enabled then return end
	local focusControllerInternal = self:__getFocusControllerInternal()
	
	if not focusControllerInternal:isInitialized() then return end
	focusControllerInternal:setInProgressFocus(self)
	
	if cryoModule.isEmpty(focusControllerInternal:getChildren(self)) then
		focusControllerInternal:setSelection(self.ref:getValue())
		
		return
	end
	local processTime = os.clock()
	local var4 = self.defaultChildRef ~= nil and (focusControllerInternal.allNodes[self.defaultChildRef] ~= nil and self.defaultChildRef:getValue() ~= nil)
	local var5 = if self.timeout ~= nil then processTime < self.timeout else true
	
	if self.restorePreviousChildFocus and self.lastFocused ~= nil and self.lastFocused:getValue() then
		debugPrintModule("[FOCUS] Restore previous focus:", self.lastFocused)
		focusControllerInternal:moveFocusTo(self.lastFocused)
		
		return
	elseif self.defaultChildRef and (var5 or var4) then
		if var4 then
			debugPrintModule("[FOCUS] Found valid default child", self.defaultChildRef, "for", self.ref)
			self.timeout = nil
			focusControllerInternal:moveFocusTo(self.defaultChildRef)
			
			return
		elseif self.timeout == nil then
			debugPrintModule("[FOCUS] Default child specified is not valid. Wait for it to be assigned...")
			self.timeout = processTime + 0.5
		end
		task.delay(0, function()
			-- upvalues: focusControllerInternal (ref), self (ref)
			if focusControllerInternal:isInProgressFocus(self) then
				self:focus()
			end
		end)
		
		return
	elseif self.timeout ~= nil then
		debugPrintModule("[FOCUS] Timeout for default child of", self.ref)
		self.timeout = nil
	end
	local var6 = self:__findDefaultChildNode()
	
	if var6 == nil then
		focusControllerInternal:setFocusedLeaf(self)
		focusControllerInternal:setInProgressFocus(nil)
		
		return
	end
	debugPrintModule("[FOCUS] No default, use fallback logic to focus", var6.ref)
	var6:focus()
end

function t:attachToTree(p1, p2)
	-- upvalues: cryoModule (ref)
	local focusControllerInternal = self:__getFocusControllerInternal()
	focusControllerInternal:registerNode(p1, self.ref, self)
	self.parent = p1
	self.disconnectSelectionListener = focusControllerInternal:subscribeToSelectionChange(function()
		-- upvalues: focusControllerInternal (ref), self (ref), p2 (ref), cryoModule (copy)
		local var4 = focusControllerInternal:isNodeFocused(self)
		p2(var4)
		
		if self.parent ~= nil and var4 then
			self.parent.lastFocused = self.ref
		end
		if not cryoModule.isEmpty(focusControllerInternal:getChildren(self)) and var4 and focusControllerInternal:getSelection() == self.ref:getValue() then
			self:focus()
		end
	end)
end

function t:detachFromTree()
	self:__getFocusControllerInternal():deregisterNode(self.parent, self.ref)
	
	if self.disconnectSelectionListener ~= nil then
		self.disconnectSelectionListener()
		self.disconnectSelectionListener = nil
	end
end

return t