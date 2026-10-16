local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local FocusContextModule = require(script.Parent.FocusContext)
local FocusNodeModule = require(script.Parent.FocusNode)
local GetEngineInterfaceModule = require(script.Parent.getEngineInterface)
local FocusControllerInternalApiModule = require(script.Parent.FocusControllerInternalApi)
local config = {
	parentFocusNode = CryoModule.None,
	parentNeighbors = CryoModule.None,
	focusController = CryoModule.None,
	onFocusGained = CryoModule.None,
	onFocusLost = CryoModule.None,
	onFocusChanged = CryoModule.None,
	inputBindings = CryoModule.None,
	innerRef = CryoModule.None,
	restorePreviousChildFocus = CryoModule.None,
	defaultChild = CryoModule.None
}
local t = {}
local IntersectionResult = TModule.intersection(TModule.interface({
	parentFocusNode = TModule.optional(TModule.table),
	focusController = TModule.optional(TModule.table),
	innerRef = TModule.optional(TModule.table),
	restorePreviousChildFocus = TModule.boolean,
	inputBindings = TModule.table,
	defaultChild = TModule.optional(TModule.table),
	onFocusGained = TModule.optional(TModule.callback),
	onFocusLost = TModule.optional(TModule.callback),
	onFocusChanged = TModule.optional(TModule.callback)
}), function(p1) --[[ Line: 34 | Named "checkFocusManager" ]]
	if p1.focusController == nil or p1.parentFocusNode == nil then
		return true
	else
		return false, "Cannot attach a new focusController beneath an existing one"
	end
end)
local DefaultProps = { restorePreviousChildFocus = false, inputBindings = {} }

return function(p1) --[[ Line: 69 | Named "asFocusable" ]]
	-- upvalues: RoactModule (copy), IntersectionResult (copy), DefaultProps (copy), t (copy), FocusNodeModule (copy), GetEngineInterfaceModule (copy), FocusControllerInternalApiModule (copy), CryoModule (copy), config (copy), FocusContextModule (copy)
	local ExtendResult = RoactModule.Component:extend((("Focusable(%s)"):format((tostring(p1)))))
	ExtendResult.validateProps = IntersectionResult
	ExtendResult.defaultProps = DefaultProps
	
	function ExtendResult.init(p2) --[[ Line: 79 ]]
		-- upvalues: RoactModule (upval), t (upval), FocusNodeModule (upval), GetEngineInterfaceModule (upval)
		p2.focused = false
		p2.defaultRef = RoactModule.createRef()
		local ParentNeighbors = p2.props.parentNeighbors or t
		p2:setState({
			needsDescendantAddedRefocusCounter = 0,
			needsDescendantRemovedRefocusCounter = 0,
			focusNode = FocusNodeModule.new(p2.props, p2:getRef()),
			parentNeighbors = ParentNeighbors,
			neighbors = {
				NextSelectionLeft = p2.props.NextSelectionLeft or ParentNeighbors.NextSelectionLeft,
				NextSelectionRight = p2.props.NextSelectionRight or ParentNeighbors.NextSelectionRight,
				NextSelectionUp = p2.props.NextSelectionUp or ParentNeighbors.NextSelectionUp,
				NextSelectionDown = p2.props.NextSelectionDown or ParentNeighbors.NextSelectionDown
			}
		})
		
		function p2.updateFocusedState(p3) --[[ Line: 97 ]]
			-- upvalues: p2 (copy)
			if not p2.focused and p3 then
				p2:gainFocus()
				
				return
			end
			if p2.focused and not p3 then
				p2:loseFocus()
			end
		end
		
		if p2:isRoot() then
			local Flag = false
			
			function p2.ancestryChanged(Object) --[[ Line: 111 ]]
				-- upvalues: Flag (ref), p2 (copy), GetEngineInterfaceModule (upval)
				if not Flag and Object:IsDescendantOf(game) then
					Flag = true
					p2:getFocusControllerInternal():initialize(GetEngineInterfaceModule(Object))
				end
			end
			
			function p2.ancestryChangedListener(p3) --[[ Line: 121 ]]
				-- upvalues: p2 (copy), RoactModule (upval)
				p2.ancestryChanged(p3)
				local Prop: (any) -> () = p2.props[RoactModule.Event.AncestryChanged]
				
				if Prop ~= nil then
					Prop(p3)
				end
			end
			
			function p2.refreshFocusOnDescendantAdded(p3) --[[ Line: 130 ]]
				-- upvalues: p2 (copy), RoactModule (upval)
				if p2:getFocusControllerInternal():needsDescendantAddedRefocus() then
					p2:setState(function(p4) --[[ Line: 132 ]]
						return {
							needsDescendantAddedRefocusCounter = p4.needsDescendantAddedRefocusCounter + 1
						}
					end)
				end
				local Prop: (any) -> () = p2.props[RoactModule.Event.DescendantAdded]
				
				if Prop ~= nil then
					Prop(p3)
				end
			end
			
			function p2.refreshFocusOnDescendantRemoved(p3) --[[ Line: 145 ]]
				-- upvalues: p2 (copy), RoactModule (upval)
				if p2:getFocusControllerInternal():needsDescendantRemovedRefocus() then
					p2:setState(function(p4) --[[ Line: 147 ]]
						return {
							needsDescendantRemovedRefocusCounter = p4.needsDescendantRemovedRefocusCounter + 1
						}
					end)
				end
				local Prop: (any) -> () = p2.props[RoactModule.Event.DescendantRemoving]
				
				if Prop ~= nil then
					Prop(p3)
				end
			end
		end
	end
	
	function ExtendResult.getDerivedStateFromProps(Gui, p2) --[[ Line: 162 ]]
		-- upvalues: t (upval)
		local Neighbors = p2.neighbors or t
		local ParentNeighbors = Gui.parentNeighbors or t
		local NextSelectionLeft = Gui.NextSelectionLeft or ParentNeighbors.NextSelectionLeft
		local NextSelectionRight = Gui.NextSelectionRight or ParentNeighbors.NextSelectionRight
		local NextSelectionUp = Gui.NextSelectionUp or ParentNeighbors.NextSelectionUp
		local NextSelectionDown = Gui.NextSelectionDown or ParentNeighbors.NextSelectionDown
		
		return if NextSelectionLeft == Neighbors.NextSelectionLeft and NextSelectionRight == Neighbors.NextSelectionRight and NextSelectionDown == Neighbors.NextSelectionDown and NextSelectionUp == Neighbors.NextSelectionUp then nil else {
			parentNeighbors = ParentNeighbors,
			neighbors = {
				NextSelectionLeft = NextSelectionLeft,
				NextSelectionRight = NextSelectionRight,
				NextSelectionUp = NextSelectionUp,
				NextSelectionDown = NextSelectionDown
			}
		}
	end
	
	function ExtendResult.gainFocus(p2) --[[ Line: 195 ]]
		p2.focused = true
		
		if p2.props.onFocusGained ~= nil then
			p2.props.onFocusGained()
		end
		if p2.props.onFocusChanged ~= nil then
			p2.props.onFocusChanged(true)
		end
	end
	
	function ExtendResult.loseFocus(p2) --[[ Line: 207 ]]
		p2.focused = false
		
		if p2.props.onFocusLost ~= nil then
			p2.props.onFocusLost()
		end
		if p2.props.onFocusChanged ~= nil then
			p2.props.onFocusChanged(false)
		end
	end
	
	function ExtendResult.isRoot(p2): boolean --[[ Line: 222 ]]
		return p2.props.focusController ~= nil and p2.props.parentFocusNode == nil
	end
	
	function ExtendResult.getFocusControllerInternal(p2) --[[ Line: 226 ]]
		-- upvalues: FocusControllerInternalApiModule (upval)
		return p2.state.focusNode.focusController[FocusControllerInternalApiModule]
	end
	
	function ExtendResult.getRef(p2) --[[ Line: 230 ]]
		return p2.props.innerRef or p2.defaultRef
	end
	
	function ExtendResult.render(p2) --[[ Line: 234 ]]
		-- upvalues: RoactModule (upval), CryoModule (upval), config (upval), t (upval), FocusContextModule (upval), p1 (copy)
		local Ref = p2:getRef()
		local config1 = {
			NextSelectionLeft = Ref,
			NextSelectionRight = Ref,
			NextSelectionDown = Ref,
			NextSelectionUp = Ref,
			[RoactModule.Ref] = Ref
		}
		
		return RoactModule.createElement(FocusContextModule.Provider, { value = p2.state }, RoactModule.createElement(p1, if p2:isRoot() then CryoModule.Dictionary.join(config1, p2.props, {
			[RoactModule.Event.AncestryChanged] = p2.ancestryChangedListener,
			[RoactModule.Event.DescendantAdded] = p2.refreshFocusOnDescendantAdded,
			[RoactModule.Event.DescendantRemoving] = p2.refreshFocusOnDescendantRemoved
		}, config) else CryoModule.Dictionary.join(config1, p2.props.parentNeighbors or t, p2.props, config)))
	end
	
	function ExtendResult.didMount(p2) --[[ Line: 272 ]]
		p2.state.focusNode:attachToTree(p2.props.parentFocusNode, p2.updateFocusedState)
		
		if p2:isRoot() then
			p2.ancestryChanged(p2:getRef():getValue())
		end
	end
	
	function ExtendResult.didUpdate(p2, _, p3) --[[ Line: 283 ]]
		p2.state.focusNode:updateNavProps(p2.props)
		
		if p2.state.focusNode.ref ~= (p2.props.innerRef or p2.defaultRef) then
			error("Cannot change the ref passed to a Focusable component", 0)
		end
		if p2.state.needsDescendantAddedRefocusCounter ~= p3.needsDescendantAddedRefocusCounter then
			p2:getFocusControllerInternal():descendantAddedRefocus()
		end
		if p2.state.needsDescendantRemovedRefocusCounter ~= p3.needsDescendantRemovedRefocusCounter then
			p2:getFocusControllerInternal():descendantRemovedRefocus()
		end
	end
	
	function ExtendResult.willUnmount(p2) --[[ Line: 305 ]]
		p2.state.focusNode:detachFromTree()
		
		if p2:isRoot() then
			p2:getFocusControllerInternal():teardown()
		end
	end
	
	return RoactModule.forwardRef(function(p2, InnerRef) --[[ Line: 313 ]]
		-- upvalues: RoactModule (upval), FocusContextModule (upval), CryoModule (upval), config (upval), p1 (copy), ExtendResult (copy)
		return RoactModule.createElement(FocusContextModule.Consumer, {
			render = function(p3) --[[ Line: 315 ]]
				-- upvalues: p2 (copy), CryoModule (upval), config (upval), RoactModule (upval), InnerRef (copy), p1 (upval), ExtendResult (upval)
				return if p3 == nil and p2.focusController == nil then RoactModule.createElement(p1, (CryoModule.Dictionary.join(p2, config, { [RoactModule.Ref] = InnerRef }))) else RoactModule.createElement(ExtendResult, (CryoModule.Dictionary.join(p2, {
					parentFocusNode = p3 and p3.focusNode or nil,
					parentNeighbors = p3 and p3.neighbors or nil,
					innerRef = InnerRef
				})))
			end
		})
	end)
end