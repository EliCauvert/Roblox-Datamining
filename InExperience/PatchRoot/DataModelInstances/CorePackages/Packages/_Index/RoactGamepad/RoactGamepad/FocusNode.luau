local cryoModule = require(script.Parent.Parent.Cryo)
local focusControllerInternalApiModule = require(script.Parent.FocusControllerInternalApi)
local inputBindingsEqualModule = require(script.Parent.inputBindingsEqual)
local debugPrintModule = require(script.Parent.debugPrint)
local configModule = require(script.Parent.Config)
local t = {}
t.__index = t

function t.new(p0, p1) --[[ line: 17 ]]
	-- upvalues: t (ref)
	local focusController = nil
	
	if p0.parentFocusNode ~= nil then
		focusController = p0.parentFocusNode.focusController
	elseif p0.focusController == nil then
		error("Cannot create node without focus manager")
	else
		focusController = p0.focusController
	end
	local tbl = setmetatable({
		lastFocused = nil,
		focusController = focusController,
		ref = p1
	}, t)
	tbl:updateNavProps(p0)
	
	return tbl
end

function t:__getFocusControllerInternal() --[[ line: 40 ]]
	-- upvalues: focusControllerInternalApiModule (ref)
	return self.focusController[focusControllerInternalApiModule]
end

function t:__findDefaultChildNode() --[[ line: 44 ]]
	local layoutOrder
	local var7 = 1e999
	local var8 = nil
	local var9 = self:__getFocusControllerInternal():getChildren(self)
	local value = self.ref:getValue()
	
	for i, v in pairs(var9) do
		local value_1 = i:getValue()
	end
	if var8 ~= nil then
		return var8
	end
	for i_1, v_1 in pairs(var9) do
		if i_1:getValue() ~= nil then
			return v_1
		end
	end
	return nil
end

function t:updateNavProps(p2) --[[ line: 98 ]]
	-- upvalues: inputBindingsEqualModule (ref)
	local var12 = p2.restorePreviousChildFocus ~= nil and p2.restorePreviousChildFocus
	local inputBindings = self.inputBindings
	self.defaultChildRef = p2.defaultChild
	self.restorePreviousChildFocus = var12
	self.inputBindings = p2.inputBindings or {}
	local focusControllerInternal = self:__getFocusControllerInternal()
	
	if focusControllerInternal:isNodeFocused(self) and not inputBindingsEqualModule(inputBindings, self.inputBindings) then
		focusControllerInternal:updateInputBindings()
	end
end

function t:focus() --[[ line: 116 ]]
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
	local var16 = self.defaultChildRef ~= nil and (focusControllerInternal.allNodes[self.defaultChildRef] ~= nil and self.defaultChildRef:getValue() ~= nil)
	local var17 = if self.timeout ~= nil then processTime < self.timeout else true
	
	if self.restorePreviousChildFocus and self.lastFocused ~= nil and self.lastFocused:getValue() then
		debugPrintModule("[FOCUS] Restore previous focus:", self.lastFocused)
		focusControllerInternal:moveFocusTo(self.lastFocused)
		
		return
	elseif self.defaultChildRef and (var17 or var16) then
		if var16 then
			debugPrintModule("[FOCUS] Found valid default child", self.defaultChildRef, "for", self.ref)
			self.timeout = nil
			focusControllerInternal:moveFocusTo(self.defaultChildRef)
			
			return
		elseif self.timeout == nil then
			debugPrintModule("[FOCUS] Default child specified is not valid. Wait for it to be assigned...")
			self.timeout = processTime + 0.5
		end
		task.delay(0, function() --[[ line: 155 ]]
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
	local var18 = self:__findDefaultChildNode()
	
	if var18 == nil then
		focusControllerInternal:setFocusedLeaf(self)
		focusControllerInternal:setInProgressFocus(nil)
		
		return
	end
	debugPrintModule("[FOCUS] No default, use fallback logic to focus", var18.ref)
	var18:focus()
end

function t:attachToTree(p3, p4) --[[ line: 180 ]]
	-- upvalues: cryoModule (ref)
	local focusControllerInternal = self:__getFocusControllerInternal()
	focusControllerInternal:registerNode(p3, self.ref, self)
	self.parent = p3
	self.disconnectSelectionListener = focusControllerInternal:subscribeToSelectionChange(function() --[[ line: 185 ]]
		-- upvalues: focusControllerInternal (ref), self (ref), p4 (ref), cryoModule (copy)
		local var20 = focusControllerInternal:isNodeFocused(self)
		p4(var20)
		
		if self.parent ~= nil and var20 then
			self.parent.lastFocused = self.ref
		end
		if not cryoModule.isEmpty(focusControllerInternal:getChildren(self)) and var20 and focusControllerInternal:getSelection() == self.ref:getValue() then
			self:focus()
		end
	end)
end

function t:detachFromTree() --[[ line: 209 ]]
	self:__getFocusControllerInternal():deregisterNode(self.parent, self.ref)
	
	if self.disconnectSelectionListener ~= nil then
		self.disconnectSelectionListener()
		self.disconnectSelectionListener = nil
	end
end

return t