local CorePackages = game:GetService("CorePackages")
local StarterGui = game:GetService("StarterGui")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local SignalsModule = require(CorePackages.Packages.Signals)
local OtterModule = require(CorePackages.Packages.Otter)
local CachedPolicyServiceModule = require(CorePackages.Workspace.Packages.CachedPolicyService)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Common")
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FFlagTopBarSignalizeHealthBar = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeHealthBar
local FFlagUseNewHurtOverlayImage = CoreGuiCommonModule.Flags.FFlagUseNewHurtOverlayImage
local FFlagUseNewHurtOverlayAnimation = CoreGuiCommonModule.Flags.FFlagUseNewHurtOverlayAnimation
local config = { frequency = 0.75, dampingRatio = 1 }
local _Color3 = Color3.fromRGB(187, 0, 4)
local _Color3_1 = Color3.new(1, 1, 1)
local HurtOverlay = RoactModule.PureComponent:extend("HurtOverlay")
HurtOverlay.validateProps = TModule.strictInterface(if FFlagTopBarSignalizeHealthBar then {} else {
	healthEnabled = TModule.boolean,
	health = TModule.number,
	maxHealth = TModule.number,
	isDead = TModule.boolean
})

function HurtOverlay.init(p1)
	-- upvalues: RoactModule (copy), FFlagUseNewHurtOverlayAnimation (copy), FFlagTopBarSignalizeHealthBar (copy), ConstantsModule (copy), OtterModule (copy), config (copy), CoreGuiCommonModule (copy), SignalsModule (copy), StarterGui (copy)
	p1.animationBinding, p1.animationBindingUpdate = RoactModule.createBinding(0)
	
	if not FFlagUseNewHurtOverlayAnimation then
		p1.positionBinding = p1.animationBinding:map(function(p2: number): UDim2
			return UDim2.new(-10 * p2, 0, -10 * p2, 0)
		end)
		p1.sizeBinding = p1.animationBinding:map(function(p2: number): UDim2
			return UDim2.new(1 + 19 * p2, 0, 1 + 19 * p2, 0)
		end)
	end
	if FFlagTopBarSignalizeHealthBar then
		p1.isAnimating, p1.setIsAnimating = RoactModule.createBinding(false)
		p1.health, p1.setHealth = RoactModule.createBinding(ConstantsModule.InitialHealth)
		p1.maxHealth, p1.setMaxHealth = RoactModule.createBinding(ConstantsModule.InitialHealth)
		p1.isDead, p1.setIsDead = RoactModule.createBinding(false)
		p1.prevHealth = p1.health:getValue()
		p1.prevIsDead = p1.isDead:getValue()
		p1.showHurtOverlay = RoactModule.joinBindings({ p1.isAnimating, p1.health, p1.maxHealth, p1.isDead }):map(function(Entry)
			-- upvalues: p1 (copy), ConstantsModule (upval), FFlagUseNewHurtOverlayAnimation (upval), OtterModule (upval), config (upval)
			local Entry1 = Entry[1]
			local Entry2 = Entry[2]
			local Entry3 = Entry[3]
			local Entry4 = Entry[4]
			local PrevHealth = p1.prevHealth
			local PrevIsDead = p1.prevIsDead
			p1.prevHealth = Entry2
			p1.prevIsDead = Entry4
			
			if Entry2 >= PrevHealth or Entry4 and PrevIsDead or ConstantsModule.HealthPercentForOverlay > (PrevHealth - Entry2) / Entry3 then
				return Entry1
			end
			if FFlagUseNewHurtOverlayAnimation then
				p1.setIsAnimating(true)
				p1.motor:setGoal(OtterModule.ease(0, { duration = 0.1 }))
				p1.motor:start()
			else
				p1.motor:setGoal(OtterModule.instant(0))
				p1.motor:step(0)
				p1.motor:setGoal(OtterModule.spring(1, config))
				p1.motor:start()
				p1.setIsAnimating(true)
			end
			return true
		end)
		
		if CoreGuiCommonModule.Stores.GetLocalHumanoidStore then
			p1.localHumanoidStore = CoreGuiCommonModule.Stores.GetLocalHumanoidStore(false)
			p1.disposeHealthConnection = SignalsModule.createEffect(function(p2)
				-- upvalues: p1 (copy), ConstantsModule (upval)
				local HealthValue = p1.localHumanoidStore.getHealthValue(p2)
				p1.setHealth(HealthValue.health or ConstantsModule.InitialHealth)
				p1.setMaxHealth(HealthValue.maxHealth or ConstantsModule.InitialHealth)
				p1.setIsDead(HealthValue.isDead)
			end)
		end
	else
		p1.state = { isAnimating = false }
	end
	p1.motor = OtterModule.createSingleMotor(if FFlagUseNewHurtOverlayAnimation then 1 else 0)
	p1.motor:onStep(function(p2)
		-- upvalues: p1 (copy)
		p1.animationBindingUpdate(p2)
	end)
	p1.motor:onComplete(if FFlagUseNewHurtOverlayAnimation then function(p2)
		-- upvalues: p1 (copy), OtterModule (upval), FFlagTopBarSignalizeHealthBar (upval)
		if p2 == 0 then
			p1.motor:setGoal(OtterModule.ease(1, { duration = 0.5 }))
			p1.motor:start()
			
			return
		end
		if p2 == 1 then
			if FFlagTopBarSignalizeHealthBar then
				p1.setIsAnimating(false)
				
				return
			end
			p1:setState({ isAnimating = false })
		end
	end else function()
		-- upvalues: FFlagTopBarSignalizeHealthBar (upval), p1 (copy)
		if FFlagTopBarSignalizeHealthBar then
			p1.setIsAnimating(false)
			
			return
		else
			p1:setState({ isAnimating = false })
		end
	end)
	
	if FFlagTopBarSignalizeHealthBar then
		local function _()
			-- upvalues: StarterGui (upval)
			return StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		end
		
		p1.coreGuiChangedSignalConn = StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, MountHurtOverlay)
			-- upvalues: p1 (copy)
			if CoreGuiType == Enum.CoreGuiType.Health or CoreGuiType == Enum.CoreGuiType.All then
				p1:setState({ mountHurtOverlay = MountHurtOverlay })
			end
		end)
		p1:setState({
			mountHurtOverlay = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		})
	end
end

function HurtOverlay.renderOverlay(p1)
	-- upvalues: FFlagTopBarSignalizeHealthBar (copy), FFlagUseNewHurtOverlayImage (copy), _Color3 (copy), CachedPolicyServiceModule (copy), _Color3_1 (copy), RoactModule (copy), FFlagUseNewHurtOverlayAnimation (copy)
	local IsAnimating = if FFlagTopBarSignalizeHealthBar then nil else p1.props.healthEnabled and p1.state.isAnimating
	
	return RoactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Visible = if FFlagTopBarSignalizeHealthBar then p1.showHurtOverlay else IsAnimating,
		Image = if FFlagUseNewHurtOverlayImage then "rbxasset://textures/ui/TopBar/HurtOverlayAsset.png" else "rbxasset://textures/ui/TopBar/WhiteOverlayAsset.png",
		ImageColor3 = if CachedPolicyServiceModule:IsSubjectToChinaPolicies() then _Color3_1 else _Color3,
		ImageTransparency = if FFlagUseNewHurtOverlayAnimation then p1.animationBinding else nil,
		Size = if FFlagUseNewHurtOverlayAnimation then UDim2.fromScale(1, 1) else p1.sizeBinding,
		AnchorPoint = if FFlagUseNewHurtOverlayAnimation then Vector2.new(0.5, 0.5) else nil,
		Position = if FFlagUseNewHurtOverlayAnimation then UDim2.fromScale(0.5, 0.5) else p1.positionBinding
	})
end

function HurtOverlay.render(p1)
	-- upvalues: FFlagTopBarSignalizeHealthBar (copy)
	return if FFlagTopBarSignalizeHealthBar then if p1.state.mountHurtOverlay then p1:renderOverlay() else nil else p1:renderOverlay()
end

function HurtOverlay.didUpdate(p1, p2, _)
	-- upvalues: FFlagTopBarSignalizeHealthBar (copy), ConstantsModule (copy), OtterModule (copy), config (copy)
	if FFlagTopBarSignalizeHealthBar then return end
	if p1.props.health < p2.health and (not p1.props.isDead or not p2.isDead) and ConstantsModule.HealthPercentForOverlay <= (p2.health - p1.props.health) / p1.props.maxHealth then
		p1.motor:setGoal(OtterModule.instant(0))
		p1.motor:step(0)
		p1.motor:setGoal(OtterModule.spring(1, config))
		p1.motor:start()
		p1:setState({ isAnimating = true })
	end
end

if FFlagTopBarSignalizeHealthBar then
	function HurtOverlay.onUnmount(p1)
		p1.coreGuiChangedSignalConn:Disconnect()
		p1.disposeHealthConnection()
	end
end
local function mapStateToProps(p1)
	return {
		health = p1.health.currentHealth,
		maxHealth = p1.health.maxHealth,
		isDead = p1.health.isDead,
		healthEnabled = p1.coreGuiEnabled[Enum.CoreGuiType.Health]
	}
end

return if FFlagTopBarSignalizeHealthBar then HurtOverlay else RoactRoduxModule.UNSTABLE_connect2(mapStateToProps, nil)(HurtOverlay)