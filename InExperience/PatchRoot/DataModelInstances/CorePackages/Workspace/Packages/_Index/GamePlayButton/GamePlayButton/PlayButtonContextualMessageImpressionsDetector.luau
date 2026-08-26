local parent = script:FindFirstAncestor("GamePlayButton").Parent
local reactModule = require(parent.React)
local impressionsModule = require(parent.Impressions)
local screenSizeImpressionsTracker = impressionsModule.ScreenSizeImpressionsTracker
local useImpressionsTagger = impressionsModule.useImpressionsTagger
local _ = require(parent.AppCommonLib)
local _ = require(parent.PlayabilityRodux)
local sendPlayButtonContextualMessageImpressionEvent = require(parent.DiscoveryAnalytics).Events.sendPlayButtonContextualMessageImpressionEvent

return function(p1)
	-- upvalues: useImpressionsTagger (ref), reactModule (ref), sendPlayButtonContextualMessageImpressionEvent (ref), screenSizeImpressionsTracker (ref)
	local playabilityStatus = p1.playabilityStatus and p1.playabilityStatus.playabilityStatus
	local universeId = `PLAY_BUTTON_CONTEXTUAL_MESSAGE_{p1.universeId}_{playabilityStatus}`
	useImpressionsTagger(p1.containerRef, universeId, 1)
	
	return if p1.contextualMessage and p1.contextualMessage ~= "" then reactModule.createElement(screenSizeImpressionsTracker, {
		ignoreBottomInset = true,
		pageContext = p1.pageContext,
		impressionsTag = universeId,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sendImpressions = reactModule.useCallback(function(p2)
			-- upvalues: sendPlayButtonContextualMessageImpressionEvent (copy), p1 (ref), playabilityStatus (ref)
			if #p2 == 0 then
				return
			end
			sendPlayButtonContextualMessageImpressionEvent({
				universeId = p1.universeId,
				playabilityStatus = playabilityStatus,
				contextualMessage = p1.contextualMessage
			}, p1.pageContext)
		end, {
			p1.universeId,
			p1.pageContext,
			playabilityStatus,
			p1.contextualMessage
		})
	}) else nil
end