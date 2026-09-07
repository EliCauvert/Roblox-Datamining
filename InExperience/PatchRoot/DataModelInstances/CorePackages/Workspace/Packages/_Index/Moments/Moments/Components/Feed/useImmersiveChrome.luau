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
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), getImmersiveChromeStoreModule (copy)
		return p1.store or getImmersiveChromeStoreModule(false)
	end, {})
	local var2 = if p1.featureEnabledOverride ~= nil then fFlagMomentsImmersiveChromeModule else p1.featureEnabledOverride
	local var3 = reactModule.useRef(1)
	local var4 = reactModule.useRef(var2)
	var4.current = var2
	local var5 = reactModule.useRef(p1.fireEvent or defaultFireEvent)
	var5.current = p1.fireEvent or defaultFireEvent
	local var6 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), getFIntMomentsImmersiveHideAfterAdvancesModule (copy), getFIntMomentsImmersiveShownDwellMsModule (copy), getFIntMomentsImmersiveHiddenCooldownMsModule (copy), immersiveChromeMachineModule (copy), var1 (ref), var4 (ref), var5 (ref), var3 (ref)
		return immersiveChromeMachineModule(p1.config or {
			hideAfterAdvances = getFIntMomentsImmersiveHideAfterAdvancesModule(),
			shownDwellMs = getFIntMomentsImmersiveShownDwellMsModule(),
			hiddenCooldownMs = getFIntMomentsImmersiveHiddenCooldownMsModule()
		}, {
			now = p1.now or function()
				return os.clock() * 1000
			end,
			setChromeVisible = function(value, p2)
				-- upvalues: var1 (copy), var4 (copy), var5 (copy), var3 (copy)
				var1.setChromeVisible(value)
				
				if var4.current then
					var5.current(value, p2, var3.current)
				end
			end
		})
	end, {})
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), pager (ref), getActiveIsPlaying (ref), getIsScrolling (ref), var3 (ref), var6 (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: pager (copy), getActiveIsPlaying (copy), getIsScrolling (copy), var3 (copy), var6 (copy)
			local count = pager.getCount(p2)
			local currentIndex = pager.getCurrentIndex(p2)
			local var7 = getActiveIsPlaying(p2)
			local var8 = getIsScrolling(p2)
			var3.current = currentIndex
			var6.setCount(count)
			var6.onActiveUpdate(currentIndex, var7, var8)
		end)
	end, { pager, getActiveIsPlaying, getIsScrolling, var6 })
	local var7 = useSignalState(var1.getOverlayCovering)
	reactModule.useEffect(function()
		-- upvalues: active (ref), inputAllowed (ref), reducedMotion (ref), var2 (ref), var6 (ref), var7 (ref)
		var6.setForceShow((not active or (not inputAllowed or (reducedMotion or not var2))) and not var7)
		var6.setForceHide(var7)
	end, {
		active, inputAllowed, reducedMotion, var2, var7, var6
	})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var6 (ref)
		var1.setRevealHandler(var6.reveal)
		
		return function()
			-- upvalues: var1 (copy)
			var1.setRevealHandler(nil)
		end
	end, { var1, var6 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			var1.setChromeVisible(true)
		end
	end, { var1 })
end