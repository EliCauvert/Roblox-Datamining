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

local function getHealthBarColor(p0) --[[ line: 25 ]]
	-- upvalues: healthBarColors (ref)
	if p0 <= healthBarColors.Red.Fraction then
		return healthBarColors.Red.Color
	elseif healthBarColors.Green.Fraction <= p0 then
		return healthBarColors.Green.Color
	end
	local var10 = Vector3.new(0, 0, 0)
	local var11 = 0
	
	for i, v in healthBarColors do
		local vector3 = Vector3.new(v.Color.R, v.Color.G, v.Color.B)
		local var14 = p0 - v.Fraction
		
		if var14 ~= 0 then
			local var15 = 1 / (var14 * var14)
			var10 += var15 * vector3
			var11 += var15
			continue
		end
		return Color3.new(vector3.X, vector3.Y, vector3.Z)
	end
	local var12 = var10 / var11
	
	return Color3.new(var12.X, var12.Y, var12.Z)
end

return reactModule.memo(function(p1) --[[ line: 54 | named "HealthBar" ]]
	-- upvalues: starterGuiService (ref), useTokens (ref), useDeviceOrientation (ref), signalsReactModule (ref), getLocalHumanoidStore (ref), reactModule (ref), constantsModule (ref), signalsModule (ref), view (ref), robloxAppEnumsModule (ref), getHealthBarColor (ref)
	local mockStarterGui = p1.mockStarterGui or starterGuiService
	local var17 = useTokens()
	local var18 = useDeviceOrientation()
	local var19 = signalsReactModule.useSignalState(getLocalHumanoidStore)
	local var20, var21 = reactModule.useState(mockStarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health))
	local var22, var23 = reactModule.useBinding(constantsModule.InitialHealth)
	local var24, var25 = reactModule.useBinding(constantsModule.InitialHealth)
	local var26, var27 = reactModule.useBinding(false)
	local var28 = reactModule.joinBindings({ var22, var24, var26 }):map(function(p2) --[[ line: 67 ]]
		local var30 = p2[1]
		local var31 = p2[2]
		local var32 = 1
		
		if p2[3] then
			var32 = 0
			
			return var32
		elseif var31 > 0 then
			var32 = math.clamp(var30 / var31, 0, 1)
		end
		return var32
	end)
	local var29 = reactModule.joinBindings({ var22, var24 }):map(function(p3) --[[ line: 82 ]]
		return p3[1] < p3[2]
	end)
	reactModule.useEffect(function() --[[ line: 86 ]]
		-- upvalues: signalsModule (copy), var19 (ref), var23 (ref), constantsModule (copy), var25 (ref), var27 (ref), mockStarterGui (ref), var21 (ref)
		local var33 = signalsModule.createEffect(function(p4) --[[ line: 87 ]]
			-- upvalues: var19 (copy), var23 (copy), constantsModule (copy), var25 (copy), var27 (copy)
			local healthValue = var19.getHealthValue(p4)
			var23(healthValue.health or constantsModule.InitialHealth)
			var25(healthValue.maxHealth or constantsModule.InitialHealth)
			var27(healthValue.isDead or false)
		end)
		local coreGuiChangedSignalConnection = mockStarterGui.CoreGuiChangedSignal:Connect(function(p5, p6) --[[ line: 96 ]]
			-- upvalues: var21 (copy)
			if p5 == Enum.CoreGuiType.Health or p5 == Enum.CoreGuiType.All then
				var21(p6)
			end
		end)
		
		return function() --[[ line: 103 ]]
			-- upvalues: var33 (ref), coreGuiChangedSignalConnection (ref)
			var33()
			coreGuiChangedSignalConnection:Disconnect()
		end
	end, { var19 })
	
	return if var20 then reactModule.createElement(view, {
		tag = "anchor-top-right position-top-right",
		testId = "health-bar",
		Visible = var29,
		Size = UDim2.fromOffset(if var18 == robloxAppEnumsModule.DeviceOrientationMode.Portrait then var17.Size.Size_2000 else var17.Size.Size_3000, var17.Size.Size_400),
		LayoutOrder = p1.layoutOrder
	}, {
		HealthBar = reactModule.createElement(view, {
			tag = "bg-surface-300 radius-medium size-full",
			backgroundStyle = {
				Transparency = 0.2,
				Color3 = var17.Color.Extended.Gray.Gray_700.Color3
			},
			stroke = {
				Transparency = 0.2,
				Thickness = var17.Stroke.Thicker,
				BorderStrokePosition = Enum.BorderStrokePosition.Outer
			},
			Position = UDim2.fromScale(0, 0.5),
			AnchorPoint = Vector2.new(0, 0.5)
		}, {
			Fill = reactModule.createElement(view, {
				tag = "anchor-left-center radius-medium",
				testId = "health-bar-fill",
				backgroundStyle = var28:map(function(p7) --[[ line: 138 ]]
					-- upvalues: getHealthBarColor (copy)
					return { Transparency = 0, Color3 = getHealthBarColor(p7) }
				end),
				Size = var28:map(function(p8) --[[ line: 144 ]]
					return UDim2.fromScale(p8, 1)
				end)
			})
		})
	}) else nil
end)