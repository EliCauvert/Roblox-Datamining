local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local OtterModule = require(CorePackages.Packages.Otter)
local UseLayoutValuesFunction = require(CorePackages.Workspace.Packages.PlayerList).Common.useLayoutValues
local WithLayoutValuesFunction = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues
local DropDownButtonModule = require(script.Parent.DropDownButton)
local config = { dampingRatio = 1, frequency = 4 }
local config1 = { dampingRatio = 1, frequency = 4 }
local DropDownAnimator = RoactModule.PureComponent:extend("DropDownAnimator")
DropDownAnimator.validateProps = TModule.strictInterface({
	text = TModule.string,
	icon = TModule.union(TModule.string, TModule.table),
	lastButton = TModule.boolean,
	layoutOrder = TModule.integer,
	onActivated = TModule.callback,
	forceShowOptions = TModule.boolean,
	selectedPlayer = TModule.optional(TModule.instanceIsA("Player")),
	onDecline = TModule.optional(TModule.callback),
	onDismiss = TModule.optional(TModule.callback),
	contentVisible = TModule.boolean,
	layoutValues = TModule.optional(TModule.table),
	onAnimationComplete = TModule.optional(TModule.callback),
	forwardRef = TModule.optional(TModule.callback)
})

function DropDownAnimator.init(p1) --[[ Line: 46 ]]
	-- upvalues: RoactModule (copy), OtterModule (copy), config (copy)
	p1.state = {
		lastButtonProps = nil,
		onDeclineCalled = nil,
		onActivatedCalled = nil,
		overlayPercentage = 0
	}
	p1.currentButtonPosition, p1.updateCurrentButtonPosition = RoactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p1.lastButtonPosition, p1.updateLastButtonPosition = RoactModule.createBinding(UDim2.new(0, 0, 0, 0))
	p1.positionMotor = OtterModule.createSingleMotor(0)
	p1.positionMotor:onStep(function(XScale: number) --[[ Line: 58 ]]
		-- upvalues: p1 (copy)
		p1.updateCurrentButtonPosition(UDim2.new(XScale, 0, 0, 0))
		
		if p1.animatingRight then
			p1.updateLastButtonPosition(UDim2.new(XScale + 1, 0, 0, 0))
			
			return
		else
			p1.updateLastButtonPosition(UDim2.new(XScale - 1, 0, 0, 0))
		end
	end)
	p1.positionMotor:onComplete(function(p2) --[[ Line: 66 ]]
		-- upvalues: p1 (copy), RoactModule (upval)
		if p2 == 0 then
			p1:setState({
				lastButtonProps = RoactModule.None,
				onDeclineCalled = RoactModule.None,
				onActivatedCalled = RoactModule.None
			})
		end
	end)
	p1.overlayMotor = OtterModule.createSingleMotor(0)
	p1.overlayMotor:onStep(function(OverlayPercentage) --[[ Line: 77 ]]
		-- upvalues: p1 (copy)
		p1:setState({ overlayPercentage = OverlayPercentage })
	end)
	p1.overlayMotor:onComplete(function(p2) --[[ Line: 82 ]]
		-- upvalues: p1 (copy), OtterModule (upval), config (upval)
		if p2 == 1 then
			p1.positionMotor:setGoal(OtterModule.spring(0, config))
		end
	end)
end

function DropDownAnimator.getButtonProps(p1, LastButtonProps, p2) --[[ Line: 89 ]]
	local config = {
		text = LastButtonProps.text,
		icon = LastButtonProps.icon,
		lastButton = LastButtonProps.lastButton,
		forceShowOptions = LastButtonProps.forceShowOptions,
		onDismiss = LastButtonProps.onDismiss
	}
	
	if p1.state.lastButtonProps == nil then
		if LastButtonProps.onActivated and (LastButtonProps.onDecline or p1.props.forceShowOptions) then
			function config.onActivated() --[[ Line: 106 ]]
				-- upvalues: p1 (copy), LastButtonProps (copy)
				p1:setState({ onActivatedCalled = true, onDeclineCalled = false })
				LastButtonProps.onActivated()
			end
		elseif LastButtonProps.onActivated then
			config.onActivated = LastButtonProps.onActivated
		end
		if LastButtonProps.onDecline then
			function config.onDecline() --[[ Line: 117 ]]
				-- upvalues: p1 (copy), LastButtonProps (copy)
				p1:setState({ onActivatedCalled = false, onDeclineCalled = true })
				LastButtonProps.onDecline()
			end
		end
	elseif p2 then
		config.animatingAccept = p1.state.onActivatedCalled
		config.animatingDecline = p1.state.onDeclineCalled
		config.animatingPercentage = p1.state.overlayPercentage
		
		return config
	end
	return config
end

function DropDownAnimator.render(p1) --[[ Line: 130 ]]
	-- upvalues: WithLayoutValuesFunction (copy), RoactModule (copy), DropDownButtonModule (copy)
	return WithLayoutValuesFunction(function(_) --[[ Line: 131 ]]
		-- upvalues: p1 (copy), RoactModule (upval), DropDownButtonModule (upval)
		local LayoutValues = p1.props.layoutValues
		local config = {
			CurrentButtonContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = p1.currentButtonPosition
			}, {
				DropDownButton = RoactModule.createElement(DropDownButtonModule, p1:getButtonProps(p1.props))
			})
		}
		
		if p1.state.lastButtonProps then
			config.LastButtonContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = p1.lastButtonPosition
			}, {
				DropDownButton = RoactModule.createElement(DropDownButtonModule, p1:getButtonProps(p1.state.lastButtonProps, true))
			})
		end
		return RoactModule.createElement("Frame", {
			Visible = p1.props.contentVisible,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, LayoutValues.DropDownButtonSizeY),
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			[RoactModule.Ref] = p1.props.forwardRef
		}, config)
	end)
end

function DropDownAnimator.didUpdate(p1, LastButtonProps, p2) --[[ Line: 167 ]]
	-- upvalues: OtterModule (copy), config1 (copy), RoactModule (copy)
	local HasOnDecline = LastButtonProps.onDecline ~= nil or p1.props.forceShowOptions
	local OnDeclineCalled = p1.state.onDeclineCalled or p1.state.onActivatedCalled
	local HasLastButtonProps: boolean = p1.state.lastButtonProps == nil and p2.lastButtonProps ~= nil
	
	if p1.props.text ~= LastButtonProps.text and HasOnDecline and OnDeclineCalled then
		if p1.state.onActivatedCalled and not p1.props.forceShowOptions then
			p1.animatingRight = true
			p1.positionMotor:setGoal(OtterModule.instant(-1))
		else
			p1.animatingRight = false
			p1.positionMotor:setGoal(OtterModule.instant(1))
		end
		p1.overlayMotor:setGoal(OtterModule.instant(0))
		p1.positionMotor:step(0)
		p1.overlayMotor:step(0)
		p1:setState({ lastButtonProps = LastButtonProps })
		p1.overlayMotor:setGoal(OtterModule.spring(1, config1))
	end
	if HasLastButtonProps and p1.props.onAnimationComplete then
		p1.props.onAnimationComplete()
	end
	if p1.props.selectedPlayer ~= LastButtonProps.selectedPlayer then
		p1.positionMotor:setGoal(OtterModule.instant(0))
		p1.overlayMotor:setGoal(OtterModule.instant(0))
		p1.positionMotor:step(0)
		p1.overlayMotor:step(0)
		p1:setState({ lastButtonProps = RoactModule.None })
	end
end

function DropDownAnimator.willUnmount(p1) --[[ Line: 209 ]]
	p1.positionMotor:destroy()
	p1.positionMotor = nil
	p1.overlayMotor:destroy()
	p1.overlayMotor = nil
end

return function(p1) --[[ Line: 216 ]]
	-- upvalues: UseLayoutValuesFunction (copy), RoactModule (copy), DropDownAnimator (copy), CryoModule (copy)
	return RoactModule.createElement(DropDownAnimator, CryoModule.Dictionary.join(p1, { layoutValues = UseLayoutValuesFunction() }))
end