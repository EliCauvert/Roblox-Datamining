local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local cryoModule = require(parent_2.Cryo)
local tModule = require(parent_2.t)
local controlStateModule = require(parent.Enum.ControlState)
local stateTableModule = require(parent_1.StateTable.StateTable)
local controllable = roactModule.PureComponent:extend("Controllable")

function controllable.init(p0) --[[ line: 23 ]]
	-- upvalues: controlStateModule (ref), stateTableModule (ref)
	p0.isMounted = false
	local initialize = controlStateModule.Initialize
	p0.state = { currentState = initialize }
	local formattedText = string.format("Controllable(%s)", tostring(p0))
	
	function p0.setDisabled(p1) --[[ line: 31 ]]
		-- upvalues: p0 (ref)
		if p1 then
			p0.stateTable.events.Disable()
			
			return
		end
		p0.stateTable.events.Enable()
	end
	
	p0.stateTable = stateTableModule.new(formattedText, initialize, {}, {
		[controlStateModule.Initialize] = {
			Enable = { nextState = controlStateModule.Default },
			Disable = { nextState = controlStateModule.Disabled }
		},
		[controlStateModule.Default] = {
			OnPressed = { nextState = controlStateModule.Pressed },
			StartHover = { nextState = controlStateModule.Hover },
			OnSelectionGained = { nextState = controlStateModule.Selected },
			Disable = { nextState = controlStateModule.Disabled }
		},
		[controlStateModule.Hover] = {
			OnSelectionGained = { nextState = controlStateModule.Selected },
			OnPressed = { nextState = controlStateModule.Pressed },
			EndHover = { nextState = controlStateModule.Default },
			Disable = { nextState = controlStateModule.Disabled }
		},
		[controlStateModule.Pressed] = {
			OnSelectionGained = { nextState = controlStateModule.SelectedPressed },
			OnReleased = { nextState = controlStateModule.Default },
			OnReleasedHover = { nextState = controlStateModule.Hover },
			Disable = { nextState = controlStateModule.Disabled }
		},
		[controlStateModule.Selected] = {
			OnSelectionLost = { nextState = controlStateModule.Default },
			OnPressed = { nextState = controlStateModule.SelectedPressed },
			Disable = { nextState = controlStateModule.Disabled }
		},
		[controlStateModule.SelectedPressed] = {
			OnSelectionLost = { nextState = controlStateModule.Default },
			OnReleased = { nextState = controlStateModule.Selected },
			Disable = { nextState = controlStateModule.Disabled }
		},
		[controlStateModule.Disabled] = { Enable = { nextState = controlStateModule.Default } }
	})
	p0.stateTable:onStateChange(function(p2, p3) --[[ line: 77 ]]
		-- upvalues: p0 (ref)
		p0:setState({ currentState = p3 })
		
		if p0.props.onStateChanged then
			p0.props.onStateChanged(p2, p3)
		end
	end)
end

controllable.validateProps = tModule.strictInterface({
	controlComponent = tModule.strictInterface({
		component = tModule.union(tModule.callback, tModule.string, tModule.table),
		props = tModule.optional(tModule.table),
		children = tModule.optional(tModule.table)
	}),
	onStateChanged = tModule.callback,
	isDisabled = tModule.optional(tModule.boolean),
	userInteractionEnabled = tModule.optional(tModule.boolean)
})
controllable.defaultProps = { userInteractionEnabled = true, isDisabled = false }

function controllable.render(p4) --[[ line: 115 ]]
	-- upvalues: controlStateModule (ref), cryoModule (ref), roactModule (ref)
	local controlComponent = p4.props.controlComponent
	local userInteractionEnabled = p4.props.userInteractionEnabled
	
	if p4.state.currentState == controlStateModule.Initialize then
		return nil
	end
	local selectable = controlComponent.props and controlComponent.props.Selectable
	
	if selectable == nil then
		selectable = true
	end
	return roactModule.createElement(controlComponent.component, cryoModule.Dictionary.join(p4.props, controlComponent.props or {}, {
		Selectable = selectable,
		Active = not p4.props.isDisabled,
		[roactModule.Event.MouseEnter] = function(...) --[[ line: 131 ]]
			-- upvalues: userInteractionEnabled (ref), p4 (ref), controlComponent (ref), roactModule (copy)
			if not userInteractionEnabled then
				return nil
			end
			p4.stateTable.events.StartHover()
			
			return if controlComponent.props[roactModule.Event.MouseEnter] == nil then nil else controlComponent.props[roactModule.Event.MouseEnter](...)
		end,
		[roactModule.Event.MouseLeave] = function(...) --[[ line: 141 ]]
			-- upvalues: userInteractionEnabled (ref), p4 (ref), controlComponent (ref), roactModule (copy)
			if not userInteractionEnabled then
				return nil
			end
			p4.stateTable.events.EndHover()
			
			return if controlComponent.props[roactModule.Event.MouseLeave] == nil then nil else controlComponent.props[roactModule.Event.MouseLeave](...)
		end,
		[roactModule.Event.InputBegan] = function(...) --[[ line: 151 ]]
			-- upvalues: userInteractionEnabled (ref), p4 (ref), controlComponent (ref), roactModule (copy)
			if not userInteractionEnabled then
				return nil
			end
			local var8 = select(2, ...)
			
			if var8.UserInputType == Enum.UserInputType.MouseButton1 or var8.UserInputType == Enum.UserInputType.Touch or var8.KeyCode == Enum.KeyCode.ButtonA then
				p4.stateTable.events.OnPressed()
			end
			return if controlComponent.props[roactModule.Event.InputBegan] == nil then nil else controlComponent.props[roactModule.Event.InputBegan](...)
		end,
		[roactModule.Event.InputEnded] = function(...) --[[ line: 168 ]]
			-- upvalues: userInteractionEnabled (ref), p4 (ref), controlComponent (ref), roactModule (copy)
			if not userInteractionEnabled then
				return nil
			end
			local var9 = select(2, ...)
			
			if var9.UserInputType == Enum.UserInputType.MouseButton1 then
				p4.stateTable.events.OnReleasedHover()
			elseif var9.UserInputType == Enum.UserInputType.Touch or var9.KeyCode == Enum.KeyCode.ButtonA or var9.UserInputType == Enum.UserInputType.MouseMovement then
				p4.stateTable.events.OnReleased()
			end
			return if controlComponent.props[roactModule.Event.InputEnded] == nil then nil else controlComponent.props[roactModule.Event.InputEnded](...)
		end,
		[roactModule.Event.SelectionGained] = function(...) --[[ line: 187 ]]
			-- upvalues: userInteractionEnabled (ref), p4 (ref), controlComponent (ref), roactModule (copy)
			if not userInteractionEnabled then
				return nil
			end
			p4.stateTable.events.OnSelectionGained()
			
			return if controlComponent.props[roactModule.Event.SelectionGained] == nil then nil else controlComponent.props[roactModule.Event.SelectionGained](...)
		end,
		[roactModule.Event.SelectionLost] = function(...) --[[ line: 197 ]]
			-- upvalues: userInteractionEnabled (ref), p4 (ref), controlComponent (ref), roactModule (copy)
			if not userInteractionEnabled then
				return nil
			end
			p4.stateTable.events.OnSelectionLost()
			
			return if controlComponent.props[roactModule.Event.SelectionLost] == nil then nil else controlComponent.props[roactModule.Event.SelectionLost](...)
		end,
		[roactModule.Event.Activated] = function(...) --[[ line: 207 ]]
			-- upvalues: userInteractionEnabled (ref), controlComponent (ref), roactModule (copy), p4 (ref), controlStateModule (copy)
			return if userInteractionEnabled then if controlComponent.props[roactModule.Event.Activated] and p4.state.currentState ~= controlStateModule.Disabled and p4.isMounted then controlComponent.props[roactModule.Event.Activated](...) else nil else nil
		end,
		[roactModule.Ref] = controlComponent.props.forwardedRef,
		forwardedRef = cryoModule.None,
		userInteractionEnabled = cryoModule.None,
		isDisabled = cryoModule.None,
		onStateChanged = cryoModule.None,
		[roactModule.Children] = cryoModule.None,
		controlComponent = cryoModule.None
	}), controlComponent.children)
end

function controllable.didMount(p5) --[[ line: 233 ]]
	p5.isMounted = true
	p5.setDisabled(p5.props.isDisabled)
end

function controllable.didUpdate(p6, p7) --[[ line: 238 ]]
	if p6.props.isDisabled ~= p7.isDisabled then
		p6.setDisabled(p6.props.isDisabled)
	end
end

function controllable.willUnmount(p8) --[[ line: 244 ]]
	p8.isMounted = false
end

return controllable