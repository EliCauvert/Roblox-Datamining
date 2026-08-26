local corePackagesService = game:GetService("CorePackages")
local starterGuiService = game:GetService("StarterGui")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = game:GetService("Workspace")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local tenFootInterfaceModule = require(robloxGui.Modules.TenFootInterface)
local setKeepOutAreaModule = require(parent.Actions.SetKeepOutArea)
local removeKeepOutAreaModule = require(parent.Actions.RemoveKeepOutArea)
local _ = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagTopBarSignalizeHealthBar = coreGuiCommonModule.Flags.FFlagTopBarSignalizeHealthBar
local fFlagTopBarSignalizeKeepOutAreas = coreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local fFlagTopBarSignalizeScreenSize = coreGuiCommonModule.Flags.FFlagTopBarSignalizeScreenSize
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local _ = if enabled() then require(parent.Parent.Chrome.Service) else nil
local var1 = enabled()
local var2 = if var1 then UDim2.new(0, 125, 0, 20) else UDim2.new(0, 80, 0, 6)
local uDim2 = UDim2.new(0, 50, 0, 16)
local uDim2_1 = UDim2.new(0, 80, 0, 20)
local uDim2_2 = UDim2.new(0, 220, 0, 16)
local healthBar = roactModule.PureComponent:extend("HealthBar")
healthBar.validateProps = tModule.strictInterface({
	layoutOrder = tModule.optional(tModule.integer),
	screenSize = if fFlagTopBarSignalizeScreenSize then nil else tModule.Vector2,
	healthEnabled = if fFlagTopBarSignalizeHealthBar then nil else tModule.boolean,
	health = if fFlagTopBarSignalizeHealthBar then nil else tModule.number,
	maxHealth = if fFlagTopBarSignalizeHealthBar then nil else tModule.number,
	setKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else tModule.callback,
	removeKeepOutArea = if fFlagTopBarSignalizeKeepOutAreas then nil else tModule.callback
})

local function _(p1)
	return Vector3.new(p1.r, p1.g, p1.b)
end

local t = {}
local healthRedColor = constantsModule.HealthRedColor
t[Vector3.new(healthRedColor.r, healthRedColor.g, healthRedColor.b)] = 0.1
local healthYellowColor = constantsModule.HealthYellowColor
t[Vector3.new(healthYellowColor.r, healthYellowColor.g, healthYellowColor.b)] = 0.5
local healthGreenColor = constantsModule.HealthGreenColor
t[Vector3.new(healthGreenColor.r, healthGreenColor.g, healthGreenColor.b)] = 0.8
local healthRedColor_1 = constantsModule.HealthRedColor
local healthGreenColor_1 = constantsModule.HealthGreenColor

local function getHealthBarColor(p1)
	-- upvalues: healthRedColor_1 (ref), healthGreenColor_1 (ref), t (ref)
	if p1 <= 0.1 then
		return healthRedColor_1
	elseif p1 >= 0.8 then
		return healthGreenColor_1
	end
	local var3 = Vector3.new(0, 0, 0)
	local var4 = 0
	
	for i, v in pairs(t) do
		local var5 = p1 - v
		
		if var5 ~= 0 then
			local var6 = 1 / (var5 * var5)
			var3 += var6 * i
			var4 += var6
			continue
		end
		return Color3.new(i.x, i.y, i.z)
	end
	local var7 = var3 / var4
	
	return Color3.new(var7.x, var7.y, var7.z)
end

function healthBar.init(p2)
	-- upvalues: roactModule (ref), fFlagTopBarSignalizeHealthBar (ref), constantsModule (ref), coreGuiCommonModule (ref), signalsModule (ref), starterGuiService (ref), fFlagTopBarSignalizeKeepOutAreas (ref), fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), tenFootInterfaceModule (ref), uDim2_2 (ref), var1 (ref), uDim2 (ref), uDim2_1 (ref), var2 (write)
	p2.rootRef = roactModule.createRef()
	
	if fFlagTopBarSignalizeHealthBar then
		local var8, var9 = roactModule.createBinding(constantsModule.InitialHealth)
		p2.health = var8
		p2.setHealth = var9
		local var10, var11 = roactModule.createBinding(constantsModule.InitialHealth)
		p2.maxHealth = var10
		p2.setMaxHealth = var11
		local var12, var13 = roactModule.createBinding(false)
		p2.isDead = var12
		p2.setIsDead = var13
		p2.healthPercent = roactModule.joinBindings({ p2.health, p2.maxHealth, p2.isDead }):map(function(p3)
			local var14 = p3[1]
			local var15 = p3[2]
			local var16 = 1
			
			if p3[3] then
				var16 = 0
				
				return var16
			elseif var15 > 0 then
				var16 = math.clamp(var14 / var15, 0, 1)
			end
			return var16
		end)
		p2.healthVisible = roactModule.joinBindings({ p2.health, p2.maxHealth }):map(function(p3)
			return p3[1] < p3[2]
		end)
		
		if coreGuiCommonModule.Stores.GetLocalHumanoidStore then
			p2.localHumanoidStore = coreGuiCommonModule.Stores.GetLocalHumanoidStore(false)
			p2.disposeHealthConnection = signalsModule.createEffect(function(p3)
				-- upvalues: p2 (ref), constantsModule (copy)
				local healthValue = p2.localHumanoidStore.getHealthValue(p3)
				p2.setHealth(healthValue.health or constantsModule.InitialHealth)
				p2.setMaxHealth(healthValue.maxHealth or constantsModule.InitialHealth)
				p2.setIsDead(healthValue.isDead)
			end)
		end
		local function _()
			-- upvalues: starterGuiService (copy)
			return starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		end
		
		p2.coreGuiChangedSignalConn = starterGuiService.CoreGuiChangedSignal:Connect(function(p3, p4)
			-- upvalues: p2 (ref)
			if p3 == Enum.CoreGuiType.Health or p3 == Enum.CoreGuiType.All then
				p2:setState({ mountHealthBar = p4 })
			end
		end)
		p2:setState({
			mountHealthBar = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		})
	end
	if fFlagTopBarSignalizeKeepOutAreas then
		p2.keepOutAreasStore = coreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		local var14, var15 = roactModule.createBinding(getViewportSize(false))
		p2.screenSizeBinding = var14
		p2.setScreenSizeBinding = var15
		p2.disposeScreenSize = signalsModule.createEffect(function(p3)
			-- upvalues: p2 (ref), getViewportSize (ref)
			p2.setScreenSizeBinding(getViewportSize(p3))
		end)
		p2.healthbarSizeBinding = p2.screenSizeBinding:map(function(p3)
			-- upvalues: tenFootInterfaceModule (copy), uDim2_2 (copy), var1 (copy), uDim2 (copy), uDim2_1 (copy), var2 (copy)
			return if tenFootInterfaceModule:IsEnabled() then uDim2_2 elseif var1 and p3.X <= 320 then uDim2 elseif var1 and p3.X <= 393 then uDim2_1 else var2
		end)
	end
end

function healthBar.onUnmount(p2)
	-- upvalues: fFlagTopBarSignalizeHealthBar (ref), fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeHealthBar then
		p2.coreGuiChangedSignalConn:Disconnect()
		p2.disposeHealthConnection()
	end
	if fFlagTopBarSignalizeScreenSize then
		p2.disposeScreenSize()
	end
end

function healthBar.renderHealth(p2)
	-- upvalues: fFlagTopBarSignalizeHealthBar (ref), fFlagTopBarSignalizeScreenSize (ref), var1 (ref), uDim2 (ref), uDim2_1 (ref), var2 (write), tenFootInterfaceModule (ref), uDim2_2 (ref), fFlagTopBarSignalizeKeepOutAreas (ref), constantsModule (ref), getHealthBarColor (ref), roactModule (ref), enabled (ref)
	local var8 = nil
	
	if not fFlagTopBarSignalizeHealthBar then
		var8 = p2.props.healthEnabled and p2.props.health < p2.props.maxHealth
	end
	local var9 = 1
	
	if not fFlagTopBarSignalizeHealthBar then
		if p2.props.isDead then
			var9 = 0
		elseif p2.props.maxHealth > 0 then
			var9 = math.clamp(p2.props.health / p2.props.maxHealth, 0, 1)
		end
	end
	local var10, var11, rect
	local var12 = if not fFlagTopBarSignalizeScreenSize then if var1 then if tenFootInterfaceModule:IsEnabled() then uDim2_2 elseif p2.props.screenSize.X <= 320 then uDim2 elseif p2.props.screenSize.X <= 393 then uDim2_1 else var2 elseif tenFootInterfaceModule:IsEnabled() then uDim2_2 else var2 else nil
	local var13 = if tenFootInterfaceModule:IsEnabled() then 0 else 4
	local _ = nil
	local _ = nil
	local _ = nil
	
	if var1 then
		var10 = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png"
		var11 = "rbxasset://textures/ui/TopBar/HealthBarTV.png"
		rect = Rect.new(8, 8, 9, 9)
	else
		var10 = "rbxasset://textures/ui/TopBar/HealthBarBase.png"
		var11 = "rbxasset://textures/ui/TopBar/HealthBar.png"
		rect = Rect.new(3, 3, 4, 4)
		
		if tenFootInterfaceModule:IsEnabled() then
			var10 = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png"
			var11 = "rbxasset://textures/ui/TopBar/HealthBarTV.png"
			rect = Rect.new(8, 8, 9, 9)
		end
	end
	local var14 = function(p3)
		-- upvalues: var1 (copy), fFlagTopBarSignalizeHealthBar (copy), p2 (ref), var8 (write), fFlagTopBarSignalizeKeepOutAreas (copy), constantsModule (copy)
		if not var1 then
			if (fFlagTopBarSignalizeHealthBar and p2.healthVisible or not fFlagTopBarSignalizeHealthBar and var8) and p3 then
				if fFlagTopBarSignalizeKeepOutAreas then
					p2.keepOutAreasStore.setKeepOutArea(constantsModule.HealthBarKeepOutAreaId, p3.AbsolutePosition, p3.AbsoluteSize)
					
					return
				end
				p2.props.setKeepOutArea(constantsModule.HealthBarKeepOutAreaId, p3.AbsolutePosition, p3.AbsoluteSize)
				
				return
			elseif fFlagTopBarSignalizeKeepOutAreas then
				p2.keepOutAreasStore.removeKeepOutArea(constantsModule.HealthBarKeepOutAreaId)
				
				return
			end
			p2.props.removeKeepOutArea(constantsModule.HealthBarKeepOutAreaId)
		end
	end
	
	if p2.rootRef.current then
		var14(p2.rootRef.current)
	end
	return roactModule.createElement("Frame", {
		AnchorPoint = if var1 then Vector2.new(1, 0) else nil,
		Position = if var1 then UDim2.new(1, 0, 0, 0) else nil,
		Visible = if fFlagTopBarSignalizeHealthBar then p2.healthVisible else var8,
		BackgroundTransparency = 1,
		Size = if fFlagTopBarSignalizeScreenSize then p2.healthbarSizeBinding:map(function(p3)
			return UDim2.new(p3.X, UDim.new(1, 0))
		end) else UDim2.new(var12.X, UDim.new(1, 0)),
		LayoutOrder = p2.props.layoutOrder,
		[roactModule.Change.AbsoluteSize] = var14,
		[roactModule.Change.AbsolutePosition] = var14,
		[roactModule.Ref] = p2.rootRef
	}, {
		Padding = not enabled and roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var13) }) or nil,
		HealthBar = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = var10,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = rect,
			Size = if fFlagTopBarSignalizeScreenSize then p2.healthbarSizeBinding else var12,
			Position = UDim2.fromScale(0, 0.5),
			AnchorPoint = Vector2.new(0, 0.5)
		}, {
			Fill = roactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = var11,
				ImageColor3 = if fFlagTopBarSignalizeHealthBar then p2.healthPercent:map(getHealthBarColor) else getHealthBarColor(var9),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = rect,
				Size = if fFlagTopBarSignalizeHealthBar then p2.healthPercent:map(function(p3)
					return UDim2.fromScale(p3, 1)
				end) else UDim2.fromScale(var9, 1)
			})
		})
	})
end

function healthBar.render(p2)
	-- upvalues: fFlagTopBarSignalizeHealthBar (ref)
	return if fFlagTopBarSignalizeHealthBar then if p2.state.mountHealthBar then p2:renderHealth() else nil else p2:renderHealth()
end

return roactRoduxModule.UNSTABLE_connect2(function(p2)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), fFlagTopBarSignalizeHealthBar (ref)
	return {
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p2.displayOptions.screenSize,
		health = if fFlagTopBarSignalizeHealthBar then nil else p2.health.currentHealth,
		maxHealth = if fFlagTopBarSignalizeHealthBar then nil else p2.health.maxHealth,
		healthEnabled = if fFlagTopBarSignalizeHealthBar then nil else p2.coreGuiEnabled[Enum.CoreGuiType.Health]
	}
end, if fFlagTopBarSignalizeKeepOutAreas then nil else function(p2)
	-- upvalues: fFlagTopBarSignalizeKeepOutAreas (ref), setKeepOutAreaModule (ref), removeKeepOutAreaModule (ref)
	return if fFlagTopBarSignalizeKeepOutAreas then {} else {
		setKeepOutArea = function(value, p3, p4)
			-- upvalues: p2 (ref), setKeepOutAreaModule (copy)
			return p2(setKeepOutAreaModule(value, p3, p4))
		end,
		removeKeepOutArea = function(p3)
			-- upvalues: p2 (ref), removeKeepOutAreaModule (copy)
			return p2(removeKeepOutAreaModule(p3))
		end
	}
end)(healthBar)