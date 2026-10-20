local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SignalsReactModule = require(Parent.SignalsReact)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local View = require(Parent.Foundation).View
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local UseComponentConfigFunction = SduiSharedUtilitiesModule.useComponentConfig
local UseStatusBarHeightFunction = RobloxAppHooksModule.useStatusBarHeight
local UseTopBarHeightFunction = RobloxAppHooksModule.useTopBarHeight
local VisibilityControl = require(Parent.AppNavBar).VisibilityControl
local FFlagPromptsActionEventLoggingModule = require(ServerTriggeredModals.Flags.FFlagPromptsActionEventLogging)

local function noopGetter()
	return nil
end

return ReactModule.memo(function(p1)
	-- upvalues: UseStatusBarHeightFunction (copy), UseTopBarHeightFunction (copy), ReactModule (copy), VisibilityControl (copy), UseComponentConfigFunction (copy), noopGetter (copy), SignalsReactModule (copy), View (copy), SduiFeatureEntryPoint (copy), FFlagPromptsActionEventLoggingModule (copy)
	local UseStatusBarHeightResult = UseStatusBarHeightFunction()
	local UseTopBarHeightResult = UseTopBarHeightFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local HeaderBinding = VisibilityControl.getHeaderBinding()
	local HasIdentifier = p1.identifier ~= nil
	local UseComponentConfigResult = UseComponentConfigFunction(p1.configKey, p1.identifier)
	local UseComponentConfigResult1 = if HasIdentifier then UseComponentConfigResult else nil
	local BackgroundStyle = if UseComponentConfigResult1 and UseComponentConfigResult1.props then UseComponentConfigResult1.props.backgroundStyle else nil
	local UseSignalStateResult = SignalsReactModule.useSignalState(if UseComponentConfigResult1 and UseComponentConfigResult1.propSignals and UseComponentConfigResult1.propSignals.backgroundStyle then UseComponentConfigResult1.propSignals.backgroundStyle else noopGetter)
	local Data = if BackgroundStyle == nil then if UseSignalStateResult == nil then nil else UseSignalStateResult.data else BackgroundStyle
	local MapResult = HeaderBinding:map(function(p2): UDim2
		-- upvalues: UseStatusBarHeightResult (copy), UseTopBarHeightResult (copy)
		return UDim2.new(0, 0, 0, (math.max(UseStatusBarHeightResult, p2 * UseTopBarHeightResult)))
	end)
	local MapResult1 = HeaderBinding:map(function(p2): UDim2
		-- upvalues: UseStatusBarHeightResult (copy), UseTopBarHeightResult (copy)
		return UDim2.new(1, 0, 0, (math.max(0, UseStatusBarHeightResult - p2 * UseTopBarHeightResult)))
	end)
	local SurfaceBannerContent = p1.surfaceBannerContent
	local CanvasTopPadding = SurfaceBannerContent and SurfaceBannerContent.props and SurfaceBannerContent.props.canvasTopPadding or 0
	
	return ReactModule.createElement(View, { tag = "size-full" }, {
		Content = if SurfaceBannerContent then ReactModule.cloneElement(SurfaceBannerContent, { canvasTopPadding = CanvasTopPadding + UseStateResult }) else nil,
		Filler = if HasIdentifier then ReactModule.createElement(View, {
			ZIndex = 2,
			backgroundStyle = Data,
			AnchorPoint = Vector2.new(0, 1),
			Position = MapResult,
			Size = MapResult1
		}) else nil,
		Banner = ReactModule.createElement(View, {
			ZIndex = 2,
			Position = MapResult,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			onAbsoluteSizeChanged = function(Frame)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(Frame.AbsoluteSize.Y)
			end
		}, {
			SurfaceBanner = if HasIdentifier then ReactModule.createElement(SduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				configKey = p1.configKey,
				identifier = p1.identifier,
				appPage = p1.appPage,
				additionalAnalyticsData = if FFlagPromptsActionEventLoggingModule then {
					promptInstanceId = if p1.identifier then p1.identifier else nil
				} else nil
			}) else nil
		})
	})
end)