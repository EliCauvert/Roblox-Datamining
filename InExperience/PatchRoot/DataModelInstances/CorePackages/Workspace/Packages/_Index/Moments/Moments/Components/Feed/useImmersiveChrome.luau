local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local momentsCommonModule = require(parent.MomentsCommon)
local useSignalState = require(parent.SignalsReact).useSignalState
local _ = require(script.Parent.FeedTypes)
local immersiveChromeMachineModule = require(script.Parent.immersiveChromeMachine)
local navBarChromeAdapterModule = require(moments.Utils.navBarChromeAdapter)
local getImmersiveChromeStoreModule = require(moments.Stores.GetImmersiveChromeStore)
local getFFlagMomentsImmersiveChromeModule = require(moments.Flags.GetFFlagMomentsImmersiveChrome)
local getFIntMomentsImmersiveHideAfterAdvancesModule = require(moments.Flags.GetFIntMomentsImmersiveHideAfterAdvances)
local getFIntMomentsImmersiveShownDwellMsModule = require(moments.Flags.GetFIntMomentsImmersiveShownDwellMs)
local getFIntMomentsImmersiveHiddenCooldownMsModule = require(moments.Flags.GetFIntMomentsImmersiveHiddenCooldownMs)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent

local function defaultFireEvent(p0, p1, p2) --[[ line: 79 ]]
	-- upvalues: eventNames (ref), fireAnalyticsEvent (ref)
	fireAnalyticsEvent(if p0 then eventNames.MomentsChromeRestored else eventNames.MomentsChromeAutoHidden, { trigger = p1, index = tostring(p2) })
end

return function(p3) --[[ line: 87 | named "useImmersiveChrome" ]]
	-- upvalues: reactModule (ref), navBarChromeAdapterModule (ref), getImmersiveChromeStoreModule (ref), getFFlagMomentsImmersiveChromeModule (ref), defaultFireEvent (ref), getFIntMomentsImmersiveHideAfterAdvancesModule (ref), getFIntMomentsImmersiveShownDwellMsModule (ref), getFIntMomentsImmersiveHiddenCooldownMsModule (ref), immersiveChromeMachineModule (ref), signalsModule (ref), useSignalState (ref)
	local pager = p3.pager
	local active = p3.active
	local getActiveIsPlaying = p3.getActiveIsPlaying
	local getIsScrolling = p3.getIsScrolling
	local inputAllowed = p3.inputAllowed
	local reducedMotion = p3.reducedMotion
	local var12 = reactModule.useMemo(function() --[[ line: 98 ]]
		-- upvalues: p3 (ref), navBarChromeAdapterModule (copy)
		return p3.navBarChrome or navBarChromeAdapterModule()
	end, {})
	local var13 = reactModule.useMemo(function() --[[ line: 102 ]]
		-- upvalues: p3 (ref), getImmersiveChromeStoreModule (copy)
		return p3.store or getImmersiveChromeStoreModule(false)
	end, {})
	local isEnabled = (if p3.featureEnabledOverride ~= nil then getFFlagMomentsImmersiveChromeModule() else p3.featureEnabledOverride) and var12.isEnabled
	local var15 = reactModule.useRef(1)
	local var16 = reactModule.useRef(isEnabled)
	var16.current = isEnabled
	local var17 = reactModule.useRef(p3.fireEvent or defaultFireEvent)
	var17.current = p3.fireEvent or defaultFireEvent
	local var18 = reactModule.useMemo(function() --[[ line: 123 ]]
		-- upvalues: p3 (ref), getFIntMomentsImmersiveHideAfterAdvancesModule (copy), getFIntMomentsImmersiveShownDwellMsModule (copy), getFIntMomentsImmersiveHiddenCooldownMsModule (copy), immersiveChromeMachineModule (copy), var13 (ref), var12 (ref), var16 (ref), var17 (ref), var15 (ref)
		return immersiveChromeMachineModule(p3.config or {
			hideAfterAdvances = getFIntMomentsImmersiveHideAfterAdvancesModule(),
			shownDwellMs = getFIntMomentsImmersiveShownDwellMsModule(),
			hiddenCooldownMs = getFIntMomentsImmersiveHiddenCooldownMsModule()
		}, {
			now = p3.now or function() --[[ line: 130 ]]
				return os.clock() * 1000
			end,
			setChromeVisible = function(value, p4) --[[ line: 135 ]]
				-- upvalues: var13 (copy), var12 (copy), var16 (copy), var17 (copy), var15 (copy)
				var13.setChromeVisible(value)
				var12.setVisible(value)
				
				if var16.current then
					var17.current(value, p4, var15.current)
				end
			end
		})
	end, {})
	reactModule.useEffect(function() --[[ line: 147 ]]
		-- upvalues: signalsModule (copy), pager (ref), getActiveIsPlaying (ref), getIsScrolling (ref), var15 (ref), var18 (ref)
		return signalsModule.createEffect(function(p5) --[[ line: 148 ]]
			-- upvalues: pager (copy), getActiveIsPlaying (copy), getIsScrolling (copy), var15 (copy), var18 (copy)
			local count = pager.getCount(p5)
			local currentIndex = pager.getCurrentIndex(p5)
			local var22 = getActiveIsPlaying(p5)
			local var23 = getIsScrolling(p5)
			var15.current = currentIndex
			var18.setCount(count)
			var18.onActiveUpdate(currentIndex, var22, var23)
		end)
	end, { pager, getActiveIsPlaying, getIsScrolling, var18 })
	local var19 = useSignalState(var13.getOverlayCovering)
	reactModule.useEffect(function() --[[ line: 172 ]]
		-- upvalues: active (ref), inputAllowed (ref), reducedMotion (ref), isEnabled (ref), var18 (ref), var19 (ref)
		var18.setForceShow((not active or (not inputAllowed or (reducedMotion or not isEnabled))) and not var19)
		var18.setForceHide(var19)
	end, {
		active, inputAllowed, reducedMotion, isEnabled, var19, var18
	})
	reactModule.useEffect(function() --[[ line: 181 ]]
		-- upvalues: var13 (ref), var18 (ref)
		var13.setRevealHandler(var18.reveal)
		
		return function() --[[ line: 183 ]]
			-- upvalues: var13 (copy)
			var13.setRevealHandler(nil)
		end
	end, { var13, var18 })
	reactModule.useEffect(function() --[[ line: 190 ]]
		-- upvalues: var13 (ref), var12 (ref)
		return function() --[[ line: 191 ]]
			-- upvalues: var13 (copy), var12 (copy)
			var13.setChromeVisible(true)
			var12.dispose()
		end
	end, { var13, var12 })
end