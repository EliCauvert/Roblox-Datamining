local PlayWithRewardComponent = script:FindFirstAncestor("PlayWithRewardComponent")
local Parent = PlayWithRewardComponent.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local PlayWithRewardCoachmarkStorageModule = require(PlayWithRewardComponent.PlayWithRewardCoachmarkStorage)
local PlayWithRewardTelemetryModule = require(PlayWithRewardComponent.PlayWithRewardTelemetry)
local UseEarlyIsFocusedFunction = require(Parent.Navigation).useEarlyIsFocused
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local Coachmark = FoundationModule.Coachmark
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local FFlagPlayWithRewardCoachmarkOverlayFix = require(Parent.SharedFlags).FFlagPlayWithRewardCoachmarkOverlayFix

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FFlagPlayWithRewardCoachmarkOverlayFix (copy), UseEarlyIsFocusedFunction (copy), UseSelectorFunction (copy), PlayWithRewardCoachmarkStorageModule (copy), PlayWithRewardTelemetryModule (copy), Coachmark (copy), PopoverSide (copy), PopoverAlign (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local v1 = nil
	local v2 = nil
	
	if FFlagPlayWithRewardCoachmarkOverlayFix then
		v1 = UseEarlyIsFocusedFunction()
		v2 = UseSelectorFunction(function(p2): boolean
			return p2.CentralOverlay.OverlayType ~= nil
		end)
	end
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy), PlayWithRewardCoachmarkStorageModule (upval), PlayWithRewardTelemetryModule (upval)
		UseStateResult2(false)
		
		if p1.localUserId <= 0 then return end
		if PlayWithRewardCoachmarkStorageModule.consumeImpressionIfEligible(p1.localUserId) then
			UseStateResult2(true)
			PlayWithRewardTelemetryModule.logPlayWithRewardCoachmark("shown", p1.flowId, p1.universeId, p1.productId)
		end
	end, { p1.flowId, p1.localUserId, p1.productId, p1.universeId })
	
	if FFlagPlayWithRewardCoachmarkOverlayFix then
		ReactModule.useEffect(function()
			-- upvalues: v1 (ref), v2 (ref), UseStateResult2 (copy)
			if not v1 or v2 then
				UseStateResult2(false)
			end
		end, { v1, v2 })
	end
	return ReactModule.createElement(Coachmark, {
		title = p1.title,
		text = p1.text,
		isOpen = UseStateResult,
		side = PopoverSide.Bottom,
		align = PopoverAlign.Center,
		anchorRef = p1.anchorRef,
		onClose = ReactModule.useCallback(function()
			-- upvalues: PlayWithRewardCoachmarkStorageModule (upval), p1 (copy), PlayWithRewardTelemetryModule (upval), UseStateResult2 (copy)
			PlayWithRewardCoachmarkStorageModule.dismissCurrentWindow(p1.localUserId)
			PlayWithRewardTelemetryModule.logPlayWithRewardCoachmark("dismissed", p1.flowId, p1.universeId, p1.productId)
			UseStateResult2(false)
		end, { p1.flowId, p1.universeId, p1.productId, p1.localUserId })
	})
end)