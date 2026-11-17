local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(script.Parent.FeedTypes)
local UseImmersiveChromeModule = require(script.Parent.useImmersiveChrome)
local NavBarChromeAdapterModule = require(Moments.Utils.navBarChromeAdapter)
local FFlagMomentsHideNavBarOnScrollModule = require(Moments.Flags.FFlagMomentsHideNavBarOnScroll)
local UsePreferredInputModule = require(Moments.Hooks.usePreferredInput)
local _ = require(Moments.Components.VerticalPager)
local MediaPreloadProvider = MomentsCommonModule.Media.MediaPreloadProvider
local UseFormFactorFunction = MomentsCommonModule.Hooks.useFormFactor
local FormFactor = MomentsCommonModule.Enums.FormFactor
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences

return function(p1)
	-- upvalues: MediaPreloadProvider (copy), UsePreferredInputModule (copy), UseFormFactorFunction (copy), UsePreferencesFunction (copy), FormFactor (copy), ReactModule (copy), FFlagMomentsHideNavBarOnScrollModule (copy), NavBarChromeAdapterModule (copy), UseImmersiveChromeModule (copy)
	local Pager = p1.pager
	local UseMediaControllerProviderResult = MediaPreloadProvider.useMediaControllerProvider()
	local UsePreferredInputModuleResult = UsePreferredInputModule()
	local UseFormFactorResult = UseFormFactorFunction()
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local IsUseFormFactorResultMatch: boolean = UsePreferredInputModuleResult == Enum.PreferredInput.Touch and UseFormFactorResult == FormFactor.MobilePortrait
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseMediaControllerProviderResult (copy), Pager (copy)
		return function(p2)
			-- upvalues: UseMediaControllerProviderResult (upval), Pager (upval)
			if UseMediaControllerProviderResult == nil then
				return true
			end
			local CurrentItem = Pager.getCurrentItem(p2)
			
			if CurrentItem == nil or CurrentItem.kind ~= "moment" then
				return true
			else
				local Controller = UseMediaControllerProviderResult.getControllerMap(p2)[CurrentItem.moment.momentId]
				
				return Controller == nil or Controller.getState(p2).isPlaying
			end
		end
	end, { Pager, UseMediaControllerProviderResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return function(p2): boolean
			-- upvalues: p1 (upval)
			local Current = p1.controllerRef.current
			
			return Current ~= nil and Current.getScrollState(p2) ~= "Idle"
		end
	end, { p1.controllerRef })
	local HideAppNavBarAfterSwipes: number = p1.hideAppNavBarAfterSwipes
	local UseMemoResult2 = nil
	local UseMemoResult3 = nil
	
	if FFlagMomentsHideNavBarOnScrollModule then
		UseMemoResult2 = ReactModule.useMemo(function()
			-- upvalues: p1 (copy)
			return function(p2)
				-- upvalues: p1 (upval)
				local Current = p1.controllerRef.current
				local GetDragTravel = if Current == nil then nil else Current.getDragTravel
				
				return if GetDragTravel == nil then Vector2.zero else GetDragTravel(p2)
			end
		end, { p1.controllerRef })
		UseMemoResult3 = ReactModule.useMemo(function()
			-- upvalues: HideAppNavBarAfterSwipes (copy), NavBarChromeAdapterModule (upval)
			return if HideAppNavBarAfterSwipes == nil then nil else NavBarChromeAdapterModule()
		end, { HideAppNavBarAfterSwipes ~= nil })
	end
	UseImmersiveChromeModule({
		pager = Pager,
		active = p1.active,
		getActiveIsPlaying = UseMemoResult,
		getIsScrolling = UseMemoResult1,
		inputAllowed = IsUseFormFactorResultMatch,
		reducedMotion = ReducedMotion,
		coveringOverlay = p1.coveringOverlay,
		navBarChrome = UseMemoResult3,
		getDragTravel = if UseMemoResult3 == nil then nil else UseMemoResult2,
		hideAfterAdvances = if UseMemoResult3 == nil or HideAppNavBarAfterSwipes == nil then nil elseif HideAppNavBarAfterSwipes > 0 then HideAppNavBarAfterSwipes else 1e999
	})
	
	return nil
end