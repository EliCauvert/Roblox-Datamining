local playWithRewardComponent = script:FindFirstAncestor("PlayWithRewardComponent")
local parent = playWithRewardComponent.Parent
local foundationModule = require(parent.Foundation)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local playWithRewardCoachmarkStorageModule = require(playWithRewardComponent.PlayWithRewardCoachmarkStorage)
local playWithRewardTelemetryModule = require(playWithRewardComponent.PlayWithRewardTelemetry)
local useEarlyIsFocused = navigationModule.useEarlyIsFocused
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local coachmark = foundationModule.Coachmark
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local fFlagPlayWithRewardCoachmarkOverlayFix = sharedFlagsModule.FFlagPlayWithRewardCoachmarkOverlayFix

return reactModule.memo(function(p0) --[[ line: 42 | named "PlayWithRewardCoachmark" ]]
	-- upvalues: reactModule (ref), fFlagPlayWithRewardCoachmarkOverlayFix (ref), useEarlyIsFocused (ref), useSelector (ref), playWithRewardCoachmarkStorageModule (ref), playWithRewardTelemetryModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref)
	local var8, var9 = reactModule.useState(false)
	local var10 = nil
	local var11 = nil
	
	if fFlagPlayWithRewardCoachmarkOverlayFix then
		var10 = useEarlyIsFocused()
		var11 = useSelector(function(p1) --[[ line: 47 ]]
			return p1.CentralOverlay.OverlayType ~= nil
		end)
	end
	reactModule.useEffect(function() --[[ line: 52 ]]
		-- upvalues: var9 (ref), p0 (ref), playWithRewardCoachmarkStorageModule (copy), playWithRewardTelemetryModule (copy)
		var9(false)
		
		if p0.localUserId <= 0 then return end
		if playWithRewardCoachmarkStorageModule.consumeImpressionIfEligible(p0.localUserId) then
			var9(true)
			playWithRewardTelemetryModule.logPlayWithRewardCoachmark("shown", p0.flowId, p0.universeId, p0.productId)
		end
	end, { p0.flowId, p0.localUserId, p0.productId, p0.universeId })
	
	if fFlagPlayWithRewardCoachmarkOverlayFix then
		reactModule.useEffect(function() --[[ line: 66 ]]
			-- upvalues: var10 (write), var11 (write), var9 (ref)
			if not var10 or var11 then
				var9(false)
			end
		end, { var10, var11 })
	end
	return reactModule.createElement(coachmark, {
		title = p0.title,
		text = p0.text,
		isOpen = var8,
		side = popoverSide.Bottom,
		align = popoverAlign.Center,
		anchorRef = p0.anchorRef,
		onClose = reactModule.useCallback(function() --[[ line: 73 ]]
			-- upvalues: playWithRewardCoachmarkStorageModule (copy), p0 (ref), playWithRewardTelemetryModule (copy), var9 (ref)
			playWithRewardCoachmarkStorageModule.dismissCurrentWindow(p0.localUserId)
			playWithRewardTelemetryModule.logPlayWithRewardCoachmark("dismissed", p0.flowId, p0.universeId, p0.productId)
			var9(false)
		end, { p0.flowId, p0.universeId, p0.productId, p0.localUserId })
	})
end)