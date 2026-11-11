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
									name = { value = "targetUserId", kind = "Name" },
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
												name = { value = "userPresenceType", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "lastLocation", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "lastOnline", kind = "Name" },
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
												name = { value = "rootPlaceId", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "gameId", kind = "Name" },
												directives = {}
											},
											{
												kind = "Field",
												arguments = {},
												name = { value = "universeId", kind = "Name" },
												directives = {}
											}
										}
									},
									arguments = {},
									name = { value = "presence", kind = "Name" },
									directives = {}
								},
								{
									kind = "Field",
									arguments = {},
									name = { value = "sortScore", kind = "Name" },
									directives = {}
								}
							}
						},
						arguments = {
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "userId", kind = "Name" }
								},
								name = { value = "userId", kind = "Name" }
							},
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "sort", kind = "Name" }
								},
								name = { value = "sort", kind = "Name" }
							}
						},
						name = { value = "onlineFriendsByUserId", kind = "Name" },
						directives = {}
					}
				}
			},
			directives = {},
			name = { value = "OnlineFriendsByUserId", kind = "Name" },
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
						name = { value = "userId", kind = "Name" }
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
						name = { value = "sort", kind = "Name" }
					}
				}
			}
		}
	}
}