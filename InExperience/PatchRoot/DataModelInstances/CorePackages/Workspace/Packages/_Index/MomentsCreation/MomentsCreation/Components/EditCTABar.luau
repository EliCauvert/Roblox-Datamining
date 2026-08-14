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
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useLocalization = localizationModule.Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(p0) --[[ line: 48 ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useLocalization (ref), reactModule (ref), view (ref), getFFlagEnableMomentTextGeneration (ref), loading (ref), foundationModule (ref), icon (ref), text (ref), gradientBackdrop (ref)
	local var5 = useDeviceInsets()
	local var6 = useTokens()
	local isLoadingMap = p0.isLoadingMap
	local isDisabledMap = p0.isDisabledMap
	local var7 = var6.Size.Size_600 / var6.Size.Size_1200
	local t = {}
	
	for i, v in p0.tools do
		t[v.cta.localizationKey] = v.cta.localizationKey
	end
	local var9 = useLocalization(t)
	local var10, var11 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var12 = reactModule.useCallback(function(p1) --[[ line: 69 ]]
		-- upvalues: var11 (ref)
		var11(UDim2.new(0, 1.5 * p1.AbsoluteSize.X, 1, 0))
	end, {})
	local t_1 = {}
	
	for i_1, v_1 in p0.tools do
		local kind = v_1.kind
		local var14 = isLoadingMap ~= nil and isLoadingMap[kind] == true
		t_1["Tool_" .. kind] = reactModule.createElement(view, {
			tag = "row align-x-right align-y-center gap-medium auto-xy padding-xsmall radius-medium",
			LayoutOrder = v_1.cta.order or i_1,
			onActivated = if var14 then nil elseif isDisabledMap ~= nil and isDisabledMap[kind] == true then if p0.onDisabledToolActivated ~= nil then nil else function() --[[ line: 86 ]]
				-- upvalues: p0 (ref), kind (ref)
				p0.onDisabledToolActivated(kind)
			end else function() --[[ line: 90 ]]
				-- upvalues: p0 (ref), kind (ref)
				p0.onToolSelected(kind)
			end
		}, {
			Icon = if var14 then if getFFlagEnableMomentTextGeneration() then reactModule.createElement(view, { LayoutOrder = 2, tag = "auto-xy", scale = var7 }, {
				Loading = reactModule.createElement(loading, { size = foundationModule.Enums.IconSize.Large })
			}) else reactModule.createElement(loading, {
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
				Text = var9[v_1.cta.localizationKey]
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
			size = var10
		}),
		EditCTABar = reactModule.createElement(view, {
			tag = "col align-x-right align-y-center gap-small position-center-right anchor-center-right size-0-full auto-x",
			onAbsoluteSizeChanged = var12,
			padding = {
				left = UDim.new(0, var6.Padding.Large),
				right = UDim.new(0, var5.right + var6.Padding.Large)
			}
		}, t_1)
	})
end