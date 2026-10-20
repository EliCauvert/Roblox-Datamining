local CorePackages = game:GetService("CorePackages")
local StarterGui = game:GetService("StarterGui")
local _ = game:GetService("Workspace")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local TenFootInterfaceModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.TenFootInterface)
local SetKeepOutAreaModule = require(Parent.Actions.SetKeepOutArea)
local RemoveKeepOutAreaModule = require(Parent.Actions.RemoveKeepOutArea)
local _ = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagTopBarSignalizeHealthBar = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeHealthBar
local FFlagTopBarSignalizeKeepOutAreas = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local FFlagTopBarSignalizeScreenSize = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeScreenSize
local Chrome = Parent.Parent.Chrome
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled

if EnabledFunction() then
	local _ = require(Chrome.Service)
end
local EnabledResult = EnabledFunction()
local _UDim2: UDim2 = if EnabledResult then UDim2.new(0, 125, 0, 20) else UDim2.new(0, 80, 0, 6)
local _UDim2_1 = UDim2.new(0, 50, 0, 16)
local _UDim2_2 = UDim2.new(0, 80, 0, 20)
local _UDim2_3 = UDim2.new(0, 220, 0, 16)
local HealthBar = RoactModule.PureComponent:extend("HealthBar")
HealthBar.validateProps = TModule.strictInterface({
	layoutOrder = TModule.optional(TModule.integer),
	screenSize = if FFlagTopBarSignalizeScreenSize then nil else TModule.Vector2,
	healthEnabled = if FFlagTopBarSignalizeHealthBar then nil else TModule.boolean,
	health = if FFlagTopBarSignalizeHealthBar then nil else TModule.number,
	maxHealth = if FFlagTopBarSignalizeHealthBar then nil else TModule.number,
	setKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else TModule.callback,
	removeKeepOutArea = if FFlagTopBarSignalizeKeepOutAreas then nil else TModule.callback
})

local function _(p1): Vector3
	return (Vector3.new(p1.r, p1.g, p1.b))
end

local HealthRedColor = ConstantsModule.HealthRedColor
local _Vector3 = Vector3.new(HealthRedColor.r, HealthRedColor.g, HealthRedColor.b)
local HealthYellowColor = ConstantsModule.HealthYellowColor
local _Vector3_1 = Vector3.new(HealthYellowColor.r, HealthYellowColor.g, HealthYellowColor.b)
local HealthGreenColor = ConstantsModule.HealthGreenColor
local config = {
	[_Vector3] = 0.1,
	[_Vector3_1] = 0.5,
	[Vector3.new(HealthGreenColor.r, HealthGreenColor.g, HealthGreenColor.b)] = 0.8
}
local HealthRedColor1 = ConstantsModule.HealthRedColor
local HealthGreenColor1 = ConstantsModule.HealthGreenColor

local function getHealthBarColor(ClampedValue: number)
	-- upvalues: HealthRedColor1 (copy), HealthGreenColor1 (copy), config (copy)
	if ClampedValue <= 0.1 then
		return HealthRedColor1
	end
	if ClampedValue >= 0.8 then
		return HealthGreenColor1
	end
	local Total: vector = vector.create(0, 0, 0)
	local Total1 = 0
	
	for i, value in pairs(config) do
		local ClampedValueDelta = ClampedValue - value
		
		if ClampedValueDelta == 0 then
			return Color3.new(i.x, i.y, i.z)
		end
		local Amount = 1 / (ClampedValueDelta * ClampedValueDelta)
		Total += Amount * i
		Total1 += Amount
	end
	local TotalRatio: vector = Total / Total1
	
	return Color3.new(TotalRatio.x, TotalRatio.y, TotalRatio.z)
end

function HealthBar.init(p1)
	-- upvalues: RoactModule (copy), FFlagTopBarSignalizeHealthBar (copy), ConstantsModule (copy), CoreGuiCommonModule (copy), SignalsModule (copy), StarterGui (copy), FFlagTopBarSignalizeKeepOutAreas (copy), FFlagTopBarSignalizeScreenSize (copy), DisplayModule (copy), TenFootInterfaceModule (copy), _UDim2_3 (copy), EnabledResult (copy), _UDim2_1 (copy), _UDim2_2 (copy), _UDim2 (ref)
	p1.rootRef = RoactModule.createRef()
	
	if FFlagTopBarSignalizeHealthBar then
		p1.health, p1.setHealth = RoactModule.createBinding(ConstantsModule.InitialHealth)
		p1.maxHealth, p1.setMaxHealth = RoactModule.createBinding(ConstantsModule.InitialHealth)
		p1.isDead, p1.setIsDead = RoactModule.createBinding(false)
		p1.healthPercent = RoactModule.joinBindings({ p1.health, p1.maxHealth, p1.isDead }):map(function(Entry): number
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
		p1.healthVisible = RoactModule.joinBindings({ p1.health, p1.maxHealth }):map(function(Entry): boolean
			return Entry[1] < Entry[2]
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
		local function _()
			-- upvalues: StarterGui (upval)
			return StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		end
		
		p1.coreGuiChangedSignalConn = StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, MountHealthBar)
			-- upvalues: p1 (copy)
			if CoreGuiType == Enum.CoreGuiType.Health or CoreGuiType == Enum.CoreGuiType.All then
				p1:setState({ mountHealthBar = MountHealthBar })
			end
		end)
		p1:setState({
			mountHealthBar = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
		})
	end
	if FFlagTopBarSignalizeKeepOutAreas then
		p1.keepOutAreasStore = CoreGuiCommonModule.Stores.GetKeepOutAreasStore(false)
	end
	if FFlagTopBarSignalizeScreenSize then
		local GetViewportSizeFunction = DisplayModule.GetDisplayStore(false).getViewportSize
		p1.screenSizeBinding, p1.setScreenSizeBinding = RoactModule.createBinding(GetViewportSizeFunction(false))
		p1.disposeScreenSize = SignalsModule.createEffect(function(p2)
			-- upvalues: p1 (copy), GetViewportSizeFunction (copy)
			p1.setScreenSizeBinding(GetViewportSizeFunction(p2))
		end)
		p1.healthbarSizeBinding = p1.screenSizeBinding:map(function(Vector)
			-- upvalues: TenFootInterfaceModule (upval), _UDim2_3 (upval), EnabledResult (upval), _UDim2_1 (upval), _UDim2_2 (upval), _UDim2 (upval)
			return if TenFootInterfaceModule:IsEnabled() then _UDim2_3 elseif EnabledResult and Vector.X <= 320 then _UDim2_1 elseif EnabledResult and Vector.X <= 393 then _UDim2_2 else _UDim2
		end)
	end
end

function HealthBar.onUnmount(p1)
	-- upvalues: FFlagTopBarSignalizeHealthBar (copy), FFlagTopBarSignalizeScreenSize (copy)
	if FFlagTopBarSignalizeHealthBar then
		p1.coreGuiChangedSignalConn:Disconnect()
		p1.disposeHealthConnection()
	end
	if FFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
end

function HealthBar.renderHealth(p1)
	-- upvalues: FFlagTopBarSignalizeHealthBar (copy), FFlagTopBarSignalizeScreenSize (copy), EnabledResult (copy), _UDim2_1 (copy), _UDim2_2 (copy), _UDim2 (ref), TenFootInterfaceModule (copy), _UDim2_3 (copy), FFlagTopBarSignalizeKeepOutAreas (copy), ConstantsModule (copy), getHealthBarColor (copy), RoactModule (copy), EnabledFunction (copy)
	local IsHealthBelow = if FFlagTopBarSignalizeHealthBar then nil else p1.props.healthEnabled and p1.props.health < p1.props.maxHealth
	local XScale = 1
	
	if not FFlagTopBarSignalizeHealthBar then
		if p1.props.isDead then
			XScale = 0
		elseif p1.props.maxHealth > 0 then
			XScale = math.clamp(p1.props.health / p1.props.maxHealth, 0, 1)
		end
	end
	local _UDim = if FFlagTopBarSignalizeScreenSize then nil elseif EnabledResult then if p1.props.screenSize.X <= 320 then if TenFootInterfaceModule:IsEnabled() then _UDim2_3 else _UDim2_1 elseif TenFootInterfaceModule:IsEnabled() then _UDim2_3 elseif p1.props.screenSize.X <= 393 then _UDim2_2 else _UDim2 elseif TenFootInterfaceModule:IsEnabled() then _UDim2_3 else _UDim2
	local Offset: number = if TenFootInterfaceModule:IsEnabled() then 0 else 4
	local Image = nil
	local Image1 = nil
	local _Rect = nil
	
	if EnabledResult then
		Image = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png"
		Image1 = "rbxasset://textures/ui/TopBar/HealthBarTV.png"
		_Rect = Rect.new(8, 8, 9, 9)
	else
		Image = "rbxasset://textures/ui/TopBar/HealthBarBase.png"
		Image1 = "rbxasset://textures/ui/TopBar/HealthBar.png"
		_Rect = Rect.new(3, 3, 4, 4)
		
		if TenFootInterfaceModule:IsEnabled() then
			Image = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png"
			Image1 = "rbxasset://textures/ui/TopBar/HealthBarTV.png"
			_Rect = Rect.new(8, 8, 9, 9)
		end
	end
	local function v52(Frame: Frame)
		-- upvalues: EnabledResult (upval), FFlagTopBarSignalizeHealthBar (upval), p1 (copy), IsHealthBelow (ref), FFlagTopBarSignalizeKeepOutAreas (upval), ConstantsModule (upval)
		if not EnabledResult then
			if (FFlagTopBarSignalizeHealthBar and p1.healthVisible or not FFlagTopBarSignalizeHealthBar and IsHealthBelow) and Frame then
				if FFlagTopBarSignalizeKeepOutAreas then
					p1.keepOutAreasStore.setKeepOutArea(ConstantsModule.HealthBarKeepOutAreaId, Frame.AbsolutePosition, Frame.AbsoluteSize)
					
					return
				else
					p1.props.setKeepOutArea(ConstantsModule.HealthBarKeepOutAreaId, Frame.AbsolutePosition, Frame.AbsoluteSize)
					
					return
				end
			elseif FFlagTopBarSignalizeKeepOutAreas then
				p1.keepOutAreasStore.removeKeepOutArea(ConstantsModule.HealthBarKeepOutAreaId)
				
				return
			else
				p1.props.removeKeepOutArea(ConstantsModule.HealthBarKeepOutAreaId)
			end
		end
	end
	
	if p1.rootRef.current then
		v52(p1.rootRef.current)
	end
	return RoactModule.createElement("Frame", {
		AnchorPoint = if EnabledResult then Vector2.new(1, 0) else nil,
		Position = if EnabledResult then UDim2.new(1, 0, 0, 0) else nil,
		Visible = if FFlagTopBarSignalizeHealthBar then p1.healthVisible else IsHealthBelow,
		BackgroundTransparency = 1,
		Size = if FFlagTopBarSignalizeScreenSize then p1.healthbarSizeBinding:map(function(p2): UDim2
			return UDim2.new(p2.X, UDim.new(1, 0))
		end) else UDim2.new(_UDim.X, UDim.new(1, 0)),
		LayoutOrder = p1.props.layoutOrder,
		[RoactModule.Change.AbsoluteSize] = v52,
		[RoactModule.Change.AbsolutePosition] = v52,
		[RoactModule.Ref] = p1.rootRef
	}, {
		Padding = if EnabledFunction then nil else RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, Offset) }) or nil,
		HealthBar = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = Image,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = _Rect,
			Size = if FFlagTopBarSignalizeScreenSize then p1.healthbarSizeBinding else _UDim,
			Position = UDim2.fromScale(0, 0.5),
			AnchorPoint = Vector2.new(0, 0.5)
		}, {
			Fill = RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = Image1,
				ImageColor3 = if FFlagTopBarSignalizeHealthBar then p1.healthPercent:map(getHealthBarColor) else getHealthBarColor(XScale),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = _Rect,
				Size = if FFlagTopBarSignalizeHealthBar then p1.healthPercent:map(function(XScale): UDim2
					return UDim2.fromScale(XScale, 1)
				end) else UDim2.fromScale(XScale, 1)
			})
		})
	})
end

function HealthBar.render(p1)
	-- upvalues: FFlagTopBarSignalizeHealthBar (copy)
	return if FFlagTopBarSignalizeHealthBar then if p1.state.mountHealthBar then p1:renderHealth() else nil else p1:renderHealth()
end

local function mapDispatchToProps(Callback)
	-- upvalues: FFlagTopBarSignalizeKeepOutAreas (copy), SetKeepOutAreaModule (copy), RemoveKeepOutAreaModule (copy)
	return if FFlagTopBarSignalizeKeepOutAreas then {} else {
		setKeepOutArea = function(p1, p2, p3)
			-- upvalues: Callback (copy), SetKeepOutAreaModule (upval)
			return Callback(SetKeepOutAreaModule(p1, p2, p3))
		end,
		removeKeepOutArea = function(p1)
			-- upvalues: Callback (copy), RemoveKeepOutAreaModule (upval)
			return Callback(RemoveKeepOutAreaModule(p1))
		end
	}
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1)
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy), FFlagTopBarSignalizeHealthBar (copy)
	return {
		screenSize = if FFlagTopBarSignalizeScreenSize then nil else p1.displayOptions.screenSize,
		health = if FFlagTopBarSignalizeHealthBar then nil else p1.health.currentHealth,
		maxHealth = if FFlagTopBarSignalizeHealthBar then nil else p1.health.maxHealth,
		healthEnabled = if FFlagTopBarSignalizeHealthBar then nil else p1.coreGuiEnabled[Enum.CoreGuiType.Health]
	}
end, if FFlagTopBarSignalizeKeepOutAreas then nil else mapDispatchToProps)(HealthBar)