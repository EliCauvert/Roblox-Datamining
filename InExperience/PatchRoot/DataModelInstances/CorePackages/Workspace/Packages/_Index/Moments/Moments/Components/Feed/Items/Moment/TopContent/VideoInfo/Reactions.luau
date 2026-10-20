local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local Text = FoundationModule.Text
local View = FoundationModule.View
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local UseSignalStateFunction = SignalsReactModule.useSignalState
local Reaction = MomentsCommonModule.Components.Reaction
local ReactionSize = MomentsCommonModule.Enums.ReactionSize
local MomentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local ReactionsSheetModule = require(Moments.Components.ReactionsSheet)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)

local function _(p1: number): string
	return if p1 == nil then "" elseif p1 >= 1000000 then string.format("%.1fM", p1 / 1000000) elseif p1 >= 1000 then string.format("%.1fK", p1 / 1000) else tostring(p1)
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), MomentContextModule (copy), ReactModule (copy), UseSignalBindingFunction (copy), UseSignalStateFunction (copy), GetColorStyleWithTransparencyModule (copy), Reaction (copy), ReactionSize (copy), View (copy), StateLayerAffordance (copy), Text (copy), ReactionsSheetModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMomentResult = MomentContextModule.useMoment()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseSignalBindingResult = UseSignalBindingFunction(UseMomentResult.store.getReactionCount)
	local UseSignalStateResult = UseSignalStateFunction(UseMomentResult.store.getIndividualReactionCounts)
	local AnimationRatio = UseMomentResult.animationRatio
	local MapResult = AnimationRatio:map(function(p1)
		-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
		return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Content.Emphasis, p1)
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local Elements = {}
	
	for i = 1, math.min(3, #UseSignalStateResult) do
		Elements["Reaction" .. i] = ReactModule.createElement(Reaction, {
			LayoutOrder = i,
			reactionType = UseSignalStateResult[i].reaction,
			size = ReactionSize.Small,
			imageStyle = MapResult
		})
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		ReactionsLine = ReactModule.createElement(View, {
			tag = "row align-x-left align-y-center gap-small auto-xy",
			LayoutOrder = Frame.LayoutOrder,
			onActivated = UseResult,
			stateLayer = { affordance = StateLayerAffordance.None },
			Visible = UseSignalBindingResult:map(function(p1): boolean
				return p1 ~= nil
			end)
		}, {
			Facepile = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-x-left align-y-center gap-xxsmall auto-xy"
			}, Elements),
			Count = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium text-align-x-left text-align-y-center content-default",
				Text = UseSignalBindingResult:map(function(p1: number): string
					return `{if p1 == nil then "" elseif p1 >= 1000000 then string.format("%.1fM", p1 / 1000000) elseif p1 >= 1000 then string.format("%.1fK", p1 / 1000) else tostring(p1)} reactions`
				end),
				textStyle = AnimationRatio:map(function(p2)
					-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
					return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Content.Default, p2)
				end)
			})
		}),
		Modal = if UseStateResult then ReactModule.createElement(ReactionsSheetModule, {
			reactionCounts = UseSignalStateResult,
			onClose = UseResult1
		}) else nil
	})
end)