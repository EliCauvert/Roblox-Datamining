local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local otterModule = require(corePackagesService.Packages.Otter)
local useLayoutValues = require(corePackagesService.Workspace.Packages.PlayerList).Common.useLayoutValues
local withLayoutValues = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues
local dropDownButtonModule = require(script.Parent.DropDownButton)
local t = { dampingRatio = 1, frequency = 4 }
local t_1 = { dampingRatio = 1, frequency = 4 }
local dropDownAnimator = roactModule.PureComponent:extend("DropDownAnimator")
dropDownAnimator.validateProps = tModule.strictInterface({
	text = tModule.string,
	icon = tModule.union(tModule.string, tModule.table),
	lastButton = tModule.boolean,
	layoutOrder = tModule.integer,
	onActivated = tModule.callback,
	forceShowOptions = tModule.boolean,
	selectedPlayer = tModule.optional(tModule.instanceIsA("Player")),
	onDecline = tModule.optional(tModule.callback),
	onDismiss = tModule.optional(tModule.callback),
	contentVisible = tModule.boolean,
	layoutValues = tModule.optional(tModule.table),
	onAnimationComplete = tModule.optional(tModule.callback),
	forwardRef = tModule.optional(tModule.callback)
})

function dropDownAnimator.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref), t (ref)
	p1.state = {
		lastButtonProps = nil,
		onDeclineCalled = nil,
		onActivatedCalled = nil,
		overlayPercentage = 0
	}
	local var1, var2 = roactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p1.currentButtonPosition = var1
	p1.updateCurrentButtonPosition = var2
	local var3, var4 = roactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p1.lastButtonPosition = var3
	p1.updateLastButtonPosition = var4
	p1.positionMotor = otterModule.createSingleMotor(0)
	p1.positionMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.updateCurrentButtonPosition(UDim2.new(p2, 0, 0, 0))
		
		if p1.animatingRight then
			p1.updateLastButtonPosition(UDim2.new(p2 + 1, 0, 0, 0))
			
			return
		end
		p1.updateLastButtonPosition(UDim2.new(p2 - 1, 0, 0, 0))
	end)
	p1.positionMotor:onComplete(function(p2)
		-- upvalues: p1 (ref), roactModule (copy)
		if p2 == 0 then
			p1:setState({
				lastButtonProps = roactModule.None,
				onDeclineCalled = roactModule.None,
				onActivatedCalled = roactModule.None
			})
		end
	end)
	p1.overlayMotor = otterModule.createSingleMotor(0)
	p1.overlayMotor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1:setState({ overlayPercentage = p2 })
	end)
	p1.overlayMotor:onComplete(function(p2)
		-- upvalues: p1 (ref), otterModule (copy), t (copy)
		if p2 == 1 then
			p1.positionMotor:setGoal(otterModule.spring(0, t))
		end
	end)
end

function dropDownAnimator.getButtonProps(p1, p2, p3)
	local t = {
		text = p2.text,
		icon = p2.icon,
		lastButton = p2.lastButton,
		forceShowOptions = p2.forceShowOptions,
		onDismiss = p2.onDismiss
	}
	
	if p1.state.lastButtonProps ~= nil then
		if p3 then
			t.animatingAccept = p1.state.onActivatedCalled
			t.animatingDecline = p1.state.onDeclineCalled
			t.animatingPercentage = p1.state.overlayPercentage
			
			return t
		end
	elseif p2.onActivated and (p2.onDecline or p1.props.forceShowOptions) then
		function t.onActivated()
			-- upvalues: p1 (ref), p2 (ref)
			p1:setState({ onActivatedCalled = true, onDeclineCalled = false })
			p2.onActivated()
		end
	elseif p2.onActivated then
		t.onActivated = p2.onActivated
	end
	if p2.onDecline then
		function t.onDecline()
			-- upvalues: p1 (ref), p2 (ref)
			p1:setState({ onActivatedCalled = false, onDeclineCalled = true })
			p2.onDecline()
		end
	end
	return t
end

function dropDownAnimator.render(p1)
	-- upvalues: withLayoutValues (ref), roactModule (ref), dropDownButtonModule (ref)
	return withLayoutValues(function(_)
		-- upvalues: p1 (ref), roactModule (copy), dropDownButtonModule (copy)
		layoutValues = p1.props.layoutValues
		local t = {
			CurrentButtonContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = p1.currentButtonPosition
			}, {
				DropDownButton = roactModule.createElement(dropDownButtonModule, p1:getButtonProps(p1.props))
			})
		}
		
		if p1.state.lastButtonProps then
			t.LastButtonContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = p1.lastButtonPosition
			}, {
				DropDownButton = roactModule.createElement(dropDownButtonModule, p1:getButtonProps(p1.state.lastButtonProps, true))
			})
		end
		return roactModule.createElement("Frame", {
			Visible = p1.props.contentVisible,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, layoutValues.DropDownButtonSizeY),
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			[roactModule.Ref] = p1.props.forwardRef
		}, t)
	end)
end

function dropDownAnimator.didUpdate(p1, p2, p3)
	-- upvalues: otterModule (ref), t_1 (ref), roactModule (ref)
	local var1 = p1.state.lastButtonProps == nil and p3.lastButtonProps ~= nil
	
	if p1.props.text ~= p2.text and (if p2.onDecline == nil then p1.props.forceShowOptions else true) and (p1.state.onDeclineCalled or p1.state.onActivatedCalled) then
		if p1.state.onActivatedCalled and not p1.props.forceShowOptions then
			p1.animatingRight = true
			p1.positionMotor:setGoal(otterModule.instant(-1))
		else
			p1.animatingRight = false
			p1.positionMotor:setGoal(otterModule.instant(1))
		end
		p1.overlayMotor:setGoal(otterModule.instant(0))
		p1.positionMotor:step(0)
		p1.overlayMotor:step(0)
		p1:setState({ lastButtonProps = p2 })
		p1.overlayMotor:setGoal(otterModule.spring(1, t_1))
	end
	if var1 and p1.props.onAnimationComplete then
		p1.props.onAnimationComplete()
	end
	if p1.props.selectedPlayer ~= p2.selectedPlayer then
		p1.positionMotor:setGoal(otterModule.instant(0))
		p1.overlayMotor:setGoal(otterModule.instant(0))
		p1.positionMotor:step(0)
		p1.overlayMotor:step(0)
		p1:setState({ lastButtonProps = roactModule.None })
	end
end

function dropDownAnimator.willUnmount(p1)
	p1.positionMotor:destroy()
	p1.positionMotor = nil
	p1.overlayMotor:destroy()
	p1.overlayMotor = nil
end

return function(p1)
	-- upvalues: useLayoutValues (ref), roactModule (ref), dropDownAnimator (ref), cryoModule (ref)
	return roactModule.createElement(dropDownAnimator, cryoModule.Dictionary.join(p1, { layoutValues = useLayoutValues() }))
end