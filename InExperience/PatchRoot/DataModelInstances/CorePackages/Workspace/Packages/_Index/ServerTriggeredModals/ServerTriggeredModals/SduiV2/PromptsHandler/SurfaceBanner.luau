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

local function noopGetter() --[[ line: 27 ]]
	return nil
end

return reactModule.memo(function(p0) --[[ line: 31 | named "SurfaceBanner" ]]
	-- upvalues: useStatusBarHeight (ref), useTopBarHeight (ref), reactModule (ref), visibilityControl (ref), useComponentConfig (ref), noopGetter (ref), signalsReactModule (ref), view (ref), sduiFeatureEntryPoint (ref)
	local var7 = useStatusBarHeight()
	local var8 = useTopBarHeight()
	local var9, var10 = reactModule.useState(0)
	local headerBinding = visibilityControl.getHeaderBinding()
	local var12 = useComponentConfig(p0.configKey, p0.identifier)
	local var13 = if var12 and var12.props then var12.props.backgroundStyle else nil
	local var14 = signalsReactModule.useSignalState(if var12 and var12.propSignals and var12.propSignals.backgroundStyle then var12.propSignals.backgroundStyle else noopGetter)
	local var15 = if var13 ~= nil then if var14 ~= nil then nil else var14.data else var13
	local var16 = headerBinding:map(function(p1) --[[ line: 63 ]]
		-- upvalues: var7 (ref), var8 (ref)
		return UDim2.new(0, 0, 0, math.max(var7, p1 * var8))
	end)
	local surfaceBannerContent = p0.surfaceBannerContent
	
	return reactModule.createElement(view, { tag = "size-full" }, {
		Content = if surfaceBannerContent then reactModule.cloneElement(surfaceBannerContent, {
			canvasTopPadding = (surfaceBannerContent and (surfaceBannerContent.props and (surfaceBannerContent.props.canvasTopPadding or 0))) + var9
		}) else nil,
		Filler = reactModule.createElement(view, {
			ZIndex = 2,
			backgroundStyle = var15,
			AnchorPoint = Vector2.new(0, 1),
			Position = var16,
			Size = headerBinding:map(function(p2) --[[ line: 73 ]]
				-- upvalues: var7 (ref), var8 (ref)
				return UDim2.new(1, 0, 0, math.max(0, var7 - p2 * var8))
			end)
		}),
		Banner = reactModule.createElement(view, {
			ZIndex = 2,
			Position = var16,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			onAbsoluteSizeChanged = function(value) --[[ line: 99 ]]
				-- upvalues: var10 (ref)
				var10(value.AbsoluteSize.Y)
			end
		}, {
			SurfaceBanner = reactModule.createElement(sduiFeatureEntryPoint, {
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				configKey = p0.configKey,
				identifier = p0.identifier,
				appPage = p0.appPage
			})
		})
	})
end)