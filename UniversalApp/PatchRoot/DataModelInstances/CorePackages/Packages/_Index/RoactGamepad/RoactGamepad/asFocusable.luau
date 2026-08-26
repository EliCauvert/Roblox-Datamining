local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local focusContextModule = require(script.Parent.FocusContext)
local focusNodeModule = require(script.Parent.FocusNode)
local getEngineInterfaceModule = require(script.Parent.getEngineInterface)
local focusControllerInternalApiModule = require(script.Parent.FocusControllerInternalApi)
local t = {
	parentFocusNode = cryoModule.None,
	parentNeighbors = cryoModule.None,
	focusController = cryoModule.None,
	onFocusGained = cryoModule.None,
	onFocusLost = cryoModule.None,
	onFocusChanged = cryoModule.None,
	inputBindings = cryoModule.None,
	innerRef = cryoModule.None,
	restorePreviousChildFocus = cryoModule.None,
	defaultChild = cryoModule.None
}
local t_1 = {}
local var1 = tModule.intersection(tModule.interface({
	parentFocusNode = tModule.optional(tModule.table),
	focusController = tModule.optional(tModule.table),
	innerRef = tModule.optional(tModule.table),
	restorePreviousChildFocus = tModule.boolean,
	inputBindings = tModule.table,
	defaultChild = tModule.optional(tModule.table),
	onFocusGained = tModule.optional(tModule.callback),
	onFocusLost = tModule.optional(tModule.callback),
	onFocusChanged = tModule.optional(tModule.callback)
}), function(p1)
	if p1.focusController == nil or p1.parentFocusNode == nil then
		return true
	end
	return false, "Cannot attach a new focusController beneath an existing one"
end)
local t_2 = { restorePreviousChildFocus = false, inputBindings = {} }

return function(p1)
	-- upvalues: roactModule (ref), var1 (ref), t_2 (ref), t_1 (ref), focusNodeModule (ref), getEngineInterfaceModule (ref), focusControllerInternalApiModule (ref), cryoModule (ref), t (ref), focusContextModule (ref)
	local var2 = roactModule.Component:extend(("Focusable(%s)"):format(tostring(p1)))
	var2.validateProps = var1
	var2.defaultProps = t_2
	
	function var11.init(p2)
		-- upvalues: roactModule (copy), t_1 (copy), focusNodeModule (copy), getEngineInterfaceModule (copy)
		p2.focused = false
		p2.defaultRef = roactModule.createRef()
		local parentNeighbors = p2.props.parentNeighbors or t_1
		p2:setState({
			needsDescendantAddedRefocusCounter = 0,
			needsDescendantRemovedRefocusCounter = 0,
			focusNode = focusNodeModule.new(p2.props, p2:getRef()),
			parentNeighbors = parentNeighbors,
			neighbors = {
				NextSelectionLeft = p2.props.NextSelectionLeft or parentNeighbors.NextSelectionLeft,
				NextSelectionRight = p2.props.NextSelectionRight or parentNeighbors.NextSelectionRight,
				NextSelectionUp = p2.props.NextSelectionUp or parentNeighbors.NextSelectionUp,
				NextSelectionDown = p2.props.NextSelectionDown or parentNeighbors.NextSelectionDown
			}
		})
		
		function p2.updateFocusedState(p3)
			-- upvalues: p2 (ref)
			if not p2.focused and p3 then
				p2:gainFocus()
				
				return
			elseif p2.focused and not p3 then
				p2:loseFocus()
			end
		end
		
		if p2:isRoot() then
			local var3 = false
			
			function p2.ancestryChanged(p3)
				-- upvalues: var3 (write), p2 (ref), getEngineInterfaceModule (copy)
				if not var3 and p3:IsDescendantOf(game) then
					var3 = true
					p2:getFocusControllerInternal():initialize(getEngineInterfaceModule(p3))
				end
			end
			
			function p2.ancestryChangedListener(p3)
				-- upvalues: p2 (ref), roactModule (copy)
				p2.ancestryChanged(p3)
				local ancestryChanged = p2.props[roactModule.Event.AncestryChanged]
				
				if ancestryChanged ~= nil then
					ancestryChanged(p3)
				end
			end
			
			function p2.refreshFocusOnDescendantAdded(p3)
				-- upvalues: p2 (ref), roactModule (copy)
				if p2:getFocusControllerInternal():needsDescendantAddedRefocus() then
					p2:setState(function(p4)
						return {
							needsDescendantAddedRefocusCounter = p4.needsDescendantAddedRefocusCounter + 1
						}
					end)
				end
				local descendantAdded = p2.props[roactModule.Event.DescendantAdded]
				
				if descendantAdded ~= nil then
					descendantAdded(p3)
				end
			end
			
			function p2.refreshFocusOnDescendantRemoved(p3)
				-- upvalues: p2 (ref), roactModule (copy)
				if p2:getFocusControllerInternal():needsDescendantRemovedRefocus() then
					p2:setState(function(p4)
						return {
							needsDescendantRemovedRefocusCounter = p4.needsDescendantRemovedRefocusCounter + 1
						}
					end)
				end
				local descendantRemoving = p2.props[roactModule.Event.DescendantRemoving]
				
				if descendantRemoving ~= nil then
					descendantRemoving(p3)
				end
			end
		end
	end
	
	function var11.getDerivedStateFromProps(p2, p3)
		-- upvalues: t_1 (copy)
		local neighbors = p3.neighbors or t_1
		local parentNeighbors = p2.parentNeighbors or t_1
		local nextSelectionLeft = p2.NextSelectionLeft or parentNeighbors.NextSelectionLeft
		local nextSelectionRight = p2.NextSelectionRight or parentNeighbors.NextSelectionRight
		local nextSelectionUp = p2.NextSelectionUp or parentNeighbors.NextSelectionUp
		local nextSelectionDown = p2.NextSelectionDown or parentNeighbors.NextSelectionDown
		
		return if nextSelectionLeft == neighbors.NextSelectionLeft and nextSelectionRight == neighbors.NextSelectionRight and (nextSelectionDown == neighbors.NextSelectionDown and nextSelectionUp == neighbors.NextSelectionUp) then nil else {
			parentNeighbors = parentNeighbors,
			neighbors = {
				NextSelectionLeft = nextSelectionLeft,
				NextSelectionRight = nextSelectionRight,
				NextSelectionUp = nextSelectionUp,
				NextSelectionDown = nextSelectionDown
			}
		}
	end
	
	function var11.gainFocus(p2)
		p2.focused = true
		
		if p2.props.onFocusGained ~= nil then
			p2.props.onFocusGained()
		end
		if p2.props.onFocusChanged ~= nil then
			p2.props.onFocusChanged(true)
		end
	end
	
	function var11.loseFocus(p2)
		p2.focused = false
		
		if p2.props.onFocusLost ~= nil then
			p2.props.onFocusLost()
		end
		if p2.props.onFocusChanged ~= nil then
			p2.props.onFocusChanged(false)
		end
	end
	
	function var11.isRoot(p2)
		return p2.props.focusController ~= nil and p2.props.parentFocusNode == nil
	end
	
	function var11.getFocusControllerInternal(p2)
		-- upvalues: focusControllerInternalApiModule (copy)
		return p2.state.focusNode.focusController[focusControllerInternalApiModule]
	end
	
	function var11.getRef(p2)
		return p2.props.innerRef or p2.defaultRef
	end
	
	function var11.render(p2)
		-- upvalues: roactModule (copy), cryoModule (copy), t (copy), t_1 (copy), focusContextModule (copy), p1 (ref)
		local ref = p2:getRef()
		local t_2 = {
			NextSelectionLeft = ref,
			NextSelectionRight = ref,
			NextSelectionDown = ref,
			NextSelectionUp = ref,
			[roactModule.Ref] = ref
		}
		local _ = nil
		
		return roactModule.createElement(focusContextModule.Provider, { value = p2.state }, roactModule.createElement(p1, if p2:isRoot() then cryoModule.Dictionary.join(t_2, p2.props, {
			[roactModule.Event.AncestryChanged] = p2.ancestryChangedListener,
			[roactModule.Event.DescendantAdded] = p2.refreshFocusOnDescendantAdded,
			[roactModule.Event.DescendantRemoving] = p2.refreshFocusOnDescendantRemoved
		}, t) else cryoModule.Dictionary.join(t_2, p2.props.parentNeighbors or t_1, p2.props, t)))
	end
	
	function var11.didMount(p2)
		p2.state.focusNode:attachToTree(p2.props.parentFocusNode, p2.updateFocusedState)
		
		if p2:isRoot() then
			p2.ancestryChanged(p2:getRef():getValue())
		end
	end
	
	function var11.didUpdate(p2, _, p3)
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
	
	function var11.willUnmount(p2)
		p2.state.focusNode:detachFromTree()
		
		if p2:isRoot() then
			p2:getFocusControllerInternal():teardown()
		end
	end
	
	return roactModule.forwardRef(function(p2, p3)
		-- upvalues: roactModule (copy), focusContextModule (copy), cryoModule (copy), t (copy), p1 (ref), var2 (ref)
		return roactModule.createElement(focusContextModule.Consumer, {
			render = function(p4)
				-- upvalues: p2 (ref), cryoModule (copy), t (copy), roactModule (copy), p3 (ref), p1 (copy), var2 (copy)
				return if p4 == nil and p2.focusController == nil then roactModule.createElement(p1, cryoModule.Dictionary.join(p2, t, { [roactModule.Ref] = p3 })) else roactModule.createElement(var2, cryoModule.Dictionary.join(p2, {
					parentFocusNode = if p4 then p4.focusNode else nil,
					parentNeighbors = if p4 then p4.neighbors else nil,
					innerRef = p3
				}))
			end
		})
	end)
end