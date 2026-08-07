local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local otterModule = require(corePackagesService.Packages.Otter)
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
	onDismiss = tModule.optional(tModule.callback)
})

function dropDownAnimator.init(p0) --[[ line: 38 ]]
	-- upvalues: roactModule (ref), otterModule (ref), t (ref)
	p0.state = {
		lastButtonProps = nil,
		onDeclineCalled = nil,
		onActivatedCalled = nil,
		overlayPercentage = 0
	}
	local var8, var9 = roactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p0.currentButtonPosition = var8
	p0.updateCurrentButtonPosition = var9
	local var10, var11 = roactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p0.lastButtonPosition = var10
	p0.updateLastButtonPosition = var11
	p0.positionMotor = otterModule.createSingleMotor(0)
	p0.positionMotor:onStep(function(p1) --[[ line: 50 ]]
		-- upvalues: p0 (ref)
		p0.updateCurrentButtonPosition(UDim2.new(p1, 0, 0, 0))
		
		if p0.animatingRight then
			p0.updateLastButtonPosition(UDim2.new(p1 + 1, 0, 0, 0))
			
			return
		end
		p0.updateLastButtonPosition(UDim2.new(p1 - 1, 0, 0, 0))
	end)
	p0.positionMotor:onComplete(function(p2) --[[ line: 58 ]]
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
	p0.overlayMotor:onStep(function(p3) --[[ line: 69 ]]
		-- upvalues: p0 (ref)
		p0:setState({ overlayPercentage = p3 })
	end)
	p0.overlayMotor:onComplete(function(p4) --[[ line: 74 ]]
		-- upvalues: p0 (ref), otterModule (copy), t (copy)
		if p4 == 1 then
			p0.positionMotor:setGoal(otterModule.spring(0, t))
		end
	end)
end

function dropDownAnimator.getButtonProps(p5, p6, p7) --[[ line: 81 ]]
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
		function t.onActivated() --[[ line: 98 ]]
			-- upvalues: p5 (ref), p6 (ref)
			p5:setState({ onActivatedCalled = true, onDeclineCalled = false })
			p6.onActivated()
		end
	elseif p6.onActivated then
		t.onActivated = p6.onActivated
	end
	if p6.onDecline then
		function t.onDecline() --[[ line: 109 ]]
			-- upvalues: p5 (ref), p6 (ref)
			p5:setState({ onActivatedCalled = false, onDeclineCalled = true })
			p6.onDecline()
		end
	end
	return t
end

function dropDownAnimator.render(p8) --[[ line: 122 ]]
	-- upvalues: withLayoutValues (ref), roactModule (ref), dropDownButtonModule (ref)
	return withLayoutValues(function(p9) --[[ line: 123 ]]
		-- upvalues: roactModule (copy), p8 (ref), dropDownButtonModule (copy)
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
			ZIndex = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, p9.DropDownButtonSizeY),
			LayoutOrder = p8.props.layoutOrder
		}, t)
	end)
end

function dropDownAnimator.didUpdate(p10, p11, _) --[[ line: 156 ]]
	-- upvalues: otterModule (ref), t_1 (ref), roactModule (ref)
	if p10.props.text ~= p11.text and (if p11.onDecline == nil then p10.props.forceShowOptions else true) and (p10.state.onDeclineCalled or p10.state.onActivatedCalled) then
		if p10.state.onActivatedCalled and not p10.props.forceShowOptions then
			p10.animatingRight = true
			p10.positionMotor:setGoal(otterModule.instant(-1))
		else
			p10.animatingRight = false
			p10.positionMotor:setGoal(otterModule.instant(1))
		end
		p10.overlayMotor:setGoal(otterModule.instant(0))
		p10.positionMotor:step(0)
		p10.overlayMotor:step(0)
		p10:setState({ lastButtonProps = p11 })
		p10.overlayMotor:setGoal(otterModule.spring(1, t_1))
	end
	if p10.props.selectedPlayer ~= p11.selectedPlayer then
		p10.positionMotor:setGoal(otterModule.instant(0))
		p10.overlayMotor:setGoal(otterModule.instant(0))
		p10.positionMotor:step(0)
		p10.overlayMotor:step(0)
		p10:setState({ lastButtonProps = roactModule.None })
	end
end

function dropDownAnimator.willUnmount(p12) --[[ line: 191 ]]
	p12.positionMotor:destroy()
	p12.positionMotor = nil
	p12.overlayMotor:destroy()
	p12.overlayMotor = nil
end

return dropDownAnimator