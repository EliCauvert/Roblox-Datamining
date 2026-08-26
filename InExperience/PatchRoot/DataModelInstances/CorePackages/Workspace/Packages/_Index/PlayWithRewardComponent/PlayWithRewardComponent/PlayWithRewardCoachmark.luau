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

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), fFlagPlayWithRewardCoachmarkOverlayFix (ref), useEarlyIsFocused (ref), useSelector (ref), playWithRewardCoachmarkStorageModule (ref), playWithRewardTelemetryModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = nil
	local var4 = nil
	
	if fFlagPlayWithRewardCoachmarkOverlayFix then
		var3 = useEarlyIsFocused()
		var4 = useSelector(function(p2)
			return p2.CentralOverlay.OverlayType ~= nil
		end)
	end
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref), playWithRewardCoachmarkStorageModule (copy), playWithRewardTelemetryModule (copy)
		var2(false)
		
		if p1.localUserId <= 0 then return end
		if playWithRewardCoachmarkStorageModule.consumeImpressionIfEligible(p1.localUserId) then
			var2(true)
			playWithRewardTelemetryModule.logPlayWithRewardCoachmark("shown", p1.flowId, p1.universeId, p1.productId)
		end
	end, { p1.flowId, p1.localUserId, p1.productId, p1.universeId })
	
	if fFlagPlayWithRewardCoachmarkOverlayFix then
		reactModule.useEffect(function()
			-- upvalues: var3 (write), var4 (write), var2 (ref)
			if not var3 or var4 then
				var2(false)
			end
		end, { var3, var4 })
	end
	return reactModule.createElement(coachmark, {
		title = p1.title,
		text = p1.text,
		isOpen = var1,
		side = popoverSide.Bottom,
		align = popoverAlign.Center,
		anchorRef = p1.anchorRef,
		onClose = reactModule.useCallback(function()
			-- upvalues: playWithRewardCoachmarkStorageModule (copy), p1 (ref), playWithRewardTelemetryModule (copy), var2 (ref)
			playWithRewardCoachmarkStorageModule.dismissCurrentWindow(p1.localUserId)
			playWithRewardTelemetryModule.logPlayWithRewardCoachmark("dismissed", p1.flowId, p1.universeId, p1.productId)
			var2(false)
		end, { p1.flowId, p1.universeId, p1.productId, p1.localUserId })
	})
end)