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
									name = { value = "targetUserId", kind = "Name" },
									directives = {}
								},
								{
									kind = "Field",
									arguments = {},
									name = { value = "prevCursor", kind = "Name" },
									directives = {}
								},
								{
									kind = "Field",
									arguments = {},
									name = { value = "nextCursor", kind = "Name" },
									directives = {}
								},
								{
									kind = "Field",
									arguments = {},
									name = { value = "curCursor", kind = "Name" },
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
												name = { value = "targetUserId", kind = "Name" },
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
									name = { value = "friends", kind = "Name" },
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
							},
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "pageLimit", kind = "Name" }
								},
								name = { value = "pageLimit", kind = "Name" }
							},
							{
								kind = "Argument",
								value = {
									kind = "Variable",
									name = { value = "pageCursor", kind = "Name" }
								},
								name = { value = "pageCursor", kind = "Name" }
							}
						},
						name = { value = "allFriendsByUserId", kind = "Name" },
						directives = {}
					}
				}
			},
			directives = {},
			name = { value = "AllFriendsByUserId", kind = "Name" },
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
						name = { value = "pageLimit", kind = "Name" }
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
						name = { value = "pageCursor", kind = "Name" }
					}
				}
			}
		}
	}
}