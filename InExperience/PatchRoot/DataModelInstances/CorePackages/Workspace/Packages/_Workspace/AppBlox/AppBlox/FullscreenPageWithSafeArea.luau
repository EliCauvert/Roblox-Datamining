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

function fullscreenPageWithSafeArea.render(p1)
	-- upvalues: roactModule (ref), fFlagExtendScrollingFramesBySafeInsets (ref), getSafeAreaSize (ref), isVRAppBuild (ref), constants (ref)
	local statusBarHeight = p1.props.statusBarHeight
	local screenSize = p1.props.screenSize
	local globalGuiInset = p1.props.globalGuiInset
	local backgroundColor3 = p1.props.BackgroundColor3
	local backgroundTransparency = p1.props.BackgroundTransparency
	local includeStatusBar = p1.props.includeStatusBar
	local includeBottomBar = p1.props.includeBottomBar
	local renderFullscreenBackground = p1.props.renderFullscreenBackground
	local children = p1.props[roactModule.Children]
	local buttonRef = p1.props.buttonRef
	local var1 = if fFlagExtendScrollingFramesBySafeInsets then p1.props.deviceSafePadding else nil
	
	if screenSize.X == 0 or screenSize.Y == 0 then
		return nil
	end
	local var2 = getSafeAreaSize(screenSize, globalGuiInset)
	local var3 = globalGuiInset.top + (if fFlagExtendScrollingFramesBySafeInsets then var1.top else 0)
	local useFullScalePage = p1.props.useFullScalePage or isVRAppBuild()
	
	if includeStatusBar then
		var2 = UDim2.new(0, var2.X.Offset, 0, var2.Y.Offset - statusBarHeight)
		var3 += statusBarHeight
	end
	if includeBottomBar then
		var2 = UDim2.new(0, var2.X.Offset, 0, var2.Y.Offset - constants.BOTTOM_BAR_SIZE)
	end
	return roactModule.createElement("Frame", {
		Position = if useFullScalePage then UDim2.new(0, 0, 0, 0) else UDim2.new(0, (-globalGuiInset.left) - (if fFlagExtendScrollingFramesBySafeInsets then var1.left else 0), 0, (-globalGuiInset.top) - (if fFlagExtendScrollingFramesBySafeInsets then var1.top else 0)),
		Size = if useFullScalePage then UDim2.new(1, 0, 1, 0) else UDim2.new(0, screenSize.X, 0, screenSize.Y),
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = backgroundTransparency,
		Active = true,
		BorderSizePixel = 0,
		ClipsDescendants = if fFlagExtendScrollingFramesBySafeInsets then false else true,
		[roactModule.Ref] = buttonRef
	}, {
		Background = renderFullscreenBackground and renderFullscreenBackground(var3),
		SafeAreaFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = if useFullScalePage then UDim2.new(0, 0, 0, 0) else UDim2.new(0, globalGuiInset.left + (if fFlagExtendScrollingFramesBySafeInsets then var1.left else 0), 0, var3),
			Size = if useFullScalePage then UDim2.new(1, 0, 1, 0) else var2,
			ZIndex = if renderFullscreenBackground then 2 else 1
		}, children)
	})
end

local var1 = roactRoduxModule.connect(function(p1, _)
	return {
		statusBarHeight = p1.TopBar.statusBarHeight,
		screenSize = p1.ScreenSize,
		globalGuiInset = p1.GlobalGuiInset
	}
end)(fullscreenPageWithSafeArea)

return if fFlagExtendScrollingFramesBySafeInsets then function(p1)
	-- upvalues: useSignalState (ref), displayModule (ref), cryoModule (ref), roactModule (ref), var1 (ref)
	return roactModule.createElement(var1, cryoModule.Dictionary.join(p1, {
		deviceSafePadding = useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding)
	}))
end else var1