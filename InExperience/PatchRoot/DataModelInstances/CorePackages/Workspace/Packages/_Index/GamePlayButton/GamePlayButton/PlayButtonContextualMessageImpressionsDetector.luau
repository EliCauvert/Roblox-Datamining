local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local ReactModule = require(Parent.React)
local ImpressionsModule = require(Parent.Impressions)
local ScreenSizeImpressionsTracker = ImpressionsModule.ScreenSizeImpressionsTracker
local UseImpressionsTaggerFunction = ImpressionsModule.useImpressionsTagger
local _ = require(Parent.AppCommonLib)
local _ = require(Parent.PlayabilityRodux)
local SendPlayButtonContextualMessageImpressionEventFunction = require(Parent.DiscoveryAnalytics).Events.sendPlayButtonContextualMessageImpressionEvent

return function(p1) --[[ Line: 23 | Named "PlayButtonContextualMessageImpressionsDetector" ]]
	-- upvalues: UseImpressionsTaggerFunction (copy), ReactModule (copy), SendPlayButtonContextualMessageImpressionEventFunction (copy), ScreenSizeImpressionsTracker (copy)
	local PlayabilityStatus = p1.playabilityStatus and p1.playabilityStatus.playabilityStatus
	local CONTEXTUALName: string = `PLAY_BUTTON_CONTEXTUAL_MESSAGE_{p1.universeId}_{PlayabilityStatus}`
	UseImpressionsTaggerFunction(p1.containerRef, CONTEXTUALName, 1)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 30 ]]
		-- upvalues: SendPlayButtonContextualMessageImpressionEventFunction (upval), p1 (copy), PlayabilityStatus (copy)
		if #p2 ~= 0 then
			SendPlayButtonContextualMessageImpressionEventFunction({
				universeId = p1.universeId,
				playabilityStatus = PlayabilityStatus,
				contextualMessage = p1.contextualMessage
			}, p1.pageContext)
			
			return
		end
	end, {
		p1.universeId,
		p1.pageContext,
		PlayabilityStatus,
		p1.contextualMessage
	})
	
	return if p1.contextualMessage and p1.contextualMessage ~= "" then ReactModule.createElement(ScreenSizeImpressionsTracker, {
		ignoreBottomInset = true,
		pageContext = p1.pageContext,
		impressionsTag = CONTEXTUALName,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		sendImpressions = UseResult
	}) else nil
end