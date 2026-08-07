local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local text = foundationModule.Text
local view = foundationModule.View
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useTokens = foundationModule.Hooks.useTokens
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState
local reaction = momentsCommonModule.Components.Reaction
local reactionSize = momentsCommonModule.Enums.ReactionSize
local momentContextModule = require(script.Parent.Parent.Parent.MomentContext)
local reactionsSheetModule = require(moments.Components.ReactionsSheet)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)

local function _(p0) --[[ line: 46 | named "formatCount" ]]
	return if p0 == nil then "" elseif p0 >= 1000000 then string.format("%.1fM", p0 / 1000000) elseif p0 >= 1000 then string.format("%.1fK", p0 / 1000) else tostring(p0)
end

return reactModule.memo(function(p1) --[[ line: 58 | named "Reactions" ]]
	-- upvalues: useTokens (ref), momentContextModule (ref), reactModule (ref), useSignalBinding (ref), useSignalState (ref), getColorStyleWithTransparencyModule (ref), reaction (ref), reactionSize (ref), view (ref), stateLayerAffordance (ref), text (ref), reactionsSheetModule (ref)
	local var8 = useTokens()
	local var9 = momentContextModule.useMoment()
	local var10, var11 = reactModule.useState(false)
	local var12 = useSignalBinding(var9.store.getReactionCount)
	local var13 = useSignalState(var9.store.getIndividualReactionCounts)
	local animationRatio = var9.animationRatio
	local var14 = animationRatio:map(function(p2) --[[ line: 71 ]]
		-- upvalues: getColorStyleWithTransparencyModule (copy), var8 (ref)
		return getColorStyleWithTransparencyModule(var8.Color.Content.Emphasis, p2)
	end)
	local var15 = reactModule.useCallback(function() --[[ line: 75 ]]
		-- upvalues: var11 (ref)
		var11(true)
	end, {})
	local var16 = reactModule.useCallback(function() --[[ line: 79 ]]
		-- upvalues: var11 (ref)
		var11(false)
	end, {})
	local t = {}
	
	for i = 1, math.min(3, #var13) do
		t["Reaction" .. i] = reactModule.createElement(reaction, {
			LayoutOrder = i,
			reactionType = var13[i].reaction,
			size = reactionSize.Small,
			imageStyle = var14
		})
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		ReactionsLine = reactModule.createElement(view, {
			tag = "row align-x-left align-y-center gap-small auto-xy",
			LayoutOrder = p1.LayoutOrder,
			onActivated = var15,
			stateLayer = { affordance = stateLayerAffordance.None },
			Visible = var12:map(function(p3) --[[ line: 102 ]]
				return p3 ~= nil
			end)
		}, {
			Facepile = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row align-x-left align-y-center gap-xxsmall auto-xy"
			}, t),
			Count = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium text-align-x-left text-align-y-center content-default",
				Text = var12:map(function(p4) --[[ line: 114 ]]
					return `{if p4 == nil then "" elseif p4 >= 1000000 then string.format("%.1fM", p4 / 1000000) elseif p4 >= 1000 then string.format("%.1fK", p4 / 1000) else tostring(p4)} reactions`
				end),
				textStyle = animationRatio:map(function(p5) --[[ line: 117 ]]
					-- upvalues: getColorStyleWithTransparencyModule (copy), var8 (ref)
					return getColorStyleWithTransparencyModule(var8.Color.Content.Default, p5)
				end)
			})
		}),
		Modal = if var10 then reactModule.createElement(reactionsSheetModule, { reactionCounts = var13, onClose = var16 }) else nil
	})
end)