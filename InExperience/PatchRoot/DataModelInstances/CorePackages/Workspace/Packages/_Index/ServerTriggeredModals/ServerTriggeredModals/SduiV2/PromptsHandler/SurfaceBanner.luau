local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local appNavBarModule = require(parent.AppNavBar)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local signalsReactModule = require(parent.SignalsReact)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local view = foundationModule.View
local sduiFeatureEntryPoint = sduiSharedUtilitiesModule.SduiFeatureEntryPoint
local useComponentConfig = sduiSharedUtilitiesModule.useComponentConfig
local useStatusBarHeight = robloxAppHooksModule.useStatusBarHeight
local useTopBarHeight = robloxAppHooksModule.useTopBarHeight
local visibilityControl = appNavBarModule.VisibilityControl

local function noopGetter()
	return nil
end

return reactModule.memo(function(p0)
	-- upvalues: useStatusBarHeight (ref), useTopBarHeight (ref), reactModule (ref), visibilityControl (ref), useComponentConfig (ref), noopGetter (ref), signalsReactModule (ref), view (ref), sduiFeatureEntryPoint (ref)
	local var7 = useStatusBarHeight()
	local var8 = useTopBarHeight()
	local var9, var10 = reactModule.useState(0)
	local headerBinding = visibilityControl.getHeaderBinding()
	local var12 = p0.identifier ~= nil
	local var13 = if var12 then useComponentConfig(p0.configKey, p0.identifier) else nil
	local var14 = if var13 and var13.props then var13.props.backgroundStyle else nil
	local var15 = signalsReactModule.useSignalState(if var13 and var13.propSignals and var13.propSignals.backgroundStyle then var13.propSignals.backgroundStyle else noopGetter)
	local var16 = if var14 ~= nil then if var15 ~= nil then nil else var15.data else var14
	local var17 = headerBinding:map(function(p1)
		-- upvalues: var7 (ref), var8 (ref)
		return UDim2.new(0, 0, 0, math.max(var7, p1 * var8))
	end)
	local surfaceBannerContent = p0.surfaceBannerContent
	
	return reactModule.createElement(view, { tag = "size-full" }, {
		Content = if surfaceBannerContent then reactModule.cloneElement(surfaceBannerContent, {
			canvasTopPadding = (surfaceBannerContent and (surfaceBannerContent.props and (surfaceBannerContent.props.canvasTopPadding or 0))) + var9
		}) else nil,
		Filler = if var12 then reactModule.createElement(view, {
			ZIndex = 2,
			backgroundStyle = var16,
			AnchorPoint = Vector2.new(0, 1),
			Position = var17,
			Size = headerBinding:map(function(p2)
				-- upvalues: var7 (ref), var8 (ref)
				return UDim2.new(1, 0, 0, math.max(0, var7 - p2 * var8))
			end)
		}) else nil,
		Banner = reactModule.createElement(view, {
			ZIndex = 2,
			Position = var17,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			onAbsoluteSizeChanged = function(value)
				-- upvalues: var10 (ref)
				var10(value.AbsoluteSize.Y)
			end
		}, {
			SurfaceBanner = if var12 then reactModule.createElement(sduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				configKey = p0.configKey,
				identifier = p0.identifier,
				appPage = p0.appPage
			}) else nil
		})
	})
end)