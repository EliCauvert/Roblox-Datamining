-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:59 2026 Pacific Standard Time.

local cryoModule = require(script.Parent.Parent.Cryo)
local inputModule = require(script.Parent.Input)
local createSignalModule = require(script.Parent.createSignal)
local debugPrintModule = require(script.Parent.debugPrint)
local focusControllerInternalApiModule = require(script.Parent.FocusControllerInternalApi)
local t = {}
t.__index = t

function t.new() --[[ line: 16 ]]
	-- upvalues: createSignalModule (ref), t (ref)
	return setmetatable({
		rootRef = nil,
		engineInterface = nil,
		captureFocusOnInitialize = false,
		moveFocusToOnInitialize = nil,
		focusedLeaf = nil,
		inProgressFocus = nil,
		selectionChangedSignal = createSignalModule(),
		boundInputsChangedSignal = createSignalModule(),
		focusNodeTree = {},
		allNodes = {},
		inputDisconnectors = {},
		boundInputs = {}
	}, t)
end

function t:isInitialized() --[[ line: 37 ]]
	return self.engineInterface ~= nil
end

function t:moveFocusTo(p0) --[[ line: 41 ]]
	-- upvalues: debugPrintModule (ref)
	if self.engineInterface == nil then
		self.moveFocusToOnInitialize = p0
		
		return
	end
	debugPrintModule("[FOCUS] Move focus to", p0)
	local var6 = self.allNodes[p0]
	
	if var6 ~= nil and not self:isNodeFocused(var6) then
		var6:focus()
	end
	self:debugPrintTree()
end

function t:moveFocusToNeighbor(p1) --[[ line: 56 ]]
	-- upvalues: debugPrintModule (ref)
	if self.engineInterface == nil then
		error("FocusController is not connected to a component hierarchy!", 2)
	end
	if self.focusedLeaf ~= nil then
		debugPrintModule("[FOCUS] Move focus to", p1, "from", self.focusedLeaf.ref)
		local value = self.focusedLeaf.ref:getValue()
		
		if value ~= nil and value[p1] ~= nil then
			self:setSelection(value[p1])
		end
	end
end

function t:getSelection() --[[ line: 70 ]]
	return self.engineInterface.getSelection()
end

function t:setSelection(p2) --[[ line: 74 ]]
	self.engineInterface.setSelection(p2)
end

function t:registerNode(p3, p4, p5) --[[ line: 78 ]]
	-- upvalues: debugPrintModule (ref)
	if p3 ~= nil then
		debugPrintModule("[TREE ] Registering child node", p4)
		local var8 = self.focusNodeTree[p3] or {}
		var8[p4] = p5
		self.focusNodeTree[p3] = var8
		self.allNodes[p4] = p5
		self:descendantAddedRefocus()
		
		return
	end
	debugPrintModule("[TREE ] Registering root node", p4)
	self.rootRef = p4
	self.allNodes[p4] = p5
	
	if self.captureFocusOnRootRegistered then
		self.captureFocusOnRootRegistered = false
		self:captureFocus()
	end
end

function t:deregisterNode(p6, p7) --[[ line: 103 ]]
	-- upvalues: debugPrintModule (ref)
	if p6 == nil then
		debugPrintModule("[TREE ] Deregistering root node", p7)
		self.allNodes[p7] = nil
		
		return
	end
	debugPrintModule("[TREE ] Deregistering child node", p7)
	self.focusNodeTree[p6][p7] = nil
	self.allNodes[p7] = nil
	self:descendantRemovedRefocus()
end

function t:needsDescendantRemovedRefocus() --[[ line: 119 ]]
	if self.focusedLeaf == nil then
		return
	end
	return self.focusedLeaf.ref:getValue() == nil
end

function t:descendantRemovedRefocus() --[[ line: 132 ]]
	-- upvalues: debugPrintModule (ref)
	if self:needsDescendantRemovedRefocus() then
		debugPrintModule("[FOCUS] Focused node was removed; refocusing from nearest existing ancestor")
		local parent = self.focusedLeaf.parent
		while parent ~= nil and self.allNodes[parent.ref] == nil do
			parent = parent.parent
		end
		if parent ~= nil then
			parent:focus()
		end
	end
end

function t:needsDescendantAddedRefocus() --[[ line: 149 ]]
	-- upvalues: cryoModule (ref)
	return if self.focusedLeaf == nil then nil else not cryoModule.isEmpty(self:getChildren(self.focusedLeaf))
end

function t:descendantAddedRefocus() --[[ line: 162 ]]
	-- upvalues: debugPrintModule (ref)
	if self:needsDescendantAddedRefocus() then
		debugPrintModule("[FOCUS] Currently-focused node is no longer a leaf; refocusing", self.focusedLeaf.ref)
		self.focusedLeaf:focus()
	end
end

function t:getChildren(p8) --[[ line: 171 ]]
	return self.focusNodeTree[p8] or {}
end

function t:isNodeFocused(p9) --[[ line: 175 ]]
	if self.focusedLeaf == nil then
		return false
	elseif self.focusedLeaf == p9 then
		return true
	end
	local parent = self.focusedLeaf.parent
	while parent ~= nil do
		if parent ~= p9 then
			parent = parent.parent
			continue
		end
		return true
	end
	return false
end

function t:setFocusedLeaf(p10) --[[ line: 198 ]]
	self.focusedLeaf = p10
end

function t:setInProgressFocus(p11) --[[ line: 202 ]]
	self.inProgressFocus = p11
end

function t:isInProgressFocus(p12) --[[ line: 206 ]]
	return self.inProgressFocus == p12
end

function t:debugPrintTree() --[[ line: 211 ]]
	-- upvalues: debugPrintModule (ref)
	if debugPrintModule.isEnabled then
		local function recursePrintTree(p13, p14) --[[ line: 216 ]]
			-- upvalues: self (ref), debugPrintModule (copy), recursePrintTree (ref)
			local var10 = tostring(p13.ref)
			
			if self:isNodeFocused(p13) then
				var10 ..= "*"
			end
			debugPrintModule(p14, var10)
			
			for i, v in pairs(self:getChildren(p13)) do
				recursePrintTree(v, p14 .. "  ")
			end
		end
		
		debugPrintModule("Focus Node Tree:")
		recursePrintTree(self.allNodes[self.rootRef], "  ")
		
		return
	end
end

function t:updateInputBindings() --[[ line: 236 ]]
	-- upvalues: inputModule (ref), debugPrintModule (ref)
	local t = {}
	local focusedLeaf = self.focusedLeaf
	while focusedLeaf ~= nil do
		for i, v in pairs(focusedLeaf.inputBindings) do
			local uniqueKey = inputModule.getUniqueKey(v)
			
			if t[uniqueKey] == nil then
				debugPrintModule("[INPUT] Bind input", uniqueKey)
				t[uniqueKey] = v
			end
		end
		focusedLeaf = focusedLeaf.parent
	end
	for i, v in pairs(self.inputDisconnectors) do
		v()
	end
	self.inputDisconnectors = {}
	self.boundInputs = {}
	
	for i_1, v_1 in pairs(t) do
		self.inputDisconnectors[i_1] = inputModule.connectToEvent(v_1, self.engineInterface)
		
		if v_1.keyCode then
			self.boundInputs[v_1.keyCode] = v_1.meta or {}
		end
	end
	self.boundInputsChangedSignal:fire(self.boundInputs)
end

function t:initialize(p15) --[[ line: 271 ]]
	-- upvalues: debugPrintModule (ref)
	if self.engineInterface ~= nil then
		error("FocusController cannot be initialized more than once; make sure you are not passing it to multiple components")
	end
	self.engineInterface = p15
	self.guiServiceConnection = p15.subscribeToSelectionChanged(function() --[[ line: 284 ]]
		-- upvalues: self (ref), p15 (ref), debugPrintModule (copy)
		if self.rootRef == nil then return end
		local var13 = self.focusedLeaf ~= nil
		self.focusedLeaf = nil
		local selection = p15.getSelection()
		local value = self.rootRef:getValue()
		
		if selection ~= nil and (value == selection or selection:IsDescendantOf(value)) then
			debugPrintModule("[EVENT] Selection changed to", selection, "in focus hierarchy beginning at", value)
			
			for i, v in pairs(self.allNodes) do
				if selection == i:getValue() then
					self.focusedLeaf = v
					break
				end
			end
		end
		if self.focusedLeaf ~= nil or var13 then
			self.selectionChangedSignal:fire()
			self:updateInputBindings()
		end
	end)
	
	if self.captureFocusOnInitialize then
		self:captureFocus()
	end
	if self.moveFocusToOnInitialize then
		self:moveFocusTo(self.moveFocusToOnInitialize)
	end
end

function t:captureFocus() --[[ line: 344 ]]
	if self.engineInterface == nil then
		self.captureFocusOnInitialize = true
		
		return
	elseif self.rootRef == nil then
		self.captureFocusOnRootRegistered = true
		
		return
	end
	self.allNodes[self.rootRef]:focus()
	self:debugPrintTree()
end

function t:releaseFocus() --[[ line: 355 ]]
	if self.engineInterface ~= nil then
		self.engineInterface.setSelection(nil)
	end
	self.captureFocusOnInitialize = false
	self.captureFocusOnRootRegistered = false
end

function t:teardown() --[[ line: 363 ]]
	if self.guiServiceConnection ~= nil then
		self.guiServiceConnection:Disconnect()
	end
	for i, v in pairs(self.inputDisconnectors) do
		v()
	end
	self.rootRef = nil
	self.engineInterface = nil
	self.captureFocusOnInitialize = false
	self.captureFocusOnRootRegistered = false
	self.focusedLeaf = nil
end

function t:subscribeToSelectionChange(p16) --[[ line: 382 ]]
	-- upvalues: debugPrintModule (ref)
	debugPrintModule("[TREE ] New subscription to selection change event")
	
	return self.selectionChangedSignal:subscribe(p16)
end

function t.createPublicApiWrapper() --[[ line: 389 ]]
	-- upvalues: t (ref), focusControllerInternalApiModule (ref)
	local var16 = t.new()
	
	return {
		[focusControllerInternalApiModule] = var16,
		moveFocusTo = function(...) --[[ line: 394 ]]
			-- upvalues: var16 (ref)
			var16:moveFocusTo(...)
		end,
		moveFocusLeft = function() --[[ line: 397 ]]
			-- upvalues: var16 (ref)
			var16:moveFocusToNeighbor("NextSelectionLeft")
		end,
		moveFocusRight = function() --[[ line: 400 ]]
			-- upvalues: var16 (ref)
			var16:moveFocusToNeighbor("NextSelectionRight")
		end,
		moveFocusUp = function() --[[ line: 403 ]]
			-- upvalues: var16 (ref)
			var16:moveFocusToNeighbor("NextSelectionUp")
		end,
		moveFocusDown = function() --[[ line: 406 ]]
			-- upvalues: var16 (ref)
			var16:moveFocusToNeighbor("NextSelectionDown")
		end,
		captureFocus = function() --[[ line: 409 ]]
			-- upvalues: var16 (ref)
			var16:captureFocus()
		end,
		releaseFocus = function() --[[ line: 412 ]]
			-- upvalues: var16 (ref)
			var16:releaseFocus()
		end,
		getCurrentFocus = function() --[[ line: 415 ]]
			-- upvalues: var16 (ref)
			local focusedLeaf = var16.focusedLeaf
			
			return if focusedLeaf then focusedLeaf.ref else nil
		end,
		getBoundInputs = function() --[[ line: 419 ]]
			-- upvalues: var16 (ref)
			return var16.boundInputs
		end,
		subscribeToBoundInputsChanged = function(p17) --[[ line: 422 ]]
			-- upvalues: var16 (ref)
			return var16.boundInputsChangedSignal:subscribe(p17)
		end
	}
end

return t