return {
	kind = "Document",
	definitions = {
		{
			operation = "query",
			kind = "OperationDefinition",
			selectionSet = {
				kind = "SelectionSet",
				selections = {
					{
						kind = "Field",
						selectionSet = {
							kind = "SelectionSet",
							selections = {
								{
									kind = "Field",
									arguments = {},
									name = { value = "id", kind = "Name" },
									directives = {}
								},
								{
									kind = "Field",
									selectionSet = {
										kind = "SelectionSet",
										selections = {
											{
												kind = "Field",
												arguments = {},
												name = { value = "targetUserId", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "isOfflineFrequents", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												selectionSet = {
													kind = "SelectionSet",
													selections = {
														{
															kind = "Field",
															arguments = {},
															name = { value = "id", kind = "Name" },
															directives = {}
														},
														{
															kind = "Field",
															arguments = {},
															name = { value = "username", kind = "Name" },
															directives = {}
														},
														{
															kind = "Field",
															arguments = {},
															name = { value = "displayName", kind = "Name" },
															directives = {}
														}
													}
												},
												arguments = {},
												name = { value = "mutualFriends", kind = "Name" },
												directives = {}
											}
										}
									},
									arguments = {},
									name = { value = "profileInsights", kind = "Name" },
									directives = {}
								}
							}
						},
						arguments = {
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "userIds", kind = "Name" }
								},
								name = { value = "userIds", kind = "Name" }
							},
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "count", kind = "Name" }
								},
								name = { value = "count", kind = "Name" }
							},
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "pageId", kind = "Name" }
								},
								name = { value = "pageId", kind = "Name" }
							},
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "rankingStrategy", kind = "Name" }
								},
								name = { value = "rankingStrategy", kind = "Name" }
							}
						},
						name = { value = "profilesInsights", kind = "Name" },
						directives = {}
					}
				}
			},
			directives = {},
			name = { value = "ProfilesInsights", kind = "Name" },
			variableDefinitions = {
				{
					kind = "VariableDefinition",
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
					variable = {
						kind = "Variable",
						name = { value = "userIds", kind = "Name" }
					}
				},
				{
					kind = "VariableDefinition",
					type = {
						kind = "NamedType",
						name = { value = "Int", kind = "Name" }
					},
					directives = {},
					variable = {
						kind = "Variable",
						name = { value = "count", kind = "Name" }
					}
				},
				{
					kind = "VariableDefinition",
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					directives = {},
					variable = {
						kind = "Variable",
						name = { value = "pageId", kind = "Name" }
					}
				},
				{
					kind = "VariableDefinition",
					type = {
						kind = "NamedType",
						name = { value = "String", kind = "Name" }
					},
					directives = {},
					variable = {
						kind = "Variable",
						name = { value = "rankingStrategy", kind = "Name" }
					}
				}
			}
		}
	}
}