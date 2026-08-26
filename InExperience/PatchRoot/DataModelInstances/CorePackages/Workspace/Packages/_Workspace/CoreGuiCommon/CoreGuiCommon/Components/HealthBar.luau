local starterGuiService = game:GetService("StarterGui")
local coreGuiCommon = script:FindFirstAncestor("CoreGuiCommon")
local parent = coreGuiCommon.Parent
local constantsModule = require(coreGuiCommon.Constants)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getLocalHumanoidStore = require(coreGuiCommon.Stores).GetLocalHumanoidStore
local view = foundationModule.View
local useDeviceOrientation = robloxAppHooksModule.useDeviceOrientation
local useTokens = foundationModule.Hooks.useTokens
local healthBarColors = constantsModule.HealthBarColors

local function getHealthBarColor(p1)
	-- upvalues: healthBarColors (ref)
	if p1 <= healthBarColors.Red.Fraction then
		return healthBarColors.Red.Color
	elseif healthBarColors.Green.Fraction <= p1 then
		return healthBarColors.Green.Color
	end
	local var1 = Vector3.new(0, 0, 0)
	local var2 = 0
	
	for i, v in healthBarColors do
		local vector3 = Vector3.new(v.Color.R, v.Color.G, v.Color.B)
		local var3 = p1 - v.Fraction
		
		if var3 ~= 0 then
			local var4 = 1 / (var3 * var3)
			var1 += var4 * vector3
			var2 += var4
			continue
		end
		return Color3.new(vector3.X, vector3.Y, vector3.Z)
	end
	local var5 = var1 / var2
	
	return Color3.new(var5.X, var5.Y, var5.Z)
end

return reactModule.memo(function(p2)
	-- upvalues: starterGuiService (ref), useTokens (ref), useDeviceOrientation (ref), signalsReactModule (ref), getLocalHumanoidStore (ref), reactModule (ref), constantsModule (ref), signalsModule (ref), view (ref), robloxAppEnumsModule (ref), getHealthBarColor (ref)
	local mockStarterGui = p2.mockStarterGui or starterGuiService
	local var6 = useTokens()
	local var7 = useDeviceOrientation()
	local var8 = signalsReactModule.useSignalState(getLocalHumanoidStore)
	local var9, var10 = reactModule.useState(mockStarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health))
	local var11, var12 = reactModule.useBinding(constantsModule.InitialHealth)
	local var13, var14 = reactModule.useBinding(constantsModule.InitialHealth)
	local var15, var16 = reactModule.useBinding(false)
	local var17 = reactModule.joinBindings({ var11, var13, var15 }):map(function(p3)
		local var18 = p3[1]
		local var19 = p3[2]
		local var20 = 1
		
		if p3[3] then
			var20 = 0
			
			return var20
		elseif var19 > 0 then
			var20 = math.clamp(var18 / var19, 0, 1)
		end
		return var20
	end)
	local var18 = reactModule.joinBindings({ var11, var13 }):map(function(p3)
		return p3[1] < p3[2]
	end)
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var8 (ref), var12 (ref), constantsModule (copy), var14 (ref), var16 (ref), mockStarterGui (ref), var10 (ref)
		local var19 = signalsModule.createEffect(function(p3)
			-- upvalues: var8 (copy), var12 (copy), constantsModule (copy), var14 (copy), var16 (copy)
			local healthValue = var8.getHealthValue(p3)
			var12(healthValue.health or constantsModule.InitialHealth)
			var14(healthValue.maxHealth or constantsModule.InitialHealth)
			var16(healthValue.isDead or false)
		end)
		local coreGuiChangedSignalConnection = mockStarterGui.CoreGuiChangedSignal:Connect(function(p3, p4)
			-- upvalues: var10 (copy)
			if p3 == Enum.CoreGuiType.Health or p3 == Enum.CoreGuiType.All then
				var10(p4)
			end
		end)
		
		return function()
			-- upvalues: var19 (ref), coreGuiChangedSignalConnection (ref)
			var19()
			coreGuiChangedSignalConnection:Disconnect()
		end
	end, { var8 })
	
	return if var9 then reactModule.createElement(view, {
		tag = "anchor-top-right position-top-right",
		testId = "health-bar",
		Visible = var18,
		Size = UDim2.fromOffset(if var7 == robloxAppEnumsModule.DeviceOrientationMode.Portrait then var6.Size.Size_2000 else var6.Size.Size_3000, var6.Size.Size_400),
		LayoutOrder = p2.layoutOrder
	}, {
		HealthBar = reactModule.createElement(view, {
			tag = "bg-surface-300 radius-medium size-full",
			backgroundStyle = {
				Transparency = 0.2,
				Color3 = var6.Color.Extended.Gray.Gray_700.Color3
			},
			stroke = {
				Transparency = 0.2,
				Thickness = var6.Stroke.Thicker,
				BorderStrokePosition = Enum.BorderStrokePosition.Outer
			},
			Position = UDim2.fromScale(0, 0.5),
			AnchorPoint = Vector2.new(0, 0.5)
		}, {
			Fill = reactModule.createElement(view, {
				tag = "anchor-left-center radius-medium",
				testId = "health-bar-fill",
				backgroundStyle = var17:map(function(p3)
					-- upvalues: getHealthBarColor (copy)
					return { Transparency = 0, Color3 = getHealthBarColor(p3) }
				end),
				Size = var17:map(function(p3)
					return UDim2.fromScale(p3, 1)
				end)
			})
		})
	}) else nil
end)