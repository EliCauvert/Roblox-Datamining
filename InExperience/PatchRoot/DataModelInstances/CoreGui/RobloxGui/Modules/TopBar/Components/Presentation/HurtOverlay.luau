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

function hurtOverlay.init(p0) --[[ line: 46 ]]
	-- upvalues: roactModule (ref), fFlagUseNewHurtOverlayAnimation (ref), fFlagTopBarSignalizeHealthBar (ref), constantsModule (ref), otterModule (ref), t (ref), coreGuiCommonModule (ref), signalsModule (ref), starterGuiService (ref)
	local var15, var16 = roactModule.createBinding(0)
	p0.animationBinding = var15
	p0.animationBindingUpdate = var16
	
	if not fFlagUseNewHurtOverlayAnimation then
		p0.positionBinding = p0.animationBinding:map(function(p1) --[[ line: 51 ]]
			return UDim2.new(-10 * p1, 0, -10 * p1, 0)
		end)
		p0.sizeBinding = p0.animationBinding:map(function(p2) --[[ line: 54 ]]
			return UDim2.new(1 + 19 * p2, 0, 1 + 19 * p2, 0)
		end)
	end
	if fFlagTopBarSignalizeHealthBar then
		local var17, var18 = roactModule.createBinding(false)
		p0.isAnimating = var17
		p0.setIsAnimating = var18
		local var19, var20 = roactModule.createBinding(constantsModule.InitialHealth)
		p0.health = var19
		p0.setHealth = var20
		local var21, var22 = roactModule.createBinding(constantsModule.InitialHealth)
		p0.maxHealth = var21
		p0.setMaxHealth = var22
		local var23, var24 = roactModule.createBinding(false)
		p0.isDead = var23
		p0.setIsDead = var24
		p0.prevHealth = p0.health:getValue()
		p0.prevIsDead = p0.isDead:getValue()
		p0.showHurtOverlay = roactModule.joinBindings({ p0.isAnimating, p0.health, p0.maxHealth, p0.isDead }):map(function(p3) --[[ line: 67 ]]
			-- upvalues: p0 (ref), constantsModule (copy), fFlagUseNewHurtOverlayAnimation (copy), otterModule (copy), t (copy)
			local var25 = p3[1]
			local var26 = p3[2]
			local var27 = p3[3]
			local var28 = p3[4]
			local prevHealth = p0.prevHealth
			local prevIsDead = p0.prevIsDead
			p0.prevHealth = var26
			p0.prevIsDead = var28
			
			if var26 >= prevHealth or var28 and prevIsDead or constantsModule.HealthPercentForOverlay > (prevHealth - var26) / var27 then
				return var25
			elseif fFlagUseNewHurtOverlayAnimation then
				p0.setIsAnimating(true)
				p0.motor:setGoal(otterModule.ease(0, { duration = 0.1 }))
				p0.motor:start()
			else
				p0.motor:setGoal(otterModule.instant(0))
				p0.motor:step(0)
				p0.motor:setGoal(otterModule.spring(1, t))
				p0.motor:start()
				p0.setIsAnimating(true)
			end
			return true
		end)
		
		if coreGuiCommonModule.Stores.GetLocalHumanoidStore then
			p0.localHumanoidStore = coreGuiCommonModule.Stores.GetLocalHumanoidStore(false)
			p0.disposeHealthConnection = signalsModule.createEffect(function(p4) --[[ line: 104 ]]
				-- upvalues: p0 (ref), constantsModule (copy)
				local healthValue = p0.localHumanoidStore.getHealthValue(p4)
				p0.setHealth(healthValue.health or constantsModule.InitialHealth)
				p0.setMaxHealth(healthValue.maxHealth or constantsModule.InitialHealth)
				p0.setIsDead(healthValue.isDead)
			end)
		end
	else
		p0.state = { isAnimating = false }
	end
	p0.motor = otterModule.createSingleMotor(if fFlagUseNewHurtOverlayAnimation then 1 else 0)
	p0.motor:onStep(function(p5) --[[ line: 119 ]]
		-- upvalues: p0 (ref)
		p0.animationBindingUpdate(p5)
	end)
	p0.motor:onComplete(if fFlagUseNewHurtOverlayAnimation then function(p6) --[[ line: 123 ]]
		-- upvalues: p0 (ref), otterModule (copy), fFlagTopBarSignalizeHealthBar (copy)
		if p6 == 0 then
			p0.motor:setGoal(otterModule.ease(1, { duration = 0.5 }))
			p0.motor:start()
			
			return
		elseif p6 == 1 then
			if fFlagTopBarSignalizeHealthBar then
				p0.setIsAnimating(false)
				
				return
			end
			p0:setState({ isAnimating = false })
		end
	end else function() --[[ line: 138 ]]
		-- upvalues: fFlagTopBarSignalizeHealthBar (copy), p0 (ref)
		if fFlagTopBarSignalizeHealthBar then
			p0.setIsAnimating(false)
			
			return
		end
		p0:setState({ isAnimating = false })
	end)
	
	if fFlagTopBarSignalizeHealthBar then
		local function _() --[[ line: 149 | named "getHealthEnabled" ]]
			-- upvalues: starterGuiService (copy)
			return starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		end
		
		p0.coreGuiChangedSignalConn = starterGuiService.CoreGuiChangedSignal:Connect(function(p7, p8) --[[ line: 154 ]]
			-- upvalues: p0 (ref)
			if p7 == Enum.CoreGuiType.Health or p7 == Enum.CoreGuiType.All then
				p0:setState({ mountHurtOverlay = p8 })
			end
		end)
		p0:setState({
			mountHurtOverlay = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		})
	end
end

function hurtOverlay.renderOverlay(p9) --[[ line: 168 ]]
	-- upvalues: fFlagTopBarSignalizeHealthBar (ref), fFlagUseNewHurtOverlayImage (ref), color (ref), cachedPolicyServiceModule (ref), color3 (ref), roactModule (ref), fFlagUseNewHurtOverlayAnimation (ref)
	local var30 = nil
	
	if not fFlagTopBarSignalizeHealthBar then
		var30 = p9.props.healthEnabled and p9.state.isAnimating
	end
	return roactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Visible = if fFlagTopBarSignalizeHealthBar then p9.showHurtOverlay else var30,
		Image = if fFlagUseNewHurtOverlayImage then "rbxasset://textures/ui/TopBar/HurtOverlayAsset.png" else "rbxasset://textures/ui/TopBar/WhiteOverlayAsset.png",
		ImageColor3 = if cachedPolicyServiceModule:IsSubjectToChinaPolicies() then color3 else color,
		ImageTransparency = if fFlagUseNewHurtOverlayAnimation then p9.animationBinding else nil,
		Size = if fFlagUseNewHurtOverlayAnimation then UDim2.fromScale(1, 1) else p9.sizeBinding,
		AnchorPoint = if fFlagUseNewHurtOverlayAnimation then Vector2.new(0.5, 0.5) else nil,
		Position = if fFlagUseNewHurtOverlayAnimation then UDim2.fromScale(0.5, 0.5) else p9.positionBinding
	})
end

function hurtOverlay.render(p10) --[[ line: 194 ]]
	-- upvalues: fFlagTopBarSignalizeHealthBar (ref)
	return if fFlagTopBarSignalizeHealthBar then if p10.state.mountHurtOverlay then p10:renderOverlay() else nil else p10:renderOverlay()
end

function hurtOverlay.didUpdate(p11, p12, _) --[[ line: 202 ]]
	-- upvalues: fFlagTopBarSignalizeHealthBar (ref), constantsModule (ref), otterModule (ref), t (ref)
	if fFlagTopBarSignalizeHealthBar then return end
	if p11.props.health < p12.health and (not p11.props.isDead or not p12.isDead) and constantsModule.HealthPercentForOverlay <= (p12.health - p11.props.health) / p11.props.maxHealth then
		p11.motor:setGoal(otterModule.instant(0))
		p11.motor:step(0)
		p11.motor:setGoal(otterModule.spring(1, t))
		p11.motor:start()
		p11:setState({ isAnimating = true })
	end
end

if fFlagTopBarSignalizeHealthBar then
	function hurtOverlay.onUnmount(p13) --[[ line: 224 ]]
		p13.coreGuiChangedSignalConn:Disconnect()
		p13.disposeHealthConnection()
	end
end
return if fFlagTopBarSignalizeHealthBar then hurtOverlay else roactRoduxModule.UNSTABLE_connect2(function(p14) --[[ line: 230 | named "mapStateToProps" ]]
	return {
		health = p14.health.currentHealth,
		maxHealth = p14.health.maxHealth,
		isDead = p14.health.isDead,
		healthEnabled = p14.coreGuiEnabled[Enum.CoreGuiType.Health]
	}
end, nil)(hurtOverlay)