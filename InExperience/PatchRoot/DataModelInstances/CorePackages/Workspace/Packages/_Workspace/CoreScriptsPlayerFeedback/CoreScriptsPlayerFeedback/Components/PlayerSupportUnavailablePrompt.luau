local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local Parent = CoreScriptsPlayerFeedback.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BuilderIconsModule = require(Parent.BuilderIcons)
local IconVariant = BuilderIconsModule.IconVariant
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseEscapeDismissModule = require(CoreScriptsPlayerFeedback.Hooks.useEscapeDismiss)
local FFlagPlayerSupportPromptEventIngestModule = require(CoreScriptsPlayerFeedback.Flags.FFlagPlayerSupportPromptEventIngest)
local PlayerSupportPromptTelemetryModule = require(CoreScriptsPlayerFeedback.Telemetry.PlayerSupportPromptTelemetry)
local config = {
	TICKET_CREATION_TEXT_FILTER_ERROR = {
		titleKey = "TextFilterTitle",
		bodyKey = "TextFilterBody",
		hasReportLink = true
	},
	TICKET_CREATION_GIBBERISH_ERROR = { titleKey = "TextFilterTitle", bodyKey = "GibberishBody" },
	TICKET_CREATION_ELIGIBILITY_FAILURE_REASON_UNDER13 = { titleKey = "Under13Title", bodyKey = "Under13Body" },
	TICKET_CREATION_ELIGIBILITY_FAILURE_REASON_NOT_RECENTLY_VISITED = {
		titleKey = "NotRecentlyVisitedTitle",
		bodyKey = "NotRecentlyVisitedBody"
	},
	TICKET_CREATION_ELIGIBILITY_FAILURE_REASON_OPEN_TICKET_LIMIT_REACHED = {
		titleKey = "OpenTicketLimitTitle",
		bodyKey = "OpenTicketLimitBody"
	},
	RateLimited = {
		titleKey = "RateLimitedTitle",
		bodyKey = "RateLimitedBody"
	}
}
local config1 = { titleKey = "DefaultTitle", bodyKey = "DefaultBody" }

local function _()
	pcall(function()
		local RobloxGui = game:GetService("CoreGui"):FindFirstChild("RobloxGui")
		local Modules = RobloxGui and RobloxGui:FindFirstChild("Modules") or nil
		local Settings = Modules and Modules:FindFirstChild("Settings") or nil
		local SettingsHub = Settings and Settings:FindFirstChild("SettingsHub") or nil
		
		if SettingsHub then
			local Module = require(SettingsHub)
			Module:SetVisibility(true, false, Module.Instance.ReportAbusePage)
			
			return
		end
	end)
end

return (ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), config (copy), config1 (copy), FFlagPlayerSupportPromptEventIngestModule (copy), ReactModule (copy), PlayerSupportPromptTelemetryModule (copy), UseEscapeDismissModule (copy), Dialog (copy), View (copy), Icon (copy), BuilderIconsModule (copy), IconSize (copy), IconVariant (copy), Text (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		BackButton = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.BackButton",
		Under13Title = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.Under13.Title",
		Under13Body = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.Under13.Body",
		NotRecentlyVisitedTitle = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.NotRecentlyVisited.Title",
		NotRecentlyVisitedBody = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.NotRecentlyVisited.Body",
		OpenTicketLimitTitle = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.OpenTicketLimit.Title",
		OpenTicketLimitBody = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.OpenTicketLimit.Body",
		RateLimitedTitle = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.RateLimited.Title",
		RateLimitedBody = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.RateLimited.Body",
		DefaultTitle = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.Default.Title",
		DefaultBody = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.Default.Body",
		TextFilterTitle = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.TextFilter.Title",
		TextFilterBody = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.TextFilter.Body",
		GibberishBody = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Unavailable.Gibberish.Body",
		TextFilterLink = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.ReportAbuse.Link"
	})
	local Entry = config[p1.reason or ""] or config1
	local config2 = {
		title = UseLocalizationResult[Entry.titleKey],
		body = UseLocalizationResult[Entry.bodyKey],
		hasReportLink = Entry.hasReportLink
	}
	local Reason = p1.reason or ""
	
	if FFlagPlayerSupportPromptEventIngestModule then
		ReactModule.useEffect(function()
			-- upvalues: PlayerSupportPromptTelemetryModule (upval), Reason (copy)
			PlayerSupportPromptTelemetryModule.logUnavailableShown(Reason)
		end, { Reason })
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagPlayerSupportPromptEventIngestModule (upval), p1 (copy), PlayerSupportPromptTelemetryModule (upval), Reason (copy)
		if FFlagPlayerSupportPromptEventIngestModule and p1.openPlayerSupportPrompt then
			PlayerSupportPromptTelemetryModule.log({
				action = PlayerSupportPromptTelemetryModule.Action.RejectionRetry,
				reason = Reason
			})
		end
		p1.closePrompt()
		
		if p1.openPlayerSupportPrompt then
			p1.openPlayerSupportPrompt()
		end
	end, if FFlagPlayerSupportPromptEventIngestModule then { p1.closePrompt, p1.openPlayerSupportPrompt, Reason } else { p1.closePrompt, p1.openPlayerSupportPrompt })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FFlagPlayerSupportPromptEventIngestModule (upval), PlayerSupportPromptTelemetryModule (upval), Reason (copy), p1 (copy)
		if FFlagPlayerSupportPromptEventIngestModule then
			PlayerSupportPromptTelemetryModule.log({
				action = PlayerSupportPromptTelemetryModule.Action.ReportAbuseClicked,
				reason = Reason
			})
		end
		p1.closePrompt()
		pcall(function()
			local RobloxGui = game:GetService("CoreGui"):FindFirstChild("RobloxGui")
			local Modules = RobloxGui and RobloxGui:FindFirstChild("Modules") or nil
			local Settings = Modules and Modules:FindFirstChild("Settings") or nil
			local SettingsHub = Settings and Settings:FindFirstChild("SettingsHub") or nil
			
			if SettingsHub then
				local Module = require(SettingsHub)
				Module:SetVisibility(true, false, Module.Instance.ReportAbusePage)
				
				return
			end
		end)
	end, if FFlagPlayerSupportPromptEventIngestModule then { p1.closePrompt, Reason } else { p1.closePrompt })
	UseEscapeDismissModule("PlayerSupportUnavailableCancel", UseResult)
	
	return ReactModule.createElement(Dialog.Root, { hasBackdrop = true }, {
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 1 }, {
			Body = ReactModule.createElement(View, {
				tag = "col gap-large size-full-0 auto-y",
				padding = { top = UDim.new(0, UseTokensResult.Size.Size_500) }
			}, {
				TitleRow = ReactModule.createElement(View, {
					tag = "row items-center gap-small auto-y",
					LayoutOrder = 1
				}, {
					AlertIcon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = BuilderIconsModule.Icon.TriangleExclamation,
						size = IconSize.Large,
						variant = IconVariant.Filled,
						style = UseTokensResult.Color.System.Alert
					}),
					TitleText = ReactModule.createElement(Text, {
						tag = "auto-xy text-heading-small text-align-x-left",
						LayoutOrder = 2,
						Text = config2.title,
						TextYAlignment = Enum.TextYAlignment.Center,
						textStyle = UseTokensResult.Color.Content.Emphasis
					})
				}),
				Paragraph = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
					LayoutOrder = 2,
					Text = config2.body,
					textStyle = UseTokensResult.Color.Content.Default
				}),
				LinkRow = if config2.hasReportLink then ReactModule.createElement(Text, {
					RichText = true,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
					LayoutOrder = 3,
					Text = UseLocalizationResult.TextFilterLink,
					onActivated = UseResult1,
					selection = { Selectable = true },
					textStyle = UseTokensResult.Color.Content.Default
				}) else nil
			})
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 2,
			actions = {
				{
					text = UseLocalizationResult.BackButton,
					variant = ButtonVariant.Emphasis,
					onActivated = UseResult
				}
			}
		})
	})
end))