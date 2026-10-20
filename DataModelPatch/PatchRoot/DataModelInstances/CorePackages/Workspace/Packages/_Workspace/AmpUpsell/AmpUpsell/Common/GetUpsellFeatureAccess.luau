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
									selectionSet = {
										kind = "SelectionSet",
										selections = {
											{
												kind = "Field",
												arguments = {},
												name = { value = "featureName", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "access", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "recourse", kind = "Name" },
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
															name = { value = "action", kind = "Name" },
															directives = {}
														},
														{
															kind = "Field",
															arguments = {},
															name = { value = "parentConsentTypes", kind = "Name" },
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
																		name = { value = "settingName", kind = "Name" },
																		directives = {}
																	},
																	{
																		kind = "Field",
																		arguments = {},
																		name = { value = "settingValue", kind = "Name" },
																		directives = {}
																	}
																}
															},
															arguments = {},
															name = { value = "userSettings", kind = "Name" },
															directives = {}
														}
													}
												},
												arguments = {},
												name = { value = "recourses", kind = "Name" },
												directives = {}
											}
										}
									},
									arguments = {},
									name = { value = "featureAccess", kind = "Name" },
									directives = {}
								},
								{
									kind = "Field",
									arguments = {},
									name = { value = "shouldPrompt", kind = "Name" },
									directives = {}
								}
							}
						},
						arguments = {
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "featureName", kind = "Name" }
								},
								name = { value = "featureName", kind = "Name" }
							},
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "successfulActions", kind = "Name" }
								},
								name = { value = "successfulActions", kind = "Name" }
							},
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "nameSpace", kind = "Name" }
								},
								name = { value = "nameSpace", kind = "Name" }
							},
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "extraParameters", kind = "Name" }
								},
								name = { value = "extraParameters", kind = "Name" }
							}
						},
						name = { value = "getUpsellFeatureAccess", kind = "Name" },
						directives = {}
					}
				}
			},
			directives = {},
			name = { value = "GetUpsellFeatureAccess", kind = "Name" },
			variableDefinitions = {
				{
					kind = "VariableDefinition",
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "String", kind = "Name" }
						}
					},
					directives = {},
					variable = {
						kind = "Variable",
						name = { value = "featureName", kind = "Name" }
					}
				},
				{
					kind = "VariableDefinition",
					type = {
						kind = "ListType",
						type = {
							kind = "NamedType",
							name = { value = "RecourseActions", kind = "Name" }
						}
					},
					directives = {},
					variable = {
						kind = "Variable",
						name = { value = "successfulActions", kind = "Name" }
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
						name = { value = "nameSpace", kind = "Name" }
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
						name = { value = "extraParameters", kind = "Name" }
					}
				}
			}
		}
	}
}