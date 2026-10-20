local CryoModule = require(script.Parent.Parent.Cryo)
local FocusControllerInternalApiModule = require(script.Parent.FocusControllerInternalApi)
local InputBindingsEqualModule = require(script.Parent.inputBindingsEqual)
local DebugPrintModule = require(script.Parent.debugPrint)
local ConfigModule = require(script.Parent.Config)
local FocusNodeModule = {}
FocusNodeModule.__index = FocusNodeModule

function FocusNodeModule.new(p1, Ref)
	-- upvalues: FocusNodeModule (copy)
	local FocusController = nil
	
	if p1.parentFocusNode == nil then
		if p1.focusController == nil then
			error("Cannot create node without focus manager")
		else
			FocusController = p1.focusController
		end
	else
		FocusController = p1.parentFocusNode.focusController
	end
	local self = setmetatable({
		lastFocused = nil,
		focusController = FocusController,
		ref = Ref
	}, FocusNodeModule)
	self:updateNavProps(p1)
	
	return self
end

function FocusNodeModule:__getFocusControllerInternal()
	-- upvalues: FocusControllerInternalApiModule (copy)
	return self.focusController[FocusControllerInternalApiModule]
end

function FocusNodeModule:__findDefaultChildNode()
	local v1 = 1e999
	local v2 = nil
	local Children = self:__getFocusControllerInternal():getChildren(self)
	local Value = self.ref:getValue()
	local LayoutOrder = nil
	
	for i, child in pairs(Children) do
		local Value1 = i:getValue()
		while Value1 ~= Value and Value1 ~= nil do
			if Value1:isA("GuiObject") then
				LayoutOrder = Value1.LayoutOrder
				
				if LayoutOrder ~= 0 then
					if LayoutOrder >= v1 then break end
					v1 = LayoutOrder
					v2 = child
					break
				end
			end
			Value1 = Value1.Parent
		end
	end
	if v2 ~= nil then
		return v2
	end
	for i1, child1 in pairs(Children) do
		if i1:getValue() ~= nil then
			return child1
		end
	end
	return nil
end

function FocusNodeModule:updateNavProps(p1)
	-- upvalues: InputBindingsEqualModule (copy)
	local RestorePreviousChildFocus = p1.restorePreviousChildFocus ~= nil and p1.restorePreviousChildFocus
	local InputBindings = self.inputBindings
	self.defaultChildRef = p1.defaultChild
	self.restorePreviousChildFocus = RestorePreviousChildFocus
	self.inputBindings = p1.inputBindings or {}
	local FocusControllerInternal = self:__getFocusControllerInternal()
	
	if FocusControllerInternal:isNodeFocused(self) and not InputBindingsEqualModule(InputBindings, self.inputBindings) then
		FocusControllerInternal:updateInputBindings()
	end
end

function FocusNodeModule:focus()
	-- upvalues: ConfigModule (copy), CryoModule (copy), DebugPrintModule (copy)
	if not ConfigModule.Enabled then return end
	local FocusControllerInternal = self:__getFocusControllerInternal()
	
	if not FocusControllerInternal:isInitialized() then return end
	FocusControllerInternal:setInProgressFocus(self)
	
	if CryoModule.isEmpty((FocusControllerInternal:getChildren(self))) then
		FocusControllerInternal:setSelection(self.ref:getValue())
		
		return
	end
	local ClockTime = os.clock()
	local HasValue: boolean = self.defaultChildRef ~= nil and (FocusControllerInternal.allNodes[self.defaultChildRef] ~= nil and self.defaultChildRef:getValue() ~= nil)
	local NoTimeout: boolean = self.timeout == nil or ClockTime < self.timeout
	
	if self.restorePreviousChildFocus and self.lastFocused ~= nil and self.lastFocused:getValue() then
		DebugPrintModule("[FOCUS] Restore previous focus:", self.lastFocused)
		FocusControllerInternal:moveFocusTo(self.lastFocused)
		
		return
	end
	if self.defaultChildRef and (NoTimeout or HasValue) then
		if HasValue then
			DebugPrintModule("[FOCUS] Found valid default child", self.defaultChildRef, "for", self.ref)
			self.timeout = nil
			FocusControllerInternal:moveFocusTo(self.defaultChildRef)
			
			return
		end
		if self.timeout == nil then
			DebugPrintModule("[FOCUS] Default child specified is not valid. Wait for it to be assigned...")
			self.timeout = ClockTime + 0.5
		end
		task.delay(0, function()
			-- upvalues: FocusControllerInternal (copy), self (copy)
			if FocusControllerInternal:isInProgressFocus(self) then
				self:focus()
			end
		end)
		
		return
	else
		if self.timeout ~= nil then
			DebugPrintModule("[FOCUS] Timeout for default child of", self.ref)
			self.timeout = nil
		end
		local DefaultChildNode = self:__findDefaultChildNode()
		
		if DefaultChildNode == nil then
			FocusControllerInternal:setFocusedLeaf(self)
			FocusControllerInternal:setInProgressFocus(nil)
			
			return
		else
			DebugPrintModule("[FOCUS] No default, use fallback logic to focus", DefaultChildNode.ref)
			DefaultChildNode:focus()
		end
	end
end

function FocusNodeModule:attachToTree(Parent, Callback)
	-- upvalues: CryoModule (copy)
	local FocusControllerInternal = self:__getFocusControllerInternal()
	FocusControllerInternal:registerNode(Parent, self.ref, self)
	self.parent = Parent
	self.disconnectSelectionListener = FocusControllerInternal:subscribeToSelectionChange(function()
		-- upvalues: FocusControllerInternal (copy), self (copy), Callback (copy), CryoModule (upval)
		local IsNodeFocused = FocusControllerInternal:isNodeFocused(self)
		Callback(IsNodeFocused)
		
		if self.parent ~= nil and IsNodeFocused then
			self.parent.lastFocused = self.ref
		end
		if not CryoModule.isEmpty((FocusControllerInternal:getChildren(self))) and IsNodeFocused and FocusControllerInternal:getSelection() == self.ref:getValue() then
			self:focus()
		end
	end)
end

function FocusNodeModule:detachFromTree()
	self:__getFocusControllerInternal():deregisterNode(self.parent, self.ref)
	
	if self.disconnectSelectionListener ~= nil then
		self.disconnectSelectionListener()
		self.disconnectSelectionListener = nil
	end
end

return FocusNodeModule