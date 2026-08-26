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

local function _(p1)
	return if p1 == nil then "" elseif p1 >= 1000000 then string.format("%.1fM", p1 / 1000000) elseif p1 >= 1000 then string.format("%.1fK", p1 / 1000) else tostring(p1)
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), momentContextModule (ref), reactModule (ref), useSignalBinding (ref), useSignalState (ref), getColorStyleWithTransparencyModule (ref), reaction (ref), reactionSize (ref), view (ref), stateLayerAffordance (ref), text (ref), reactionsSheetModule (ref)
	local var1 = useTokens()
	local var2 = momentContextModule.useMoment()
	local var3, var4 = reactModule.useState(false)
	local var5 = useSignalBinding(var2.store.getReactionCount)
	local var6 = useSignalState(var2.store.getIndividualReactionCounts)
	local animationRatio = var2.animationRatio
	local var7 = animationRatio:map(function(p2)
		-- upvalues: getColorStyleWithTransparencyModule (copy), var1 (ref)
		return getColorStyleWithTransparencyModule(var1.Color.Content.Emphasis, p2)
	end)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(true)
	end, {})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(false)
	end, {})
	local t = {}
	
	for i = 1, math.min(3, #var6) do
		t["Reaction" .. i] = reactModule.createElement(reaction, {
			LayoutOrder = i,
			reactionType = var6[i].reaction,
			size = reactionSize.Small,
			imageStyle = var7
		})
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		ReactionsLine = reactModule.createElement(view, {
			tag = "row align-x-left align-y-center gap-small auto-xy",
			LayoutOrder = p1.LayoutOrder,
			onActivated = var8,
			stateLayer = { affordance = stateLayerAffordance.None },
			Visible = var5:map(function(p2)
				return p2 ~= nil
			end)
		}, {
			Facepile = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row align-x-left align-y-center gap-xxsmall auto-xy"
			}, t),
			Count = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium text-align-x-left text-align-y-center content-default",
				Text = var5:map(function(p2)
					return `{if p2 == nil then "" elseif p2 >= 1000000 then string.format("%.1fM", p2 / 1000000) elseif p2 >= 1000 then string.format("%.1fK", p2 / 1000) else tostring(p2)} reactions`
				end),
				textStyle = animationRatio:map(function(p3)
					-- upvalues: getColorStyleWithTransparencyModule (copy), var1 (ref)
					return getColorStyleWithTransparencyModule(var1.Color.Content.Default, p3)
				end)
			})
		}),
		Modal = if var3 then reactModule.createElement(reactionsSheetModule, { reactionCounts = var6, onClose = var9 }) else nil
	})
end)