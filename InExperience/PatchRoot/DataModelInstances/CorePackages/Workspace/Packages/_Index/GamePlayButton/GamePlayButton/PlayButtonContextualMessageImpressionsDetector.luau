local parent = script:FindFirstAncestor("GamePlayButton").Parent
local reactModule = require(parent.React)
local impressionsModule = require(parent.Impressions)
local screenSizeImpressionsTracker = impressionsModule.ScreenSizeImpressionsTracker
local useImpressionsTagger = impressionsModule.useImpressionsTagger
local _ = require(parent.AppCommonLib)
local _ = require(parent.PlayabilityRodux)
local sendPlayButtonContextualMessageImpressionEvent = require(parent.DiscoveryAnalytics).Events.sendPlayButtonContextualMessageImpressionEvent

return function(p0)
	-- upvalues: useImpressionsTagger (ref), reactModule (ref), sendPlayButtonContextualMessageImpressionEvent (ref), screenSizeImpressionsTracker (ref)
	local playabilityStatus = p0.playabilityStatus and p0.playabilityStatus.playabilityStatus
	local universeId = `PLAY_BUTTON_CONTEXTUAL_MESSAGE_{p0.universeId}_{playabilityStatus}`
	useImpressionsTagger(p0.containerRef, universeId, 1)
	
	return if p0.contextualMessage and p0.contextualMessage ~= "" then reactModule.createElement(screenSizeImpressionsTracker, {
		ignoreBottomInset = true,
		pageContext = p0.pageContext,
		impressionsTag = universeId,
		scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
		sendImpressions = reactModule.useCallback(function(p1)
			-- upvalues: sendPlayButtonContextualMessageImpressionEvent (copy), p0 (ref), playabilityStatus (ref)
			if #p1 == 0 then
				return
			end
			sendPlayButtonContextualMessageImpressionEvent({
				universeId = p0.universeId,
				playabilityStatus = playabilityStatus,
				contextualMessage = p0.contextualMessage
			}, p0.pageContext)
		end, {
			p0.universeId,
			p0.pageContext,
			playabilityStatus,
			p0.contextualMessage
		})
	}) else nil
end