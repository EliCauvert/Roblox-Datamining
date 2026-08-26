local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local cryoModule = require(parent_2.Cryo)
local tModule = require(parent_2.t)
local controlStateModule = require(parent.Enum.ControlState)
local stateTableModule = require(parent_1.StateTable.StateTable)
local controllable = roactModule.PureComponent:extend("Controllable")

function controllable.init(p1)
	-- upvalues: controlStateModule (ref), stateTableModule (ref)
	p1.isMounted = false
	local initialize = controlStateModule.Initialize
	p1.state = { currentState = initialize }
	local formattedText = string.format("Controllable(%s)", tostring(p1))
	
	function p0.setDisabled(p2)
		-- upvalues: p1 (ref)
		if p2 then
			p1.stateTable.events.Disable()
			
			return
		end
		p1.stateTable.events.Enable()
	end
	
	p1.stateTable = stateTableModule.new(formattedText, initialize, {}, {
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
	p1.stateTable:onStateChange(function(p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({ currentState = p3 })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, p3)
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

function controllable.render(p1)
	-- upvalues: controlStateModule (ref), cryoModule (ref), roactModule (ref)
	local controlComponent = p1.props.controlComponent
	local userInteractionEnabled = p1.props.userInteractionEnabled
	
	if p1.state.currentState == controlStateModule.Initialize then
		return nil
	end
	local selectable = controlComponent.props and controlComponent.props.Selectable
	
	if selectable == nil then
		selectable = true
	end
	return roactModule.createElement(controlComponent.component, cryoModule.Dictionary.join(p1.props, controlComponent.props or {}, {
		Selectable = selectable,
		Active = not p1.props.isDisabled,
		[roactModule.Event.MouseEnter] = function(...)
			-- upvalues: userInteractionEnabled (ref), p1 (ref), controlComponent (ref), roactModule (copy)
			if not userInteractionEnabled then
				return nil
			end
			p1.stateTable.events.StartHover()
			
			return if controlComponent.props[roactModule.Event.MouseEnter] == nil then nil else controlComponent.props[roactModule.Event.MouseEnter](...)
		end,
		[roactModule.Event.MouseLeave] = function(...)
			-- upvalues: userInteractionEnabled (ref), p1 (ref), controlComponent (ref), roactModule (copy)
			if not userInteractionEnabled then
				return nil
			end
			p1.stateTable.events.EndHover()
			
			return if controlComponent.props[roactModule.Event.MouseLeave] == nil then nil else controlComponent.props[roactModule.Event.MouseLeave](...)
		end,
		[roactModule.Event.InputBegan] = function(...)
			-- upvalues: userInteractionEnabled (ref), p1 (ref), controlComponent (ref), roactModule (copy)
			if not userInteractionEnabled then
				return nil
			end
			local var1 = select(2, ...)
			
			if var1.UserInputType == Enum.UserInputType.MouseButton1 or var1.UserInputType == Enum.UserInputType.Touch or var1.KeyCode == Enum.KeyCode.ButtonA then
				p1.stateTable.events.OnPressed()
			end
			return if controlComponent.props[roactModule.Event.InputBegan] == nil then nil else controlComponent.props[roactModule.Event.InputBegan](...)
		end,
		[roactModule.Event.InputEnded] = function(...)
			-- upvalues: userInteractionEnabled (ref), p1 (ref), controlComponent (ref), roactModule (copy)
			if not userInteractionEnabled then
				return nil
			end
			local var1 = select(2, ...)
			
			if var1.UserInputType == Enum.UserInputType.MouseButton1 then
				p1.stateTable.events.OnReleasedHover()
			elseif var1.UserInputType == Enum.UserInputType.Touch or var1.KeyCode == Enum.KeyCode.ButtonA or var1.UserInputType == Enum.UserInputType.MouseMovement then
				p1.stateTable.events.OnReleased()
			end
			return if controlComponent.props[roactModule.Event.InputEnded] == nil then nil else controlComponent.props[roactModule.Event.InputEnded](...)
		end,
		[roactModule.Event.SelectionGained] = function(...)
			-- upvalues: userInteractionEnabled (ref), p1 (ref), controlComponent (ref), roactModule (copy)
			if not userInteractionEnabled then
				return nil
			end
			p1.stateTable.events.OnSelectionGained()
			
			return if controlComponent.props[roactModule.Event.SelectionGained] == nil then nil else controlComponent.props[roactModule.Event.SelectionGained](...)
		end,
		[roactModule.Event.SelectionLost] = function(...)
			-- upvalues: userInteractionEnabled (ref), p1 (ref), controlComponent (ref), roactModule (copy)
			if not userInteractionEnabled then
				return nil
			end
			p1.stateTable.events.OnSelectionLost()
			
			return if controlComponent.props[roactModule.Event.SelectionLost] == nil then nil else controlComponent.props[roactModule.Event.SelectionLost](...)
		end,
		[roactModule.Event.Activated] = function(...)
			-- upvalues: userInteractionEnabled (ref), controlComponent (ref), roactModule (copy), p1 (ref), controlStateModule (copy)
			return if userInteractionEnabled then if controlComponent.props[roactModule.Event.Activated] and p1.state.currentState ~= controlStateModule.Disabled and p1.isMounted then controlComponent.props[roactModule.Event.Activated](...) else nil else nil
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

function controllable.didMount(p1)
	p1.isMounted = true
	p1.setDisabled(p1.props.isDisabled)
end

function controllable.didUpdate(p1, p2)
	if p1.props.isDisabled ~= p2.isDisabled then
		p1.setDisabled(p1.props.isDisabled)
	end
end

function controllable.willUnmount(p1)
	p1.isMounted = false
end

return controllable