local Parent = script:FindFirstAncestor("AppBlox").Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local GetSafeAreaSizeFunction = require(Parent.InputUi).getSafeAreaSize
local IsVRAppBuildFunction = require(Parent.AppCommonLib).IsVRAppBuild
local Constants = require(Parent.AppSystemBar).Constants
local FullscreenPageWithSafeArea = RoactModule.PureComponent:extend("FullscreenPageWithSafeArea")
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local DisplayModule = require(Parent.Display)
local CryoModule = require(Parent.Cryo)
local VRAlwaysIgnoreSafeMargins = game:DefineFastFlag("VRAlwaysIgnoreSafeMargins", false)
local FFlagExtendScrollingFramesBySafeInsets = require(Parent.SharedFlags).FFlagExtendScrollingFramesBySafeInsets

function FullscreenPageWithSafeArea.render(p1)
	-- upvalues: RoactModule (copy), FFlagExtendScrollingFramesBySafeInsets (copy), GetSafeAreaSizeFunction (copy), VRAlwaysIgnoreSafeMargins (copy), IsVRAppBuildFunction (copy), Constants (copy)
	local StatusBarHeight = p1.props.statusBarHeight
	local ScreenSize = p1.props.screenSize
	local GlobalGuiInset = p1.props.globalGuiInset
	local BackgroundColor3 = p1.props.BackgroundColor3
	local BackgroundTransparency = p1.props.BackgroundTransparency
	local IncludeStatusBar = p1.props.includeStatusBar
	local IncludeBottomBar = p1.props.includeBottomBar
	local RenderFullscreenBackgroundFunction = p1.props.renderFullscreenBackground
	local Prop = p1.props[RoactModule.Children]
	local ButtonRef = p1.props.buttonRef
	local DeviceSafePadding = if FFlagExtendScrollingFramesBySafeInsets then p1.props.deviceSafePadding else nil
	
	if ScreenSize.X == 0 or ScreenSize.Y == 0 then
		return nil
	end
	local SafeAreaSize = GetSafeAreaSizeFunction(ScreenSize, GlobalGuiInset)
	local NewTop = GlobalGuiInset.top + (FFlagExtendScrollingFramesBySafeInsets and DeviceSafePadding.top or 0)
	local UseFullScalePage = if VRAlwaysIgnoreSafeMargins then p1.props.useFullScalePage or IsVRAppBuildFunction() elseif p1.props.useFullScalePage == nil then IsVRAppBuildFunction() else p1.props.useFullScalePage
	
	if IncludeStatusBar then
		SafeAreaSize = UDim2.new(0, SafeAreaSize.X.Offset, 0, SafeAreaSize.Y.Offset - StatusBarHeight)
		NewTop += StatusBarHeight
	end
	if IncludeBottomBar then
		SafeAreaSize = UDim2.new(0, SafeAreaSize.X.Offset, 0, SafeAreaSize.Y.Offset - Constants.BOTTOM_BAR_SIZE)
	end
	return RoactModule.createElement("Frame", {
		Position = if UseFullScalePage then UDim2.new(0, 0, 0, 0) else UDim2.new(0, -GlobalGuiInset.left - (FFlagExtendScrollingFramesBySafeInsets and DeviceSafePadding.left or 0), 0, -GlobalGuiInset.top - (FFlagExtendScrollingFramesBySafeInsets and DeviceSafePadding.top or 0)),
		Size = if UseFullScalePage then UDim2.new(1, 0, 1, 0) else UDim2.new(0, ScreenSize.X, 0, ScreenSize.Y),
		BackgroundColor3 = BackgroundColor3,
		BackgroundTransparency = BackgroundTransparency,
		Active = true,
		BorderSizePixel = 0,
		ClipsDescendants = not FFlagExtendScrollingFramesBySafeInsets,
		[RoactModule.Ref] = ButtonRef
	}, {
		Background = RenderFullscreenBackgroundFunction and RenderFullscreenBackgroundFunction(NewTop),
		SafeAreaFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = if UseFullScalePage then UDim2.new(0, 0, 0, 0) else UDim2.new(0, GlobalGuiInset.left + (FFlagExtendScrollingFramesBySafeInsets and DeviceSafePadding.left or 0), 0, NewTop),
			Size = if UseFullScalePage then UDim2.new(1, 0, 1, 0) else SafeAreaSize,
			ZIndex = if RenderFullscreenBackgroundFunction then 2 else 1
		}, Prop)
	})
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	return {
		statusBarHeight = p1.TopBar.statusBarHeight,
		screenSize = p1.ScreenSize,
		globalGuiInset = p1.GlobalGuiInset
	}
end)(FullscreenPageWithSafeArea)

return if FFlagExtendScrollingFramesBySafeInsets then function(p1)
	-- upvalues: UseSignalStateFunction (copy), DisplayModule (copy), CryoModule (copy), RoactModule (copy), v1 (copy)
	return RoactModule.createElement(v1, (CryoModule.Dictionary.join(p1, {
		deviceSafePadding = UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding)
	})))
end else v1