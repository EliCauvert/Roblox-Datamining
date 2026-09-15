local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local parent = coreScriptsPlayerFeedback.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local useTokens = foundationModule.Hooks.useTokens
local builderIconsModule = require(parent.BuilderIcons)
local iconVariant = builderIconsModule.IconVariant
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useEscapeDismissModule = require(coreScriptsPlayerFeedback.Hooks.useEscapeDismiss)
local t = {
	TICKET_CREATION_TEXT_FILTER_ERROR = {
		titleKey = "TextFilterTitle",
		bodyKey = "TextFilterBody",
		hasReportLink = true
	},
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
local t_1 = { titleKey = "DefaultTitle", bodyKey = "DefaultBody" }

local function _()
	pcall(function()
		local robloxGui = game:GetService("CoreGui"):FindFirstChild("RobloxGui")
		local modules = robloxGui and robloxGui:FindFirstChild("Modules") or nil
		local settings = modules and modules:FindFirstChild("Settings") or nil
		local settingsHub = settings and settings:FindFirstChild("SettingsHub") or nil
		
		if settingsHub then
			local unknownModule = require(settingsHub)
			unknownModule:SetVisibility(true, false, unknownModule.Instance.ReportAbusePage)
			
			return
		end
	end)
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), t (ref), t_1 (ref), reactModule (ref), useEscapeDismissModule (ref), dialog (ref), view (ref), icon (ref), builderIconsModule (ref), iconSize (ref), iconVariant (ref), text (ref), buttonVariant (ref)
	local var1 = useTokens()
	local var2 = useLocalization({
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
		TextFilterLink = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.ReportAbuse.Link"
	})
	local var3 = t[p1.reason or ""] or t_1
	local t_2 = {
		title = var2[var3.titleKey],
		body = var2[var3.bodyKey],
		hasReportLink = var3.hasReportLink
	}
	local var4 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.closePrompt()
		
		if p1.openPlayerSupportPrompt then
			p1.openPlayerSupportPrompt()
		end
	end, { p1.closePrompt, p1.openPlayerSupportPrompt })
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.closePrompt()
		pcall(function()
			local robloxGui = game:GetService("CoreGui"):FindFirstChild("RobloxGui")
			local modules = robloxGui and robloxGui:FindFirstChild("Modules") or nil
			local settings = modules and modules:FindFirstChild("Settings") or nil
			local settingsHub = settings and settings:FindFirstChild("SettingsHub") or nil
			
			if settingsHub then
				local unknownModule = require(settingsHub)
				unknownModule:SetVisibility(true, false, unknownModule.Instance.ReportAbusePage)
				
				return
			end
		end)
	end, { p1.closePrompt })
	useEscapeDismissModule("PlayerSupportUnavailableCancel", var4)
	
	return reactModule.createElement(dialog.Root, { hasBackdrop = true }, {
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 1 }, {
			Body = reactModule.createElement(view, {
				tag = "col gap-large size-full-0 auto-y",
				padding = { top = UDim.new(0, var1.Size.Size_500) }
			}, {
				TitleRow = reactModule.createElement(view, {
					tag = "row items-center gap-small auto-y",
					LayoutOrder = 1
				}, {
					AlertIcon = reactModule.createElement(icon, {
						LayoutOrder = 1,
						name = builderIconsModule.Icon.TriangleExclamation,
						size = iconSize.Large,
						variant = iconVariant.Filled,
						style = var1.Color.System.Alert
					}),
					TitleText = reactModule.createElement(text, {
						tag = "auto-xy text-heading-small text-align-x-left",
						LayoutOrder = 2,
						Text = t_2.title,
						TextYAlignment = Enum.TextYAlignment.Center,
						textStyle = var1.Color.Content.Emphasis
					})
				}),
				Paragraph = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
					LayoutOrder = 2,
					Text = t_2.body,
					textStyle = var1.Color.Content.Default
				}),
				LinkRow = if t_2.hasReportLink then reactModule.createElement(text, {
					RichText = true,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left",
					LayoutOrder = 3,
					Text = var2.TextFilterLink,
					onActivated = var5,
					selection = { Selectable = true },
					textStyle = var1.Color.Content.Default
				}) else nil
			})
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 2,
			actions = {
				{
					text = var2.BackButton,
					variant = buttonVariant.Emphasis,
					onActivated = var4
				}
			}
		})
	})
end)