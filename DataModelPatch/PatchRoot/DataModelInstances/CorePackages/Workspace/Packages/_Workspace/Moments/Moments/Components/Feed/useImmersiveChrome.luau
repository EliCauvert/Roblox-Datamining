local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local _ = require(script.Parent.FeedTypes)
local ImmersiveChromeMachineModule = require(script.Parent.immersiveChromeMachine)
local NavBarChromeAdapterModule = require(Moments.Utils.navBarChromeAdapter)
local GetImmersiveChromeStoreModule = require(Moments.Stores.GetImmersiveChromeStore)
local GetFFlagMomentsImmersiveChromeModule = require(Moments.Flags.GetFFlagMomentsImmersiveChrome)
local GetFIntMomentsImmersiveHideAfterAdvancesModule = require(Moments.Flags.GetFIntMomentsImmersiveHideAfterAdvances)
local GetFIntMomentsImmersiveShownDwellMsModule = require(Moments.Flags.GetFIntMomentsImmersiveShownDwellMs)
local GetFIntMomentsImmersiveHiddenCooldownMsModule = require(Moments.Flags.GetFIntMomentsImmersiveHiddenCooldownMs)
local Analytics = require(Parent.MomentsCommon).Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent

local function defaultFireEvent(p1, Trigger, p2)
	-- upvalues: EventNames (copy), FireAnalyticsEventFunction (copy)
	FireAnalyticsEventFunction(if p1 then EventNames.MomentsChromeRestored else EventNames.MomentsChromeAutoHidden, { trigger = Trigger, index = tostring(p2) })
end

return function(p1)
	-- upvalues: ReactModule (copy), NavBarChromeAdapterModule (copy), GetImmersiveChromeStoreModule (copy), GetFFlagMomentsImmersiveChromeModule (copy), defaultFireEvent (copy), GetFIntMomentsImmersiveHideAfterAdvancesModule (copy), GetFIntMomentsImmersiveShownDwellMsModule (copy), GetFIntMomentsImmersiveHiddenCooldownMsModule (copy), ImmersiveChromeMachineModule (copy), SignalsModule (copy), UseSignalStateFunction (copy)
	local Pager = p1.pager
	local Active = p1.active
	local GetActiveIsPlayingFunction = p1.getActiveIsPlaying
	local GetIsScrollingFunction = p1.getIsScrolling
	local InputAllowed = p1.inputAllowed
	local ReducedMotion = p1.reducedMotion
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), NavBarChromeAdapterModule (upval)
		return p1.navBarChrome or NavBarChromeAdapterModule()
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), GetImmersiveChromeStoreModule (upval)
		return p1.store or GetImmersiveChromeStoreModule(false)
	end, {})
	local IsEnabled = (if p1.featureEnabledOverride == nil then GetFFlagMomentsImmersiveChromeModule() else p1.featureEnabledOverride) and UseMemoResult.isEnabled
	local UseRefResult = ReactModule.useRef(1)
	local UseRefResult1 = ReactModule.useRef(IsEnabled)
	UseRefResult1.current = IsEnabled
	local UseRefResult2 = ReactModule.useRef(p1.fireEvent or defaultFireEvent)
	UseRefResult2.current = p1.fireEvent or defaultFireEvent
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), GetFIntMomentsImmersiveHideAfterAdvancesModule (upval), GetFIntMomentsImmersiveShownDwellMsModule (upval), GetFIntMomentsImmersiveHiddenCooldownMsModule (upval), ImmersiveChromeMachineModule (upval), UseMemoResult1 (copy), UseMemoResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult (copy)
		return ImmersiveChromeMachineModule(p1.config or {
			hideAfterAdvances = GetFIntMomentsImmersiveHideAfterAdvancesModule(),
			shownDwellMs = GetFIntMomentsImmersiveShownDwellMsModule(),
			hiddenCooldownMs = GetFIntMomentsImmersiveHiddenCooldownMsModule()
		}, {
			now = p1.now or function(): number
				return os.clock() * 1000
			end,
			setChromeVisible = function(p2, p3)
				-- upvalues: UseMemoResult1 (upval), UseMemoResult (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult (upval)
				UseMemoResult1.setChromeVisible(p2)
				UseMemoResult.setVisible(p2)
				
				if UseRefResult1.current then
					UseRefResult2.current(p2, p3, UseRefResult.current)
				end
			end
		})
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), Pager (copy), GetActiveIsPlayingFunction (copy), GetIsScrollingFunction (copy), UseRefResult (copy), UseMemoResult2 (copy)
		return (SignalsModule.createEffect(function(p2)
			-- upvalues: Pager (upval), GetActiveIsPlayingFunction (upval), GetIsScrollingFunction (upval), UseRefResult (upval), UseMemoResult2 (upval)
			local Count = Pager.getCount(p2)
			local CurrentIndex = Pager.getCurrentIndex(p2)
			local ActiveIsPlaying = GetActiveIsPlayingFunction(p2)
			local IsScrolling = GetIsScrollingFunction(p2)
			UseRefResult.current = CurrentIndex
			UseMemoResult2.setCount(Count)
			UseMemoResult2.onActiveUpdate(CurrentIndex, ActiveIsPlaying, IsScrolling)
		end))
	end, {
		Pager,
		GetActiveIsPlayingFunction,
		GetIsScrollingFunction,
		UseMemoResult2
	})
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult1.getOverlayCovering)
	ReactModule.useEffect(function()
		-- upvalues: Active (copy), InputAllowed (copy), ReducedMotion (copy), IsEnabled (copy), UseMemoResult2 (copy), UseSignalStateResult (copy)
		UseMemoResult2.setForceShow((not Active or (not InputAllowed or (ReducedMotion or not IsEnabled))) and not UseSignalStateResult)
		UseMemoResult2.setForceHide(UseSignalStateResult)
	end, {
		Active, InputAllowed, ReducedMotion, IsEnabled, UseSignalStateResult,
		UseMemoResult2
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult1 (copy), UseMemoResult2 (copy)
		UseMemoResult1.setRevealHandler(UseMemoResult2.reveal)
		
		return function()
			-- upvalues: UseMemoResult1 (upval)
			UseMemoResult1.setRevealHandler(nil)
		end
	end, { UseMemoResult1, UseMemoResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult1 (copy), UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult1 (upval), UseMemoResult (upval)
			UseMemoResult1.setChromeVisible(true)
			UseMemoResult.dispose()
		end
	end, { UseMemoResult1, UseMemoResult })
end