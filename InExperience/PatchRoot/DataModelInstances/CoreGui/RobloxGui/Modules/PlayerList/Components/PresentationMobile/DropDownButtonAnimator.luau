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

function dropDownAnimator.init(p0)
	-- upvalues: roactModule (ref), otterModule (ref), t (ref)
	p0.state = {
		lastButtonProps = nil,
		onDeclineCalled = nil,
		onActivatedCalled = nil,
		overlayPercentage = 0
	}
	local var9, var10 = roactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p0.currentButtonPosition = var9
	p0.updateCurrentButtonPosition = var10
	local var11, var12 = roactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p0.lastButtonPosition = var11
	p0.updateLastButtonPosition = var12
	p0.positionMotor = otterModule.createSingleMotor(0)
	p0.positionMotor:onStep(function(p1)
		-- upvalues: p0 (ref)
		p0.updateCurrentButtonPosition(UDim2.new(p1, 0, 0, 0))
		
		if p0.animatingRight then
			p0.updateLastButtonPosition(UDim2.new(p1 + 1, 0, 0, 0))
			
			return
		end
		p0.updateLastButtonPosition(UDim2.new(p1 - 1, 0, 0, 0))
	end)
	p0.positionMotor:onComplete(function(p2)
		-- upvalues: p0 (ref), roactModule (copy)
		if p2 == 0 then
			p0:setState({
				lastButtonProps = roactModule.None,
				onDeclineCalled = roactModule.None,
				onActivatedCalled = roactModule.None
			})
		end
	end)
	p0.overlayMotor = otterModule.createSingleMotor(0)
	p0.overlayMotor:onStep(function(p3)
		-- upvalues: p0 (ref)
		p0:setState({ overlayPercentage = p3 })
	end)
	p0.overlayMotor:onComplete(function(p4)
		-- upvalues: p0 (ref), otterModule (copy), t (copy)
		if p4 == 1 then
			p0.positionMotor:setGoal(otterModule.spring(0, t))
		end
	end)
end

function dropDownAnimator.getButtonProps(p5, p6, p7)
	local t = {
		text = p6.text,
		icon = p6.icon,
		lastButton = p6.lastButton,
		forceShowOptions = p6.forceShowOptions,
		onDismiss = p6.onDismiss
	}
	
	if p5.state.lastButtonProps ~= nil then
		if p7 then
			t.animatingAccept = p5.state.onActivatedCalled
			t.animatingDecline = p5.state.onDeclineCalled
			t.animatingPercentage = p5.state.overlayPercentage
			
			return t
		end
	elseif p6.onActivated and (p6.onDecline or p5.props.forceShowOptions) then
		function t.onActivated()
			-- upvalues: p5 (ref), p6 (ref)
			p5:setState({ onActivatedCalled = true, onDeclineCalled = false })
			p6.onActivated()
		end
	elseif p6.onActivated then
		t.onActivated = p6.onActivated
	end
	if p6.onDecline then
		function t.onDecline()
			-- upvalues: p5 (ref), p6 (ref)
			p5:setState({ onActivatedCalled = false, onDeclineCalled = true })
			p6.onDecline()
		end
	end
	return t
end

function dropDownAnimator.render(p8)
	-- upvalues: withLayoutValues (ref), roactModule (ref), dropDownButtonModule (ref)
	return withLayoutValues(function(_)
		-- upvalues: p8 (ref), roactModule (copy), dropDownButtonModule (copy)
		layoutValues = p8.props.layoutValues
		local t = {
			CurrentButtonContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = p8.currentButtonPosition
			}, {
				DropDownButton = roactModule.createElement(dropDownButtonModule, p8:getButtonProps(p8.props))
			})
		}
		
		if p8.state.lastButtonProps then
			t.LastButtonContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = p8.lastButtonPosition
			}, {
				DropDownButton = roactModule.createElement(dropDownButtonModule, p8:getButtonProps(p8.state.lastButtonProps, true))
			})
		end
		return roactModule.createElement("Frame", {
			Visible = p8.props.contentVisible,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, layoutValues.DropDownButtonSizeY),
			BackgroundTransparency = 1,
			LayoutOrder = p8.props.layoutOrder,
			[roactModule.Ref] = p8.props.forwardRef
		}, t)
	end)
end

function dropDownAnimator.didUpdate(p9, p10, p11)
	-- upvalues: otterModule (ref), t_1 (ref), roactModule (ref)
	local var15 = p9.state.lastButtonProps == nil and p11.lastButtonProps ~= nil
	
	if p9.props.text ~= p10.text and (if p10.onDecline == nil then p9.props.forceShowOptions else true) and (p9.state.onDeclineCalled or p9.state.onActivatedCalled) then
		if p9.state.onActivatedCalled and not p9.props.forceShowOptions then
			p9.animatingRight = true
			p9.positionMotor:setGoal(otterModule.instant(-1))
		else
			p9.animatingRight = false
			p9.positionMotor:setGoal(otterModule.instant(1))
		end
		p9.overlayMotor:setGoal(otterModule.instant(0))
		p9.positionMotor:step(0)
		p9.overlayMotor:step(0)
		p9:setState({ lastButtonProps = p10 })
		p9.overlayMotor:setGoal(otterModule.spring(1, t_1))
	end
	if var15 and p9.props.onAnimationComplete then
		p9.props.onAnimationComplete()
	end
	if p9.props.selectedPlayer ~= p10.selectedPlayer then
		p9.positionMotor:setGoal(otterModule.instant(0))
		p9.overlayMotor:setGoal(otterModule.instant(0))
		p9.positionMotor:step(0)
		p9.overlayMotor:step(0)
		p9:setState({ lastButtonProps = roactModule.None })
	end
end

function dropDownAnimator.willUnmount(p12)
	p12.positionMotor:destroy()
	p12.positionMotor = nil
	p12.overlayMotor:destroy()
	p12.overlayMotor = nil
end

return function(p13)
	-- upvalues: useLayoutValues (ref), roactModule (ref), dropDownAnimator (ref), cryoModule (ref)
	return roactModule.createElement(dropDownAnimator, cryoModule.Dictionary.join(p13, { layoutValues = useLayoutValues() }))
end