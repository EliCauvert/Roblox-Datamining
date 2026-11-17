local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local MomentsCommonModule = require(Parent.MomentsCommon)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local _ = require(script.Parent.FeedTypes)
local ImmersiveChromeMachineModule = require(script.Parent.immersiveChromeMachine)
local GetImmersiveChromeStoreModule = require(Moments.Stores.GetImmersiveChromeStore)
local _ = require(Moments.Utils.navBarChromeAdapter)
local GetFIntMomentsImmersiveHideAfterAdvancesModule = require(Moments.Flags.GetFIntMomentsImmersiveHideAfterAdvances)
local GetFIntMomentsImmersiveShownDwellMsModule = require(Moments.Flags.GetFIntMomentsImmersiveShownDwellMs)
local GetFIntMomentsImmersiveHiddenCooldownMsModule = require(Moments.Flags.GetFIntMomentsImmersiveHiddenCooldownMs)
local GetFFlagMomentsPersistHeaderOnProfilePeekModule = require(Moments.Flags.GetFFlagMomentsPersistHeaderOnProfilePeek)
local FFlagMomentsHideNavBarOnScrollModule = require(Moments.Flags.FFlagMomentsHideNavBarOnScroll)
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent

local function defaultFireEvent(p1, Trigger, p2)
	-- upvalues: EventNames (copy), FireAnalyticsEventFunction (copy)
	FireAnalyticsEventFunction(if p1 then EventNames.MomentsChromeRestored else EventNames.MomentsChromeAutoHidden, { trigger = Trigger, index = tostring(p2) })
end

return function(p1)
	-- upvalues: FFlagMomentsHideNavBarOnScrollModule (copy), ReactModule (copy), GetImmersiveChromeStoreModule (copy), defaultFireEvent (copy), GetFIntMomentsImmersiveHideAfterAdvancesModule (copy), GetFIntMomentsImmersiveShownDwellMsModule (copy), GetFIntMomentsImmersiveHiddenCooldownMsModule (copy), ImmersiveChromeMachineModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), GetFFlagMomentsPersistHeaderOnProfilePeekModule (copy)
	local Pager = p1.pager
	local Active = p1.active
	local GetActiveIsPlayingFunction = p1.getActiveIsPlaying
	local GetIsScrollingFunction = p1.getIsScrolling
	local InputAllowed = p1.inputAllowed
	local ReducedMotion = p1.reducedMotion
	local IsCoveringOverlay = p1.coveringOverlay == true
	local NavBarChrome = if FFlagMomentsHideNavBarOnScrollModule then p1.navBarChrome else nil
	local GetDragTravel = if FFlagMomentsHideNavBarOnScrollModule then p1.getDragTravel else nil
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
	local UseRefResult3 = nil
	local UseRefResult4 = nil
	
	if FFlagMomentsHideNavBarOnScrollModule then
		UseRefResult3 = ReactModule.useRef(NavBarChrome)
		UseRefResult4 = ReactModule.useRef(false)
	end
	if UseRefResult3 ~= nil then
		UseRefResult3.current = NavBarChrome
	end
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), GetFIntMomentsImmersiveHideAfterAdvancesModule (upval), GetFIntMomentsImmersiveShownDwellMsModule (upval), GetFIntMomentsImmersiveHiddenCooldownMsModule (upval), NavBarChrome (copy), ImmersiveChromeMachineModule (upval), UseMemoResult (copy), UseRefResult3 (ref), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult (copy)
		local Config = p1.config or {
			hideAfterAdvances = p1.hideAfterAdvances or GetFIntMomentsImmersiveHideAfterAdvancesModule(),
			shownDwellMs = GetFIntMomentsImmersiveShownDwellMsModule(),
			hiddenCooldownMs = GetFIntMomentsImmersiveHiddenCooldownMsModule()
		}
		
		if NavBarChrome ~= nil then
			Config = table.clone(Config)
			Config.hideAwayFromPausedItem = true
		end
		return ImmersiveChromeMachineModule(Config, {
			now = p1.now or function(): number
				return os.clock() * 1000
			end,
			setChromeVisible = function(p2, p3)
				-- upvalues: UseMemoResult (upval), UseRefResult3 (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult (upval)
				UseMemoResult.setChromeVisible(p2)
				local Current = if UseRefResult3 == nil then nil else UseRefResult3.current
				
				if Current ~= nil and (p2 or p3 ~= "force") then
					Current.setVisible(p2)
				end
				if UseRefResult1.current then
					UseRefResult2.current(p2, p3, UseRefResult.current)
				end
			end
		})
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), Pager (copy), GetActiveIsPlayingFunction (copy), GetIsScrollingFunction (copy), UseRefResult (copy), UseMemoResult1 (copy), UseRefResult4 (ref), UseRefResult3 (ref)
		return (SignalsModule.createEffect(function(p2)
			-- upvalues: Pager (upval), GetActiveIsPlayingFunction (upval), GetIsScrollingFunction (upval), UseRefResult (upval), UseMemoResult1 (upval), UseRefResult4 (upval), UseRefResult3 (upval)
			local Count = Pager.getCount(p2)
			local CurrentIndex = Pager.getCurrentIndex(p2)
			local ActiveIsPlaying = GetActiveIsPlayingFunction(p2)
			local IsScrolling = GetIsScrollingFunction(p2)
			UseRefResult.current = CurrentIndex
			UseMemoResult1.setCount(Count)
			UseMemoResult1.onActiveUpdate(CurrentIndex, ActiveIsPlaying, IsScrolling)
			
			if UseRefResult4 ~= nil and UseRefResult4.current and not IsScrolling then
				UseRefResult4.current = false
				local Current = if UseRefResult3 == nil then nil else UseRefResult3.current
				
				if Current ~= nil and UseMemoResult1.isVisible() then
					Current.setVisible(true)
				end
			end
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
	local UseRefResult5 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: FFlagMomentsPersistHeaderOnProfilePeekModule (copy), UseSignalStateResult (copy), Active (copy), UseRefResult5 (copy), NavBarChrome (copy), InputAllowed (copy), ReducedMotion (copy), NoFeatureEnabledOverride (copy), UseMemoResult1 (copy), IsCoveringOverlay (copy), IsCoveringOverlay1 (copy)
		if FFlagMomentsPersistHeaderOnProfilePeekModule then
			if UseSignalStateResult and not Active then
				UseRefResult5.current = true
			elseif Active then
				UseRefResult5.current = false
			end
		end
		UseMemoResult1.setForceShow((not Active and not (FFlagMomentsPersistHeaderOnProfilePeekModule and UseRefResult5.current) or (NavBarChrome == nil and (not InputAllowed or ReducedMotion) or not NoFeatureEnabledOverride)) and not (UseSignalStateResult or IsCoveringOverlay))
		UseMemoResult1.setForceHide(IsCoveringOverlay1)
	end, {
		Active, InputAllowed, ReducedMotion, NoFeatureEnabledOverride,
		UseSignalStateResult, IsCoveringOverlay, IsCoveringOverlay1,
		FFlagMomentsPersistHeaderOnProfilePeekModule, NavBarChrome, UseMemoResult1
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
	
	if FFlagMomentsHideNavBarOnScrollModule then
		ReactModule.useEffect(function()
			-- upvalues: NavBarChrome (copy), GetDragTravel (copy), SignalsModule (upval), UseMemoResult1 (copy), UseRefResult4 (ref)
			if NavBarChrome == nil or GetDragTravel == nil then
				return nil
			else
				local Flag = false
				local WillHideOnNextAdvanceResult = false
				local Y = 0
				
				return SignalsModule.createEffect(function(p2)
					-- upvalues: GetDragTravel (upval), Flag (ref), WillHideOnNextAdvanceResult (ref), UseMemoResult1 (upval), Y (ref), UseRefResult4 (upval), NavBarChrome (upval)
					local DragTravel = GetDragTravel(p2)
					
					if DragTravel == Vector2.zero then
						Flag = false
						WillHideOnNextAdvanceResult = false
						
						return
					end
					if Flag then
						if not WillHideOnNextAdvanceResult then return end
						local YDelta = DragTravel.Y - Y
						Y = DragTravel.Y
						
						if YDelta ~= 0 then
							if UseRefResult4 ~= nil then
								UseRefResult4.current = true
							end
							NavBarChrome.followDrag(YDelta)
						end
						return
					else
						local Magnitude = math.abs(DragTravel.X)
						local Magnitude1 = math.abs(DragTravel.Y)
						
						if Magnitude > 10 or Magnitude1 > 10 then
							Flag = true
							WillHideOnNextAdvanceResult = DragTravel.Y < 0 and Magnitude < Magnitude1 and UseMemoResult1.willHideOnNextAdvance()
							Y = DragTravel.Y
							
							return
						end
					end
				end)
			end
		end, { NavBarChrome, GetDragTravel, UseMemoResult1 })
		local UseRefResult6 = ReactModule.useRef(Active)
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult6 (copy), Active (copy), NavBarChrome (copy), UseMemoResult1 (copy)
			local Current = UseRefResult6.current
			UseRefResult6.current = Active
			
			if NavBarChrome ~= nil and Active and not Current then
				UseMemoResult1.reveal()
			end
		end, { Active, NavBarChrome, UseMemoResult1 })
		ReactModule.useEffect(function()
			-- upvalues: NavBarChrome (copy)
			return if NavBarChrome == nil then nil else function()
				-- upvalues: NavBarChrome (upval)
				NavBarChrome.dispose()
			end
		end, { NavBarChrome })
	end
end