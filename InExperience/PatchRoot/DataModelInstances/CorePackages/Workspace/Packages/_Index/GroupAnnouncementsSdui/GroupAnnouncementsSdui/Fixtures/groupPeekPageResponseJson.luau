return {
	pageEntries = {
		{
			pageEntry = {
				robloxComponent = "CommunityAnnouncementCard",
				identifier = "communityAnnouncement",
				title = "",
				category = ""
			},
			inputData = {
				communityAnnouncement = {
					communityId = "151432314",
					announcementId = "038eaebf-e95c-4c7e-bd0f-e0cdb634fad9",
					messageId = "34ae25fa-caa0-404e-ac6f-898783c7f6c3",
					title = "My New Annoncement",
					body = "This is a new announcement i'm doing, I'm going to start with something new here!!",
					creatorKey = "User_7017120594",
					creatorRoleName = "Top Panda",
					mediaAssetId = "133165144599828",
					createdTime = "2026-09-17T16:22:46.830Z"
				}
			}
		}
	},
	hydrationData = {
		creator = {
			User_7017120594 = {
				creatorType = "User",
				creatorId = "7017120594",
				creatorName = "BuilderSaiyanSage",
				isVerified = false
			}
		}
	},
	templates = {
		["community-profile-announcement-card-2026-09-03"] = {
			robloxComponent = "CommunityAnnouncementCard",
			template = {
				view = {
					props = {
						tag = { literal = "size-full-0 auto-y col gap-small" },
						children = {
							componentList = {
								deferItemBuild = false,
								literal = {
									items = {
										{
											identifier = "meta",
											inlineComponent = {
												text = {
													props = {
														text = {
															conditional = {
																options = {
																	{
																		condition = {
																			andCondition = {
																				conditions = {
																					{ isNotEmpty = { field = "creator.creator_name" } },
																					{ isNotEmpty = { field = "creator_role_name" } }
																				}
																			}
																		},
																		format = {
																			str = "{name} \194\183 {role} \194\183 {published}",
																			args = {
																				name = { bindingPath = "creator.creator_name" },
																				role = { bindingPath = "creator_role_name" },
																				published = {
																					bindingPath = "created_time",
																					formatter = {
																						type = "TYPE_DATE_FORMAT",
																						dateConfig = { pattern = "ll" }
																					}
																				}
																			}
																		}
																	},
																	{
																		condition = { isNotEmpty = { field = "creator.creator_name" } },
																		format = {
																			str = "{name} \194\183 {published}",
																			args = {
																				name = { bindingPath = "creator.creator_name" },
																				published = {
																					bindingPath = "created_time",
																					formatter = {
																						type = "TYPE_DATE_FORMAT",
																						dateConfig = { pattern = "ll" }
																					}
																				}
																			}
																		}
																	},
																	{
																		condition = { isNotEmpty = { field = "creator_role_name" } },
																		format = {
																			str = "{role} \194\183 {published}",
																			args = {
																				role = { bindingPath = "creator_role_name" },
																				published = {
																					bindingPath = "created_time",
																					formatter = {
																						type = "TYPE_DATE_FORMAT",
																						dateConfig = { pattern = "ll" }
																					}
																				}
																			}
																		}
																	},
																	{
																		format = {
																			str = "{published}",
																			args = {
																				published = {
																					bindingPath = "created_time",
																					formatter = {
																						type = "TYPE_DATE_FORMAT",
																						dateConfig = { pattern = "ll" }
																					}
																				}
																			}
																		}
																	}
																}
															}
														},
														tag = {
															literal = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-muted"
														},
														textWrapped = { literal = true }
													},
													shared = {
														componentType = "UI_COMPONENT_TYPE_TEXT",
														data = {},
														analyticsData = {}
													}
												}
											},
											inputs = {}
										},
										{
											identifier = "media",
											inlineComponent = {
												image = {
													props = {
														size = { literal = "1,0,0,480" },
														image = {
															format = {
																str = "rbxassetid://{assetId}",
																args = { assetId = { bindingPath = "media_asset_id" } }
															}
														},
														aspectRatio = { literal = 1.9375 }
													},
													shared = {
														componentType = "UI_COMPONENT_TYPE_IMAGE",
														data = {},
														analyticsData = {},
														isComponentFiltered = {
															conditional = {
																options = {
																	{
																		literal = true,
																		condition = { isEmpty = { field = "media_asset_id" } }
																	}
																}
															}
														}
													}
												}
											},
											inputs = {}
										},
										{
											identifier = "title",
											inlineComponent = {
												text = {
													props = {
														text = { bindingPath = "title" },
														tag = {
															literal = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-emphasis"
														},
														textWrapped = { literal = true }
													},
													shared = {
														componentType = "UI_COMPONENT_TYPE_TEXT",
														data = {},
														analyticsData = {}
													}
												}
											},
											inputs = {}
										},
										{
											identifier = "body",
											inlineComponent = {
												text = {
													props = {
														text = { bindingPath = "body" },
														tag = {
															literal = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default"
														},
														textWrapped = { literal = true }
													},
													shared = {
														componentType = "UI_COMPONENT_TYPE_TEXT",
														data = {},
														analyticsData = {}
													}
												}
											},
											inputs = {}
										}
									}
								},
								itemOverrides = {}
							}
						}
					},
					shared = {
						componentType = "UI_COMPONENT_TYPE_VIEW",
						data = {
							{
								contentType = "HYDRATION_CONTENT_TYPE_CREATOR",
								alias = "",
								clientFetch = false,
								required = false,
								idBinding = { inputPath = "creator_key" },
								requiredFields = {},
								clientHints = {}
							}
						},
						analyticsData = {}
					}
				}
			}
		}
	},
	localizedLiterals = {}
}