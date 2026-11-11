local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local NotApprovedPageProvider = require(NotApprovedPage.Contexts.NotApprovedPageContext).NotApprovedPageProvider
local PageNavigationProvider = require(NotApprovedPage.Contexts.PageNavigationContext).PageNavigationProvider
local PageAnalyticsProvider = require(NotApprovedPage.Contexts.PageAnalyticsContext).PageAnalyticsProvider
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
local UnitTestHelpersModule = require(Parent.Dev.UnitTestHelpers)
local _ = require(NotApprovedPage.Common.Types)
local config = {
	punishedUserId = 12345,
	messageToUser = "This is a test moderator message",
	punishmentTypeDescription = "Warn",
	punishmentId = 67890,
	beginDate = "",
	endDate = "",
	verificationCategory = "",
	interventionId = "intervention-123",
	consequenceTransparencyMessage = "",
	showAppealsProcessLink = false,
	badUtterances = {}
}

local function MockProviders(p1)
	-- upvalues: config (copy), UnitTestHelpersModule (copy), ReactModule (copy), NotApprovedPageProvider (copy), PageNavigationProvider (copy), PageAnalyticsProvider (copy)
	local ModerationDetail = if p1.moderationDetail then p1.moderationDetail else config
	
	return UnitTestHelpersModule.mockProviders(ReactModule.createElement(NotApprovedPageProvider, {
		translations = p1.translations,
		moderationDetail = ModerationDetail,
		commutationEligibility = p1.commutationEligibility
	}, ReactModule.createElement(PageNavigationProvider, { moderationDetail = ModerationDetail }, ReactModule.createElement(PageAnalyticsProvider, nil, p1.children))), { mockFoundation = true })
end

return {
	renderWithProviders = function(p1, p2, p3, Translations, ModerationDetail)
		-- upvalues: MockProviders (copy), ReactModule (copy), ReactRobloxModule (copy)
		local MockProvidersResult = MockProviders({
			children = ReactModule.createElement(p2, p3),
			translations = Translations,
			moderationDetail = ModerationDetail
		})
		ReactRobloxModule.act(function()
			-- upvalues: p1 (copy), MockProvidersResult (copy)
			p1:render(MockProvidersResult)
		end)
	end,
	MockProviders = MockProviders,
	DEFAULT_MODERATION_DETAIL = table.clone(config)
}