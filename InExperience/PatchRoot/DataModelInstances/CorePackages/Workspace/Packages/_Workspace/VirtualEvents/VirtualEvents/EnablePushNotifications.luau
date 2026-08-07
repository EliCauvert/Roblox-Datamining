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
									name = { value = "enablePushNotifications", kind = "Name" },
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
			directives = {},
			name = { value = "EnablePushNotifications", kind = "Name" },
			variableDefinitions = {}
		}
	}
}