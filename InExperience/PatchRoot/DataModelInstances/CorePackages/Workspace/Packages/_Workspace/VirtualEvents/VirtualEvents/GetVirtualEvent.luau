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
									arguments = {},
									name = { value = "title", kind = "Name" },
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
									selectionSet = {
										kind = "SelectionSet",
										selections = {
											{
												kind = "Field",
												arguments = {},
												name = { value = "hostId", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "hostType", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "hostName", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "hasVerifiedBadge", kind = "Name" },
												directives = {}
											}
										}
									},
									arguments = {},
									name = { value = "host", kind = "Name" },
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
								},
								{
									kind = "Field",
									selectionSet = {
										kind = "SelectionSet",
										selections = {
											{
												kind = "Field",
												arguments = {},
												name = { value = "name", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "playing", kind = "Name" },
												directives = {}
											}
										}
									},
									arguments = {},
									name = { value = "experienceDetails", kind = "Name" },
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
												name = { value = "imageId", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "assetType", kind = "Name" },
												directives = {}
											}
										}
									},
									arguments = {},
									name = { value = "media", kind = "Name" },
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
												name = { value = "going", kind = "Name" },
												directives = {}
											}
										}
									},
									arguments = {},
									name = { value = "rsvpCounters", kind = "Name" },
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
												name = { value = "userId", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "rsvpStatus", kind = "Name" },
												directives = {}
											}
										}
									},
									arguments = {},
									name = { value = "rsvps", kind = "Name" },
									directives = {}
								}
							}
						},
						arguments = {
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "virtualEventId", kind = "Name" }
								},
								name = { value = "id", kind = "Name" }
							}
						},
						name = { value = "virtualEvent", kind = "Name" },
						directives = {}
					}
				}
			},
			directives = {},
			name = { value = "GetVirtualEvent", kind = "Name" },
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
						name = { value = "virtualEventId", kind = "Name" }
					}
				}
			}
		}
	}
}