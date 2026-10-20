local CryoModule = require(script.Parent.Parent.Cryo)
local InputModule = require(script.Parent.Input)
local CreateSignalModule = require(script.Parent.createSignal)
local DebugPrintModule = require(script.Parent.debugPrint)
local FocusControllerInternalApiModule = require(script.Parent.FocusControllerInternalApi)
local FocusController = {}
FocusController.__index = FocusController

function FocusController.new()
	-- upvalues: CreateSignalModule (copy), FocusController (copy)
	return (setmetatable({
		rootRef = nil,
		engineInterface = nil,
		captureFocusOnInitialize = false,
		moveFocusToOnInitialize = nil,
		focusedLeaf = nil,
		inProgressFocus = nil,
		selectionChangedSignal = CreateSignalModule(),
		boundInputsChangedSignal = CreateSignalModule(),
		focusNodeTree = {},
		allNodes = {},
		inputDisconnectors = {},
		boundInputs = {}
	}, FocusController))
end

function FocusController:isInitialized(): boolean
	return self.engineInterface ~= nil
end

function FocusController:moveFocusTo(MoveFocusToOnInitialize)
	-- upvalues: DebugPrintModule (copy)
	if self.engineInterface == nil then
		self.moveFocusToOnInitialize = MoveFocusToOnInitialize
		
		return
	end
	DebugPrintModule("[FOCUS] Move focus to", MoveFocusToOnInitialize)
	local AllNode = self.allNodes[MoveFocusToOnInitialize]
	
	if AllNode ~= nil and not self:isNodeFocused(AllNode) then
		AllNode:focus()
	end
	self:debugPrintTree()
end

function FocusController:moveFocusToNeighbor(p1)
	-- upvalues: DebugPrintModule (copy)
	if self.engineInterface == nil then
		error("FocusController is not connected to a component hierarchy!", 2)
	end
	if self.focusedLeaf ~= nil then
		DebugPrintModule("[FOCUS] Move focus to", p1, "from", self.focusedLeaf.ref)
		local Value = self.focusedLeaf.ref:getValue()
		
		if Value ~= nil and Value[p1] ~= nil then
			self:setSelection(Value[p1])
		end
	end
end

function FocusController:getSelection()
	return self.engineInterface.getSelection()
end

function FocusController:setSelection(p1)
	self.engineInterface.setSelection(p1)
end

function FocusController:registerNode(p1, RootRef, p2)
	-- upvalues: DebugPrintModule (copy)
	if p1 ~= nil then
		DebugPrintModule("[TREE ] Registering child node", RootRef)
		local FocusNodeTreeEntry = self.focusNodeTree[p1] or {}
		FocusNodeTreeEntry[RootRef] = p2
		self.focusNodeTree[p1] = FocusNodeTreeEntry
		self.allNodes[RootRef] = p2
		self:descendantAddedRefocus()
		
		return
	end
	DebugPrintModule("[TREE ] Registering root node", RootRef)
	self.rootRef = RootRef
	self.allNodes[RootRef] = p2
	
	if self.captureFocusOnRootRegistered then
		self.captureFocusOnRootRegistered = false
		self:captureFocus()
	end
end

function FocusController:deregisterNode(p1, p2)
	-- upvalues: DebugPrintModule (copy)
	if p1 == nil then
		DebugPrintModule("[TREE ] Deregistering root node", p2)
		self.allNodes[p2] = nil
		
		return
	else
		DebugPrintModule("[TREE ] Deregistering child node", p2)
		self.focusNodeTree[p1][p2] = nil
		self.allNodes[p2] = nil
		self:descendantRemovedRefocus()
	end
end

function FocusController:needsDescendantRemovedRefocus(): boolean?
	if self.focusedLeaf == nil then return end
	return self.focusedLeaf.ref:getValue() == nil
end

function FocusController:descendantRemovedRefocus()
	-- upvalues: DebugPrintModule (copy)
	if self:needsDescendantRemovedRefocus() then
		DebugPrintModule("[FOCUS] Focused node was removed; refocusing from nearest existing ancestor")
		local Parent = self.focusedLeaf.parent
		while Parent ~= nil and self.allNodes[Parent.ref] == nil do
			Parent = Parent.parent
		end
		if Parent ~= nil then
			Parent:focus()
		end
	end
end

function FocusController.needsDescendantAddedRefocus(p1)
	-- upvalues: CryoModule (copy)
	return if p1.focusedLeaf == nil then nil else not CryoModule.isEmpty(p1:getChildren(p1.focusedLeaf))
end

function FocusController:descendantAddedRefocus()
	-- upvalues: DebugPrintModule (copy)
	if self:needsDescendantAddedRefocus() then
		DebugPrintModule("[FOCUS] Currently-focused node is no longer a leaf; refocusing", self.focusedLeaf.ref)
		self.focusedLeaf:focus()
	end
end

function FocusController:getChildren(FocusedLeaf)
	return self.focusNodeTree[FocusedLeaf] or {}
end

function FocusController:isNodeFocused(AllNode): boolean
	if self.focusedLeaf == nil then
		return false
	end
	if self.focusedLeaf == AllNode then
		return true
	end
	local Parent = self.focusedLeaf.parent
	while Parent ~= nil do
		if Parent == AllNode then
			return true
		end
		Parent = Parent.parent
	end
	return false
end

function FocusController:setFocusedLeaf(FocusedLeaf)
	self.focusedLeaf = FocusedLeaf
end

function FocusController:setInProgressFocus(InProgressFocus)
	self.inProgressFocus = InProgressFocus
end

function FocusController:isInProgressFocus(InProgressFocus): boolean
	return self.inProgressFocus == InProgressFocus
end

function FocusController:debugPrintTree()
	-- upvalues: DebugPrintModule (copy)
	if DebugPrintModule.isEnabled then
		local function recursePrintTree(AllNode, Text)
			-- upvalues: self (copy), DebugPrintModule (upval), recursePrintTree (copy)
			local Text1 = tostring(AllNode.ref)
			
			if self:isNodeFocused(AllNode) then
				Text1 ..= "*"
			end
			DebugPrintModule(Text, Text1)
			
			for _, child in pairs((self:getChildren(AllNode))) do
				recursePrintTree(child, Text .. "  ")
			end
		end
		
		DebugPrintModule("Focus Node Tree:")
		recursePrintTree(self.allNodes[self.rootRef], "  ")
		
		return
	end
end

function FocusController:updateInputBindings()
	-- upvalues: InputModule (copy), DebugPrintModule (copy)
	local t = {}
	local FocusedLeaf = self.focusedLeaf
	while FocusedLeaf ~= nil do
		for _, inputBinding in pairs(FocusedLeaf.inputBindings) do
			local UniqueKey = InputModule.getUniqueKey(inputBinding)
			
			if t[UniqueKey] == nil then
				DebugPrintModule("[INPUT] Bind input", UniqueKey)
				t[UniqueKey] = inputBinding
			end
		end
		FocusedLeaf = FocusedLeaf.parent
	end
	for _, inputDisconnector in pairs(self.inputDisconnectors) do
		inputDisconnector()
	end
	self.inputDisconnectors = {}
	self.boundInputs = {}
	
	for i, value in pairs(t) do
		self.inputDisconnectors[i] = InputModule.connectToEvent(value, self.engineInterface)
		
		if value.keyCode then
			self.boundInputs[value.keyCode] = value.meta or {}
		end
	end
	self.boundInputsChangedSignal:fire(self.boundInputs)
end

function FocusController:initialize(EngineInterface)
	-- upvalues: DebugPrintModule (copy)
	if self.engineInterface ~= nil then
		error("FocusController cannot be initialized more than once; make sure you are not passing it to multiple components")
	end
	self.engineInterface = EngineInterface
	self.guiServiceConnection = EngineInterface.subscribeToSelectionChanged(function()
		-- upvalues: self (copy), EngineInterface (copy), DebugPrintModule (upval)
		if self.rootRef == nil then return end
		local HasFocusedLeaf = self.focusedLeaf ~= nil
		self.focusedLeaf = nil
		local Selection = EngineInterface.getSelection()
		local Value = self.rootRef:getValue()
		
		if Selection ~= nil and (Value == Selection or Selection:IsDescendantOf(Value)) then
			DebugPrintModule("[EVENT] Selection changed to", Selection, "in focus hierarchy beginning at", Value)
			
			for i, allNode in pairs(self.allNodes) do
				if Selection == i:getValue() then
					self.focusedLeaf = allNode
					break
				end
			end
		end
		if self.focusedLeaf ~= nil or HasFocusedLeaf then
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

function FocusController:captureFocus()
	if self.engineInterface == nil then
		self.captureFocusOnInitialize = true
		
		return
	end
	if self.rootRef == nil then
		self.captureFocusOnRootRegistered = true
		
		return
	else
		self.allNodes[self.rootRef]:focus()
		self:debugPrintTree()
	end
end

function FocusController:releaseFocus()
	if self.engineInterface ~= nil then
		self.engineInterface.setSelection(nil)
	end
	self.captureFocusOnInitialize = false
	self.captureFocusOnRootRegistered = false
end

function FocusController:teardown()
	if self.guiServiceConnection ~= nil then
		self.guiServiceConnection:Disconnect()
	end
	for _, inputDisconnector in pairs(self.inputDisconnectors) do
		inputDisconnector()
	end
	self.rootRef = nil
	self.engineInterface = nil
	self.captureFocusOnInitialize = false
	self.captureFocusOnRootRegistered = false
	self.focusedLeaf = nil
end

function FocusController:subscribeToSelectionChange(p1)
	-- upvalues: DebugPrintModule (copy)
	DebugPrintModule("[TREE ] New subscription to selection change event")
	
	return self.selectionChangedSignal:subscribe(p1)
end

function FocusController.createPublicApiWrapper()
	-- upvalues: FocusController (copy), FocusControllerInternalApiModule (copy)
	local NewFocusController = FocusController.new()
	
	return {
		[FocusControllerInternalApiModule] = NewFocusController,
		moveFocusTo = function(...)
			-- upvalues: NewFocusController (copy)
			NewFocusController:moveFocusTo(...)
		end,
		moveFocusLeft = function()
			-- upvalues: NewFocusController (copy)
			NewFocusController:moveFocusToNeighbor("NextSelectionLeft")
		end,
		moveFocusRight = function()
			-- upvalues: NewFocusController (copy)
			NewFocusController:moveFocusToNeighbor("NextSelectionRight")
		end,
		moveFocusUp = function()
			-- upvalues: NewFocusController (copy)
			NewFocusController:moveFocusToNeighbor("NextSelectionUp")
		end,
		moveFocusDown = function()
			-- upvalues: NewFocusController (copy)
			NewFocusController:moveFocusToNeighbor("NextSelectionDown")
		end,
		captureFocus = function()
			-- upvalues: NewFocusController (copy)
			NewFocusController:captureFocus()
		end,
		releaseFocus = function()
			-- upvalues: NewFocusController (copy)
			NewFocusController:releaseFocus()
		end,
		getCurrentFocus = function()
			-- upvalues: NewFocusController (copy)
			local FocusedLeaf = NewFocusController.focusedLeaf
			
			return FocusedLeaf and FocusedLeaf.ref or nil
		end,
		getBoundInputs = function()
			-- upvalues: NewFocusController (copy)
			return NewFocusController.boundInputs
		end,
		subscribeToBoundInputsChanged = function(p1)
			-- upvalues: NewFocusController (copy)
			return NewFocusController.boundInputsChangedSignal:subscribe(p1)
		end
	}
end

return FocusController