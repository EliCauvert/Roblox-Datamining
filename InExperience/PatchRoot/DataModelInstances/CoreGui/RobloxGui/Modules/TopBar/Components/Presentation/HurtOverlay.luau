local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local starterGuiService = game:GetService("StarterGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local signalsModule = require(corePackagesService.Packages.Signals)
local otterModule = require(corePackagesService.Packages.Otter)
local cachedPolicyServiceModule = require(corePackagesService.Workspace.Packages.CachedPolicyService)
local _ = coreGuiService:WaitForChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Common")
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagTopBarSignalizeHealthBar = coreGuiCommonModule.Flags.FFlagTopBarSignalizeHealthBar
local fFlagUseNewHurtOverlayImage = coreGuiCommonModule.Flags.FFlagUseNewHurtOverlayImage
local fFlagUseNewHurtOverlayAnimation = coreGuiCommonModule.Flags.FFlagUseNewHurtOverlayAnimation
local t = { frequency = 0.75, dampingRatio = 1 }
local color = Color3.fromRGB(187, 0, 4)
local color3 = Color3.new(1, 1, 1)
local hurtOverlay = roactModule.PureComponent:extend("HurtOverlay")
hurtOverlay.validateProps = tModule.strictInterface(if fFlagTopBarSignalizeHealthBar then {} else {
	healthEnabled = tModule.boolean,
	health = tModule.number,
	maxHealth = tModule.number,
	isDead = tModule.boolean
})

function hurtOverlay.init(p1)
	-- upvalues: roactModule (ref), fFlagUseNewHurtOverlayAnimation (ref), fFlagTopBarSignalizeHealthBar (ref), constantsModule (ref), otterModule (ref), t (ref), coreGuiCommonModule (ref), signalsModule (ref), starterGuiService (ref)
	local var1, var2 = roactModule.createBinding(0)
	p1.animationBinding = var1
	p1.animationBindingUpdate = var2
	
	if not fFlagUseNewHurtOverlayAnimation then
		p1.positionBinding = p1.animationBinding:map(function(p2)
			return UDim2.new(-10 * p2, 0, -10 * p2, 0)
		end)
		p1.sizeBinding = p1.animationBinding:map(function(p2)
			return UDim2.new(1 + 19 * p2, 0, 1 + 19 * p2, 0)
		end)
	end
	if fFlagTopBarSignalizeHealthBar then
		local var3, var4 = roactModule.createBinding(false)
		p1.isAnimating = var3
		p1.setIsAnimating = var4
		local var5, var6 = roactModule.createBinding(constantsModule.InitialHealth)
		p1.health = var5
		p1.setHealth = var6
		local var7, var8 = roactModule.createBinding(constantsModule.InitialHealth)
		p1.maxHealth = var7
		p1.setMaxHealth = var8
		local var9, var10 = roactModule.createBinding(false)
		p1.isDead = var9
		p1.setIsDead = var10
		p1.prevHealth = p1.health:getValue()
		p1.prevIsDead = p1.isDead:getValue()
		p1.showHurtOverlay = roactModule.joinBindings({ p1.isAnimating, p1.health, p1.maxHealth, p1.isDead }):map(function(p2)
			-- upvalues: p1 (ref), constantsModule (copy), fFlagUseNewHurtOverlayAnimation (copy), otterModule (copy), t (copy)
			local var11 = p2[1]
			local var12 = p2[2]
			local var13 = p2[3]
			local var14 = p2[4]
			local prevHealth = p1.prevHealth
			local prevIsDead = p1.prevIsDead
			p1.prevHealth = var12
			p1.prevIsDead = var14
			
			if var12 >= prevHealth or var14 and prevIsDead or constantsModule.HealthPercentForOverlay > (prevHealth - var12) / var13 then
				return var11
			elseif fFlagUseNewHurtOverlayAnimation then
				p1.setIsAnimating(true)
				p1.motor:setGoal(otterModule.ease(0, { duration = 0.1 }))
				p1.motor:start()
			else
				p1.motor:setGoal(otterModule.instant(0))
				p1.motor:step(0)
				p1.motor:setGoal(otterModule.spring(1, t))
				p1.motor:start()
				p1.setIsAnimating(true)
			end
			return true
		end)
		
		if coreGuiCommonModule.Stores.GetLocalHumanoidStore then
			p1.localHumanoidStore = coreGuiCommonModule.Stores.GetLocalHumanoidStore(false)
			p1.disposeHealthConnection = signalsModule.createEffect(function(p2)
				-- upvalues: p1 (ref), constantsModule (copy)
				local healthValue = p1.localHumanoidStore.getHealthValue(p2)
				p1.setHealth(healthValue.health or constantsModule.InitialHealth)
				p1.setMaxHealth(healthValue.maxHealth or constantsModule.InitialHealth)
				p1.setIsDead(healthValue.isDead)
			end)
		end
	else
		p1.state = { isAnimating = false }
	end
	p1.motor = otterModule.createSingleMotor(if fFlagUseNewHurtOverlayAnimation then 1 else 0)
	p1.motor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.animationBindingUpdate(p2)
	end)
	p1.motor:onComplete(if fFlagUseNewHurtOverlayAnimation then function(p2)
		-- upvalues: p1 (ref), otterModule (copy), fFlagTopBarSignalizeHealthBar (copy)
		if p2 == 0 then
			p1.motor:setGoal(otterModule.ease(1, { duration = 0.5 }))
			p1.motor:start()
			
			return
		elseif p2 == 1 then
			if fFlagTopBarSignalizeHealthBar then
				p1.setIsAnimating(false)
				
				return
			end
			p1:setState({ isAnimating = false })
		end
	end else function()
		-- upvalues: fFlagTopBarSignalizeHealthBar (copy), p1 (ref)
		if fFlagTopBarSignalizeHealthBar then
			p1.setIsAnimating(false)
			
			return
		end
		p1:setState({ isAnimating = false })
	end)
	
	if fFlagTopBarSignalizeHealthBar then
		local function _()
			-- upvalues: starterGuiService (copy)
			return starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		end
		
		p1.coreGuiChangedSignalConn = starterGuiService.CoreGuiChangedSignal:Connect(function(p2, p3)
			-- upvalues: p1 (ref)
			if p2 == Enum.CoreGuiType.Health or p2 == Enum.CoreGuiType.All then
				p1:setState({ mountHurtOverlay = p3 })
			end
		end)
		p1:setState({
			mountHurtOverlay = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		})
	end
end

function hurtOverlay.renderOverlay(p1)
	-- upvalues: fFlagTopBarSignalizeHealthBar (ref), fFlagUseNewHurtOverlayImage (ref), color (ref), cachedPolicyServiceModule (ref), color3 (ref), roactModule (ref), fFlagUseNewHurtOverlayAnimation (ref)
	local var1 = nil
	
	if not fFlagTopBarSignalizeHealthBar then
		var1 = p1.props.healthEnabled and p1.state.isAnimating
	end
	return roactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Visible = if fFlagTopBarSignalizeHealthBar then p1.showHurtOverlay else var1,
		Image = if fFlagUseNewHurtOverlayImage then "rbxasset://textures/ui/TopBar/HurtOverlayAsset.png" else "rbxasset://textures/ui/TopBar/WhiteOverlayAsset.png",
		ImageColor3 = if cachedPolicyServiceModule:IsSubjectToChinaPolicies() then color3 else color,
		ImageTransparency = if fFlagUseNewHurtOverlayAnimation then p1.animationBinding else nil,
		Size = if fFlagUseNewHurtOverlayAnimation then UDim2.fromScale(1, 1) else p1.sizeBinding,
		AnchorPoint = if fFlagUseNewHurtOverlayAnimation then Vector2.new(0.5, 0.5) else nil,
		Position = if fFlagUseNewHurtOverlayAnimation then UDim2.fromScale(0.5, 0.5) else p1.positionBinding
	})
end

function hurtOverlay.render(p1)
	-- upvalues: fFlagTopBarSignalizeHealthBar (ref)
	return if fFlagTopBarSignalizeHealthBar then if p1.state.mountHurtOverlay then p1:renderOverlay() else nil else p1:renderOverlay()
end

function hurtOverlay.didUpdate(p1, p2, _)
	-- upvalues: fFlagTopBarSignalizeHealthBar (ref), constantsModule (ref), otterModule (ref), t (ref)
	if fFlagTopBarSignalizeHealthBar then return end
	if p1.props.health < p2.health and (not p1.props.isDead or not p2.isDead) and constantsModule.HealthPercentForOverlay <= (p2.health - p1.props.health) / p1.props.maxHealth then
		p1.motor:setGoal(otterModule.instant(0))
		p1.motor:step(0)
		p1.motor:setGoal(otterModule.spring(1, t))
		p1.motor:start()
		p1:setState({ isAnimating = true })
	end
end

if fFlagTopBarSignalizeHealthBar then
	function hurtOverlay.onUnmount(p1)
		p1.coreGuiChangedSignalConn:Disconnect()
		p1.disposeHealthConnection()
	end
end
return if fFlagTopBarSignalizeHealthBar then hurtOverlay else roactRoduxModule.UNSTABLE_connect2(function(p1)
	return {
		health = p1.health.currentHealth,
		maxHealth = p1.health.maxHealth,
		isDead = p1.health.isDead,
		healthEnabled = p1.coreGuiEnabled[Enum.CoreGuiType.Health]
	}
end, nil)(hurtOverlay)