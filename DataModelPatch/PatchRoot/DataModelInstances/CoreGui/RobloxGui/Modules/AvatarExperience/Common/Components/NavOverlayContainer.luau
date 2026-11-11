local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local NavOverlayContainer = RoactModule.PureComponent:extend("NavOverlayContainer")
NavOverlayContainer.validateProps = TModule.strictInterface({
	onAbsoluteSizeChanged = TModule.optional(TModule.callback),
	onAbsolutePositionChanged = TModule.optional(TModule.callback),
	ZIndex = TModule.optional(TModule.integer),
	[RoactModule.Children] = TModule.table,
	globalGuiInset = TModule.strictInterface({
		left = TModule.integer,
		top = TModule.integer,
		right = TModule.integer,
		bottom = TModule.integer
	}),
	screenSize = TModule.Vector2,
	isPortrait = TModule.boolean
})

function NavOverlayContainer.render(p1)
	-- upvalues: GetSafeAreaSizeFunction (copy), ConstantsModule (copy), RoactModule (copy), IsVRAppBuildFunction (copy)
	local SafeAreaSize = GetSafeAreaSizeFunction(p1.props.screenSize, p1.props.globalGuiInset)
	local _UDim2 = UDim2.fromScale(1, 1)
	local _UDim2_1 = UDim2.fromOffset(0, 0)
	
	if not p1.props.isPortrait then
		_UDim2 = UDim2.fromScale(ConstantsModule.LandscapeNavWidth, 1)
		_UDim2_1 = UDim2.fromOffset(0, 0)
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromScale(0, 0),
		Size = if IsVRAppBuildFunction() then UDim2.fromScale(1, 1) else SafeAreaSize,
		ZIndex = p1.props.ZIndex
	}, {
		WidthFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = _UDim2,
			Position = _UDim2_1,
			[RoactModule.Change.AbsoluteSize] = p1.props.onAbsoluteSizeChanged,
			[RoactModule.Change.AbsolutePosition] = p1.props.onAbsolutePositionChanged
		}, p1.props[RoactModule.Children])
	})
end

return RoactRoduxModule.connect(function(p1, _)
	-- upvalues: SelectIsPortraitModule (copy)
	return {
		globalGuiInset = p1.GlobalGuiInset,
		screenSize = p1.ScreenSize,
		isPortrait = SelectIsPortraitModule(p1)
	}
end, nil)(NavOverlayContainer)