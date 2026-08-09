return {
	name = "in_experience",
	version = 2,
	startNode = {
		["$switch"] = {
			{
				value = "preselectedAbuserRoot",
				condition = { ["$attribute"] = "preselectedAbuserId" }
			},
			{ condition = true, value = "root" }
		}
	},
	attributes = {
		abuseVector = "in-experience",
		experienceTargetId = "9588998913",
		isUsRegionUser = true,
		isVoiceChatReportable = true
	},
	resources = {
		reportSurfaces = {
			type = "listItem",
			value = {
				{
					["$switch"] = {
						{
							condition = { ["$attribute"] = "isVoiceChatReportable" },
							value = {
								leading = "Microphone",
								id = "voiceChat",
								label = { ["$translate"] = "Label.VoiceChat" },
								meta = { routeVoiceChat = true, submitAsVoice = true }
							}
						}
					}
				},
				{
					leading = "SpeechBubbleAlignCenter",
					id = "textChat",
					label = { ["$translate"] = "Label.TextChat" },
					meta = { routeTextChat = true, submitAsChat = true }
				},
				{
					leading = "Person",
					id = "avatarNameBehavior",
					label = { ["$translate"] = "Label.SomeonePlaying" },
					description = { ["$translate"] = "Description.AvatarOrName" },
					meta = { routeAvatarOrName = true, submitAsUser = true }
				},
				{
					leading = "Controller",
					id = "gameOrExperience",
					label = { ["$translate"] = "Label.GameOrExperience" },
					description = { ["$translate"] = "Description.GameOrExperience" },
					meta = { routeGameOrExperience = true, submitAsPlace = true }
				}
			}
		},
		temporaryUsers = {
			type = "listItem",
			value = {
				{
					id = "user1",
					label = "DisplayName1",
					description = "@username1"
				},
				{
					id = "user2",
					label = "DisplayName2",
					description = "@username2"
				},
				{
					id = "user3",
					label = "DisplayName3",
					description = "@username3"
				}
			}
		},
		preselectedAbuserSurfaces = {
			type = "listItem",
			value = {
				{
					["$switch"] = {
						{
							condition = { ["$attribute"] = "isVoiceChatReportable" },
							value = {
								leading = "Microphone",
								id = "voiceChat",
								label = { ["$translate"] = "Label.VoiceChat" },
								meta = { routeVoiceChat = true, submitAsVoice = true }
							}
						}
					}
				},
				{
					leading = "SpeechBubbleAlignCenter",
					id = "textChat",
					label = { ["$translate"] = "Label.TextChat" },
					meta = { routeTextChat = true, submitAsChat = true }
				},
				{
					leading = "PersonRunning",
					id = "somethingTheyDid",
					label = { ["$translate"] = "Label.SomethingTheyDid" },
					meta = { routeUserTargets = true, submitAsUser = true }
				},
				{
					leading = "Person",
					id = "avatarOrName",
					label = { ["$translate"] = "Label.TheirAvatarOrName" },
					meta = { routeAvatarOrName = true, submitAsUser = true }
				},
				{
					leading = "PersonWithSmallerPerson",
					id = "ABUSE_CATEGORY_INACCURATE_AGE_GUIDELINES",
					label = { ["$translate"] = "Label.SurfacePlayerAge" },
					meta = { routeComment = true, submitAsUser = true }
				}
			}
		},
		generalUserTargets = {
			type = "listItem",
			value = {
				{
					id = "ABUSE_CATEGORY_AVATAR",
					label = { ["$translate"] = "Label.Avatar" }
				},
				{
					id = "ABUSE_CATEGORY_INAPPROPRIATE_USERNAME",
					label = { ["$translate"] = "Label.Name" }
				},
				{
					id = "ABUSE_CATEGORY_CHEATING",
					label = { ["$translate"] = "Label.SurfaceCheating" },
					meta = { routeComment = true }
				},
				{
					id = "ABUSE_CATEGORY_INACCURATE_AGE_GUIDELINES",
					label = { ["$translate"] = "Label.SurfacePlayerAge" },
					meta = { routeComment = true }
				},
				{
					id = "behavior",
					label = { ["$translate"] = "Label.SurfaceBehavior" }
				}
			}
		},
		usernameOrAvatar = {
			type = "listItem",
			value = {
				{
					id = "ABUSE_CATEGORY_AVATAR",
					label = { ["$translate"] = "Label.Avatar" },
					meta = { routeAvatarOrName = true }
				},
				{
					id = "ABUSE_CATEGORY_INAPPROPRIATE_USERNAME",
					label = { ["$translate"] = "Label.Name" },
					meta = { routeAvatarOrName = true }
				}
			}
		},
		cheatingOrBehavior = {
			type = "listItem",
			value = {
				{
					id = "ABUSE_CATEGORY_CHEATING",
					label = { ["$translate"] = "Label.SurfaceCheating" },
					meta = { routeComment = true }
				},
				{
					id = "behavior",
					label = { ["$translate"] = "Label.SurfaceBehavior" }
				}
			}
		},
		experienceTargets = {
			type = "listItem",
			value = {
				{
					leading = "CubeQuestionMark",
					id = "somethingInExperience",
					label = { ["$translate"] = "Label.SomethingInExperience" },
					meta = { routeHighlightMode = true }
				},
				{
					leading = "Controller",
					id = "wholeGameOrExperience",
					label = { ["$translate"] = "Label.WholeGameOrExperience" }
				}
			}
		},
		abuseTypes = {
			type = "listItem",
			value = {
				{
					id = "ABUSE_CATEGORY_BULLYING",
					label = { ["$translate"] = "Label.AbuseBullying" },
					description = { ["$translate"] = "Description.AbuseBullying" },
					meta = { showHelpline = true }
				},
				{
					id = "ABUSE_CATEGORY_SWEARING",
					label = { ["$translate"] = "Label.AbuseSwearing" },
					description = { ["$translate"] = "Description.AbuseSwearing" }
				},
				{
					id = "ABUSE_CATEGORY_SCAMMING",
					label = { ["$translate"] = "Label.AbuseScamming" },
					description = { ["$translate"] = "Description.AbuseScamming" }
				},
				{
					id = "ABUSE_CATEGORY_CHEATING",
					label = { ["$translate"] = "Label.AbuseCheating" },
					description = { ["$translate"] = "Description.AbuseCheating" }
				},
				{
					id = "ABUSE_CATEGORY_PERSONAL_QUESTION",
					label = { ["$translate"] = "Label.AbusePersonalInformation" },
					description = { ["$translate"] = "Description.AbusePersonalInformation" }
				},
				{
					id = "ABUSE_CATEGORY_HATE_SPEECH",
					label = { ["$translate"] = "Label.AbuseDiscrimination" },
					description = { ["$translate"] = "Description.AbuseDiscrimination" },
					meta = { showHelpline = true }
				},
				{
					id = "ABUSE_CATEGORY_SPAMMING",
					label = { ["$translate"] = "Label.AbuseSpam" },
					description = { ["$translate"] = "Description.AbuseSpam" }
				},
				{
					id = "ABUSE_CATEGORY_OFFSITE_LINKS",
					label = { ["$translate"] = "Label.AbuseOffPlatformLinks" },
					description = { ["$translate"] = "Description.AbuseOffPlatformLinks" }
				},
				{
					id = "ABUSE_CATEGORY_DATING_OR_SEXUAL_CONTENT",
					label = { ["$translate"] = "Label.AbuseRomanceSex" },
					description = { ["$translate"] = "Description.AbuseRomanceSex" },
					meta = { showHelpline = true }
				},
				{
					id = "ABUSE_CATEGORY_VIOLENCE_OR_TERRORISM",
					label = { ["$translate"] = "Label.AbuseViolence" },
					description = { ["$translate"] = "Description.AbuseViolence" },
					meta = { showHelpline = true }
				},
				{
					id = "ABUSE_CATEGORY_DANGEROUS_ASK",
					label = { ["$translate"] = "Label.AbuseDangerousSuggestions" },
					description = { ["$translate"] = "Description.AbuseDangerousSuggestions" },
					meta = { showHelpline = true }
				},
				{
					id = "ABUSE_CATEGORY_ASKING_OR_GIVING_PII",
					label = { ["$translate"] = "Label.AbuseRealLifeEvents" },
					description = { ["$translate"] = "Description.AbuseRealLifeEvents" }
				},
				{
					id = "ABUSE_CATEGORY_SUICIDE_OR_SELF_HARM",
					label = { ["$translate"] = "Label.AbuseInappropriateRequest" },
					description = { ["$translate"] = "Description.AbuseInappropriateRequest" }
				}
			}
		},
		gameAbuseTypes = {
			type = "listItem",
			value = {
				{
					id = "ABUSE_CATEGORY_INACCURATE_AGE_GUIDELINES",
					label = { ["$translate"] = "Label.GameRating" },
					description = { ["$translate"] = "Description.GameRating" }
				},
				{
					id = "ABUSE_CATEGORY_TEXT_CHAT",
					label = { ["$translate"] = "Label.ChatFilters" },
					description = { ["$translate"] = "Description.ChatFilters" }
				},
				{
					id = "ABUSE_CATEGORY_DATING_OR_SEXUAL_CONTENT",
					label = { ["$translate"] = "Label.AbuseRomanceSex" },
					description = { ["$translate"] = "Description.AbuseRomanceSex" }
				},
				{
					id = "ABUSE_CATEGORY_ILLEGAL_CONTENT",
					label = { ["$translate"] = "Label.IllegalAdultGoods" },
					description = { ["$translate"] = "Description.IllegalAdultGoods" }
				},
				{
					id = "ABUSE_CATEGORY_HARASSMENT",
					label = { ["$translate"] = "Label.AbuseDiscrimination" },
					description = { ["$translate"] = "Description.AbuseDiscrimination" }
				},
				{
					id = "ABUSE_CATEGORY_VIOLENCE_OR_TERRORISM",
					label = { ["$translate"] = "Label.AbuseViolence" },
					description = { ["$translate"] = "Description.AbuseViolence" }
				},
				{
					id = "ABUSE_CATEGORY_ASKING_OR_GIVING_PII",
					label = { ["$translate"] = "Label.AbuseRealLifeEvents" },
					description = { ["$translate"] = "Description.AbuseRealLifeEvents" }
				},
				{
					id = "ABUSE_CATEGORY_DANGEROUS_ASK",
					label = { ["$translate"] = "Label.AbuseDangerousSuggestions" },
					description = { ["$translate"] = "Description.AbuseDangerousSuggestions" }
				},
				{
					id = "ABUSE_CATEGORY_SCAMMING",
					label = { ["$translate"] = "Label.AbuseScamming" },
					description = { ["$translate"] = "Description.AbuseScamming" }
				},
				{
					id = "ABUSE_CATEGORY_OFFSITE_LINKS",
					label = { ["$translate"] = "Label.AbuseOffPlatformLinks" },
					description = { ["$translate"] = "Description.AbuseOffPlatformLinks" }
				}
			}
		},
		regionalFooterItems = {
			type = "listItem",
			value = {
				{
					["$switch"] = {
						{
							condition = {
								["$switch"] = {
									{
										value = true,
										condition = { ["$attribute"] = "isUkRegionUser" }
									},
									{
										value = true,
										condition = { ["$attribute"] = "isAuRegionUser" }
									},
									{
										value = true,
										condition = { ["$attribute"] = "isBrRegionUser" }
									},
									{
										value = true,
										condition = { ["$attribute"] = "isEuRegionUser" }
									}
								}
							},
							value = {
								id = "illegalContentReporting",
								label = {
									["$translate"] = "Label.ReportIllegalContent",
									wrappers = {
										link = {
											type = "link",
											href = "https://www.roblox.com/illegal-content-reporting"
										}
									}
								}
							}
						},
						{
							condition = { ["$attribute"] = "isUsRegionUser" },
							value = {
								id = "takeItDown",
								label = {
									["$translate"] = "Label.TakeItDown",
									wrappers = {
										link = {
											type = "link",
											href = "https://www.roblox.com/non-consensual-intimate-imagery-removal-request"
										}
									}
								}
							}
						}
					}
				}
			}
		},
		illegalContentReportingFooterItem = {
			type = "paragraph",
			value = {
				["$translate"] = "Label.ReportIllegalContent",
				wrappers = {
					link = {
						type = "link",
						href = "https://www.roblox.com/illegal-content-reporting"
					}
				}
			}
		},
		takeItDownFooterItem = {
			type = "paragraph",
			value = {
				["$translate"] = "Label.TakeItDown",
				wrappers = {
					link = {
						type = "link",
						href = "https://www.roblox.com/non-consensual-intimate-imagery-removal-request"
					}
				}
			}
		}
	},
	display = {
		closeButtonLabel = { ["$translate"] = "Action.Close" },
		titleDisclosure = {
			tooltipTitle = { ["$translate"] = "Title.HowReportsWork" },
			tooltipText = { ["$translate"] = "Description.HowReportsWork" },
			closeButtonLabel = { ["$translate"] = "Action.Close" },
			buttonLabel = {
				["$switch"] = {
					{
						condition = { ["$attribute"] = "isUkRegionUser" },
						value = { ["$translate"] = "Action.Ok" }
					}
				}
			},
			openByDefault = { ["$attribute"] = "isUkRegionUser" }
		}
	},
	nodes = {
		root = {
			type = "list",
			variant = "chevron",
			required = true,
			storeAs = "selectedSurface",
			title = { ["$translate"] = "Title.WhatToReport" },
			items = { ["$resource"] = "reportSurfaces" },
			footerItems = { ["$resource"] = "regionalFooterItems" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" },
			next = {
				["$switch"] = {
					{
						value = "voiceChatPlayerSelection",
						condition = { ["$store"] = "selectedSurface.meta.routeVoiceChat" }
					},
					{
						value = "textChatLineSelection",
						condition = { ["$store"] = "selectedSurface.meta.routeTextChat" }
					},
					{
						value = "experienceSubSelection",
						condition = {
							["$store"] = "selectedSurface.meta.routeGameOrExperience"
						}
					},
					{ condition = true, value = "generalUserSelection" }
				}
			}
		},
		preselectedAbuserRoot = {
			type = "list",
			variant = "chevron",
			required = true,
			storeAs = "selectedSurface",
			title = { ["$translate"] = "Title.WhatToReport" },
			subtitle = {
				leading = "LockClosed",
				text = { ["$translate"] = "Label.ReportConfidential" }
			},
			items = { ["$resource"] = "preselectedAbuserSurfaces" },
			footerItems = { ["$resource"] = "regionalFooterItems" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" },
			next = {
				["$switch"] = {
					{
						value = "voiceChatAbuseSelection",
						condition = { ["$store"] = "selectedSurface.meta.routeVoiceChat" }
					},
					{
						value = "textChatAbuseSelection",
						condition = { ["$store"] = "selectedSurface.meta.routeTextChat" }
					},
					{
						value = "cheatingBehaviorSubSelectionFromPreselectedUser",
						condition = { ["$store"] = "selectedSurface.meta.routeUserTargets" }
					},
					{
						value = "socialComment",
						condition = { ["$store"] = "selectedSurface.meta.routeComment" }
					},
					{ condition = true, value = "usernameAvatarSubSelection" }
				}
			}
		},
		voiceChatPlayerSelection = {
			type = "list",
			variant = "chevron",
			storeAs = "selectedPlayer",
			required = true,
			next = "voiceChatAbuseSelection",
			title = { ["$translate"] = "Title.WhoToReport" },
			items = {
				["$load"] = "voiceUsers",
				stub = {
					{
						id = "12345",
						label = "StubUser",
						description = "@stubuser",
						meta = { username = "stubuser", displayname = "Stub User" }
					}
				}
			},
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" },
			emptyText = { ["$translate"] = "Description.NoVoiceTalk" }
		},
		generalUserSelection = {
			type = "list",
			variant = "chevron",
			storeAs = "selectedPlayer",
			required = true,
			next = "generalUserSubSelection",
			title = { ["$translate"] = "Title.WhoToReport" },
			subtitle = {
				leading = "LockClosed",
				text = { ["$translate"] = "Label.ReportConfidential" }
			},
			items = {
				["$load"] = "users",
				stub = {
					{
						id = "12345",
						label = "StubUser",
						description = "@stubuser",
						meta = { username = "stubuser", displayname = "Stub User" }
					}
				}
			},
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" }
		},
		textChatLineSelection = {
			type = "inExpChatSelection",
			storeAs = "selectedTextChatMessage",
			required = true,
			title = { ["$translate"] = "Title.SelectChatToReport" },
			items = { ["$load"] = "inExpChatMessages" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" },
			emptyText = { ["$translate"] = "Label.NoChatMessages" },
			reportMessageNotShownText = { ["$translate"] = "Label.ReportMessageNotShown" },
			next = {
				type = "goto",
				nodeId = "textChatAbuseSelection",
				replace = true
			}
		},
		experienceSubSelection = {
			type = "list",
			variant = "chevron",
			storeAs = "selectedGameExperienceTarget",
			required = true,
			title = { ["$translate"] = "Title.WhatToReport" },
			items = { ["$resource"] = "experienceTargets" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" },
			next = {
				["$switch"] = {
					{
						value = "sceneSelection",
						condition = {
							["$store"] = "selectedGameExperienceTarget.meta.routeHighlightMode"
						}
					},
					{ condition = true, value = "experienceAbuseSelection" }
				}
			}
		},
		sceneSelection = {
			type = "inExpSceneSelection",
			title = { ["$translate"] = "Label.SomethingInExperience" },
			loadingText = { ["$translate"] = "Label.Loading" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			next = { type = "close" }
		},
		voiceChatAbuseSelection = {
			type = "list",
			variant = "chevron",
			storeAs = "selectedAbuseType",
			required = true,
			next = "socialComment",
			title = { ["$translate"] = "Title.WhatIssue" },
			items = { ["$resource"] = "abuseTypes" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" }
		},
		textChatAbuseSelection = {
			type = "list",
			variant = "chevron",
			storeAs = "selectedAbuseType",
			required = true,
			next = "socialComment",
			title = { ["$translate"] = "Title.WhatIssue" },
			items = { ["$resource"] = "abuseTypes" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" }
		},
		generalUserAbuseSelection = {
			type = "list",
			variant = "chevron",
			storeAs = "selectedAbuseType",
			required = true,
			next = "socialComment",
			title = { ["$translate"] = "Title.WhatIssue" },
			items = { ["$resource"] = "abuseTypes" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" }
		},
		usernameAvatarSubSelection = {
			type = "list",
			variant = "chevron",
			required = true,
			storeAs = "selectedUserTarget",
			next = "generalUserAbuseSelection",
			title = { ["$translate"] = "Title.WhatToReport" },
			items = { ["$resource"] = "usernameOrAvatar" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" }
		},
		cheatingBehaviorSubSelectionFromPreselectedUser = {
			type = "list",
			variant = "chevron",
			required = true,
			storeAs = "selectedUserTarget",
			next = "socialComment",
			title = { ["$translate"] = "Title.WhatToReport" },
			items = { ["$resource"] = "cheatingOrBehavior" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" }
		},
		generalUserSubSelection = {
			type = "list",
			variant = "chevron",
			required = true,
			storeAs = "selectedUserTarget",
			title = { ["$translate"] = "Title.WhatToReport" },
			items = { ["$resource"] = "generalUserTargets" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" },
			next = {
				["$switch"] = {
					{
						value = "socialComment",
						condition = { ["$store"] = "selectedUserTarget.meta.routeComment" }
					},
					{ condition = true, value = "generalUserAbuseSelection" }
				}
			}
		},
		experienceAbuseSelection = {
			type = "list",
			variant = "chevron",
			storeAs = "selectedAbuseType",
			required = true,
			next = "gameExperienceComment",
			title = { ["$translate"] = "Title.WhatIssue" },
			items = { ["$resource"] = "gameAbuseTypes" },
			nextButtonText = { ["$translate"] = "Action.Continue" },
			errorText = { ["$translate"] = "Label.GeneralError" },
			retryButtonText = { ["$translate"] = "Action.Retry" }
		},
		socialComment = {
			type = "comment",
			storeAs = "comment",
			textAreaLabel = "",
			maxLength = 1000,
			title = { ["$translate"] = "Title.AnythingElseToAdd" },
			placeholder = { ["$translate"] = "Label.AddDetailsHere" },
			helperText = { ["$translate"] = "Label.CharacterCountWithLimit" },
			nextButtonText = { ["$translate"] = "Action.Send" },
			next = {
				type = "submitForm",
				onSuccess = "userConfirmation",
				onFailure = "generalError"
			}
		},
		socialSummary = {
			type = "review",
			title = "Report summary",
			preview = {
				["$switch"] = {
					{
						condition = { ["$store"] = "selectedTextChatMessage.label" },
						value = {
							type = "chat",
							text = { ["$store"] = "selectedTextChatMessage.label" }
						}
					},
					{
						condition = { ["$attribute"] = "preselectedAbuserId" },
						value = {
							type = "user",
							id = { ["$attribute"] = "preselectedAbuserId" },
							displayName = { ["$attribute"] = "preselectedAbuserDisplayName" },
							username = { ["$attribute"] = "preselectedAbuserUsername" }
						}
					},
					{
						condition = true,
						value = {
							type = "user",
							id = { ["$store"] = "selectedPlayer.id" },
							displayName = { ["$store"] = "selectedPlayer.label" },
							username = { ["$store"] = "selectedPlayer.description" }
						}
					}
				}
			},
			details = {
				{
					heading = "What was the issue?",
					text = { ["$store"] = "selectedAbuseType.label" }
				}
			},
			nextButtonText = { ["$translate"] = "Action.Continue" },
			next = {
				type = "submitForm",
				onSuccess = "userConfirmation",
				onFailure = "generalError"
			}
		},
		gameExperienceComment = {
			type = "comment",
			storeAs = "comment",
			textAreaLabel = "",
			maxLength = 1000,
			title = { ["$translate"] = "Title.AnythingElseToAdd" },
			placeholder = { ["$translate"] = "Label.AddDetailsHere" },
			helperText = { ["$translate"] = "Label.CharacterCountWithLimit" },
			nextButtonText = { ["$translate"] = "Action.Send" },
			next = {
				type = "submitForm",
				onSuccess = "experienceConfirmation",
				onFailure = "generalError"
			}
		},
		gameExperienceSummary = {
			type = "review",
			title = "Report summary",
			nextButtonText = "Submit",
			preview = {
				type = "experience",
				id = { ["$attribute"] = "experienceTargetId" }
			},
			details = {
				{
					heading = "What was the issue?",
					text = { ["$store"] = "selectedAbuseType.label" }
				}
			},
			next = {
				type = "submitForm",
				onSuccess = "experienceConfirmation",
				onFailure = "generalError"
			}
		},
		userConfirmation = {
			type = "inExpConfirmation",
			title = { ["$translate"] = "Title.ThanksForYourReport" },
			message = { ["$translate"] = "Description.ModerationTeamWillReview" },
			storeAs = {
				didBlockUser = "didBlockUser",
				didMuteUser = "didMuteUser"
			},
			blockToggle = {
				description = "",
				label = {
					["$translate"] = "Label.BlockUsername",
					params = {
						username = {
							["$switch"] = {
								{
									condition = { ["$attribute"] = "preselectedAbuserId" },
									value = { ["$attribute"] = "preselectedAbuserUsername" }
								},
								{
									condition = true,
									value = { ["$store"] = "selectedPlayer.meta.username" }
								}
							}
						}
					}
				},
				errorLabel = { ["$translate"] = "Label.GeneralError" },
				userId = {
					["$switch"] = {
						{
							condition = { ["$attribute"] = "preselectedAbuserId" },
							value = { ["$attribute"] = "preselectedAbuserId" }
						},
						{
							condition = true,
							value = { ["$store"] = "selectedPlayer.id" }
						}
					}
				},
				blockedSnackbarMessage = { ["$translate"] = "Label.BlockedPerson" },
				unblockedSnackbarMessage = { ["$translate"] = "Label.UnblockedPerson" }
			},
			muteToggle = {
				description = "",
				label = {
					["$translate"] = "Action.MuteUsername",
					params = {
						username = {
							["$switch"] = {
								{
									condition = { ["$attribute"] = "preselectedAbuserId" },
									value = { ["$attribute"] = "preselectedAbuserUsername" }
								},
								{
									condition = true,
									value = { ["$store"] = "selectedPlayer.meta.username" }
								}
							}
						}
					}
				},
				errorLabel = { ["$translate"] = "Label.GeneralError" },
				userId = {
					["$switch"] = {
						{
							condition = { ["$attribute"] = "preselectedAbuserId" },
							value = { ["$attribute"] = "preselectedAbuserId" }
						},
						{
							condition = true,
							value = { ["$store"] = "selectedPlayer.id" }
						}
					}
				},
				mutedSnackbarMessage = { ["$translate"] = "Label.MutedPerson" },
				unmutedSnackbarMessage = { ["$translate"] = "Label.UnmutedPerson" }
			},
			helpline = {
				["$switch"] = {
					{
						condition = { ["$store"] = "selectedAbuseType.meta.showHelpline" },
						value = {
							heading = "If you or someone you know is struggling, please reach out for help.",
							href = "https://roblox.findahelpline.com/",
							buttonText = { ["$translate"] = "Action.ViewHelplines" }
						}
					}
				}
			},
			nextButtonText = { ["$translate"] = "Action.Close" },
			next = {
				type = "reset",
				inlineAlert = {
					type = "success",
					title = {
						["$translate"] = {
							["$switch"] = {
								{
									value = "Label.BlockedPersonReportSent",
									condition = { ["$store"] = "didBlockUser" }
								},
								{
									value = "Label.MutedPersonReportSent",
									condition = { ["$store"] = "didMuteUser" }
								},
								{ condition = true, value = "Label.ReportSent" }
							}
						},
						params = {
							username = {
								["$switch"] = {
									{
										condition = { ["$attribute"] = "preselectedAbuserId" },
										value = { ["$attribute"] = "preselectedAbuserUsername" }
									},
									{
										condition = true,
										value = { ["$store"] = "selectedPlayer.meta.username" }
									}
								}
							}
						}
					}
				}
			}
		},
		experienceConfirmation = {
			type = "inExpConfirmation",
			title = { ["$translate"] = "Title.ThanksForYourReport" },
			message = { ["$translate"] = "Description.ModerationTeamWillReview" },
			helpline = {
				["$switch"] = {
					{
						condition = { ["$store"] = "selectedAbuseType.meta.showHelpline" },
						value = {
							heading = "If you or someone you know is struggling, please reach out for help.",
							href = "https://roblox.findahelpline.com/",
							buttonText = { ["$translate"] = "Action.ViewHelplines" }
						}
					}
				}
			},
			nextButtonText = { ["$translate"] = "Action.Close" },
			next = {
				type = "reset",
				inlineAlert = {
					type = "success",
					title = { ["$translate"] = "Label.ReportSent" }
				}
			}
		},
		generalError = {
			type = "paragraph",
			title = { ["$translate"] = "Title.SomethingWentWrong" },
			paragraph = { ["$translate"] = "Description.SomethingWentWrong" },
			nextButtonText = { ["$translate"] = "Action.Close" },
			next = { type = "close" }
		}
	},
	submission = {
		endpoint = {
			["$switch"] = {
				{
					value = "voice",
					condition = { ["$store"] = "selectedSurface.meta.submitAsVoice" }
				},
				{
					value = "chat",
					condition = { ["$store"] = "selectedSurface.meta.submitAsChat" }
				},
				{
					value = "avatar",
					condition = { ["$store"] = "selectedSurface.meta.submitAsUser" }
				},
				{
					value = "place",
					condition = { ["$store"] = "selectedSurface.meta.submitAsPlace" }
				}
			}
		},
		data = {
			abuseVector = {
				["$switch"] = {
					{
						value = "voice",
						condition = { ["$store"] = "selectedSurface.meta.submitAsVoice" }
					},
					{
						value = "chat",
						condition = { ["$store"] = "selectedSurface.meta.submitAsChat" }
					},
					{
						value = "user_profile",
						condition = { ["$store"] = "selectedSurface.meta.submitAsUser" }
					},
					{
						value = "place",
						condition = { ["$store"] = "selectedSurface.meta.submitAsPlace" }
					}
				}
			},
			targetIdStr = {
				["$switch"] = {
					{
						condition = { ["$attribute"] = "preselectedAbuserId" },
						value = { ["$attribute"] = "preselectedAbuserId" }
					},
					{
						condition = { ["$store"] = "selectedTextChatMessage.meta.userId" },
						value = { ["$store"] = "selectedTextChatMessage.meta.userId" }
					},
					{
						condition = { ["$store"] = "selectedPlayer.id" },
						value = { ["$store"] = "selectedPlayer.id" }
					},
					{
						condition = true,
						value = { ["$attribute"] = "experienceTargetId" }
					}
				}
			},
			category = {
				["$switch"] = {
					{
						condition = { ["$store"] = "selectedAbuseType.id" },
						value = { ["$store"] = "selectedAbuseType.id" }
					},
					{
						condition = { ["$store"] = "selectedUserTarget.id" },
						value = { ["$store"] = "selectedUserTarget.id" }
					},
					{
						condition = true,
						value = { ["$store"] = "selectedSurface.id" }
					}
				}
			},
			comment = { ["$store"] = "comment" },
			custom = {
				textChatMessageId = { ["$store"] = "selectedTextChatMessage.id" }
			}
		}
	},
	translations = {
		["Action.Close"] = "Close",
		["Action.Continue"] = "Continue",
		["Action.MuteUsername"] = "Mute @{username}",
		["Action.Ok"] = "OK",
		["Action.Retry"] = "Retry",
		["Action.Send"] = "Send",
		["Action.ViewHelplines"] = "View helplines",
		["Description.AbuseBullying"] = "Being mean to someone or threatening them",
		["Description.AbuseCheating"] = "Using hacks or exploits. Breaking a game's rules to win.",
		["Description.AbuseDangerousSuggestions"] = "Sharing viral challenges, instructions, and other information that can hurt people in real life",
		["Description.AbuseDiscrimination"] = "Being mean to someone because of their race, age, or other parts of their identity",
		["Description.AbuseInappropriateRequest"] = "People asking you to keep secrets, meet in real life, or join harmful groups",
		["Description.AbuseOffPlatformLinks"] = "Sharing links to other websites and apps, trading Robux outside Roblox",
		["Description.AbusePersonalInformation"] = "Asking for or sending full names, phone numbers, addresses, passwords, and more",
		["Description.AbuseRealLifeEvents"] = "Recreating or making fun of tragedies, political demonstrations, or other events that may be upsetting",
		["Description.AbuseRomanceSex"] = "Wearing revealing outfits, flirting, or kissing. Sexual words or actions.",
		["Description.AbuseScamming"] = "Fake trading, lying to get items, and misleading people",
		["Description.AbuseSpam"] = "Sending the same message many times, uploading the same files many times",
		["Description.AbuseSwearing"] = "Using swear words, even if they're misspelled or spelled with symbols",
		["Description.AbuseViolence"] = "Showing a person, animal, or character that's hurt or suffering in a way that looks real",
		["Description.AvatarOrName"] = "Their username, avatar, or behavior",
		["Description.ChatFilters"] = "The game bypasses chat filters",
		["Description.GameOrExperience"] = "Objects, sounds, or the whole experience",
		["Description.GameRating"] = "The game has an inaccurate age rating",
		["Description.GeneralError"] = "Something went wrong. Please try again later.",
		["Description.HowReportsWork"] = "We'll review your report and take appropriate action. We won't share your information with anyone you report. Reporting doesn't block the person or thing you reported. If you want to limit your interactions with someone, you can block them.",
		["Description.IllegalAdultGoods"] = "Selling or promoting illegal adult content",
		["Description.ModerationTeamWillReview"] = "Our moderation team will use it to make Roblox safer for you and everyone.",
		["Description.NoVoiceTalk"] = "No one to report",
		["Description.SomethingWentWrong"] = "We weren't able to submit your report. Please try again later.",
		["Label.AbuseBullying"] = "Bullying",
		["Label.AbuseCheating"] = "Cheating",
		["Label.AbuseDangerousSuggestions"] = "Dangerous suggestions",
		["Label.AbuseDiscrimination"] = "Discrimination",
		["Label.AbuseInappropriateRequest"] = "Asking you to do things that aren't safe",
		["Label.AbuseOffPlatformLinks"] = "Outside links and trading",
		["Label.AbusePersonalInformation"] = "Sharing personal information",
		["Label.AbuseRealLifeEvents"] = "Real-life events",
		["Label.AbuseRomanceSex"] = "Romance or sex",
		["Label.AbuseScamming"] = "Scams",
		["Label.AbuseSpam"] = "Spam",
		["Label.AbuseSwearing"] = "Swearing",
		["Label.AbuseViolence"] = "Extreme violence",
		["Label.AddDetailsHere"] = "Add details here",
		["Label.Avatar"] = "Avatar",
		["Label.BlockedPerson"] = "You blocked this person",
		["Label.BlockedPersonReportSent"] = "@{username} blocked, report sent",
		["Label.BlockPlayerUsername"] = "Block @{username}",
		["Label.BlockUsername"] = "Block @{username}",
		["Label.CharacterCountWithLimit"] = "{count}/{limit} characters",
		["Label.ChatFilters"] = "Chat filters",
		["Label.GameOrExperience"] = "The game or experience",
		["Label.GameRating"] = "Game rating",
		["Label.GeneralError"] = "Something went wrong. Please try again later.",
		["Label.IllegalAdultGoods"] = "Illegal adult goods",
		["Label.Loading"] = "Loading...",
		["Label.MutedPerson"] = "You muted this person",
		["Label.MutedPersonReportSent"] = "@{username} muted, report sent",
		["Label.MutePlayerUsername"] = "Mute @{username}",
		["Label.Name"] = "Username",
		["Label.NoChatMessages"] = "No chat messages",
		["Label.ReportConfidential"] = "Your report is confidential",
		["Label.ReportIllegalContent"] = "{linkStart}Report illegal content or content harmful to children{linkEnd}",
		["Label.ReportMessageNotShown"] = "Report a message not shown",
		["Label.ReportSent"] = "Report sent",
		["Label.SomeonePlaying"] = "Someone playing",
		["Label.SomethingInExperience"] = "Something in the experience",
		["Label.SomethingTheyDid"] = "Something they did",
		["Label.SurfaceBehavior"] = "Behavior",
		["Label.SurfaceCheating"] = "Cheating",
		["Label.SurfacePlayerAge"] = "Player age",
		["Label.SurfaceTextChat"] = "Text chat messages",
		["Label.SurfaceVoiceChat"] = "Voice chat messages",
		["Label.TakeItDown"] = "{linkStart}Report non-consensual intimate imagery as defined by 47 U.S. Code \194\167 223a{linkEnd}",
		["Label.TextChat"] = "Text chat",
		["Label.TheirAvatarOrName"] = "Their avatar or name",
		["Label.UnblockedPerson"] = "You unblocked this person",
		["Label.UnmutedPerson"] = "You unmuted this person",
		["Label.VoiceChat"] = "Voice chat",
		["Label.WholeGameOrExperience"] = "The whole game or experience",
		["Title.AnythingElseToAdd"] = "Anything else to add?",
		["Title.HowReportsWork"] = "How reports work",
		["Title.SelectChatToReport"] = "Select one chat to report",
		["Title.SomethingWentWrong"] = "Something went wrong",
		["Title.ThanksForYourReport"] = "Thanks for your report",
		["Title.WhatIssue"] = "What was the issue?",
		["Title.WhatToReport"] = "What do you want to report?",
		["Title.WhoToReport"] = "Who do you want to report?"
	}
}