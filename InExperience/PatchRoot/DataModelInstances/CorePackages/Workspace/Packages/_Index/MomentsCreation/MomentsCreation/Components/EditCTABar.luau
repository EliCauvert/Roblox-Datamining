local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local loading = foundationModule.Loading
local text = foundationModule.Text
local view = foundationModule.View
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useLocalization = localizationModule.Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(p0) --[[ line: 43 ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useLocalization (ref), reactModule (ref), view (ref), loading (ref), foundationModule (ref), icon (ref), text (ref), gradientBackdrop (ref)
	local var5 = useDeviceInsets()
	local var6 = useTokens()
	local t = {}
	
	for i, v in p0.tools do
		t[v.cta.localizationKey] = v.cta.localizationKey
	end
	local var8 = useLocalization(t)
	local var9, var10 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var11 = reactModule.useCallback(function(p1) --[[ line: 57 ]]
		-- upvalues: var10 (ref)
		var10(UDim2.new(0, 1.5 * p1.AbsoluteSize.X, 1, 0))
	end, {})
	local t_1 = {}
	local isLoadingMap = p0.isLoadingMap
	
	for i_1, v_1 in p0.tools do
		local kind = v_1.kind
		local var13 = isLoadingMap ~= nil and isLoadingMap[kind] == true
		t_1["Tool_" .. kind] = reactModule.createElement(view, {
			tag = "row align-x-right align-y-center gap-medium auto-xy padding-xsmall radius-medium",
			LayoutOrder = v_1.cta.order or i_1,
			onActivated = if var13 then nil else function() --[[ line: 73 ]]
				-- upvalues: p0 (ref), kind (ref)
				p0.onToolSelected(kind)
			end
		}, {
			Icon = if var13 then reactModule.createElement(loading, {
				LayoutOrder = 2,
				size = foundationModule.Enums.IconSize.Small
			}) else reactModule.createElement(icon, {
				LayoutOrder = 2,
				name = v_1.cta.icon,
				size = foundationModule.Enums.IconSize.Large
			}),
			Text = if p0.showText then reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-label-medium content-emphasis",
				Text = var8[v_1.cta.localizationKey]
			}) else nil
		})
	end
	return reactModule.createElement(view, {
		tag = "position-center-right anchor-center-right size-0-full auto-x",
		ZIndex = p0.zIndex
	}, {
		GradientBackdrop = reactModule.createElement(gradientBackdrop, {
			rotation = 180,
			color3 = var6.Color.Common.Scrim.Color3,
			size = var9
		}),
		EditCTABar = reactModule.createElement(view, {
			tag = "col align-x-right align-y-center gap-small position-center-right anchor-center-right size-0-full auto-x",
			onAbsoluteSizeChanged = var11,
			padding = {
				left = UDim.new(0, var6.Padding.Large),
				right = UDim.new(0, var5.right + var6.Padding.Large)
			}
		}, t_1)
	})
end