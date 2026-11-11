local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local UnitTestHelpersModule = require(Parent.Dev.UnitTestHelpers)
local config = {
	BackButton = "Back",
	Send = "Send",
	Title = "How can the creator help?",
	["ReportAbuse.Lead"] = "Trying to report abuse?",
	["ReportAbuse.Link"] = "<u>Submit a report instead.</u>",
	["Category.Label"] = "Category *",
	["Category.Placeholder"] = "Select a category",
	["Category.BugReport"] = "Bug report",
	["Category.DataRestoreRequest"] = "Item or data restoration",
	["Category.PurchasingIssue"] = "Purchase issue",
	["Category.Other"] = "Other",
	["Description.Label"] = "Details *",
	["Description.CharacterLimitHint"] = "Up to {MAX} characters",
	["Placeholder.BugReport"] = "BugReport placeholder",
	["Placeholder.DataRestoreRequest"] = "DataRestoreRequest placeholder",
	["Placeholder.PurchasingIssue"] = "PurchasingIssue placeholder",
	["Placeholder.Other"] = "Other placeholder",
	["ShareUserId.Label"] = "Share user information with creator",
	["ShareUserId.LabelRequired"] = "Share user information with creator (required)",
	["ShareUserId.Hint"] = "This helps the creator support the correct account.",
	["Toast.Submitted"] = "Support request sent",
	["Toast.Failed"] = "We couldn't send your request. Please try again later.",
	["Unavailable.Default.Title"] = "Support unavailable",
	["Unavailable.Default.Body"] = "Player support is currently unavailable. Please try again later.",
	["Unavailable.Under13.Title"] = "Feature not available",
	["Unavailable.Under13.Body"] = "Player support requests are unavailable for users under 13.",
	["Unavailable.NotRecentlyVisited.Title"] = "Visit required",
	["Unavailable.NotRecentlyVisited.Body"] = "You need to have played this experience recently to file a support request.",
	["Unavailable.OpenTicketLimit.Title"] = "Request already open",
	["Unavailable.OpenTicketLimit.Body"] = "Please wait for the creator to respond to your existing requests before submitting another request.",
	["Unavailable.RateLimited.Title"] = "Try again later",
	["Unavailable.RateLimited.Body"] = "Player support is temporarily unavailable. Please try again in a few minutes.",
	["Unavailable.TextFilter.Title"] = "Submission failed",
	["Unavailable.TextFilter.Body"] = "Your submission violated Roblox Community Standards. Trying to report abuse?"
}

return function(App)
	-- upvalues: config (copy), ReactModule (copy), LocalizationProvider (copy), UnitTestHelpersModule (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = {
			Format = function(_, Text: string, List)
				-- upvalues: config (upval)
				if string.sub(Text, 1, 47) == "CoreScripts.FeedbackPrompt.PlayerSupportPrompt." then
					local Entry = config[string.sub(Text, 48)] or Text
					
					if List then
						for i, value in pairs(List) do
							Entry = string.gsub(Entry, "{" .. i .. "}", (tostring(value)))
						end
					end
					return Entry
				else
					local Replaced = string.gsub(Text, "CoreScripts%.FeedbackPrompt%.FeedbackPrompt%.", "")
					
					if string.find(Replaced, "^Unavailable%.") then
						if Replaced == "Unavailable.Title" then
							return "UnavailableTitle"
						end
						if Replaced == "Unavailable.Header.Under13" then
							return "Under13Title"
						end
						if Replaced == "Unavailable.Hint.Under13" then
							return "Under13Content"
						end
						if Replaced == "Unavailable.Header.RateLimited" then
							return "RateLimitedTitle"
						end
						if Replaced == "Unavailable.Hint.RateLimited" then
							return "RateLimitedContent"
						end
						if Replaced == "Unavailable.Header.Default" then
							return "DefaultTitle"
						end
						if Replaced == "Unavailable.Hint.Default" then
							return "DefaultContent"
						end
						if Replaced == "Unavailable.OkayButton" then
							return "OK"
						end
					else
						if Replaced == "Title" then
							return "Feedback Prompt"
						end
						if Replaced == "Submit" then
							return "Submit"
						end
						if Replaced == "Submitting" then
							return "Submitting..."
						end
						if Replaced == "Placeholder" then
							return "Enter your feedback here..."
						end
						if Replaced == "Intro" then
							return "Tell us about your experience"
						end
						if Replaced == "Footer" then
							return "Your feedback helps improve the experience"
						end
						if Replaced == "Error.TooShort" then
							return "Feedback too short"
						end
						if Replaced == "Error.TooLong" then
							return "Feedback too long"
						end
					end
					if List then
						for i1, value1 in pairs(List) do
							Replaced = string.gsub(Replaced, "{" .. i1 .. "}", (tostring(value1)))
						end
					end
					return Replaced
				end
			end
		}
	}, {
		StyleProvider = UnitTestHelpersModule.createStyleProvider({ App = App })
	})
end