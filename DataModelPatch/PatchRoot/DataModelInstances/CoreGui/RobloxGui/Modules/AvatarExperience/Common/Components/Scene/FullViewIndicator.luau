local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OtterModule = require(CorePackages.Packages.Otter)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local IsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local FFlagMigrateRoactUtilsToReactUtils = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils()
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local GamepadUtils = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local WithAppRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)
local IconsActionsZoomIn = Images["icons/actions/zoomIn"]
local _Vector2 = Vector2.new(36, 36)
local IconsControlsKeysXboxRS = Images["icons/controls/keys/xboxRS"]
local _Vector2_1 = Vector2.new(36, 36)
local ComponentAssetsCircle49 = Images["component_assets/circle_49"]
local _Vector2_2 = Vector2.new(49 + _Vector2_1.X, (math.max(49, _Vector2_1.Y)))
local config = { dampingRatio = 1, frequency = 4 }

local function _(Input)
	-- upvalues: IsGamepadInputFunction (copy)
	return IsGamepadInputFunction(Input.UserInputType)
end

local _ = function(p1, p2): boolean
	-- upvalues: ConstantsModule (copy)
	local v1 = p2[p1]
	
	return typeof(v1) == "table" and v1.tag == ConstantsModule.SceneGamepad.FullViewIndicatorTag
end

local _ = function(p1): number
	return if p1 then 0 else 1
end

local FullViewIndicator = RoactModule.PureComponent:extend("FullViewIndicator")
FullViewIndicator.validateProps = TModule.strictInterface({
	AnchorPoint = TModule.Vector2,
	Position = TModule.UDim2,
	LayoutOrder = TModule.optional(TModule.number),
	boundInputs = TModule.table,
	isSceneFullView = TModule.boolean,
	avatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute.Interface
})

function FullViewIndicator.getDerivedStateFromProps(p1, p2)
	-- upvalues: ConstantsModule (copy)
	local BoundInputs = p1.boundInputs
	local LastGamepadKeyCode = p2.lastGamepadKeyCode
	local BoundInput = BoundInputs[Enum.KeyCode.Thumbstick2]
	local Inverted = not (typeof(BoundInput) == "table" and BoundInput.tag == ConstantsModule.SceneGamepad.FullViewIndicatorTag)
	local BoundInput1 = BoundInputs[Enum.KeyCode.ButtonR3]
	local Inverted1 = not (typeof(BoundInput1) == "table" and BoundInput1.tag == ConstantsModule.SceneGamepad.FullViewIndicatorTag)
	local IsLastGamepadKeyCodeMatch: boolean = not p1.isSceneFullView and (not Inverted and LastGamepadKeyCode == Enum.KeyCode.Thumbstick2 or not Inverted1 and LastGamepadKeyCode == Enum.KeyCode.ButtonR3)
	
	return if IsLastGamepadKeyCodeMatch == p2.isVisible then nil else { isVisible = IsLastGamepadKeyCodeMatch }
end

function FullViewIndicator.setStateIfChanged(p1, List)
	local StateEntries = {}
	
	for i, value in List do
		if p1.state[i] ~= value then
			StateEntries[i] = value
		end
	end
	if next(StateEntries) then
		p1:setState(StateEntries)
	end
end

function FullViewIndicator.init(p2)
	-- upvalues: RoactModule (copy), IsGamepadInputFunction (copy), GamepadUtils (copy)
	p2:setState({ lastGamepadKeyCode = nil })
	p2.transparencyBinding, p2.updateTransparencyBinding = RoactModule.createBinding(if p2.state.isVisible then 0 else 1)
	
	function p2.onInputBegan(Input)
		-- upvalues: IsGamepadInputFunction (upval), p2 (copy)
		if not IsGamepadInputFunction(Input.UserInputType) then return end
		if Input.KeyCode ~= Enum.KeyCode.ButtonR3 or (p2.props.isSceneFullView or p2.state.isR3BindingOverridden) then
			p2:setStateIfChanged({ lastGamepadKeyCode = Input.KeyCode })
			
			return
		end
	end
	
	function p2.onInputChanged(Input)
		-- upvalues: IsGamepadInputFunction (upval), GamepadUtils (upval), p2 (copy)
		if not IsGamepadInputFunction(Input.UserInputType) then return end
		if (Input.KeyCode == Enum.KeyCode.Thumbstick1 or Input.KeyCode == Enum.KeyCode.Thumbstick2) and GamepadUtils.normalizeStickByDeadzone(Input.Position) ~= Vector2.new(0, 0) then
			p2:setStateIfChanged({ lastGamepadKeyCode = Input.KeyCode })
			
			return
		end
	end
end

function FullViewIndicator.didMount(p2)
	-- upvalues: OtterModule (copy)
	p2.transparencyMotor = OtterModule.createSingleMotor(if p2.state.isVisible then 0 else 1)
	p2.transparencyMotor:onStep(function(p3)
		-- upvalues: p2 (copy)
		p2.updateTransparencyBinding(p3)
	end)
	p2.transparencyMotor:start()
end

function FullViewIndicator.willUpdate(p2, _, p3)
	-- upvalues: OtterModule (copy), config (copy)
	local IsVisible = p3.isVisible
	
	if IsVisible ~= p2.state.isVisible then
		p2.transparencyMotor:setGoal(OtterModule.spring(if IsVisible then 0 else 1, config))
	end
end

function FullViewIndicator.render(p2)
	-- upvalues: AvatarScreen (copy), RoactModule (copy), ExternalEventConnection (copy), UserInputService (copy), FFlagMigrateRoactUtilsToReactUtils (copy), WithStyleFunction (copy), _Vector2_2 (copy), ImageSetLabel (copy), _Vector2_1 (copy), IconsControlsKeysXboxRS (copy), ComponentAssetsCircle49 (copy), _Vector2 (copy), IconsActionsZoomIn (copy)
	return if p2.props.avatarRoute.opaque.name == AvatarScreen.AvatarExperienceLandingPage then nil else RoactModule.createFragment({
		InputBeganConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.InputBegan,
			callback = p2.onInputBegan
		}, {
			InputChangedConnection = if FFlagMigrateRoactUtilsToReactUtils then nil else RoactModule.createElement(ExternalEventConnection, {
				event = UserInputService.InputChanged,
				callback = p2.onInputChanged
			})
		}),
		InputChangedConnection = if FFlagMigrateRoactUtilsToReactUtils then RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.InputChanged,
			callback = p2.onInputChanged
		}) else nil,
		Indicator = WithStyleFunction(function(p3)
			-- upvalues: RoactModule (upval), p2 (copy), _Vector2_2 (upval), ImageSetLabel (upval), _Vector2_1 (upval), IconsControlsKeysXboxRS (upval), ComponentAssetsCircle49 (upval), _Vector2 (upval), IconsActionsZoomIn (upval)
			local Theme = p3.Theme
			
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = p2.props.AnchorPoint,
				Position = p2.props.Position,
				Size = UDim2.new(0, _Vector2_2.X, 0, _Vector2_2.Y)
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 5)
				}),
				ControllerButtonImage = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(0, _Vector2_1.X, 0, _Vector2_1.Y),
					Image = IconsControlsKeysXboxRS,
					ImageColor3 = Theme.TextEmphasis.Color,
					ImageTransparency = p2.transparencyBinding
				}),
				CircleBackground = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(0, 49, 0, 49),
					Image = ComponentAssetsCircle49,
					ImageColor3 = Theme.BackgroundUIDefault.Color,
					ImageTransparency = p2.transparencyBinding
				}, {
					IndicatorImage = RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(0, _Vector2.X, 0, _Vector2.Y),
						Image = IconsActionsZoomIn,
						ImageColor3 = Theme.TextEmphasis.Color,
						ImageTransparency = p2.transparencyBinding
					})
				})
			})
		end)
	})
end

function FullViewIndicator.willUnmount(p2)
	p2.transparencyMotor:destroy()
end

return (WithAppRouteModule((RoactRoduxModule.connect(function(p2, p3)
	-- upvalues: UtilsModule (copy)
	return {
		boundInputs = p2.GamepadBottomBar.boundInputs,
		isSceneFullView = UtilsModule.getIsSceneFullViewFromState(p2, p3.avatarRoute)
	}
end)(FullViewIndicator))))