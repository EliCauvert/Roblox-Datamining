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

local function VoiceCoachmark(p1)
	-- upvalues: useCreationController (ref), reactModule (ref), educationalTooltip (ref), foundationModule (ref)
	local var1 = useCreationController()
	local var2, var3 = reactModule.useState(function()
		-- upvalues: var1 (ref)
		return not var1.getVoiceCoachmarkDismissed(false)
	end)
	
	return if var2 then reactModule.createElement(educationalTooltip, {
		isOpen = true,
		LayoutOrder = p1.layoutOrder,
		onClose = function()
			-- upvalues: var1 (ref), var3 (ref)
			var1.dismissVoiceCoachmark()
			var3(false)
		end,
		side = foundationModule.Enums.PopoverSide.Bottom,
		align = foundationModule.Enums.PopoverAlign.End,
		title = p1.title,
		text = p1.text
	}, p1.children) else p1.children
end

return function(p1)
	-- upvalues: useDeviceInsets (ref), useTokens (ref), useLocalization (ref), reactModule (ref), view (ref), getFFlagEnableMomentTextGeneration (ref), loading (ref), foundationModule (ref), icon (ref), text (ref), VoiceCoachmark (ref), gradientBackdrop (ref)
	local var1 = useDeviceInsets()
	local var2 = useTokens()
	local isLoadingMap = p1.isLoadingMap
	local isDisabledMap = p1.isDisabledMap
	local var3 = var2.Size.Size_600 / var2.Size.Size_1200
	local t = {}
	
	for i, v in p1.tools do
		t[v.cta.localizationKey] = v.cta.localizationKey
	end
	local var4 = useLocalization(t)
	local var5, var6 = reactModule.useBinding(UDim2.fromScale(1, 0))
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref)
		var6(UDim2.new(0, 1.5 * p2.AbsoluteSize.X, 1, 0))
	end, {})
	local t_1 = {}
	local coachmark = p1.coachmark
	
	for i_1, v_1 in p1.tools do
		local kind = v_1.kind
		local var8 = isLoadingMap ~= nil and isLoadingMap[kind] == true
		local var9 = reactModule.createElement(view, {
			tag = "row align-x-right align-y-center gap-medium auto-xy padding-xsmall radius-medium",
			LayoutOrder = v_1.cta.order or i_1,
			onActivated = if var8 then nil elseif isDisabledMap ~= nil and isDisabledMap[kind] == true then if p1.onDisabledToolActivated ~= nil then nil else function()
				-- upvalues: p1 (ref), kind (ref)
				p1.onDisabledToolActivated(kind)
			end else function()
				-- upvalues: p1 (ref), kind (ref)
				p1.onToolSelected(kind)
			end
		}, {
			Icon = if var8 then if getFFlagEnableMomentTextGeneration() then reactModule.createElement(view, { LayoutOrder = 2, tag = "auto-xy", scale = var3 }, {
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
				Text = var4[v_1.cta.localizationKey]
			}) else nil
		})
		
		if coachmark == nil or coachmark.kind ~= kind then
			t_1["Tool_" .. kind] = var9
		else
			t_1["Tool_" .. kind] = reactModule.createElement(VoiceCoachmark, {
				layoutOrder = v_1.cta.order or i_1,
				title = coachmark.title,
				text = coachmark.text
			}, var9)
		end
	end
	return reactModule.createElement(view, {
		tag = "position-center-right anchor-center-right size-0-full auto-x",
		ZIndex = p1.zIndex
	}, {
		GradientBackdrop = reactModule.createElement(gradientBackdrop, {
			rotation = 180,
			color3 = var2.Color.Common.Scrim.Color3,
			size = var5
		}),
		EditCTABar = reactModule.createElement(view, {
			tag = "col align-x-right align-y-center gap-small position-center-right anchor-center-right size-0-full auto-x",
			onAbsoluteSizeChanged = var7,
			padding = {
				left = UDim.new(0, var2.Padding.Large),
				right = UDim.new(0, var1.right + var2.Padding.Large)
			}
		}, t_1)
	})
end