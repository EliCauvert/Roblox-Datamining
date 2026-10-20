local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local ListNodeV2Module = require(GenericAbuseReporting.BeduiV2.Components.Nodes.ListNodeV2)
local RecentlyLeftBadgeModule = require(GenericAbuseReporting.BeduiV2.Components.Shared.RecentlyLeftBadge)
local RecentlyLeftSignalsModule = require(GenericAbuseReporting.BeduiV2.Utils.Signals.recentlyLeftSignals)
local VoiceSpeakingIconModule = require(GenericAbuseReporting.BeduiV2.Components.Shared.VoiceSpeakingIcon)
local VoiceSpeakingSignalsModule = require(GenericAbuseReporting.BeduiV2.Utils.Signals.voiceSpeakingSignals)

return ReactModule.memo(function(p1)
	-- upvalues: DashModule (copy), VoiceSpeakingSignalsModule (copy), SignalsReactModule (copy), RecentlyLeftSignalsModule (copy), ReactModule (copy), VoiceSpeakingIconModule (copy), RecentlyLeftBadgeModule (copy), View (copy), ListNodeV2Module (copy)
	local TrailingAccessories = p1.trailingAccessories
	local UseVoiceSpeakingStoreResult = VoiceSpeakingSignalsModule.useVoiceSpeakingStore()
	local UseSignalStateResult = SignalsReactModule.useSignalState(RecentlyLeftSignalsModule.getRecentlyLeftIds())
	
	return ReactModule.createElement(ListNodeV2Module, DashModule.join(DashModule.join(p1, { trailingAccessories = DashModule.None }), {
		renderTrailingAccessory = ReactModule.useCallback(function(p2)
			-- upvalues: TrailingAccessories (copy), ReactModule (upval), VoiceSpeakingIconModule (upval), UseVoiceSpeakingStoreResult (copy), UseSignalStateResult (copy), RecentlyLeftBadgeModule (upval), View (upval)
			if not TrailingAccessories or #TrailingAccessories == 0 then
				return nil
			end
			local Elements = {}
			
			for LayoutOrder, trailingAccessory in TrailingAccessories do
				if trailingAccessory.type == "voiceSpeakingIndicator" then
					table.insert(Elements, ReactModule.createElement(VoiceSpeakingIconModule, {
						isSpeakingSignal = UseVoiceSpeakingStoreResult.getIsSpeaking(p2.id),
						layoutOrder = LayoutOrder
					}))
				elseif trailingAccessory.type == "recentlyLeftIndicator" and UseSignalStateResult[p2.id] then
					table.insert(Elements, ReactModule.createElement(RecentlyLeftBadgeModule, { text = trailingAccessory.text, layoutOrder = LayoutOrder }))
				end
			end
			return if next(Elements) == nil then nil else ReactModule.createElement(View, { tag = "row align-y-center gap-small auto-xy" }, Elements)
		end, {
			TrailingAccessories,
			UseVoiceSpeakingStoreResult,
			UseSignalStateResult
		})
	}))
end)