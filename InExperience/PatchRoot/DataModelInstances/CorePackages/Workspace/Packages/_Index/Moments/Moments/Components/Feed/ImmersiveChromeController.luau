local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(script.Parent.FeedTypes)
local useImmersiveChromeModule = require(script.Parent.useImmersiveChrome)
local usePreferredInputModule = require(moments.Hooks.usePreferredInput)
local _ = require(moments.Components.VerticalPager)
local mediaPreloadProvider = momentsCommonModule.Media.MediaPreloadProvider
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local formFactor = momentsCommonModule.Enums.FormFactor
local usePreferences = foundationModule.Hooks.usePreferences

return function(p0)
	-- upvalues: mediaPreloadProvider (ref), usePreferredInputModule (ref), useFormFactor (ref), usePreferences (ref), formFactor (ref), reactModule (ref), useImmersiveChromeModule (ref)
	local pager = p0.pager
	local var6 = mediaPreloadProvider.useMediaControllerProvider()
	useImmersiveChromeModule({
		pager = pager,
		active = p0.active,
		getActiveIsPlaying = reactModule.useMemo(function()
			-- upvalues: var6 (ref), pager (ref)
			return function(p1)
				-- upvalues: var6 (copy), pager (copy)
				if var6 == nil then
					return true
				end
				local currentItem = pager.getCurrentItem(p1)
				
				if currentItem == nil or currentItem.kind ~= "moment" then
					return true
				end
				local momentId = var6.getControllerMap(p1)[currentItem.moment.momentId]
				
				return momentId == nil or momentId.getState(p1).isPlaying
			end
		end, { pager, var6 }),
		getIsScrolling = reactModule.useMemo(function()
			-- upvalues: p0 (ref)
			return function(p2)
				-- upvalues: p0 (copy)
				local current = p0.controllerRef.current
				
				return if current == nil then false else current.getScrollState(p2) ~= "Idle"
			end
		end, { p0.controllerRef }),
		inputAllowed = usePreferredInputModule() == Enum.PreferredInput.Touch and useFormFactor() == formFactor.MobilePortrait,
		reducedMotion = usePreferences().reducedMotion
	})
	
	return nil
end