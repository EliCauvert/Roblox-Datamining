return {
	kind = "Document",
	definitions = {
		{
			kind = "InterfaceTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "id", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "displayName", kind = "Name" }
				}
			},
			name = { value = "User", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {
				{
					kind = "NamedType",
					name = { value = "User", kind = "Name" }
				}
			},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "id", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "displayName", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "avatarHeadshot", kind = "Name" }
				}
			},
			name = { value = "Player", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "User", kind = "Name" }
						}
					},
					name = { value = "me", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "NamedType",
									name = { value = "ID", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "id", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "User", kind = "Name" }
						}
					},
					name = { value = "user", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "ListType",
									type = {
										kind = "NamedType",
										name = { value = "String", kind = "Name" }
									}
								}
							},
							directives = {},
							name = { value = "userIds", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "Int", kind = "Name" }
							},
							directives = {},
							name = { value = "count", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "String", kind = "Name" }
							},
							directives = {},
							name = { value = "pageId", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "String", kind = "Name" }
							},
							directives = {},
							name = { value = "rankingStrategy", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "ProfileInsightsPages", kind = "Name" }
					},
					name = { value = "profilesInsights", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "ListType",
									type = {
										kind = "NamedType",
										name = { value = "String", kind = "Name" }
									}
								}
							},
							directives = {},
							name = { value = "userIds", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "Int", kind = "Name" }
							},
							directives = {},
							name = { value = "count", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "String", kind = "Name" }
							},
							directives = {},
							name = { value = "rankingStrategy", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "ProfileInsights", kind = "Name" }
						}
					},
					name = { value = "profilesInsightsByUserIds", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "ListType",
									type = {
										kind = "NonNullType",
										type = {
											kind = "NamedType",
											name = { value = "String", kind = "Name" }
										}
									}
								}
							},
							directives = {},
							name = { value = "universeIds", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NonNullType",
							type = {
								kind = "NamedType",
								name = { value = "Experience", kind = "Name" }
							}
						}
					},
					name = { value = "experienceThumbnails", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "String", kind = "Name" }
							},
							directives = {},
							name = { value = "sessionId", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "String", kind = "Name" }
							},
							directives = {},
							name = { value = "pageType", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "String", kind = "Name" }
							},
							directives = {},
							name = { value = "nextPageToken", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "ListType",
								type = {
									kind = "NamedType",
									name = { value = "String", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "supportedTreatmentTypes", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "OmniFeed", kind = "Name" }
					},
					name = { value = "omniFeed", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "NamedType",
									name = { value = "String", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "sortId", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "OmniFeedItem", kind = "Name" }
					},
					name = { value = "omniFeedItem", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "NamedType",
									name = { value = "String", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "sessionId", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "NamedType",
									name = { value = "String", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "topicId", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "ListType",
								type = {
									kind = "NamedType",
									name = {
										value = "OmniFeedRecommendationDescriptor",
										kind = "Name"
									}
								}
							},
							directives = {},
							name = { value = "recommendations", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "OmniFeedItemWithMetadata", kind = "Name" }
					},
					name = { value = "refreshOmniFeedItem", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "NamedType",
									name = { value = "ID", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "id", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "VirtualEvent", kind = "Name" }
					},
					name = { value = "virtualEvent", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "NamedType",
									name = { value = "ID", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "universeId", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = {
									value = "VirtualEventsByUniverseIdOptions",
									kind = "Name"
								}
							},
							directives = {},
							name = { value = "options", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "VirtualEventsPage", kind = "Name" }
					},
					name = { value = "virtualEventsByUniverseId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "ListType",
									type = {
										kind = "NamedType",
										name = { value = "String", kind = "Name" }
									}
								}
							},
							directives = {},
							name = { value = "userIds", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "ListType",
							type = {
								kind = "NamedType",
								name = { value = "UserProfile", kind = "Name" }
							}
						}
					},
					name = { value = "userProfiles", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "ListType",
								type = {
									kind = "NamedType",
									name = { value = "String", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "featureNames", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "FeatureAccessResponse", kind = "Name" }
					},
					name = { value = "getFeatureAccess", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "String", kind = "Name" }
							},
							directives = {},
							name = { value = "featureName", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "ListType",
								type = {
									kind = "NamedType",
									name = { value = "RecourseActions", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "successfulActions", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "String", kind = "Name" }
							},
							directives = {},
							name = { value = "nameSpace", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "String", kind = "Name" }
							},
							directives = {},
							name = { value = "extraParameters", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "UpsellFeatureAccessResponse", kind = "Name" }
					},
					name = { value = "getUpsellFeatureAccess", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "NamedType",
									name = { value = "ID", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "userId", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "Int", kind = "Name" }
							},
							directives = {},
							name = { value = "sort", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "Int", kind = "Name" }
							},
							directives = {},
							name = { value = "pageLimit", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "String", kind = "Name" }
							},
							directives = {},
							name = { value = "pageCursor", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "AllFriendsPage", kind = "Name" }
					},
					name = { value = "allFriendsByUserId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "NamedType",
									name = { value = "ID", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "userId", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NamedType",
								name = { value = "Int", kind = "Name" }
							},
							directives = {},
							name = { value = "sort", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "Friend", kind = "Name" }
						}
					},
					name = { value = "onlineFriendsByUserId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "NamedType",
									name = { value = "String", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "universeId", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ExperienceDetailsLink", kind = "Name" }
						}
					},
					name = {
						value = "experienceDetailsLinkByUniverseId",
						kind = "Name"
					}
				}
			},
			name = { value = "Query", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {
				{
					kind = "NamedType",
					name = { value = "User", kind = "Name" }
				}
			},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "id", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "username", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "displayName", kind = "Name" }
				}
			},
			name = { value = "MutualFriend", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "targetUserId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NonNullType",
							type = {
								kind = "NamedType",
								name = { value = "MutualFriend", kind = "Name" }
							}
						}
					},
					name = { value = "mutualFriends", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "Boolean", kind = "Name" }
						}
					},
					name = { value = "isOfflineFrequents", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "friendshipAgeUnixSeconds", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "friendRequestOriginSource", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "accountCreationDateUnixSeconds", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "localizedCountryName", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "userAgeVerifiedBracket", kind = "Name" }
				}
			},
			name = { value = "ProfileInsights", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "id", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NonNullType",
							type = {
								kind = "NamedType",
								name = { value = "ProfileInsights", kind = "Name" }
							}
						}
					},
					name = { value = "profileInsights", kind = "Name" }
				}
			},
			name = { value = "ProfileInsightsPages", kind = "Name" }
		},
		{
			kind = "EnumTypeDefinition",
			directives = {},
			values = {
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Image", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "YouTubeVideo", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Video", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "GamePreviewVideo", kind = "Name" }
				}
			},
			name = { value = "MediaAssetType", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "ID", kind = "Name" }
					},
					name = { value = "assetTypeId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "MediaAssetType", kind = "Name" }
					},
					name = { value = "assetType", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "approved", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "ID", kind = "Name" }
					},
					name = { value = "imageId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "videoId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "videoHash", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "videoTitle", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "altText", kind = "Name" }
				}
			},
			name = { value = "ExperienceMedia", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "id", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "name", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "type", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "isRNVAccount", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "hasVerifiedBadge", kind = "Name" }
				}
			},
			name = { value = "ExperienceCreator", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "id", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "ID", kind = "Name" }
					},
					name = { value = "rootPlaceId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "name", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "description", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "sourceName", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "sourceDescription", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "ExperienceCreator", kind = "Name" }
					},
					name = { value = "creator", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "price", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "allowedGearGenres", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "allowedGearCategories", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "isGenreEnforced", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "copyingAllowed", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Float", kind = "Name" }
					},
					name = { value = "playing", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Float", kind = "Name" }
					},
					name = { value = "visits", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "maxPlayers", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "created", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "updated", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "studioAccessToApisAllowed", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "createVipServersAllowed", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "universeAvatarType", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "genre", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "isAllGenre", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "isFavoritedByUser", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Float", kind = "Name" }
					},
					name = { value = "favoritedCount", kind = "Name" }
				}
			},
			name = { value = "ExperienceDetails", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "universeId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "placeId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "name", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "totalUpVotes", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "totalDownVotes", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "playerCount", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "description", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "under9", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "under13", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "adId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "isSponsored", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "Media", kind = "Name" }
						}
					},
					name = { value = "thumbnails", kind = "Name" }
				}
			},
			name = { value = "Experience", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "url", kind = "Name" }
				}
			},
			name = { value = "Media", kind = "Name" }
		},
		{
			kind = "ScalarTypeDefinition",
			directives = {},
			name = { value = "JSONObject", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "OmniFeedMetadata", kind = "Name" }
					},
					name = { value = "metadata", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "pageType", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "sortsExpirationTime", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "nextPageToken", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "isSessionExpired", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "recommendationsId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "JSONObject", kind = "Name" }
					},
					name = { value = "globalLayoutData", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "omniSessionId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "OmniFeedItem", kind = "Name" }
						}
					},
					name = { value = "sorts", kind = "Name" }
				}
			},
			name = { value = "OmniFeed", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {
						{
							kind = "Directive",
							name = { value = "deprecated", kind = "Name" },
							arguments = {
								{
									kind = "Argument",
									value = {
										value = "Fetch game metadata from OmniFeedItem instead. Scheduled for deprecation on 2023-01-30",
										kind = "StringValue",
										block = false
									},
									name = { value = "reason", kind = "Name" }
								}
							}
						}
					},
					type = {
						kind = "NamedType",
						name = { value = "JSONObject", kind = "Name" }
					},
					name = { value = "GameJSON", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "JSONObject", kind = "Name" }
					},
					name = { value = "CatalogAssetJSON", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "JSONObject", kind = "Name" }
					},
					name = { value = "CatalogBundleJSON", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "JSONObject", kind = "Name" }
					},
					name = { value = "RecommendedFriendJSON", kind = "Name" }
				}
			},
			name = { value = "OmniFeedMetadata", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "topicId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "topic", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "JSONObject", kind = "Name" }
					},
					name = { value = "topicLayoutData", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "treatmentType", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "OmniFeedRecommendation", kind = "Name" }
						}
					},
					name = { value = "recommendations", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "Experience", kind = "Name" }
						}
					},
					name = { value = "experiences", kind = "Name" }
				}
			},
			name = { value = "OmniFeedItem", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "contentType", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "contentId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "JSONObject", kind = "Name" }
					},
					name = { value = "contentMetadata", kind = "Name" }
				}
			},
			name = { value = "OmniFeedRecommendation", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "OmniFeedMetadata", kind = "Name" }
					},
					name = { value = "metadata", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "OmniFeedItem", kind = "Name" }
					},
					name = { value = "sort", kind = "Name" }
				}
			},
			name = { value = "OmniFeedItemWithMetadata", kind = "Name" }
		},
		{
			kind = "InputObjectTypeDefinition",
			directives = {},
			fields = {
				{
					kind = "InputValueDefinition",
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					directives = {},
					name = { value = "contentId", kind = "Name" }
				},
				{
					kind = "InputValueDefinition",
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					directives = {},
					name = { value = "contentType", kind = "Name" }
				}
			},
			name = {
				value = "OmniFeedRecommendationDescriptor",
				kind = "Name"
			}
		},
		{
			kind = "EnumTypeDefinition",
			directives = {},
			values = {
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "unpublished", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "active", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "cancelled", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "moderated", kind = "Name" }
				}
			},
			name = { value = "EventStatus", kind = "Name" }
		},
		{
			kind = "EnumTypeDefinition",
			directives = {},
			values = {
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "none", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "going", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "maybeGoing", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "notGoing", kind = "Name" }
				}
			},
			name = { value = "RsvpStatus", kind = "Name" }
		},
		{
			kind = "EnumTypeDefinition",
			directives = {},
			values = {
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "user", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "group", kind = "Name" }
				}
			},
			name = { value = "HostType", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "startUtc", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "endUtc", kind = "Name" }
				}
			},
			name = { value = "EventTime", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "ID", kind = "Name" }
					},
					name = { value = "hostId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "HostType", kind = "Name" }
					},
					name = { value = "hostType", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "hostName", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "hasVerifiedBadge", kind = "Name" }
				}
			},
			name = { value = "Host", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "ID", kind = "Name" }
					},
					name = { value = "userId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "RsvpStatus", kind = "Name" }
					},
					name = { value = "rsvpStatus", kind = "Name" }
				}
			},
			name = { value = "Rsvp", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Float", kind = "Name" }
					},
					name = { value = "none", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Float", kind = "Name" }
					},
					name = { value = "going", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Float", kind = "Name" }
					},
					name = { value = "maybeGoing", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Float", kind = "Name" }
					},
					name = { value = "notGoing", kind = "Name" }
				}
			},
			name = { value = "RsvpCounters", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "category", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "rank", kind = "Name" }
				}
			},
			name = { value = "EventCategory", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "id", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "title", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "displayTitle", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "subtitle", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "displaySubtitle", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "description", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "displayDescription", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Host", kind = "Name" }
					},
					name = { value = "host", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "ID", kind = "Name" }
					},
					name = { value = "universeId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "placeId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "EventStatus", kind = "Name" }
					},
					name = { value = "eventStatus", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "EventTime", kind = "Name" }
					},
					name = { value = "eventTime", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "createdUtc", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "updatedUtc", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "RsvpStatus", kind = "Name" }
					},
					name = { value = "userRsvpStatus", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "EventCategory", kind = "Name" }
						}
					},
					name = { value = "eventCategories", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "ExperienceDetails", kind = "Name" }
					},
					name = { value = "experienceDetails", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NonNullType",
							type = {
								kind = "NamedType",
								name = { value = "ExperienceMedia", kind = "Name" }
							}
						}
					},
					name = { value = "media", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "RsvpCounters", kind = "Name" }
					},
					name = { value = "rsvpCounters", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NonNullType",
							type = {
								kind = "NamedType",
								name = { value = "Rsvp", kind = "Name" }
							}
						}
					},
					name = { value = "rsvps", kind = "Name" }
				}
			},
			name = { value = "VirtualEvent", kind = "Name" }
		},
		{
			kind = "InputObjectTypeDefinition",
			directives = {},
			fields = {
				{
					kind = "InputValueDefinition",
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					directives = {},
					name = { value = "cursor", kind = "Name" }
				},
				{
					kind = "InputValueDefinition",
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					directives = {},
					name = { value = "limit", kind = "Name" }
				},
				{
					kind = "InputValueDefinition",
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					directives = {},
					name = { value = "fromUtc", kind = "Name" }
				}
			},
			name = {
				value = "VirtualEventsByUniverseIdOptions",
				kind = "Name"
			}
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "cursor", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NonNullType",
							type = {
								kind = "NamedType",
								name = { value = "VirtualEvent", kind = "Name" }
							}
						}
					},
					name = { value = "virtualEvents", kind = "Name" }
				}
			},
			name = { value = "VirtualEventsPage", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = {
						value = "shouldSeeNotificationsUpsellModal",
						kind = "Name"
					}
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "VirtualEvent", kind = "Name" }
					},
					name = { value = "virtualEvent", kind = "Name" }
				}
			},
			name = { value = "RsvpResponse", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "neverShowNotificationModalAgain", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "enablePushNotifications", kind = "Name" }
				}
			},
			name = { value = "VirtualEventMutations", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "VirtualEventMutations", kind = "Name" }
						}
					},
					name = { value = "virtualEvents", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "NamedType",
									name = { value = "ID", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "id", kind = "Name" }
						},
						{
							kind = "InputValueDefinition",
							type = {
								kind = "NonNullType",
								type = {
									kind = "NamedType",
									name = { value = "RsvpStatus", kind = "Name" }
								}
							},
							directives = {},
							name = { value = "rsvpStatus", kind = "Name" }
						}
					},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "RsvpResponse", kind = "Name" }
					},
					name = { value = "virtualEventRsvp", kind = "Name" }
				}
			},
			name = { value = "Mutation", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "alias", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "combinedName", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "contactName", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "displayName", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "inExperienceCombinedName", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "username", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "platformName", kind = "Name" }
				}
			},
			name = { value = "Names", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {
				{
					kind = "NamedType",
					name = { value = "User", kind = "Name" }
				}
			},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "id", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "displayName", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Names", kind = "Name" }
					},
					name = { value = "names", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "platformProfileId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "isVerified", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "isDeleted", kind = "Name" }
				}
			},
			name = { value = "UserProfile", kind = "Name" }
		},
		{
			kind = "EnumTypeDefinition",
			directives = {},
			values = {
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Granted", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Denied", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Actionable", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Pending", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Error", kind = "Name" }
				}
			},
			name = { value = "Access", kind = "Name" }
		},
		{
			kind = "EnumTypeDefinition",
			directives = {},
			values = {
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Phone", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Email", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "GovernmentId", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "AddedEmail", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "ParentConsent", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "ParentLink", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "AgeEstimation", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Subscription", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "CardVerification", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Wait", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "UserAgreement", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "UserSettings", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Invalid", kind = "Name" }
				}
			},
			name = { value = "RecourseActions", kind = "Name" }
		},
		{
			kind = "EnumTypeDefinition",
			directives = {},
			values = {
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "ChargebackReenableAccount", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "SavePaymentMethods", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "UpdateUserSetting", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "UpdateBirthdate", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "LinkToChild", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "ManageFriend", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "ManageExperience", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "LiftPunishment", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "AddTrustedConnection", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "SendTransfer", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "ReceiveTransfer", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "LiftRestriction", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Unknown", kind = "Name" }
				}
			},
			name = { value = "VPCRequestTypes", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "featureVector", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "endTime", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "startTime", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "duration", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "vectorTargetID", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "evidence", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "decisionEventID", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "violationType", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					name = { value = "sublabel", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "acknowledgedTime", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "permanent", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "acknowledgeable", kind = "Name" }
				}
			},
			name = { value = "TimeoutActionResponse", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "id", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "displayUrl", kind = "Name" }
				}
			},
			name = { value = "AgreementResponse", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "settingName", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "settingValue", kind = "Name" }
				}
			},
			name = { value = "UserSettingsResponse", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "RecourseActions", kind = "Name" }
					},
					name = { value = "action", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "VPCRequestTypes", kind = "Name" }
						}
					},
					name = { value = "parentConsentTypes", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "TimeoutActionResponse", kind = "Name" }
						}
					},
					name = { value = "timeoutActions", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "AgreementResponse", kind = "Name" }
						}
					},
					name = { value = "agreements", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "UserSettingsResponse", kind = "Name" }
					},
					name = { value = "userSettings", kind = "Name" }
				}
			},
			name = { value = "RecourseResponses", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "featureName", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Access", kind = "Name" }
					},
					name = { value = "access", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "RecourseActions", kind = "Name" }
						}
					},
					name = { value = "recourse", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "RecourseResponses", kind = "Name" }
						}
					},
					name = { value = "recourses", kind = "Name" }
				}
			},
			name = { value = "FeatureAccess", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "FeatureAccess", kind = "Name" }
					},
					name = { value = "featureAccess", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "shouldPrompt", kind = "Name" }
				}
			},
			name = { value = "UpsellFeatureAccessResponse", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "FeatureAccess", kind = "Name" }
						}
					},
					name = { value = "features", kind = "Name" }
				}
			},
			name = { value = "FeatureAccessResponse", kind = "Name" }
		},
		{
			kind = "InterfaceTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "id", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "targetUserId", kind = "Name" }
				}
			},
			name = { value = "Friendship", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {
				{
					kind = "NamedType",
					name = { value = "User", kind = "Name" }
				},
				{
					kind = "NamedType",
					name = { value = "Friendship", kind = "Name" }
				}
			},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "id", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Boolean", kind = "Name" }
					},
					name = { value = "hasVerifiedBadge", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "displayName", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "targetUserId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "UserPresence", kind = "Name" }
					},
					name = { value = "presence", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "Float", kind = "Name" }
					},
					name = { value = "sortScore", kind = "Name" }
				}
			},
			name = { value = "Friend", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "targetUserId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "curCursor", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "prevCursor", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "nextCursor", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "Friend", kind = "Name" }
						}
					},
					name = { value = "friends", kind = "Name" }
				}
			},
			name = { value = "AllFriendsPage", kind = "Name" }
		},
		{
			kind = "EnumTypeDefinition",
			directives = {},
			values = {
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "InGame", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Online", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "InStudio", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Offline", kind = "Name" }
				}
			},
			name = { value = "PresenceType", kind = "Name" }
		},
		{
			kind = "InterfaceTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "PresenceType", kind = "Name" }
					},
					name = { value = "userPresenceType", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "lastLocation", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "lastOnline", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "gameId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "placeId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "rootPlaceId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "universeId", kind = "Name" }
				}
			},
			name = { value = "Presence", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {
				{
					kind = "NamedType",
					name = { value = "Presence", kind = "Name" }
				}
			},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "id", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "PresenceType", kind = "Name" }
					},
					name = { value = "userPresenceType", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "lastLocation", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "lastOnline", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "gameId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "placeId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "rootPlaceId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					name = { value = "universeId", kind = "Name" }
				}
			},
			name = { value = "UserPresence", kind = "Name" }
		},
		{
			kind = "EnumTypeDefinition",
			directives = {},
			values = {
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "ExperienceInvite", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "FriendInvite", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Home", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Profile", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "NotificationExperienceInvite", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "ScreenshotInvite", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "PrivateServer", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "Server", kind = "Name" }
				},
				{
					kind = "EnumValueDefinition",
					directives = {},
					name = { value = "ExperienceDetails", kind = "Name" }
				}
			},
			name = { value = "ShareLinkType", kind = "Name" }
		},
		{
			kind = "InterfaceTypeDefinition",
			directives = {},
			interfaces = {},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "linkId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "shortUrl", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ShareLinkType", kind = "Name" }
						}
					},
					name = { value = "linkType", kind = "Name" }
				}
			},
			name = { value = "ShareLink", kind = "Name" }
		},
		{
			kind = "ObjectTypeDefinition",
			directives = {},
			interfaces = {
				{
					kind = "NamedType",
					name = { value = "ShareLink", kind = "Name" }
				}
			},
			fields = {
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "universeId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					name = { value = "linkId", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					name = { value = "shortUrl", kind = "Name" }
				},
				{
					kind = "FieldDefinition",
					arguments = {},
					directives = {},
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ShareLinkType", kind = "Name" }
						}
					},
					name = { value = "linkType", kind = "Name" }
				}
			},
			name = { value = "ExperienceDetailsLink", kind = "Name" }
		},
		{
			kind = "SchemaDefinition",
			directives = {},
			operationTypes = {
				{
					operation = "mutation",
					kind = "OperationTypeDefinition",
					type = {
						kind = "NamedType",
						name = { value = "Mutation", kind = "Name" }
					}
				},
				{
					operation = "query",
					kind = "OperationTypeDefinition",
					type = {
						kind = "NamedType",
						name = { value = "Query", kind = "Name" }
					}
				}
			}
		}
	}
}