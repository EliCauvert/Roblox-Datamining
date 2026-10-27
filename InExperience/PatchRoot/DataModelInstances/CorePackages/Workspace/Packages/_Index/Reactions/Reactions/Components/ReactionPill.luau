local TweenService = game:GetService("TweenService")
local Reactions = script:FindFirstAncestor("Reactions")
local Parent = Reactions.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local ReactionModule = require(Reactions.Components.Reaction)
local ReactionSizeModule = require(Reactions.Enums.ReactionSize)
local _ = require(Reactions.Enums.ReactionType)
local AbbreviateReactionCountModule = require(Reactions.Utils.abbreviateReactionCount)
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local Text = FoundationModule.Text
local View = FoundationModule.View
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function easeOut(Alpha)
	-- upvalues: TweenService (copy)
	return TweenService:GetValue(Alpha, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
end

local function getPopScale(p1: number): number
	-- upvalues: easeOut (copy)
	return if p1 < 0.6 then math.lerp(0.88, 1.08, easeOut(p1 / 0.6)) else math.lerp(1.08, 1, easeOut((p1 - 0.6) / 0.4))
end

local function _(p1: number): number
	-- upvalues: easeOut (copy)
	return if p1 < 0.6 then math.lerp(0.55, 1, easeOut(p1 / 0.6)) else 1
end

local function CountText(p1)
	-- upvalues: UseTokensFunction (copy), ReactOtterModule (copy), ReactModule (copy), Text (copy), getPopScale (copy), easeOut (copy)
	local Default = UseTokensFunction().Color.Content.Default
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if p1.isAnimated then 0 else 1)
	ReactModule.useLayoutEffect(function()
		-- upvalues: p1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if p1.isAnimated then
			UseAnimatedBindingResult2((ReactOtterModule.ease(1, { duration = 0.24 })))
		end
	end, { p1.isAnimated })
	
	return ReactModule.createElement(Text, {
		tag = "auto-xy text-label-small content-default",
		LayoutOrder = 2,
		Text = p1.text,
		scale = if p1.isAnimated then UseAnimatedBindingResult:map(getPopScale) else nil,
		textStyle = if p1.isAnimated then UseAnimatedBindingResult:map(function(p2: number)
			-- upvalues: Default (copy), easeOut (upval)
			return {
				Color3 = Default.Color3,
				Transparency = 1 - (1 - (Default.Transparency or 0)) * (if p2 < 0.6 then math.lerp(0.55, 1, easeOut(p2 / 0.6)) else 1)
			}
		end) else nil,
		testId = p1.testId
	})
end

local function PoppingCount(p1)
	-- upvalues: UsePreferencesFunction (copy), ReactModule (copy), CountText (copy)
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(p1.count)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy), UseStateResult2 (copy)
		if UseRefResult.current ~= p1.count then
			UseRefResult.current = p1.count
			UseStateResult2(function(p2: number): number
				return p2 + 1
			end)
		end
	end, { p1.count })
	
	return ReactModule.createElement(CountText, {
		key = tostring(UseStateResult),
		text = p1.localizeCount(p1.count),
		isAnimated = UseStateResult > 0 and not ReducedMotion,
		testId = p1.testId
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), StateLayerAffordance (copy), ReactionModule (copy), ReactionSizeModule (copy), PoppingCount (copy), AbbreviateReactionCountModule (copy)
	local TestId = p1.testId or "reaction-pill"
	local Count = p1.count
	
	if Count == 0 then
		return nil
	else
		local IsIsSelected = p1.isSelected == true
		
		return ReactModule.createElement(View, {
			tag = {
				["row align-y-center gap-xsmall auto-xy padding-small stroke-standard radius-circle"] = true,
				["stroke-action-standard bg-shift-300"] = IsIsSelected,
				["stroke-default bg-surface-100"] = not IsIsSelected
			},
			stateLayer = if IsIsSelected then { affordance = StateLayerAffordance.None } else nil,
			onActivated = p1.onActivated,
			LayoutOrder = p1.layoutOrder,
			testId = TestId
		}, {
			Reaction = ReactModule.createElement(ReactionModule, {
				LayoutOrder = 1,
				reactionType = p1.reactionType,
				size = ReactionSizeModule.XSmall,
				testId = `{TestId}--reaction`
			}),
			Count = if Count == nil then nil else ReactModule.createElement(PoppingCount, {
				count = Count,
				localizeCount = p1.localizeCount or AbbreviateReactionCountModule,
				testId = `{TestId}--count`
			})
		})
	end
end)