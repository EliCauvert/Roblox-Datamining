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

return reactModule.memo(function(p1)
	-- upvalues: useStatusBarHeight (ref), useTopBarHeight (ref), reactModule (ref), visibilityControl (ref), useComponentConfig (ref), noopGetter (ref), signalsReactModule (ref), view (ref), sduiFeatureEntryPoint (ref)
	local var1 = useStatusBarHeight()
	local var2 = useTopBarHeight()
	local var3, var4 = reactModule.useState(0)
	local headerBinding = visibilityControl.getHeaderBinding()
	local var5 = p1.identifier ~= nil
	local var6 = if var5 then useComponentConfig(p1.configKey, p1.identifier) else nil
	local var7 = if var6 and var6.props then var6.props.backgroundStyle else nil
	local var8 = signalsReactModule.useSignalState(if var6 and var6.propSignals and var6.propSignals.backgroundStyle then var6.propSignals.backgroundStyle else noopGetter)
	local var9 = if var7 ~= nil then if var8 ~= nil then nil else var8.data else var7
	local var10 = headerBinding:map(function(p2)
		-- upvalues: var1 (ref), var2 (ref)
		return UDim2.new(0, 0, 0, math.max(var1, p2 * var2))
	end)
	local surfaceBannerContent = p1.surfaceBannerContent
	
	return reactModule.createElement(view, { tag = "size-full" }, {
		Content = if surfaceBannerContent then reactModule.cloneElement(surfaceBannerContent, {
			canvasTopPadding = (surfaceBannerContent and (surfaceBannerContent.props and (surfaceBannerContent.props.canvasTopPadding or 0))) + var3
		}) else nil,
		Filler = if var5 then reactModule.createElement(view, {
			ZIndex = 2,
			backgroundStyle = var9,
			AnchorPoint = Vector2.new(0, 1),
			Position = var10,
			Size = headerBinding:map(function(p2)
				-- upvalues: var1 (ref), var2 (ref)
				return UDim2.new(1, 0, 0, math.max(0, var1 - p2 * var2))
			end)
		}) else nil,
		Banner = reactModule.createElement(view, {
			ZIndex = 2,
			Position = var10,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			onAbsoluteSizeChanged = function(value)
				-- upvalues: var4 (ref)
				var4(value.AbsoluteSize.Y)
			end
		}, {
			SurfaceBanner = if var5 then reactModule.createElement(sduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				configKey = p1.configKey,
				identifier = p1.identifier,
				appPage = p1.appPage
			}) else nil
		})
	})
end)