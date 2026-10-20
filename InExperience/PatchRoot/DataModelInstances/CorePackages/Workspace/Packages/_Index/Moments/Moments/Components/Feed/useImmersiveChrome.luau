local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local _ = require(script.Parent.FeedTypes)
local ImmersiveChromeMachineModule = require(script.Parent.immersiveChromeMachine)
local GetImmersiveChromeStoreModule = require(Moments.Stores.GetImmersiveChromeStore)
local GetFIntMomentsImmersiveHideAfterAdvancesModule = require(Moments.Flags.GetFIntMomentsImmersiveHideAfterAdvances)
local GetFIntMomentsImmersiveShownDwellMsModule = require(Moments.Flags.GetFIntMomentsImmersiveShownDwellMs)
local GetFIntMomentsImmersiveHiddenCooldownMsModule = require(Moments.Flags.GetFIntMomentsImmersiveHiddenCooldownMs)
local GetFFlagMomentsPersistHeaderOnProfilePeekModule = require(Moments.Flags.GetFFlagMomentsPersistHeaderOnProfilePeek)
local Analytics = require(Parent.MomentsCommon).Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent

local function defaultFireEvent(p1, Trigger, p2)
	-- upvalues: EventNames (copy), FireAnalyticsEventFunction (copy)
	FireAnalyticsEventFunction(if p1 then EventNames.MomentsChromeRestored else EventNames.MomentsChromeAutoHidden, { trigger = Trigger, index = tostring(p2) })
end

return function(p1)
	-- upvalues: ReactModule (copy), GetImmersiveChromeStoreModule (copy), defaultFireEvent (copy), GetFIntMomentsImmersiveHideAfterAdvancesModule (copy), GetFIntMomentsImmersiveShownDwellMsModule (copy), GetFIntMomentsImmersiveHiddenCooldownMsModule (copy), ImmersiveChromeMachineModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), GetFFlagMomentsPersistHeaderOnProfilePeekModule (copy)
	local Pager = p1.pager
	local Active = p1.active
	local GetActiveIsPlayingFunction = p1.getActiveIsPlaying
	local GetIsScrollingFunction = p1.getIsScrolling
	local InputAllowed = p1.inputAllowed
	local ReducedMotion = p1.reducedMotion
	local IsCoveringOverlay = p1.coveringOverlay == true
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), GetImmersiveChromeStoreModule (upval)
		return p1.store or GetImmersiveChromeStoreModule(false)
	end, {})
	local NoFeatureEnabledOverride = p1.featureEnabledOverride == nil or p1.featureEnabledOverride
	local UseRefResult = ReactModule.useRef(1)
	local UseRefResult1 = ReactModule.useRef(NoFeatureEnabledOverride)
	UseRefResult1.current = NoFeatureEnabledOverride
	local UseRefResult2 = ReactModule.useRef(p1.fireEvent or defaultFireEvent)
	UseRefResult2.current = p1.fireEvent or defaultFireEvent
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), GetFIntMomentsImmersiveHideAfterAdvancesModule (upval), GetFIntMomentsImmersiveShownDwellMsModule (upval), GetFIntMomentsImmersiveHiddenCooldownMsModule (upval), ImmersiveChromeMachineModule (upval), UseMemoResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult (copy)
		return ImmersiveChromeMachineModule(p1.config or {
			hideAfterAdvances = GetFIntMomentsImmersiveHideAfterAdvancesModule(),
			shownDwellMs = GetFIntMomentsImmersiveShownDwellMsModule(),
			hiddenCooldownMs = GetFIntMomentsImmersiveHiddenCooldownMsModule()
		}, {
			now = p1.now or function(): number
				return os.clock() * 1000
			end,
			setChromeVisible = function(p2, p3)
				-- upvalues: UseMemoResult (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult (upval)
				UseMemoResult.setChromeVisible(p2)
				
				if UseRefResult1.current then
					UseRefResult2.current(p2, p3, UseRefResult.current)
				end
			end
		})
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), Pager (copy), GetActiveIsPlayingFunction (copy), GetIsScrollingFunction (copy), UseRefResult (copy), UseMemoResult1 (copy)
		return (SignalsModule.createEffect(function(p2)
			-- upvalues: Pager (upval), GetActiveIsPlayingFunction (upval), GetIsScrollingFunction (upval), UseRefResult (upval), UseMemoResult1 (upval)
			local Count = Pager.getCount(p2)
			local CurrentIndex = Pager.getCurrentIndex(p2)
			local ActiveIsPlaying = GetActiveIsPlayingFunction(p2)
			local IsScrolling = GetIsScrollingFunction(p2)
			UseRefResult.current = CurrentIndex
			UseMemoResult1.setCount(Count)
			UseMemoResult1.onActiveUpdate(CurrentIndex, ActiveIsPlaying, IsScrolling)
		end))
	end, {
		Pager,
		GetActiveIsPlayingFunction,
		GetIsScrollingFunction,
		UseMemoResult1
	})
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult.getOverlayCovering)
	local FFlagMomentsPersistHeaderOnProfilePeekModule = GetFFlagMomentsPersistHeaderOnProfilePeekModule()
	local IsCoveringOverlay1 = if FFlagMomentsPersistHeaderOnProfilePeekModule then IsCoveringOverlay else UseSignalStateResult or IsCoveringOverlay
	local UseRefResult3 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: FFlagMomentsPersistHeaderOnProfilePeekModule (copy), UseSignalStateResult (copy), Active (copy), UseRefResult3 (copy), InputAllowed (copy), ReducedMotion (copy), NoFeatureEnabledOverride (copy), UseMemoResult1 (copy), IsCoveringOverlay (copy), IsCoveringOverlay1 (copy)
		if FFlagMomentsPersistHeaderOnProfilePeekModule then
			if UseSignalStateResult and not Active then
				UseRefResult3.current = true
			elseif Active then
				UseRefResult3.current = false
			end
		end
		UseMemoResult1.setForceShow((not Active and not (FFlagMomentsPersistHeaderOnProfilePeekModule and UseRefResult3.current) or (not InputAllowed or (ReducedMotion or not NoFeatureEnabledOverride))) and not (UseSignalStateResult or IsCoveringOverlay))
		UseMemoResult1.setForceHide(IsCoveringOverlay1)
	end, {
		Active, InputAllowed, ReducedMotion, NoFeatureEnabledOverride,
		UseSignalStateResult, IsCoveringOverlay, IsCoveringOverlay1,
		FFlagMomentsPersistHeaderOnProfilePeekModule, UseMemoResult1
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseMemoResult1 (copy)
		UseMemoResult.setRevealHandler(UseMemoResult1.reveal)
		
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.setRevealHandler(nil)
		end
	end, { UseMemoResult, UseMemoResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.setChromeVisible(true)
		end
	end, { UseMemoResult })
end