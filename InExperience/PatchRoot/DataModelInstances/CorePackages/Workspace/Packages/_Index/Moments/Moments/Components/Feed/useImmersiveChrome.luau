local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local momentsCommonModule = require(parent.MomentsCommon)
local useSignalState = require(parent.SignalsReact).useSignalState
local _ = require(script.Parent.FeedTypes)
local immersiveChromeMachineModule = require(script.Parent.immersiveChromeMachine)
local getImmersiveChromeStoreModule = require(moments.Stores.GetImmersiveChromeStore)
local fFlagMomentsImmersiveChromeModule = require(moments.Flags.FFlagMomentsImmersiveChrome)
local getFIntMomentsImmersiveHideAfterAdvancesModule = require(moments.Flags.GetFIntMomentsImmersiveHideAfterAdvances)
local getFIntMomentsImmersiveShownDwellMsModule = require(moments.Flags.GetFIntMomentsImmersiveShownDwellMs)
local getFIntMomentsImmersiveHiddenCooldownMsModule = require(moments.Flags.GetFIntMomentsImmersiveHiddenCooldownMs)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent

local function defaultFireEvent(p1, p2, p3)
	-- upvalues: eventNames (ref), fireAnalyticsEvent (ref)
	fireAnalyticsEvent(if p1 then eventNames.MomentsChromeRestored else eventNames.MomentsChromeAutoHidden, { trigger = p2, index = tostring(p3) })
end

return function(p1)
	-- upvalues: reactModule (ref), getImmersiveChromeStoreModule (ref), fFlagMomentsImmersiveChromeModule (ref), defaultFireEvent (ref), getFIntMomentsImmersiveHideAfterAdvancesModule (ref), getFIntMomentsImmersiveShownDwellMsModule (ref), getFIntMomentsImmersiveHiddenCooldownMsModule (ref), immersiveChromeMachineModule (ref), signalsModule (ref), useSignalState (ref)
	local pager = p1.pager
	local active = p1.active
	local getActiveIsPlaying = p1.getActiveIsPlaying
	local getIsScrolling = p1.getIsScrolling
	local inputAllowed = p1.inputAllowed
	local reducedMotion = p1.reducedMotion
	local var1 = p1.coveringOverlay == true
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), getImmersiveChromeStoreModule (copy)
		return p1.store or getImmersiveChromeStoreModule(false)
	end, {})
	local var3 = if p1.featureEnabledOverride ~= nil then fFlagMomentsImmersiveChromeModule else p1.featureEnabledOverride
	local var4 = reactModule.useRef(1)
	local var5 = reactModule.useRef(var3)
	var5.current = var3
	local var6 = reactModule.useRef(p1.fireEvent or defaultFireEvent)
	var6.current = p1.fireEvent or defaultFireEvent
	local var7 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), getFIntMomentsImmersiveHideAfterAdvancesModule (copy), getFIntMomentsImmersiveShownDwellMsModule (copy), getFIntMomentsImmersiveHiddenCooldownMsModule (copy), immersiveChromeMachineModule (copy), var2 (ref), var5 (ref), var6 (ref), var4 (ref)
		return immersiveChromeMachineModule(p1.config or {
			hideAfterAdvances = getFIntMomentsImmersiveHideAfterAdvancesModule(),
			shownDwellMs = getFIntMomentsImmersiveShownDwellMsModule(),
			hiddenCooldownMs = getFIntMomentsImmersiveHiddenCooldownMsModule()
		}, {
			now = p1.now or function()
				return os.clock() * 1000
			end,
			setChromeVisible = function(value, p2)
				-- upvalues: var2 (copy), var5 (copy), var6 (copy), var4 (copy)
				var2.setChromeVisible(value)
				
				if var5.current then
					var6.current(value, p2, var4.current)
				end
			end
		})
	end, {})
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), pager (ref), getActiveIsPlaying (ref), getIsScrolling (ref), var4 (ref), var7 (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: pager (copy), getActiveIsPlaying (copy), getIsScrolling (copy), var4 (copy), var7 (copy)
			local count = pager.getCount(p2)
			local currentIndex = pager.getCurrentIndex(p2)
			local var8 = getActiveIsPlaying(p2)
			local var9 = getIsScrolling(p2)
			var4.current = currentIndex
			var7.setCount(count)
			var7.onActiveUpdate(currentIndex, var8, var9)
		end)
	end, { pager, getActiveIsPlaying, getIsScrolling, var7 })
	local getOverlayCovering = useSignalState(var2.getOverlayCovering) or var1
	reactModule.useEffect(function()
		-- upvalues: active (ref), inputAllowed (ref), reducedMotion (ref), var3 (ref), var7 (ref), getOverlayCovering (ref)
		var7.setForceShow((not active or (not inputAllowed or (reducedMotion or not var3))) and not getOverlayCovering)
		var7.setForceHide(getOverlayCovering)
	end, {
		active, inputAllowed, reducedMotion, var3, getOverlayCovering, var7
	})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var7 (ref)
		var2.setRevealHandler(var7.reveal)
		
		return function()
			-- upvalues: var2 (copy)
			var2.setRevealHandler(nil)
		end
	end, { var2, var7 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return function()
			-- upvalues: var2 (copy)
			var2.setChromeVisible(true)
		end
	end, { var2 })
end