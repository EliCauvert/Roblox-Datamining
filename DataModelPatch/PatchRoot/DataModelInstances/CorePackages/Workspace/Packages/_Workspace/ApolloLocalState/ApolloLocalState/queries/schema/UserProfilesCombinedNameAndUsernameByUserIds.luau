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
												name = { value = "combinedName", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "username", kind = "Name" },
												directives = {}
											}
										}
									},
									arguments = {},
									name = { value = "names", kind = "Name" },
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
							}
						},
						name = { value = "userProfiles", kind = "Name" },
						directives = {}
					}
				}
			},
			directives = {},
			name = { value = "UserProfiles", kind = "Name" },
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
				}
			}
		}
	}
}