local parent = script:FindFirstAncestor("AppBlox").Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local getSafeAreaSize = require(parent.InputUi).getSafeAreaSize
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild
local constants = require(parent.AppSystemBar).Constants
local fullscreenPageWithSafeArea = roactModule.PureComponent:extend("FullscreenPageWithSafeArea")
local useSignalState = require(parent.SignalsReact).useSignalState
local displayModule = require(parent.Display)
local cryoModule = require(parent.Cryo)
local fFlagExtendScrollingFramesBySafeInsets = require(parent.SharedFlags).FFlagExtendScrollingFramesBySafeInsets

function fullscreenPageWithSafeArea.render(p0)
	-- upvalues: roactModule (ref), fFlagExtendScrollingFramesBySafeInsets (ref), getSafeAreaSize (ref), isVRAppBuild (ref), constants (ref)
	local statusBarHeight = p0.props.statusBarHeight
	local screenSize = p0.props.screenSize
	local globalGuiInset = p0.props.globalGuiInset
	local backgroundColor3 = p0.props.BackgroundColor3
	local backgroundTransparency = p0.props.BackgroundTransparency
	local includeStatusBar = p0.props.includeStatusBar
	local includeBottomBar = p0.props.includeBottomBar
	local renderFullscreenBackground = p0.props.renderFullscreenBackground
	local children = p0.props[roactModule.Children]
	local buttonRef = p0.props.buttonRef
	local var6 = if fFlagExtendScrollingFramesBySafeInsets then p0.props.deviceSafePadding else nil
	
	if screenSize.X == 0 or screenSize.Y == 0 then
		return nil
	end
	local var7 = getSafeAreaSize(screenSize, globalGuiInset)
	local var8 = globalGuiInset.top + (if fFlagExtendScrollingFramesBySafeInsets then var6.top else 0)
	local useFullScalePage = p0.props.useFullScalePage or isVRAppBuild()
	
	if includeStatusBar then
		var7 = UDim2.new(0, var7.X.Offset, 0, var7.Y.Offset - statusBarHeight)
		var8 += statusBarHeight
	end
	if includeBottomBar then
		var7 = UDim2.new(0, var7.X.Offset, 0, var7.Y.Offset - constants.BOTTOM_BAR_SIZE)
	end
	return roactModule.createElement("Frame", {
		Position = if useFullScalePage then UDim2.new(0, 0, 0, 0) else UDim2.new(0, (-globalGuiInset.left) - (if fFlagExtendScrollingFramesBySafeInsets then var6.left else 0), 0, (-globalGuiInset.top) - (if fFlagExtendScrollingFramesBySafeInsets then var6.top else 0)),
		Size = if useFullScalePage then UDim2.new(1, 0, 1, 0) else UDim2.new(0, screenSize.X, 0, screenSize.Y),
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = backgroundTransparency,
		Active = true,
		BorderSizePixel = 0,
		ClipsDescendants = if fFlagExtendScrollingFramesBySafeInsets then false else true,
		[roactModule.Ref] = buttonRef
	}, {
		Background = renderFullscreenBackground and renderFullscreenBackground(var8),
		SafeAreaFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = if useFullScalePage then UDim2.new(0, 0, 0, 0) else UDim2.new(0, globalGuiInset.left + (if fFlagExtendScrollingFramesBySafeInsets then var6.left else 0), 0, var8),
			Size = if useFullScalePage then UDim2.new(1, 0, 1, 0) else var7,
			ZIndex = if renderFullscreenBackground then 2 else 1
		}, children)
	})
end

local var5 = roactRoduxModule.connect(function(p1, _)
	return {
		statusBarHeight = p1.TopBar.statusBarHeight,
		screenSize = p1.ScreenSize,
		globalGuiInset = p1.GlobalGuiInset
	}
end)(fullscreenPageWithSafeArea)

return if fFlagExtendScrollingFramesBySafeInsets then function(p2)
	-- upvalues: useSignalState (ref), displayModule (ref), cryoModule (ref), roactModule (ref), var5 (ref)
	return roactModule.createElement(var5, cryoModule.Dictionary.join(p2, {
		deviceSafePadding = useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding)
	}))
end else var5