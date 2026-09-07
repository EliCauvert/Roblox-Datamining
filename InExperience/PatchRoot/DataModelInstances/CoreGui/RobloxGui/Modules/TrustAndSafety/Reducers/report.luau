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
	[endReportFlowModule.name] = function(p1, _)
		-- upvalues: cryoModule (ref), constantsModule (ref)
		return cryoModule.Dictionary.join(p1, {
			history = {},
			currentPage = constantsModule.Page.None,
			targetPlayer = cryoModule.None,
			reportType = constantsModule.ReportType.Any,
			identifiedAvatars = {},
			selectedAvatars = {},
			screenshotAnnotationPoints = {}
		})
	end,
	[beginReportFlowModule.name] = function(p1, p2)
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
	[navigateBackModule.name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			history = cryoModule.List.removeIndex(p1.history, #p1.history),
			currentPage = p1.history[#p1.history] or p1.currentPage
		})
	end,
	[selectReportCategoryModule.name] = function(p1, p2)
		-- upvalues: constantsModule (ref), getFFlagReportAnythingScreenshotModule (ref), cryoModule (ref)
		local var1 = p2.reportCategory == constantsModule.Category.Experience
		local var2 = p1.beginningReportType == constantsModule.ReportType.Player
		local listing = constantsModule.Page.Listing
		local reportType = p1.reportType
		
		if getFFlagReportAnythingScreenshotModule() then
			if var1 then
				listing = constantsModule.Page.ScreenshotDialog
				reportType = constantsModule.ReportType.Place
			elseif var2 then
				listing = constantsModule.Page.ReportForm
			end
		elseif var1 or var2 then
			listing = constantsModule.Page.ReportForm
			
			if var1 then
				reportType = constantsModule.ReportType.Place
			end
		end
		return cryoModule.Dictionary.join(p1, {
			history = cryoModule.List.join(p1.history, { p1.currentPage }),
			currentPage = listing,
			reportType = reportType,
			reportCategory = p2.reportCategory
		})
	end,
	[selectReportListingModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref), constantsModule (ref)
		return cryoModule.Dictionary.join(p1, {
			sortedUserIds = cryoModule.List.join(p2.sortedUserIds or {}, {}),
			history = cryoModule.List.join(p1.history, { p1.currentPage }),
			currentPage = constantsModule.Page.ReportForm,
			reportType = p2.reportType,
			targetPlayer = p2.targetPlayer or cryoModule.None
		})
	end,
	[screenshotAnnotatedModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref), constantsModule (ref)
		return cryoModule.Dictionary.join(p1, {
			history = cryoModule.List.join(p1.history, { p1.currentPage }),
			currentPage = constantsModule.Page.ReportForm,
			screenshotAnnotationPoints = p2.annotationPoints
		})
	end,
	[openReportMenuModule.name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { isReportMenuOpen = true })
	end,
	[closeReportMenuModule.name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { isReportMenuOpen = false })
	end,
	[openReportSentDialogModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref), constantsModule (ref)
		return cryoModule.Dictionary.join(p1, {
			currentPage = constantsModule.Page.ReportSent,
			reportType = p2.reportType,
			targetPlayer = p2.targetPlayer or cryoModule.None
		})
	end,
	[setVoiceReportingFlowModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { voiceReportingFlowEnabled = p2.enable })
	end,
	[setIdentifiedAvatarsModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			identifiedAvatars = p2.identifiedAvatars,
			screenshotAnnotationPoints = {}
		})
	end,
	[setSelectedAvatarsModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { selectedAvatars = p2.selectedAvatars })
	end
})