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
									name = { value = "cursor", kind = "Name" },
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
												name = { value = "title", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "displayTitle", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "subtitle", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "displaySubtitle", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "universeId", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "placeId", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "description", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "displayDescription", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "eventStatus", kind = "Name" },
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
															name = { value = "startUtc", kind = "Name" },
															directives = {}
														},
														{
															kind = "Field",
															arguments = {},
															name = { value = "endUtc", kind = "Name" },
															directives = {}
														}
													}
												},
												arguments = {},
												name = { value = "eventTime", kind = "Name" },
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
															name = { value = "category", kind = "Name" },
															directives = {}
														},
														{
															kind = "Field",
															arguments = {},
															name = { value = "rank", kind = "Name" },
															directives = {}
														}
													}
												},
												arguments = {},
												name = { value = "eventCategories", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "userRsvpStatus", kind = "Name" },
												directives = {}
											}
										}
									},
									arguments = {},
									name = { value = "virtualEvents", kind = "Name" },
									directives = {}
								}
							}
						},
						arguments = {
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "universeId", kind = "Name" }
								},
								name = { value = "universeId", kind = "Name" }
							},
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "options", kind = "Name" }
								},
								name = { value = "options", kind = "Name" }
							}
						},
						name = { value = "virtualEventsByUniverseId", kind = "Name" },
						directives = {}
					}
				}
			},
			directives = {},
			name = { value = "VirtualEventsForExperience", kind = "Name" },
			variableDefinitions = {
				{
					kind = "VariableDefinition",
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "ID", kind = "Name" }
						}
					},
					directives = {},
					variable = {
						kind = "Variable",
						name = { value = "universeId", kind = "Name" }
					}
				},
				{
					kind = "VariableDefinition",
					type = {
						kind = "NamedType",
						name = {
							value = "VirtualEventsByUniverseIdOptions",
							kind = "Name"
						}
					},
					directives = {},
					variable = {
						kind = "Variable",
						name = { value = "options", kind = "Name" }
					}
				}
			}
		}
	}
}