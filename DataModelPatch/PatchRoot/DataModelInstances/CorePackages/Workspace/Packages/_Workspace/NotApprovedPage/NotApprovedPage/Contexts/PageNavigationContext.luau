local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local _ = require(NotApprovedPage.Common.Types)
local STATICPAGENAMES = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils).STATIC_PAGE_NAMES
local GeneratePagesFunction = require(NotApprovedPage.Components.pageItemConfigs.generatePages).generatePages
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local PolicyEducationContentRegistryModule = require(NotApprovedPage.Components.pageItemConfigs.policyEducationConfigs.policyEducationContentRegistry)
local Parent = NotApprovedPage.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local ReactModule = require(Parent.React)
local UseMemoFunction = ReactModule.useMemo
local UseStateFunction = ReactModule.useState
local UseCallbackFunction = ReactModule.useCallback
local UseContextFunction = ReactModule.useContext
local FFlagEnableNapReactivationNoticeModule = require(NotApprovedPage.Flags.FFlagEnableNapReactivationNotice)
local Context = ReactModule.createContext({})

return {
	PageNavigationProvider = function(p1)
		-- upvalues: UseStateFunction (copy), UseNotApprovedPageContextFunction (copy), UseMemoFunction (copy), GeneratePagesFunction (copy), STATICPAGENAMES (copy), UseCallbackFunction (copy), FFlagEnableNapReactivationNoticeModule (copy), PolicyEducationContentRegistryModule (copy), ReactModule (copy), Context (copy)
		local UseStateResult, UseStateResult2 = UseStateFunction(1)
		local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
		local UntranslatedReasons = UseNotApprovedPageContextFunction().violationReasons.untranslatedReasons
		local CommutationEligibility = UseNotApprovedPageContextFunction().commutationEligibility
		local UseMemoResult = UseMemoFunction(function()
			-- upvalues: GeneratePagesFunction (upval), p1 (copy), UntranslatedReasons (copy), CommutationEligibility (copy)
			return GeneratePagesFunction(p1.moderationDetail, UntranslatedReasons, CommutationEligibility)
		end, {
			p1.moderationDetail,
			UntranslatedReasons,
			CommutationEligibility
		})
		local Pages = UseMemoResult.pages
		local UnmappedViolationKeys = UseMemoResult.unmappedViolationKeys
		local CountPages = #Pages
		local Page = Pages[UseStateResult]
		local PageName = if Page then Page.pageName else STATICPAGENAMES.Unknown
		local EducationalPassEligible = if CommutationEligibility then CommutationEligibility.educational_pass_eligible else false
		local UseCallbackResult = UseCallbackFunction(function()
			-- upvalues: UseStateResult (copy), CountPages (copy), FFlagEnableNapReactivationNoticeModule (upval), UseStateResult2_1 (copy), UseStateResult2 (copy)
			if UseStateResult < CountPages then
				if FFlagEnableNapReactivationNoticeModule then
					UseStateResult2_1(true)
				end
				UseStateResult2(function(p2: number): number
					return p2 + 1
				end)
			end
		end, { UseStateResult, CountPages })
		local UseCallbackResult1 = UseCallbackFunction(function()
			-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
			if UseStateResult > 1 then
				UseStateResult2(function(p2: number): number
					return p2 - 1
				end)
			end
		end, { UseStateResult })
		local IsUseStateResultMatch = UseStateResult == 1
		local IsUseStateResultMatch1 = UseStateResult == CountPages
		local UseCallbackResult2 = UseCallbackFunction(function(): number
			-- upvalues: CountPages (copy), PageName (copy), STATICPAGENAMES (upval), UseStateResult (copy), EducationalPassEligible (copy)
			if CountPages <= 1 or PageName == STATICPAGENAMES.Intro or PageName == STATICPAGENAMES.SecondChanceIntro then
				return 0
			end
			local CountPagesDelta = CountPages - 1
			local UseStateResultDelta = UseStateResult - 1
			
			if EducationalPassEligible then
				CountPagesDelta -= 1
				UseStateResultDelta -= 1
			end
			return if CountPagesDelta <= 0 then 0 else math.round(UseStateResultDelta / CountPagesDelta * 100)
		end, { UseStateResult, CountPages, PageName })
		local UseMemoResult1 = UseMemoFunction(function(): boolean
			-- upvalues: UntranslatedReasons (copy), PolicyEducationContentRegistryModule (upval)
			for _, untranslatedReason in UntranslatedReasons do
				if PolicyEducationContentRegistryModule[untranslatedReason] then
					return true
				end
			end
			return false
		end, { UntranslatedReasons })
		
		return ReactModule.createElement(Context.Provider, {
			value = UseMemoFunction(function()
				-- upvalues: UseStateResult (copy), PageName (copy), CountPages (copy), UseCallbackResult (copy), UseCallbackResult1 (copy), IsUseStateResultMatch (copy), IsUseStateResultMatch1 (copy), UseCallbackResult2 (copy), UseMemoResult1 (copy), FFlagEnableNapReactivationNoticeModule (upval), UseStateResult1 (copy), Page (copy), UnmappedViolationKeys (copy)
				return {
					currentPage = UseStateResult,
					currentPageName = PageName,
					totalPages = CountPages,
					goToNextPage = UseCallbackResult,
					goToPreviousPage = UseCallbackResult1,
					isFirstPage = IsUseStateResultMatch,
					isLastPage = IsUseStateResultMatch1,
					getProgress = UseCallbackResult2,
					hasEducationalPages = UseMemoResult1,
					hasNavigatedForward = if FFlagEnableNapReactivationNoticeModule then UseStateResult1 else false,
					currentPageConfigs = if Page then Page.pageItems else {},
					CurrentCtaComponent = if Page then Page.CtaComponent else nil,
					unmappedViolationKeys = UnmappedViolationKeys
				}
			end, {
				UseStateResult, CountPages, PageName, UseCallbackResult, UseCallbackResult1,
				IsUseStateResultMatch, IsUseStateResultMatch1, UseCallbackResult2, Pages,
				UseMemoResult1, UseStateResult1, UnmappedViolationKeys
			})
		}, p1.children)
	end,
	usePageNavigation = function()
		-- upvalues: UseContextFunction (copy), Context (copy), ArgCheckModule (copy)
		local UseContextResult = UseContextFunction(Context)
		ArgCheckModule.assert(UseContextResult and UseContextResult.currentPage ~= nil, "usePageNavigation must be used within PageNavigationProvider")
		
		return UseContextResult
	end
}