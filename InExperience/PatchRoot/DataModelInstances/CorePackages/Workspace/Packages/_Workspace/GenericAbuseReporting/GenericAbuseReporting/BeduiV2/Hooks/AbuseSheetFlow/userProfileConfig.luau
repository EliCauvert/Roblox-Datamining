return {
	name = "user_profile",
	version = 2,
	attributes = { isUkRegionUser = false, isEuRegionUser = false },
	resources = {
		surfaces = {
			type = "listItem",
			value = {
				{
					id = "username",
					label = { ["$translate"] = "Label.UsernameDisplayNameDescription" }
				},
				{
					id = "avatar",
					label = { ["$translate"] = "Label.AvatarClothesOrAccessories" }
				},
				{
					id = "textChat",
					label = { ["$translate"] = "Label.TextChat" },
					meta = { showTextChatEducation = true }
				},
				{
					id = "voiceChat",
					label = { ["$translate"] = "Label.VoiceChat" },
					meta = { showVoiceEducation = true }
				},
				{
					id = "inGameBehavior",
					label = { ["$translate"] = "Label.InGameBehavior" }
				}
			}
		},
		abuseTypes = {
			type = "listItem",
			value = {
				{
					id = "bullying",
					label = { ["$translate"] = "Label.Bullying" },
					description = { ["$translate"] = "Label.BullyingDescription" },
					meta = {
						informationHeading = "More about romantic words and behavior",
						informationHref = "https://www.roblox.com/help/article/2033664"
					}
				},
				{
					id = "cheating",
					label = { ["$translate"] = "Label.Cheating" },
					description = { ["$translate"] = "Label.CheatingDescription" }
				},
				{
					id = "swearing",
					label = { ["$translate"] = "Label.Swearing" },
					description = { ["$translate"] = "Label.SwearingDescription" }
				},
				{
					id = "scamming",
					label = { ["$translate"] = "Label.Scamming" },
					description = { ["$translate"] = "Label.ScammingDescription" }
				},
				{
					id = "personalInfo",
					label = { ["$translate"] = "Label.PersonalInformation" },
					description = { ["$translate"] = "Label.PersonalInformationDescription" }
				},
				{
					id = "romantic",
					label = { ["$translate"] = "Label.RomanticWordsAndActions" },
					description = {
						["$translate"] = "Label.RomanticWordsAndActionsDescription"
					},
					meta = {
						disclosureInfo = "Dynamic disclosure info",
						informationHeading = "More about romantic words and behavior",
						informationHref = "https://www.roblox.com/help/article/2033664"
					}
				},
				{
					id = "extremeViolence",
					label = { ["$translate"] = "Label.ExtremeViolence" },
					description = { ["$translate"] = "Label.ExtremeViolenceDescription" }
				},
				{
					id = "spam",
					label = { ["$translate"] = "Label.Spam" },
					description = { ["$translate"] = "Label.SpamDescription" }
				},
				{
					id = "links",
					label = { ["$translate"] = "Label.LinksToOtherSites" },
					description = { ["$translate"] = "Label.LinksToOtherSitesDescription" }
				},
				{
					id = "dangerousSharing",
					label = { ["$translate"] = "Label.DangerousSharing" },
					description = { ["$translate"] = "Label.DangerousSharingDescription" }
				},
				{
					id = "realLife",
					label = { ["$translate"] = "Label.RealLifeSituations" },
					description = { ["$translate"] = "Label.RealLifeSituationsDescription" }
				}
			}
		}
	},
	display = {
		title = { ["$translate"] = "Title.ReportAPerson" },
		closeButtonLabel = { ["$translate"] = "Action.Close" },
		titleDisclosure = {
			["$switch"] = {
				{
					condition = { ["$attribute"] = "isUkRegionUser" },
					value = {
						tooltipTitle = "UK Online Safety Act",
						tooltipText = "Roblox may take action after we review your report but we will not share your information with any user you report. Reporting doesn't block the user or thing you reported. If you want to limit your interactions with a user, you can block them.",
						buttonLabel = "OSA reporting"
					}
				},
				{
					condition = { ["$attribute"] = "isEuRegionUser" },
					value = {
						tooltipTitle = "EU Digital Services Act",
						tooltipText = "Roblox may take action after we review your report but we will not share your information with any user you report. Reporting doesn't block the user or thing you reported. If you want to limit your interactions with a user, you can block them.",
						buttonLabel = "DSA reporting"
					}
				},
				{
					condition = true,
					value = {
						tooltipTitle = "Reporting Abuse",
						tooltipText = "Roblox may take action after we review your report but we will not share your information with any user you report. Reporting doesn't block the user or thing you reported. If you want to limit your interactions with a user, you can block them.",
						buttonLabel = "Learn more"
					}
				}
			}
		}
	},
	nodes = {
		root = {
			type = "list",
			storeAs = "selectedSurface",
			required = true,
			title = { ["$translate"] = "Label.WhatPartOfTheirProfile" },
			eyebrow = { ["$translate"] = "Title.ReportAPerson" },
			items = { ["$resource"] = "surfaces" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Description.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" },
			next = {
				["$switch"] = {
					{
						value = "voiceEducation",
						condition = { ["$store"] = "selectedSurface.meta.showVoiceEducation" }
					},
					{
						value = "textChatEducation",
						condition = {
							["$store"] = "selectedSurface.meta.showTextChatEducation"
						}
					},
					"abuseType"
				}
			}
		},
		abuseType = {
			type = "list",
			storeAs = "selectedAbuseType",
			required = true,
			next = "summary",
			title = { ["$translate"] = "Label.WhatWasTheIssue" },
			eyebrow = { ["$translate"] = "Title.ReportAPerson" },
			items = { ["$resource"] = "abuseTypes" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Description.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" }
		},
		voiceEducation = {
			type = "paragraph",
			next = "abuseType",
			title = { ["$translate"] = "Label.ReportVoiceChatInGame" },
			eyebrow = { ["$translate"] = "Title.ReportAPerson" },
			paragraph = { ["$translate"] = "Label.ReportVoiceChatText" },
			nextButtonText = { ["$translate"] = "Action.Continue" }
		},
		textChatEducation = {
			type = "paragraph",
			next = "abuseType",
			title = { ["$translate"] = "Label.ReportTextChatInGame" },
			eyebrow = { ["$translate"] = "Title.ReportAPerson" },
			paragraph = { ["$translate"] = "Label.ReportTextChatText" },
			nextButtonText = { ["$translate"] = "Action.Continue" }
		},
		summary = {
			type = "comment",
			storeAs = "comment",
			maxLength = 1000,
			next = "confirmation",
			title = { ["$translate"] = "Label.DoYouWantToExplainWhatHappened" },
			eyebrow = { ["$translate"] = "Title.ReportAPerson" },
			textAreaLabel = {
				["$translate"] = "Label.AddingDetailsGivesUsMoreEvidenceToReview"
			},
			placeholder = { ["$translate"] = "Label.TellUsInYourOwnWords" },
			optionalLabel = { ["$translate"] = "Label.Optional" },
			nextButtonText = { ["$translate"] = "Action.Send" },
			helperText = { ["$translate"] = "Label.CharacterCountWithLimit" }
		},
		confirmation = {
			type = "confirmation",
			title = { ["$translate"] = "Label.WeReceivedYourReport" },
			eyebrow = { ["$translate"] = "Title.ReportAPerson" },
			message = {
				["$translate"] = "Label.WeWillUseThisToKeepRobloxSafeForYouAndEveryone"
			},
			blockToggleLabel = { ["$translate"] = "Label.BlockThisPerson" },
			blockToggleDescription = { ["$translate"] = "Label.YouWonTSeeThemAnymore" },
			viewInformationButtonText = { ["$translate"] = "Label.ViewInformation" },
			informationHeading = { ["$store"] = "selectedAbuseType.meta.informationHeading" },
			informationHref = { ["$store"] = "selectedAbuseType.meta.informationHref" },
			nextButtonText = { ["$translate"] = "Action.Close" },
			next = { type = "close" }
		},
		generalError = {
			type = "paragraph",
			title = { ["$translate"] = "Label.SomethingWentWrong" },
			eyebrow = { ["$translate"] = "Title.ReportAPerson" },
			paragraph = { ["$translate"] = "Label.ErrorSubmittingReport" },
			nextButtonText = { ["$translate"] = "Action.Close" },
			next = { type = "close" }
		}
	},
	translations = {
		["Action.Close"] = "Close",
		["Action.Retry"] = "Retry",
		["Description.GeneralError"] = "Something went wrong. Please try again later.",
		["Label.WhatPartOfTheirProfile"] = "What part of their profile?",
		["Label.WhatWasTheIssue"] = "What was the issue?",
		["Label.UsernameDisplayNameDescription"] = "Username, display name, description",
		["Label.AvatarClothesOrAccessories"] = "Avatar, clothes, or accessories",
		["Label.TextChat"] = "Text chat",
		["Label.VoiceChat"] = "Voice chat",
		["Label.InGameBehavior"] = "In-game behavior",
		["Label.Bullying"] = "Bullying",
		["Label.BullyingDescription"] = "Being mean, discriminating, or threatening",
		["Label.CharacterCountWithLimit"] = "{currentLength}/{maxLength} characters",
		["Label.Cheating"] = "Cheating",
		["Label.CheatingDescription"] = "Using hacks, exploits, or breaking rules to win",
		["Label.Swearing"] = "Swearing",
		["Label.SwearingDescription"] = "Using swear words, even if they're misspelled or spelled with symbols",
		["Label.Scamming"] = "Scamming",
		["Label.ScammingDescription"] = "Fake trading, lying to get items and misleading people",
		["Label.PersonalInformation"] = "Personal information",
		["Label.PersonalInformationDescription"] = "Asking for or sharing things like full names, phone numbers, addresses, passwords",
		["Label.RomanticWordsAndActions"] = "Romantic words and actions",
		["Label.RomanticWordsAndActionsDescription"] = "Wearing revealing outfits, dating, kissing and other physical contact",
		["Label.ExtremeViolence"] = "Extreme violence",
		["Label.ExtremeViolenceDescription"] = "Showing a person, animal, or character that's realistically hurt or suffering",
		["Label.Spam"] = "Spam",
		["Label.SpamDescription"] = "Sending the same message over and over",
		["Label.LinksToOtherSites"] = "Links to other sites",
		["Label.LinksToOtherSitesDescription"] = "Sharing links to other websites and apps, trading Robux outside Roblox",
		["Label.DangerousSharing"] = "Dangerous sharing",
		["Label.DangerousSharingDescription"] = "Sharing activities or things that can hurt yourself or other people",
		["Label.RealLifeSituations"] = "Real-life situations",
		["Label.RealLifeSituationsDescription"] = "Recreating or making fun of upsetting things that happened in real life",
		["Label.ReportVoiceChatInGame"] = "Report voice chat in game",
		["Label.ReportTextChatInGame"] = "Report text chat in game",
		["Label.HowToReportForBestResults"] = "How to report for best results",
		["Label.ReportVoiceChatText"] = "Report violations in voice chat when you hear them. Roblox can attach evidence only if you report during a game.",
		["Label.ReportTextChatText"] = "Report violations in text chat when you see them. Roblox can attach evidence only if you report during a game.",
		["Label.FollowTheseSteps"] = "Follow these steps:",
		["Label.VoiceEducationStep1"] = "When in a game, tap on the user you want to report.",
		["Label.VoiceEducationStep2"] = "Select \"voice chat\" as the reason for abuse.",
		["Label.VoiceEducationStep3"] = "Adding as much detail as possible and reporting as close to the violative behavior helps Roblox take action on your report.",
		["Label.TextChatEducationStep1"] = "When in a game, tap on the user you want to report.",
		["Label.TextChatEducationStep2"] = "Select \"text chat\" as the reason for abuse.",
		["Label.TextChatEducationStep3"] = "Adding as much detail as possible and reporting as close to the violative behavior helps Roblox take action on your report.",
		["Label.RobloxCommunityStandards"] = "Roblox Community Standards.",
		["Label.LearnMoreAboutRobloxCommunityStandards"] = "Learn more about {linkStart}Roblox Community Standards{linkEnd}.",
		["Label.DoYouWantToExplainWhatHappened"] = "Do you want to explain what happened?",
		["Label.AddingDetailsGivesUsMoreEvidenceToReview"] = "Adding details gives us more evidence to review.",
		["Label.TellUsInYourOwnWords"] = "Tell us in your own words.",
		["Label.Optional"] = "Optional",
		["Label.Submitting"] = "Submitting",
		["Label.ViewInformation"] = "View information",
		["Label.BlockThisPerson"] = "Block this person",
		["Label.YouWonTSeeThemAnymore"] = "You won't see them any more.",
		["Label.WeReceivedYourReport"] = "We received your report",
		["Label.WeWillUseThisToKeepRobloxSafeForYouAndEveryone"] = "Thank you. We'll use this to keep Roblox safe for you and everyone.",
		["Label.SomethingWentWrong"] = "Something went wrong",
		["Label.ErrorSubmittingReport"] = "We weren't able to submit your report. Please try again later.",
		["Action.Continue"] = "Continue",
		["Action.Send"] = "Send",
		["Title.ReportAPerson"] = "Report a person"
	}
}