local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roduxModule = require(corePackagesService.Packages.Rodux)
local parent = script.Parent.Parent
local openReportMenuModule = require(parent.Actions.OpenReportMenu)
local closeReportMenuModule = require(parent.Actions.CloseReportMenu)
local _ = require(parent.Actions.OpenReportDialog)
local _ = require(parent.Actions.OpenCategoryMenu)
local selectReportCategoryModule = require(parent.Actions.SelectReportCategory)
local openReportSentDialogModule = require(parent.Actions.OpenReportSentDialog)
local _ = require(parent.Actions.CloseReportSentDialog)
local selectReportListingModule = require(parent.Actions.SelectReportListing)
local setVoiceReportingFlowModule = require(parent.Actions.SetVoiceReportingFlow)
local setIdentifiedAvatarsModule = require(parent.Actions.SetIdentifiedAvatars)
local setSelectedAvatarsModule = require(parent.Actions.SetSelectedAvatars)
local beginReportFlowModule = require(parent.Actions.BeginReportFlow)
local endReportFlowModule = require(parent.Actions.EndReportFlow)
local screenshotAnnotatedModule = require(parent.Actions.ScreenshotAnnotated)
local navigateBackModule = require(parent.Actions.NavigateBack)
local constantsModule = require(parent.Resources.Constants)
local getFFlagReportAnythingScreenshotModule = require(parent.Flags.GetFFlagReportAnythingScreenshot)

return roduxModule.createReducer({
	voiceReportingFlowEnabled = true,
	targetPlayer = nil,
	beginningTimestamp = 0,
	currentPage = constantsModule.Page.None,
	history = {},
	reportType = constantsModule.ReportType.Any,
	beginningReportType = constantsModule.ReportType.Any,
	reportCategory = constantsModule.Category.None,
	sortedUserIds = {},
	screenshotAnnotationPoints = {},
	identifiedAvatars = {},
	selectedAvatars = {}
}, {
	[endReportFlowModule.name] = function(p0, _) --[[ line: 41 ]]
		-- upvalues: cryoModule (ref), constantsModule (ref)
		return cryoModule.Dictionary.join(p0, {
			history = {},
			currentPage = constantsModule.Page.None,
			targetPlayer = cryoModule.None,
			reportType = constantsModule.ReportType.Any,
			identifiedAvatars = {},
			selectedAvatars = {},
			screenshotAnnotationPoints = {}
		})
	end,
	[beginReportFlowModule.name] = function(p1, p2) --[[ line: 52 ]]
		-- upvalues: constantsModule (ref), cryoModule (ref)
		local t = {
			reportCategory = constantsModule.Category.None,
			beginningTimestamp = workspace:GetServerTimeNow(),
			sortedUserIds = {},
			history = { constantsModule.Page.None }
		}
		
		return if p2.reportType == constantsModule.ReportType.Place then cryoModule.Dictionary.join(p1, t, {
			reportType = p2.reportType,
			beginningReportType = p2.reportType,
			currentPage = constantsModule.Page.ReportForm,
			targetPlayer = cryoModule.None
		}) elseif p2.reportType == constantsModule.ReportType.Player then cryoModule.Dictionary.join(p1, t, {
			reportType = p2.reportType,
			beginningReportType = p2.reportType,
			targetPlayer = p2.targetPlayer,
			currentPage = if p1.voiceReportingFlowEnabled then constantsModule.Page.Category else constantsModule.Page.ReportForm
		}) else cryoModule.Dictionary.join(p1, t, {
			reportType = constantsModule.ReportType.Any,
			beginningReportType = constantsModule.ReportType.Any,
			targetPlayer = cryoModule.None,
			currentPage = if p1.voiceReportingFlowEnabled then constantsModule.Page.Category else constantsModule.Page.Listing
		})
	end,
	[navigateBackModule.name] = function(p3, _) --[[ line: 86 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p3, {
			history = cryoModule.List.removeIndex(p3.history, #p3.history),
			currentPage = p3.history[#p3.history] or p3.currentPage
		})
	end,
	[selectReportCategoryModule.name] = function(p4, p5) --[[ line: 95 ]]
		-- upvalues: constantsModule (ref), getFFlagReportAnythingScreenshotModule (ref), cryoModule (ref)
		local var18 = p5.reportCategory == constantsModule.Category.Experience
		local var19 = p4.beginningReportType == constantsModule.ReportType.Player
		local listing = constantsModule.Page.Listing
		local reportType = p4.reportType
		
		if getFFlagReportAnythingScreenshotModule() then
			if var18 then
				listing = constantsModule.Page.ScreenshotDialog
				reportType = constantsModule.ReportType.Place
			elseif var19 then
				listing = constantsModule.Page.ReportForm
			end
		elseif var18 or var19 then
			listing = constantsModule.Page.ReportForm
			
			if var18 then
				reportType = constantsModule.ReportType.Place
			end
		end
		return cryoModule.Dictionary.join(p4, {
			history = cryoModule.List.join(p4.history, { p4.currentPage }),
			currentPage = listing,
			reportType = reportType,
			reportCategory = p5.reportCategory
		})
	end,
	[selectReportListingModule.name] = function(p6, p7) --[[ line: 129 ]]
		-- upvalues: cryoModule (ref), constantsModule (ref)
		return cryoModule.Dictionary.join(p6, {
			sortedUserIds = cryoModule.List.join(p7.sortedUserIds or {}, {}),
			history = cryoModule.List.join(p6.history, { p6.currentPage }),
			currentPage = constantsModule.Page.ReportForm,
			reportType = p7.reportType,
			targetPlayer = p7.targetPlayer or cryoModule.None
		})
	end,
	[screenshotAnnotatedModule.name] = function(p8, p9) --[[ line: 140 ]]
		-- upvalues: cryoModule (ref), constantsModule (ref)
		return cryoModule.Dictionary.join(p8, {
			history = cryoModule.List.join(p8.history, { p8.currentPage }),
			currentPage = constantsModule.Page.ReportForm,
			screenshotAnnotationPoints = p9.annotationPoints
		})
	end,
	[openReportMenuModule.name] = function(p10, _) --[[ line: 151 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p10, { isReportMenuOpen = true })
	end,
	[closeReportMenuModule.name] = function(p11, _) --[[ line: 156 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p11, { isReportMenuOpen = false })
	end,
	[openReportSentDialogModule.name] = function(p12, p13) --[[ line: 161 ]]
		-- upvalues: cryoModule (ref), constantsModule (ref)
		return cryoModule.Dictionary.join(p12, {
			currentPage = constantsModule.Page.ReportSent,
			reportType = p13.reportType,
			targetPlayer = p13.targetPlayer or cryoModule.None
		})
	end,
	[setVoiceReportingFlowModule.name] = function(p14, p15) --[[ line: 168 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p14, { voiceReportingFlowEnabled = p15.enable })
	end,
	[setIdentifiedAvatarsModule.name] = function(p16, p17) --[[ line: 173 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p16, {
			identifiedAvatars = p17.identifiedAvatars,
			screenshotAnnotationPoints = {}
		})
	end,
	[setSelectedAvatarsModule.name] = function(p18, p19) --[[ line: 179 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p18, { selectedAvatars = p19.selectedAvatars })
	end
})