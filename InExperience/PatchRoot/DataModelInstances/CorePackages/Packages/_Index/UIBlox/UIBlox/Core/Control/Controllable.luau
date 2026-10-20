local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local CryoModule = require(Parent2.Cryo)
local TModule = require(Parent2.t)
local ControlStateModule = require(Parent.Enum.ControlState)
local StateTableModule = require(Parent1.StateTable.StateTable)
local Controllable = RoactModule.PureComponent:extend("Controllable")

function Controllable.init(p1)
	-- upvalues: ControlStateModule (copy), StateTableModule (copy)
	p1.isMounted = false
	local Initialize = ControlStateModule.Initialize
	p1.state = { currentState = Initialize }
	local Formatted = string.format("Controllable(%s)", (tostring(p1)))
	
	function p1.setDisabled(IsDisabled)
		-- upvalues: p1 (copy)
		if IsDisabled then
			p1.stateTable.events.Disable()
			
			return
		else
			p1.stateTable.events.Enable()
		end
	end
	
	p1.stateTable = StateTableModule.new(Formatted, Initialize, {}, {
		[ControlStateModule.Initialize] = {
			Enable = { nextState = ControlStateModule.Default },
			Disable = { nextState = ControlStateModule.Disabled }
		},
		[ControlStateModule.Default] = {
			OnPressed = { nextState = ControlStateModule.Pressed },
			StartHover = { nextState = ControlStateModule.Hover },
			OnSelectionGained = { nextState = ControlStateModule.Selected },
			Disable = { nextState = ControlStateModule.Disabled }
		},
		[ControlStateModule.Hover] = {
			OnSelectionGained = { nextState = ControlStateModule.Selected },
			OnPressed = { nextState = ControlStateModule.Pressed },
			EndHover = { nextState = ControlStateModule.Default },
			Disable = { nextState = ControlStateModule.Disabled }
		},
		[ControlStateModule.Pressed] = {
			OnSelectionGained = { nextState = ControlStateModule.SelectedPressed },
			OnReleased = { nextState = ControlStateModule.Default },
			OnReleasedHover = { nextState = ControlStateModule.Hover },
			Disable = { nextState = ControlStateModule.Disabled }
		},
		[ControlStateModule.Selected] = {
			OnSelectionLost = { nextState = ControlStateModule.Default },
			OnPressed = { nextState = ControlStateModule.SelectedPressed },
			Disable = { nextState = ControlStateModule.Disabled }
		},
		[ControlStateModule.SelectedPressed] = {
			OnSelectionLost = { nextState = ControlStateModule.Default },
			OnReleased = { nextState = ControlStateModule.Selected },
			Disable = { nextState = ControlStateModule.Disabled }
		},
		[ControlStateModule.Disabled] = { Enable = { nextState = ControlStateModule.Default } }
	})
	p1.stateTable:onStateChange(function(p2, CurrentState)
		-- upvalues: p1 (copy)
		p1:setState({ currentState = CurrentState })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, CurrentState)
		end
	end)
end

Controllable.validateProps = TModule.strictInterface({
	controlComponent = TModule.strictInterface({
		component = TModule.union(TModule.callback, TModule.string, TModule.table),
		props = TModule.optional(TModule.table),
		children = TModule.optional(TModule.table)
	}),
	onStateChanged = TModule.callback,
	isDisabled = TModule.optional(TModule.boolean),
	userInteractionEnabled = TModule.optional(TModule.boolean)
})
Controllable.defaultProps = { userInteractionEnabled = true, isDisabled = false }

function Controllable.render(p1)
	-- upvalues: ControlStateModule (copy), CryoModule (copy), RoactModule (copy)
	local ControlComponent = p1.props.controlComponent
	local UserInteractionEnabled = p1.props.userInteractionEnabled
	
	if p1.state.currentState == ControlStateModule.Initialize then
		return nil
	end
	local Selectable = ControlComponent.props and ControlComponent.props.Selectable
	
	if Selectable == nil then
		Selectable = true
	end
	return RoactModule.createElement(ControlComponent.component, CryoModule.Dictionary.join(p1.props, ControlComponent.props or {}, {
		Selectable = Selectable,
		Active = not p1.props.isDisabled,
		[RoactModule.Event.MouseEnter] = function(...)
			-- upvalues: UserInteractionEnabled (copy), p1 (copy), ControlComponent (copy), RoactModule (upval)
			if UserInteractionEnabled then
				p1.stateTable.events.StartHover()
				
				return if ControlComponent.props[RoactModule.Event.MouseEnter] == nil then nil else ControlComponent.props[RoactModule.Event.MouseEnter](...)
			else
				return nil
			end
		end,
		[RoactModule.Event.MouseLeave] = function(...)
			-- upvalues: UserInteractionEnabled (copy), p1 (copy), ControlComponent (copy), RoactModule (upval)
			if UserInteractionEnabled then
				p1.stateTable.events.EndHover()
				
				return if ControlComponent.props[RoactModule.Event.MouseLeave] == nil then nil else ControlComponent.props[RoactModule.Event.MouseLeave](...)
			else
				return nil
			end
		end,
		[RoactModule.Event.InputBegan] = function(...)
			-- upvalues: UserInteractionEnabled (copy), p1 (copy), ControlComponent (copy), RoactModule (upval)
			if not UserInteractionEnabled then
				return nil
			end
			local Selected = select(2, ...)
			
			if Selected.UserInputType == Enum.UserInputType.MouseButton1 or Selected.UserInputType == Enum.UserInputType.Touch or Selected.KeyCode == Enum.KeyCode.ButtonA then
				p1.stateTable.events.OnPressed()
			end
			return if ControlComponent.props[RoactModule.Event.InputBegan] == nil then nil else ControlComponent.props[RoactModule.Event.InputBegan](...)
		end,
		[RoactModule.Event.InputEnded] = function(...)
			-- upvalues: UserInteractionEnabled (copy), p1 (copy), ControlComponent (copy), RoactModule (upval)
			if not UserInteractionEnabled then
				return nil
			end
			local Selected = select(2, ...)
			
			if Selected.UserInputType == Enum.UserInputType.MouseButton1 then
				p1.stateTable.events.OnReleasedHover()
			elseif Selected.UserInputType == Enum.UserInputType.Touch or Selected.KeyCode == Enum.KeyCode.ButtonA or Selected.UserInputType == Enum.UserInputType.MouseMovement then
				p1.stateTable.events.OnReleased()
			end
			return if ControlComponent.props[RoactModule.Event.InputEnded] == nil then nil else ControlComponent.props[RoactModule.Event.InputEnded](...)
		end,
		[RoactModule.Event.SelectionGained] = function(...)
			-- upvalues: UserInteractionEnabled (copy), p1 (copy), ControlComponent (copy), RoactModule (upval)
			if UserInteractionEnabled then
				p1.stateTable.events.OnSelectionGained()
				
				return if ControlComponent.props[RoactModule.Event.SelectionGained] == nil then nil else ControlComponent.props[RoactModule.Event.SelectionGained](...)
			else
				return nil
			end
		end,
		[RoactModule.Event.SelectionLost] = function(...)
			-- upvalues: UserInteractionEnabled (copy), p1 (copy), ControlComponent (copy), RoactModule (upval)
			if UserInteractionEnabled then
				p1.stateTable.events.OnSelectionLost()
				
				return if ControlComponent.props[RoactModule.Event.SelectionLost] == nil then nil else ControlComponent.props[RoactModule.Event.SelectionLost](...)
			else
				return nil
			end
		end,
		[RoactModule.Event.Activated] = function(...)
			-- upvalues: UserInteractionEnabled (copy), ControlComponent (copy), RoactModule (upval), p1 (copy), ControlStateModule (upval)
			return if UserInteractionEnabled and (ControlComponent.props[RoactModule.Event.Activated] and p1.state.currentState ~= ControlStateModule.Disabled and p1.isMounted) then ControlComponent.props[RoactModule.Event.Activated](...) else nil
		end,
		[RoactModule.Ref] = ControlComponent.props.forwardedRef,
		forwardedRef = CryoModule.None,
		userInteractionEnabled = CryoModule.None,
		isDisabled = CryoModule.None,
		onStateChanged = CryoModule.None,
		[RoactModule.Children] = CryoModule.None,
		controlComponent = CryoModule.None
	}), ControlComponent.children)
end

function Controllable.didMount(p1)
	p1.isMounted = true
	p1.setDisabled(p1.props.isDisabled)
end

function Controllable.didUpdate(p1, p2)
	if p1.props.isDisabled ~= p2.isDisabled then
		p1.setDisabled(p1.props.isDisabled)
	end
end

function Controllable.willUnmount(p1)
	p1.isMounted = false
end

return Controllable