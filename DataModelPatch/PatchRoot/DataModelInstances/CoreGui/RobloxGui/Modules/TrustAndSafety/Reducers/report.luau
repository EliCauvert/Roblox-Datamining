local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent
local _ = require(Parent.Actions.OpenReportDialog)
local _ = require(Parent.Actions.OpenCategoryMenu)
local _ = require(Parent.Actions.CloseReportSentDialog)
local ConstantsModule = require(Parent.Resources.Constants)
local GetFFlagReportAnythingScreenshotModule = require(Parent.Flags.GetFFlagReportAnythingScreenshot)

return require(CorePackages.Packages.Rodux).createReducer({
	voiceReportingFlowEnabled = true,
	targetPlayer = nil,
	beginningTimestamp = 0,
	currentPage = ConstantsModule.Page.None,
	history = {},
	reportType = ConstantsModule.ReportType.Any,
	beginningReportType = ConstantsModule.ReportType.Any,
	reportCategory = ConstantsModule.Category.None,
	sortedUserIds = {},
	screenshotAnnotationPoints = {},
	identifiedAvatars = {},
	selectedAvatars = {}
}, {
	[require(Parent.Actions.EndReportFlow).name] = function(p1, _)
		-- upvalues: CryoModule (copy), ConstantsModule (copy)
		return CryoModule.Dictionary.join(p1, {
			history = {},
			currentPage = ConstantsModule.Page.None,
			targetPlayer = CryoModule.None,
			reportType = ConstantsModule.ReportType.Any,
			identifiedAvatars = {},
			selectedAvatars = {},
			screenshotAnnotationPoints = {}
		})
	end,
	[require(Parent.Actions.BeginReportFlow).name] = function(p1, p2)
		-- upvalues: ConstantsModule (copy), CryoModule (copy)
		local config = {
			reportCategory = ConstantsModule.Category.None,
			beginningTimestamp = workspace:GetServerTimeNow(),
			sortedUserIds = {},
			history = { ConstantsModule.Page.None }
		}
		
		return if p2.reportType == ConstantsModule.ReportType.Place then CryoModule.Dictionary.join(p1, config, {
			reportType = p2.reportType,
			beginningReportType = p2.reportType,
			currentPage = ConstantsModule.Page.ReportForm,
			targetPlayer = CryoModule.None
		}) elseif p2.reportType == ConstantsModule.ReportType.Player then CryoModule.Dictionary.join(p1, config, {
			reportType = p2.reportType,
			beginningReportType = p2.reportType,
			targetPlayer = p2.targetPlayer,
			currentPage = if p1.voiceReportingFlowEnabled then ConstantsModule.Page.Category else ConstantsModule.Page.ReportForm
		}) else CryoModule.Dictionary.join(p1, config, {
			reportType = ConstantsModule.ReportType.Any,
			beginningReportType = ConstantsModule.ReportType.Any,
			targetPlayer = CryoModule.None,
			currentPage = if p1.voiceReportingFlowEnabled then ConstantsModule.Page.Category else ConstantsModule.Page.Listing
		})
	end,
	[require(Parent.Actions.NavigateBack).name] = function(p1, _)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			history = CryoModule.List.removeIndex(p1.history, #p1.history),
			currentPage = p1.history[#p1.history] or p1.currentPage
		})
	end,
	[require(Parent.Actions.SelectReportCategory).name] = function(p1, p2)
		-- upvalues: ConstantsModule (copy), GetFFlagReportAnythingScreenshotModule (copy), CryoModule (copy)
		local IsReportCategoryMatch = p2.reportCategory == ConstantsModule.Category.Experience
		local IsBeginningReportTypeMatch = p1.beginningReportType == ConstantsModule.ReportType.Player
		local Listing = ConstantsModule.Page.Listing
		local ReportType = p1.reportType
		
		if GetFFlagReportAnythingScreenshotModule() then
			if IsReportCategoryMatch then
				Listing = ConstantsModule.Page.ScreenshotDialog
				ReportType = ConstantsModule.ReportType.Place
			elseif IsBeginningReportTypeMatch then
				Listing = ConstantsModule.Page.ReportForm
			end
		elseif IsReportCategoryMatch or IsBeginningReportTypeMatch then
			Listing = ConstantsModule.Page.ReportForm
			
			if IsReportCategoryMatch then
				ReportType = ConstantsModule.ReportType.Place
			end
		end
		return CryoModule.Dictionary.join(p1, {
			history = CryoModule.List.join(p1.history, { p1.currentPage }),
			currentPage = Listing,
			reportType = ReportType,
			reportCategory = p2.reportCategory
		})
	end,
	[require(Parent.Actions.SelectReportListing).name] = function(p1, p2)
		-- upvalues: CryoModule (copy), ConstantsModule (copy)
		return CryoModule.Dictionary.join(p1, {
			sortedUserIds = CryoModule.List.join(p2.sortedUserIds or {}, {}),
			history = CryoModule.List.join(p1.history, { p1.currentPage }),
			currentPage = ConstantsModule.Page.ReportForm,
			reportType = p2.reportType,
			targetPlayer = p2.targetPlayer or CryoModule.None
		})
	end,
	[require(Parent.Actions.ScreenshotAnnotated).name] = function(p1, p2)
		-- upvalues: CryoModule (copy), ConstantsModule (copy)
		return CryoModule.Dictionary.join(p1, {
			history = CryoModule.List.join(p1.history, { p1.currentPage }),
			currentPage = ConstantsModule.Page.ReportForm,
			screenshotAnnotationPoints = p2.annotationPoints
		})
	end,
	[require(Parent.Actions.OpenReportMenu).name] = function(p1, _)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { isReportMenuOpen = true })
	end,
	[require(Parent.Actions.CloseReportMenu).name] = function(p1, _)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { isReportMenuOpen = false })
	end,
	[require(Parent.Actions.OpenReportSentDialog).name] = function(p1, p2)
		-- upvalues: CryoModule (copy), ConstantsModule (copy)
		return CryoModule.Dictionary.join(p1, {
			currentPage = ConstantsModule.Page.ReportSent,
			reportType = p2.reportType,
			targetPlayer = p2.targetPlayer or CryoModule.None
		})
	end,
	[require(Parent.Actions.SetVoiceReportingFlow).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { voiceReportingFlowEnabled = p2.enable })
	end,
	[require(Parent.Actions.SetIdentifiedAvatars).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			identifiedAvatars = p2.identifiedAvatars,
			screenshotAnnotationPoints = {}
		})
	end,
	[require(Parent.Actions.SetSelectedAvatars).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { selectedAvatars = p2.selectedAvatars })
	end
})