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
local VRAlwaysIgnoreSafeMargins = game:DefineFastFlag("VRAlwaysIgnoreSafeMargins", false)
local fFlagExtendScrollingFramesBySafeInsets = require(parent.SharedFlags).FFlagExtendScrollingFramesBySafeInsets

function fullscreenPageWithSafeArea.render(p0) --[[ line: 19 ]]
	-- upvalues: roactModule (ref), fFlagExtendScrollingFramesBySafeInsets (ref), getSafeAreaSize (ref), VRAlwaysIgnoreSafeMargins (ref), isVRAppBuild (ref), constants (ref)
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
	local var7 = if fFlagExtendScrollingFramesBySafeInsets then p0.props.deviceSafePadding else nil
	
	if screenSize.X == 0 or screenSize.Y == 0 then
		return nil
	end
	local var8 = getSafeAreaSize(screenSize, globalGuiInset)
	local var9 = globalGuiInset.top + (if fFlagExtendScrollingFramesBySafeInsets then var7.top else 0)
	local var10 = if VRAlwaysIgnoreSafeMargins then p0.props.useFullScalePage or isVRAppBuild() elseif p0.props.useFullScalePage ~= nil then isVRAppBuild() else p0.props.useFullScalePage
	
	if includeStatusBar then
		var8 = UDim2.new(0, var8.X.Offset, 0, var8.Y.Offset - statusBarHeight)
		var9 += statusBarHeight
	end
	if includeBottomBar then
		var8 = UDim2.new(0, var8.X.Offset, 0, var8.Y.Offset - constants.BOTTOM_BAR_SIZE)
	end
	return roactModule.createElement("Frame", {
		Position = if var10 then UDim2.new(0, 0, 0, 0) else UDim2.new(0, (-globalGuiInset.left) - (if fFlagExtendScrollingFramesBySafeInsets then var7.left else 0), 0, (-globalGuiInset.top) - (if fFlagExtendScrollingFramesBySafeInsets then var7.top else 0)),
		Size = if var10 then UDim2.new(1, 0, 1, 0) else UDim2.new(0, screenSize.X, 0, screenSize.Y),
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = backgroundTransparency,
		Active = true,
		BorderSizePixel = 0,
		ClipsDescendants = if fFlagExtendScrollingFramesBySafeInsets then false else true,
		[roactModule.Ref] = buttonRef
	}, {
		Background = renderFullscreenBackground and renderFullscreenBackground(var9),
		SafeAreaFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = if var10 then UDim2.new(0, 0, 0, 0) else UDim2.new(0, globalGuiInset.left + (if fFlagExtendScrollingFramesBySafeInsets then var7.left else 0), 0, var9),
			Size = if var10 then UDim2.new(1, 0, 1, 0) else var8,
			ZIndex = if renderFullscreenBackground then 2 else 1
		}, children)
	})
end

local var6 = roactRoduxModule.connect(function(p1, _) --[[ line: 90 ]]
	return {
		statusBarHeight = p1.TopBar.statusBarHeight,
		screenSize = p1.ScreenSize,
		globalGuiInset = p1.GlobalGuiInset
	}
end)(fullscreenPageWithSafeArea)

return if fFlagExtendScrollingFramesBySafeInsets then function(p2) --[[ line: 99 | named "FullscreenPageWithSafeAreaFunctional" ]]
	-- upvalues: useSignalState (ref), displayModule (ref), cryoModule (ref), roactModule (ref), var6 (ref)
	return roactModule.createElement(var6, cryoModule.Dictionary.join(p2, {
		deviceSafePadding = useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding)
	}))
end else var6