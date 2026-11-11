local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local FullViewIndicatorModule = require(Modules.AvatarExperience.Common.Components.Scene.FullViewIndicator)
local RobuxBalanceModule = require(Modules.AvatarExperience.Catalog.Components.RobuxBalance)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local UseShouldRenderQuickMenuButtonModule = require(Modules.AvatarExperience.Common.Hooks.useShouldRenderQuickMenuButton)
local GetFFlagAXFixRobuxBalanceButtonPositionSecondModule = require(Modules.AvatarExperience.Flags.GetFFlagAXFixRobuxBalanceButtonPositionSecond)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseDeviceOrientationFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useDeviceOrientation
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local FFlagAXMoveRobuxBalanceButtonLowerModule = require(Modules.AvatarExperience.Flags.FFlagAXMoveRobuxBalanceButtonLower)
local QuickMenuButtonModule = require(script.Parent.QuickMenuButton)
local SceneUIContainer = RoactModule.PureComponent:extend("SceneUIContainer")
SceneUIContainer.defaultProps = { isVisible = true }

function SceneUIContainer.init(p1)
	-- upvalues: RoactModule (copy)
	p1.robuxBalanceRef = RoactModule.createRef()
	p1.quickMenuRef = RoactModule.createRef()
end

function SceneUIContainer.renderRobloxBalanceContainer(p1)
	-- upvalues: RoactModule (copy), RobuxBalanceModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(0, 0, 0, 0)
	}, {
		RobuxBalance = RoactModule.createElement(RobuxBalanceModule, {
			[RoactModule.Ref] = p1.robuxBalanceRef,
			NextSelectionLeft = p1.quickMenuRef
		})
	})
end

function SceneUIContainer.getRow1Children(p1)
	-- upvalues: RoactModule (copy), QuickMenuButtonModule (copy), FFlagAXMoveRobuxBalanceButtonLowerModule (copy)
	local ShowRobuxBalance = p1.props.showRobuxBalance
	
	return {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 5)
		}),
		QuickMenuButton = if p1.props.showQuickMenuButton then RoactModule.createElement(QuickMenuButtonModule, {
			[RoactModule.Ref] = p1.quickMenuRef,
			NextSelectionRight = p1.robuxBalanceRef
		}) else nil,
		RobuxBalanceContainer = if FFlagAXMoveRobuxBalanceButtonLowerModule then nil else ShowRobuxBalance and p1:renderRobloxBalanceContainer()
	}
end

function SceneUIContainer.render(p1)
	-- upvalues: DeviceOrientationMode (copy), GetFFlagAXFixRobuxBalanceButtonPositionSecondModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), RoactModule (copy), Focusable (copy), FullViewIndicatorModule (copy)
	local IsVisible = p1.props.isVisible
	local ForwardRef = p1.props.forwardRef
	local YOffset = 4
	
	if p1.props.deviceOrientation == DeviceOrientationMode.Landscape then
		local DesignTokens = p1.props.designTokens
		YOffset = if GetFFlagAXFixRobuxBalanceButtonPositionSecondModule() then p1.props.statusBarHeight + (if FFlagRenameDeprecatedUIBloxTokens then DesignTokens.Size.Size_300 else DesignTokens.Global.Size_150) else ((p1.props.globalGuiInset or {}).top or 0) + (if FFlagRenameDeprecatedUIBloxTokens then DesignTokens.Size.Size_300 else DesignTokens.Global.Size_150)
	end
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 72),
		Position = UDim2.new(0, -12, 0, YOffset),
		Visible = IsVisible,
		[RoactModule.Ref] = ForwardRef,
		restorePreviousChildFocus = true,
		defaultChild = p1.quickMenuRef
	}, {
		Row1 = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 36),
			Visible = p1.props.row1ChildrenVisible
		}, p1:getRow1Children()),
		FullViewIndicator = RoactModule.createElement(FullViewIndicatorModule, {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 40)
		})
	})
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: UseShouldRenderQuickMenuButtonModule (copy), UseDesignTokensFunction (copy), UseDeviceOrientationFunction (copy), RoactModule (copy), SceneUIContainer (copy), CryoModule (copy)
	return RoactModule.createElement(SceneUIContainer, CryoModule.Dictionary.join(p1, {
		forwardRef = ForwardRef,
		showQuickMenuButton = UseShouldRenderQuickMenuButtonModule(),
		designTokens = UseDesignTokensFunction(),
		deviceOrientation = UseDeviceOrientationFunction()
	}))
end)