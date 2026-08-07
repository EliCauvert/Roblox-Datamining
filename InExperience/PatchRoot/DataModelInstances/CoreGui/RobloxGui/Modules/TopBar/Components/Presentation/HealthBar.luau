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
local var13 = enabled()
local var14 = if var13 then UDim2.new(0, 125, 0, 20) else UDim2.new(0, 80, 0, 6)
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

local function _(p0) --[[ line: 63 | named "color3ToVector3" ]]
	return Vector3.new(p0.r, p0.g, p0.b)
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

local function getHealthBarColor(p1) --[[ line: 77 ]]
	-- upvalues: healthRedColor_1 (ref), healthGreenColor_1 (ref), t (ref)
	if p1 <= 0.1 then
		return healthRedColor_1
	elseif p1 >= 0.8 then
		return healthGreenColor_1
	end
	local var21 = Vector3.new(0, 0, 0)
	local var22 = 0
	
	for i, v in pairs(t) do
		local var24 = p1 - v
		
		if var24 ~= 0 then
			local var25 = 1 / (var24 * var24)
			var21 += var25 * i
			var22 += var25
			continue
		end
		return Color3.new(i.x, i.y, i.z)
	end
	local var23 = var21 / var22
	
	return Color3.new(var23.x, var23.y, var23.z)
end

function healthBar.init(p2) --[[ line: 102 ]]
	-- upvalues: roactModule (ref), fFlagTopBarSignalizeHealthBar (ref), constantsModule (ref), coreGuiCommonModule (ref), signalsModule (ref), starterGuiService (ref), fFlagTopBarSignalizeKeepOutAreas (ref), fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), tenFootInterfaceModule (ref), uDim2_2 (ref), var13 (ref), uDim2 (ref), uDim2_1 (ref), var14 (write)
	p2.rootRef = roactModule.createRef()
	
	if fFlagTopBarSignalizeHealthBar then
		local var26, var27 = roactModule.createBinding(constantsModule.InitialHealth)
		p2.health = var26
		p2.setHealth = var27
		local var28, var29 = roactModule.createBinding(constantsModule.InitialHealth)
		p2.maxHealth = var28
		p2.setMaxHealth = var29
		local var30, var31 = roactModule.createBinding(false)
		p2.isDead = var30
		p2.setIsDead = var31
		p2.healthPercent = roactModule.joinBindings({ p2.health, p2.maxHealth, p2.isDead }):map(function(p3) --[[ line: 108 ]]
			local var34 = p3[1]
			local var35 = p3[2]
			local var36 = 1
			
			if p3[3] then
				var36 = 0
				
				return var36
			elseif var35 > 0 then
				var36 = math.clamp(var34 / var35, 0, 1)
			end
			return var36
		end)
		p2.healthVisible = roactModule.joinBindings({ p2.health, p2.maxHealth }):map(function(p4) --[[ line: 122 ]]
			return p4[1] < p4[2]
		end)
		
		if coreGuiCommonModule.Stores.GetLocalHumanoidStore then
			p2.localHumanoidStore = coreGuiCommonModule.Stores.GetLocalHumanoidStore(false)
			p2.disposeHealthConnection = signalsModule.createEffect(function(p5) --[[ line: 128 ]]
				-- upvalues: p2 (ref), constantsModule (copy)
				local healthValue = p2.localHumanoidStore.getHealthValue(p5)
				p2.setHealth(healthValue.health or constantsModule.InitialHealth)
				p2.setMaxHealth(healthValue.maxHealth or constantsModule.InitialHealth)
				p2.setIsDead(healthValue.isDead)
			end)
		end
		local function _() --[[ line: 137 | named "getHealthEnabled" ]]
			-- upvalues: starterGuiService (copy)
			return starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		end
		
		p2.coreGuiChangedSignalConn = starterGuiService.CoreGuiChangedSignal:Connect(function(p6, p7) --[[ line: 142 ]]
			-- upvalues: p2 (ref)
			if p6 == Enum.CoreGuiType.Health or p6 == Enum.CoreGuiType.All then
				p2:setState({ mountHealthBar = p7 })
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
		local var32, var33 = roactModule.createBinding(getViewportSize(false))
		p2.screenSizeBinding = var32
		p2.setScreenSizeBinding = var33
		p2.disposeScreenSize = signalsModule.createEffect(function(p8) --[[ line: 162 ]]
			-- upvalues: p2 (ref), getViewportSize (ref)
			p2.setScreenSizeBinding(getViewportSize(p8))
		end)
		p2.healthbarSizeBinding = p2.screenSizeBinding:map(function(p9) --[[ line: 166 ]]
			-- upvalues: tenFootInterfaceModule (copy), uDim2_2 (copy), var13 (copy), uDim2 (copy), uDim2_1 (copy), var14 (copy)
			return if tenFootInterfaceModule:IsEnabled() then uDim2_2 elseif var13 and p9.X <= 320 then uDim2 elseif var13 and p9.X <= 393 then uDim2_1 else var14
		end)
	end
end

function healthBar.onUnmount(p10) --[[ line: 180 ]]
	-- upvalues: fFlagTopBarSignalizeHealthBar (ref), fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeHealthBar then
		p10.coreGuiChangedSignalConn:Disconnect()
		p10.disposeHealthConnection()
	end
	if fFlagTopBarSignalizeScreenSize then
		p10.disposeScreenSize()
	end
end

function healthBar.renderHealth(p11) --[[ line: 189 ]]
	-- upvalues: fFlagTopBarSignalizeHealthBar (ref), fFlagTopBarSignalizeScreenSize (ref), var13 (ref), uDim2 (ref), uDim2_1 (ref), var14 (write), tenFootInterfaceModule (ref), uDim2_2 (ref), fFlagTopBarSignalizeKeepOutAreas (ref), constantsModule (ref), getHealthBarColor (ref), roactModule (ref), enabled (ref)
	local var38 = nil
	
	if not fFlagTopBarSignalizeHealthBar then
		var38 = p11.props.healthEnabled and p11.props.health < p11.props.maxHealth
	end
	local var39 = 1
	
	if not fFlagTopBarSignalizeHealthBar then
		if p11.props.isDead then
			var39 = 0
		elseif p11.props.maxHealth > 0 then
			var39 = math.clamp(p11.props.health / p11.props.maxHealth, 0, 1)
		end
	end
	local var42, var43, rect
	local var40 = if not fFlagTopBarSignalizeScreenSize then if var13 then if tenFootInterfaceModule:IsEnabled() then uDim2_2 elseif p11.props.screenSize.X <= 320 then uDim2 elseif p11.props.screenSize.X <= 393 then uDim2_1 else var14 elseif tenFootInterfaceModule:IsEnabled() then uDim2_2 else var14 else nil
	local var41 = if tenFootInterfaceModule:IsEnabled() then 0 else 4
	local _ = nil
	local _ = nil
	local _ = nil
	
	if var13 then
		var42 = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png"
		var43 = "rbxasset://textures/ui/TopBar/HealthBarTV.png"
		rect = Rect.new(8, 8, 9, 9)
	else
		var42 = "rbxasset://textures/ui/TopBar/HealthBarBase.png"
		var43 = "rbxasset://textures/ui/TopBar/HealthBar.png"
		rect = Rect.new(3, 3, 4, 4)
		
		if tenFootInterfaceModule:IsEnabled() then
			var42 = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png"
			var43 = "rbxasset://textures/ui/TopBar/HealthBarTV.png"
			rect = Rect.new(8, 8, 9, 9)
		end
	end
	local var45 = function(p12) --[[ line: 249 ]]
		-- upvalues: var13 (copy), fFlagTopBarSignalizeHealthBar (copy), p11 (ref), var38 (write), fFlagTopBarSignalizeKeepOutAreas (copy), constantsModule (copy)
		if not var13 then
			if (fFlagTopBarSignalizeHealthBar and p11.healthVisible or not fFlagTopBarSignalizeHealthBar and var38) and p12 then
				if fFlagTopBarSignalizeKeepOutAreas then
					p11.keepOutAreasStore.setKeepOutArea(constantsModule.HealthBarKeepOutAreaId, p12.AbsolutePosition, p12.AbsoluteSize)
					
					return
				end
				p11.props.setKeepOutArea(constantsModule.HealthBarKeepOutAreaId, p12.AbsolutePosition, p12.AbsoluteSize)
				
				return
			elseif fFlagTopBarSignalizeKeepOutAreas then
				p11.keepOutAreasStore.removeKeepOutArea(constantsModule.HealthBarKeepOutAreaId)
				
				return
			end
			p11.props.removeKeepOutArea(constantsModule.HealthBarKeepOutAreaId)
		end
	end
	
	if p11.rootRef.current then
		var45(p11.rootRef.current)
	end
	return roactModule.createElement("Frame", {
		AnchorPoint = if var13 then Vector2.new(1, 0) else nil,
		Position = if var13 then UDim2.new(1, 0, 0, 0) else nil,
		Visible = if fFlagTopBarSignalizeHealthBar then p11.healthVisible else var38,
		BackgroundTransparency = 1,
		Size = if fFlagTopBarSignalizeScreenSize then p11.healthbarSizeBinding:map(function(p13) --[[ line: 277 ]]
			return UDim2.new(p13.X, UDim.new(1, 0))
		end) else UDim2.new(var40.X, UDim.new(1, 0)),
		LayoutOrder = p11.props.layoutOrder,
		[roactModule.Change.AbsoluteSize] = var45,
		[roactModule.Change.AbsolutePosition] = var45,
		[roactModule.Ref] = p11.rootRef
	}, {
		Padding = not enabled and roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var41) }) or nil,
		HealthBar = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = var42,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = rect,
			Size = if fFlagTopBarSignalizeScreenSize then p11.healthbarSizeBinding else var40,
			Position = UDim2.fromScale(0, 0.5),
			AnchorPoint = Vector2.new(0, 0.5)
		}, {
			Fill = roactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = var43,
				ImageColor3 = if fFlagTopBarSignalizeHealthBar then p11.healthPercent:map(getHealthBarColor) else getHealthBarColor(var39),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = rect,
				Size = if fFlagTopBarSignalizeHealthBar then p11.healthPercent:map(function(p14) --[[ line: 305 ]]
					return UDim2.fromScale(p14, 1)
				end) else UDim2.fromScale(var39, 1)
			})
		})
	})
end

function healthBar.render(p15) --[[ line: 313 ]]
	-- upvalues: fFlagTopBarSignalizeHealthBar (ref)
	return if fFlagTopBarSignalizeHealthBar then if p15.state.mountHealthBar then p15:renderHealth() else nil else p15:renderHealth()
end

return roactRoduxModule.UNSTABLE_connect2(function(p16) --[[ line: 321 | named "mapStateToProps" ]]
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), fFlagTopBarSignalizeHealthBar (ref)
	return {
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p16.displayOptions.screenSize,
		health = if fFlagTopBarSignalizeHealthBar then nil else p16.health.currentHealth,
		maxHealth = if fFlagTopBarSignalizeHealthBar then nil else p16.health.maxHealth,
		healthEnabled = if fFlagTopBarSignalizeHealthBar then nil else p16.coreGuiEnabled[Enum.CoreGuiType.Health]
	}
end, if fFlagTopBarSignalizeKeepOutAreas then nil else function(p17) --[[ line: 330 | named "mapDispatchToProps" ]]
	-- upvalues: fFlagTopBarSignalizeKeepOutAreas (ref), setKeepOutAreaModule (ref), removeKeepOutAreaModule (ref)
	return if fFlagTopBarSignalizeKeepOutAreas then {} else {
		setKeepOutArea = function(value, p18, p19) --[[ line: 335 ]]
			-- upvalues: p17 (ref), setKeepOutAreaModule (copy)
			return p17(setKeepOutAreaModule(value, p18, p19))
		end,
		removeKeepOutArea = function(p20) --[[ line: 338 ]]
			-- upvalues: p17 (ref), removeKeepOutAreaModule (copy)
			return p17(removeKeepOutAreaModule(p20))
		end
	}
end)(healthBar)