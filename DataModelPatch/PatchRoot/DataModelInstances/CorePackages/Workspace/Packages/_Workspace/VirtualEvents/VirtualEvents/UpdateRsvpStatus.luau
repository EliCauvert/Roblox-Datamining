return {
	kind = "Document",
	definitions = {
		{
			operation = "mutation",
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
									name = {
										value = "shouldSeeNotificationsUpsellModal",
										kind = "Name"
									},
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
												name = { value = "userRsvpStatus", kind = "Name" },
												directives = {}
											}
										}
									},
									arguments = {},
									name = { value = "virtualEvent", kind = "Name" },
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
							},
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "rsvpStatus", kind = "Name" }
								},
								name = { value = "rsvpStatus", kind = "Name" }
							}
						},
						name = { value = "virtualEventRsvp", kind = "Name" },
						directives = {}
					}
				}
			},
			directives = {},
			name = { value = "UpdateRsvpStatus", kind = "Name" },
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
				},
				{
					kind = "VariableDefinition",
					type = {
						kind = "NonNullType",
						type = {
							kind = "NamedType",
							name = { value = "RsvpStatus", kind = "Name" }
						}
					},
					directives = {},
					variable = {
						kind = "Variable",
						name = { value = "rsvpStatus", kind = "Name" }
					}
				}
			}
		}
	}
}