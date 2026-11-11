local StarterGui = game:GetService("StarterGui")
local CoreGuiCommon = script:FindFirstAncestor("CoreGuiCommon")
local Parent = CoreGuiCommon.Parent
local ConstantsModule = require(CoreGuiCommon.Constants)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetLocalHumanoidStore = require(CoreGuiCommon.Stores).GetLocalHumanoidStore
local View = FoundationModule.View
local UseDeviceOrientationFunction = require(Parent.RobloxAppHooks).useDeviceOrientation
local UseTokensFunction = FoundationModule.Hooks.useTokens
local HealthBarColors = ConstantsModule.HealthBarColors

local function getHealthBarColor(p1)
	-- upvalues: HealthBarColors (copy)
	if p1 <= HealthBarColors.Red.Fraction then
		return HealthBarColors.Red.Color
	end
	if HealthBarColors.Green.Fraction <= p1 then
		return HealthBarColors.Green.Color
	end
	local Total: vector = vector.create(0, 0, 0)
	local Total1 = 0
	local _Vector3 = nil
	
	for _, healthBarColor in HealthBarColors do
		_Vector3 = Vector3.new(healthBarColor.Color.R, healthBarColor.Color.G, healthBarColor.Color.B)
		local v1 = p1 - healthBarColor.Fraction
		
		if v1 == 0 then
			return Color3.new(_Vector3.X, _Vector3.Y, _Vector3.Z)
		end
		local Amount = 1 / (v1 * v1)
		Total += Amount * _Vector3
		Total1 += Amount
	end
	local TotalRatio: vector = Total / Total1
	
	return Color3.new(TotalRatio.X, TotalRatio.Y, TotalRatio.Z)
end

return ReactModule.memo(function(p2)
	-- upvalues: StarterGui (copy), UseTokensFunction (copy), UseDeviceOrientationFunction (copy), SignalsReactModule (copy), GetLocalHumanoidStore (copy), ReactModule (copy), ConstantsModule (copy), SignalsModule (copy), View (copy), RobloxAppEnumsModule (copy), getHealthBarColor (copy)
	local MockStarterGui = p2.mockStarterGui or StarterGui
	local UseTokensResult = UseTokensFunction()
	local UseDeviceOrientationResult = UseDeviceOrientationFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetLocalHumanoidStore)
	local UseStateResult, UseStateResult2 = ReactModule.useState(MockStarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health))
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(ConstantsModule.InitialHealth)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(ConstantsModule.InitialHealth)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(false)
	local MapResult = ReactModule.joinBindings({ UseBindingResult, UseBindingResult1, UseBindingResult3 }):map(function(Entry): number
		local Entry1 = Entry[1]
		local Entry2: number = Entry[2]
		local ClampedValue = 1
		
		if Entry[3] then
			ClampedValue = 0
			
			return ClampedValue
		end
		if Entry2 > 0 then
			ClampedValue = math.clamp(Entry1 / Entry2, 0, 1)
		end
		return ClampedValue
	end)
	local MapResult1 = ReactModule.joinBindings({ UseBindingResult, UseBindingResult1 }):map(function(Entry): boolean
		return Entry[1] < Entry[2]
	end)
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), UseSignalStateResult (copy), UseBindingResult2 (copy), ConstantsModule (upval), UseBindingResult2_1 (copy), UseBindingResult2_2 (copy), MockStarterGui (copy), UseStateResult2 (copy)
		local Effect = SignalsModule.createEffect(function(p3)
			-- upvalues: UseSignalStateResult (upval), UseBindingResult2 (upval), ConstantsModule (upval), UseBindingResult2_1 (upval), UseBindingResult2_2 (upval)
			local HealthValue = UseSignalStateResult.getHealthValue(p3)
			UseBindingResult2(HealthValue.health or ConstantsModule.InitialHealth)
			UseBindingResult2_1(HealthValue.maxHealth or ConstantsModule.InitialHealth)
			UseBindingResult2_2(HealthValue.isDead or false)
		end)
		local CoreGuiChangedSignalConnection = MockStarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, Enabled)
			-- upvalues: UseStateResult2 (upval)
			if CoreGuiType == Enum.CoreGuiType.Health or CoreGuiType == Enum.CoreGuiType.All then
				UseStateResult2(Enabled)
			end
		end)
		
		return function()
			-- upvalues: Effect (copy), CoreGuiChangedSignalConnection (copy)
			Effect()
			CoreGuiChangedSignalConnection:Disconnect()
		end
	end, { UseSignalStateResult })
	
	return if UseStateResult then ReactModule.createElement(View, {
		tag = "anchor-top-right position-top-right",
		testId = "health-bar",
		Visible = MapResult1,
		Size = UDim2.fromOffset(if UseDeviceOrientationResult == RobloxAppEnumsModule.DeviceOrientationMode.Portrait then UseTokensResult.Size.Size_2000 else UseTokensResult.Size.Size_3000, UseTokensResult.Size.Size_400),
		LayoutOrder = p2.layoutOrder
	}, {
		HealthBar = ReactModule.createElement(View, {
			tag = "bg-surface-300 radius-medium size-full",
			backgroundStyle = {
				Transparency = 0.2,
				Color3 = UseTokensResult.Color.Extended.Gray.Gray_700.Color3
			},
			stroke = {
				Transparency = 0.2,
				Thickness = UseTokensResult.Stroke.Thicker,
				BorderStrokePosition = Enum.BorderStrokePosition.Outer
			},
			Position = UDim2.fromScale(0, 0.5),
			AnchorPoint = Vector2.new(0, 0.5)
		}, {
			Fill = ReactModule.createElement(View, {
				tag = "anchor-left-center radius-medium",
				testId = "health-bar-fill",
				backgroundStyle = MapResult:map(function(p3)
					-- upvalues: getHealthBarColor (upval)
					return { Transparency = 0, Color3 = getHealthBarColor(p3) }
				end),
				Size = MapResult:map(function(XScale): UDim2
					return UDim2.fromScale(XScale, 1)
				end)
			})
		})
	}) else nil
end)