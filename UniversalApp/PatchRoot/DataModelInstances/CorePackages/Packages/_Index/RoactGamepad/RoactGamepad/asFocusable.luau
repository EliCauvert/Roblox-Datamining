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
local var9 = tModule.intersection(tModule.interface({
	parentFocusNode = tModule.optional(tModule.table),
	focusController = tModule.optional(tModule.table),
	innerRef = tModule.optional(tModule.table),
	restorePreviousChildFocus = tModule.boolean,
	inputBindings = tModule.table,
	defaultChild = tModule.optional(tModule.table),
	onFocusGained = tModule.optional(tModule.callback),
	onFocusLost = tModule.optional(tModule.callback),
	onFocusChanged = tModule.optional(tModule.callback)
}), function(p0) --[[ line: 34 | named "checkFocusManager" ]]
	if p0.focusController == nil or p0.parentFocusNode == nil then
		return true
	end
	return false, "Cannot attach a new focusController beneath an existing one"
end)
local t_2 = { restorePreviousChildFocus = false, inputBindings = {} }

return function(p1) --[[ line: 69 | named "asFocusable" ]]
	-- upvalues: roactModule (ref), var9 (ref), t_2 (ref), t_1 (ref), focusNodeModule (ref), getEngineInterfaceModule (ref), focusControllerInternalApiModule (ref), cryoModule (ref), t (ref), focusContextModule (ref)
	local var11 = roactModule.Component:extend(("Focusable(%s)"):format(tostring(p1)))
	var11.validateProps = var9
	var11.defaultProps = t_2
	
	function var11.init(p2) --[[ line: 79 ]]
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
		
		function p2.updateFocusedState(p3) --[[ line: 97 ]]
			-- upvalues: p2 (ref)
			if not p2.focused and p3 then
				p2:gainFocus()
				
				return
			elseif p2.focused and not p3 then
				p2:loseFocus()
			end
		end
		
		if p2:isRoot() then
			local var13 = false
			
			function p2.ancestryChanged(p4) --[[ line: 111 ]]
				-- upvalues: var13 (write), p2 (ref), getEngineInterfaceModule (copy)
				if not var13 and p4:IsDescendantOf(game) then
					var13 = true
					p2:getFocusControllerInternal():initialize(getEngineInterfaceModule(p4))
				end
			end
			
			function p2.ancestryChangedListener(p5) --[[ line: 121 ]]
				-- upvalues: p2 (ref), roactModule (copy)
				p2.ancestryChanged(p5)
				local ancestryChanged = p2.props[roactModule.Event.AncestryChanged]
				
				if ancestryChanged ~= nil then
					ancestryChanged(p5)
				end
			end
			
			function p2.refreshFocusOnDescendantAdded(p6) --[[ line: 130 ]]
				-- upvalues: p2 (ref), roactModule (copy)
				if p2:getFocusControllerInternal():needsDescendantAddedRefocus() then
					p2:setState(function(p7) --[[ line: 132 ]]
						return {
							needsDescendantAddedRefocusCounter = p7.needsDescendantAddedRefocusCounter + 1
						}
					end)
				end
				local descendantAdded = p2.props[roactModule.Event.DescendantAdded]
				
				if descendantAdded ~= nil then
					descendantAdded(p6)
				end
			end
			
			function p2.refreshFocusOnDescendantRemoved(p8) --[[ line: 145 ]]
				-- upvalues: p2 (ref), roactModule (copy)
				if p2:getFocusControllerInternal():needsDescendantRemovedRefocus() then
					p2:setState(function(p9) --[[ line: 147 ]]
						return {
							needsDescendantRemovedRefocusCounter = p9.needsDescendantRemovedRefocusCounter + 1
						}
					end)
				end
				local descendantRemoving = p2.props[roactModule.Event.DescendantRemoving]
				
				if descendantRemoving ~= nil then
					descendantRemoving(p8)
				end
			end
		end
	end
	
	function var11.getDerivedStateFromProps(p10, p11) --[[ line: 162 ]]
		-- upvalues: t_1 (copy)
		local neighbors = p11.neighbors or t_1
		local parentNeighbors = p10.parentNeighbors or t_1
		local nextSelectionLeft = p10.NextSelectionLeft or parentNeighbors.NextSelectionLeft
		local nextSelectionRight = p10.NextSelectionRight or parentNeighbors.NextSelectionRight
		local nextSelectionUp = p10.NextSelectionUp or parentNeighbors.NextSelectionUp
		local nextSelectionDown = p10.NextSelectionDown or parentNeighbors.NextSelectionDown
		
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
	
	function var11.gainFocus(p12) --[[ line: 195 ]]
		p12.focused = true
		
		if p12.props.onFocusGained ~= nil then
			p12.props.onFocusGained()
		end
		if p12.props.onFocusChanged ~= nil then
			p12.props.onFocusChanged(true)
		end
	end
	
	function var11.loseFocus(p13) --[[ line: 207 ]]
		p13.focused = false
		
		if p13.props.onFocusLost ~= nil then
			p13.props.onFocusLost()
		end
		if p13.props.onFocusChanged ~= nil then
			p13.props.onFocusChanged(false)
		end
	end
	
	function var11.isRoot(p14) --[[ line: 222 ]]
		return p14.props.focusController ~= nil and p14.props.parentFocusNode == nil
	end
	
	function var11.getFocusControllerInternal(p15) --[[ line: 226 ]]
		-- upvalues: focusControllerInternalApiModule (copy)
		return p15.state.focusNode.focusController[focusControllerInternalApiModule]
	end
	
	function var11.getRef(p16) --[[ line: 230 ]]
		return p16.props.innerRef or p16.defaultRef
	end
	
	function var11.render(p17) --[[ line: 234 ]]
		-- upvalues: roactModule (copy), cryoModule (copy), t (copy), t_1 (copy), focusContextModule (copy), p1 (ref)
		local ref = p17:getRef()
		local t_2 = {
			NextSelectionLeft = ref,
			NextSelectionRight = ref,
			NextSelectionDown = ref,
			NextSelectionUp = ref,
			[roactModule.Ref] = ref
		}
		local _ = nil
		
		return roactModule.createElement(focusContextModule.Provider, { value = p17.state }, roactModule.createElement(p1, if p17:isRoot() then cryoModule.Dictionary.join(t_2, p17.props, {
			[roactModule.Event.AncestryChanged] = p17.ancestryChangedListener,
			[roactModule.Event.DescendantAdded] = p17.refreshFocusOnDescendantAdded,
			[roactModule.Event.DescendantRemoving] = p17.refreshFocusOnDescendantRemoved
		}, t) else cryoModule.Dictionary.join(t_2, p17.props.parentNeighbors or t_1, p17.props, t)))
	end
	
	function var11.didMount(p18) --[[ line: 272 ]]
		p18.state.focusNode:attachToTree(p18.props.parentFocusNode, p18.updateFocusedState)
		
		if p18:isRoot() then
			p18.ancestryChanged(p18:getRef():getValue())
		end
	end
	
	function var11.didUpdate(p19, _, p20) --[[ line: 283 ]]
		p19.state.focusNode:updateNavProps(p19.props)
		
		if p19.state.focusNode.ref ~= (p19.props.innerRef or p19.defaultRef) then
			error("Cannot change the ref passed to a Focusable component", 0)
		end
		if p19.state.needsDescendantAddedRefocusCounter ~= p20.needsDescendantAddedRefocusCounter then
			p19:getFocusControllerInternal():descendantAddedRefocus()
		end
		if p19.state.needsDescendantRemovedRefocusCounter ~= p20.needsDescendantRemovedRefocusCounter then
			p19:getFocusControllerInternal():descendantRemovedRefocus()
		end
	end
	
	function var11.willUnmount(p21) --[[ line: 305 ]]
		p21.state.focusNode:detachFromTree()
		
		if p21:isRoot() then
			p21:getFocusControllerInternal():teardown()
		end
	end
	
	return roactModule.forwardRef(function(p22, p23) --[[ line: 313 ]]
		-- upvalues: roactModule (copy), focusContextModule (copy), cryoModule (copy), t (copy), p1 (ref), var11 (ref)
		return roactModule.createElement(focusContextModule.Consumer, {
			render = function(p24) --[[ line: 315 ]]
				-- upvalues: p22 (ref), cryoModule (copy), t (copy), roactModule (copy), p23 (ref), p1 (copy), var11 (copy)
				return if p24 == nil and p22.focusController == nil then roactModule.createElement(p1, cryoModule.Dictionary.join(p22, t, { [roactModule.Ref] = p23 })) else roactModule.createElement(var11, cryoModule.Dictionary.join(p22, {
					parentFocusNode = if p24 then p24.focusNode else nil,
					parentNeighbors = if p24 then p24.neighbors else nil,
					innerRef = p23
				}))
			end
		})
	end)
end