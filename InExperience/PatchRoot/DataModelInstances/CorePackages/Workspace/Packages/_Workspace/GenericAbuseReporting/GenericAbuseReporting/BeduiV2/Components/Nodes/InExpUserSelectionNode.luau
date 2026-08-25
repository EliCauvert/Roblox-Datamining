local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local listNodeV2Module = require(genericAbuseReporting.BeduiV2.Components.Nodes.ListNodeV2)
local recentlyLeftBadgeModule = require(genericAbuseReporting.BeduiV2.Components.Shared.RecentlyLeftBadge)
local recentlyLeftSignalsModule = require(genericAbuseReporting.BeduiV2.Utils.Signals.recentlyLeftSignals)
local voiceSpeakingIconModule = require(genericAbuseReporting.BeduiV2.Components.Shared.VoiceSpeakingIcon)
local voiceSpeakingSignalsModule = require(genericAbuseReporting.BeduiV2.Utils.Signals.voiceSpeakingSignals)

return reactModule.memo(function(p0)
	-- upvalues: dashModule (ref), voiceSpeakingSignalsModule (ref), signalsReactModule (ref), recentlyLeftSignalsModule (ref), reactModule (ref), voiceSpeakingIconModule (ref), recentlyLeftBadgeModule (ref), view (ref), listNodeV2Module (ref)
	local trailingAccessories = p0.trailingAccessories
	local var10 = dashModule.join(p0, { trailingAccessories = dashModule.None })
	local var11 = voiceSpeakingSignalsModule.useVoiceSpeakingStore()
	local var12 = signalsReactModule.useSignalState(recentlyLeftSignalsModule.getRecentlyLeftIds())
	
	return reactModule.createElement(listNodeV2Module, dashModule.join(var10, {
		renderTrailingAccessory = reactModule.useCallback(function(p1)
			-- upvalues: trailingAccessories (ref), reactModule (copy), voiceSpeakingIconModule (copy), var11 (ref), var12 (ref), recentlyLeftBadgeModule (copy), view (copy)
			if not trailingAccessories or #trailingAccessories == 0 then
				return nil
			end
			local t = {}
			
			for i, v in trailingAccessories do
				if v.type == "voiceSpeakingIndicator" then
					table.insert(t, reactModule.createElement(voiceSpeakingIconModule, {
						isSpeakingSignal = var11.getIsSpeaking(p1.id),
						layoutOrder = i
					}))
				elseif v.type == "recentlyLeftIndicator" and var12[p1.id] then
					table.insert(t, reactModule.createElement(recentlyLeftBadgeModule, { text = v.text, layoutOrder = i }))
				end
			end
			return if next(t) == nil then nil else reactModule.createElement(view, { tag = "row align-y-center gap-small auto-xy" }, t)
		end, { trailingAccessories, var11, var12 })
	}))
end)