local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local educationalTooltip = foundationModule.EducationalTooltip
local icon = foundationModule.Icon
local loading = foundationModule.Loading
local text = foundationModule.Text
local view = foundationModule.View
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useLocalization = localizationModule.Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local useCreationController = require(momentsCreation.CreationController).useCreationController
local _ = require(momentsCreation.Types.CreationFlowTypes)

local function VoiceCoachmark(p0) --[[ line: 63 ]]
	-- upvalues: useCreationController (ref), reactModule (ref), educationalTooltip (ref), foundationModule (ref)
	local var6 = useCreationController()
	local var7, var8 = reactModule.useState(function() --[[ line: 70 ]]
		-- upvalues: var6 (ref)
		return not var6.getVoiceCoachmarkDismissed(false)
	end)
	
	return if var7 then reactModule.createElement(educationalTooltip, {
		isOpen = true,
		LayoutOrder = p0.layoutOrder,
		onClose = function() --[[ line: 81 ]]
			-- upvalues: var6 (ref), var8 (ref)
			var6.dismissVoiceCoachmark()
			var8(false)
		end,
		side = foundationModule.Enums.PopoverSide.Bottom,
		align = foundationModule.Enums.PopoverAlign.End,
		title = p0.title,
		text = p0.text
	}, p0.children) else p0.children
end

return function(p1) --[[ line: 92 ]]
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useLocalization (ref), reactModule (ref), view (ref), getFFlagEnableMomentTextGeneration (ref), loading (ref), foundationModule (ref), icon (ref), text (ref), VoiceCoachmark (ref), gradientBackdrop (ref)
	local var9 = useDeviceInsets()
	local var10 = useTokens()
	local isLoadingMap = p1.isLoadingMap
	local isDisabledMap = p1.isDisabledMap
	local var11 = var10.Size.Size_600 / var10.Size.Size_1200
	local t = {}
	
	for i, v in p1.tools do
		t[v.cta.localizationKey] = v.cta.localizationKey
	end
	local var13 = useLocalization(t)
	local var14, var15 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var16 = reactModule.useCallback(function(p2) --[[ line: 113 ]]
		-- upvalues: var15 (ref)
		var15(UDim2.new(0, 1.5 * p2.AbsoluteSize.X, 1, 0))
	end, {})
	local t_1 = {}
	local coachmark = p1.coachmark
	
	for i_1, v_1 in p1.tools do
		local kind = v_1.kind
		local var18 = isLoadingMap ~= nil and isLoadingMap[kind] == true
		local var19 = reactModule.createElement(view, {
			tag = "row align-x-right align-y-center gap-medium auto-xy padding-xsmall radius-medium",
			LayoutOrder = v_1.cta.order or i_1,
			onActivated = if var18 then nil elseif isDisabledMap ~= nil and isDisabledMap[kind] == true then if p1.onDisabledToolActivated ~= nil then nil else function() --[[ line: 132 ]]
				-- upvalues: p1 (ref), kind (ref)
				p1.onDisabledToolActivated(kind)
			end else function() --[[ line: 136 ]]
				-- upvalues: p1 (ref), kind (ref)
				p1.onToolSelected(kind)
			end
		}, {
			Icon = if var18 then if getFFlagEnableMomentTextGeneration() then reactModule.createElement(view, { LayoutOrder = 2, tag = "auto-xy", scale = var11 }, {
				Loading = reactModule.createElement(loading, { size = foundationModule.Enums.IconSize.Large })
			}) else reactModule.createElement(loading, {
				LayoutOrder = 2,
				size = foundationModule.Enums.IconSize.Small
			}) else reactModule.createElement(icon, {
				LayoutOrder = 2,
				name = v_1.cta.icon,
				size = foundationModule.Enums.IconSize.Large
			}),
			Text = if p1.showText then reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-label-medium content-emphasis",
				Text = var13[v_1.cta.localizationKey]
			}) else nil
		})
		
		if coachmark == nil or coachmark.kind ~= kind then
			t_1["Tool_" .. kind] = var19
		else
			t_1["Tool_" .. kind] = reactModule.createElement(VoiceCoachmark, {
				layoutOrder = v_1.cta.order or i_1,
				title = coachmark.title,
				text = coachmark.text
			}, var19)
		end
	end
	return reactModule.createElement(view, {
		tag = "position-center-right anchor-center-right size-0-full auto-x",
		ZIndex = p1.zIndex
	}, {
		GradientBackdrop = reactModule.createElement(gradientBackdrop, {
			rotation = 180,
			color3 = var10.Color.Common.Scrim.Color3,
			size = var14
		}),
		EditCTABar = reactModule.createElement(view, {
			tag = "col align-x-right align-y-center gap-small position-center-right anchor-center-right size-0-full auto-x",
			onAbsoluteSizeChanged = var16,
			padding = {
				left = UDim.new(0, var10.Padding.Large),
				right = UDim.new(0, var9.right + var10.Padding.Large)
			}
		}, t_1)
	})
end