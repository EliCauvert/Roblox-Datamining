local parent = script.Parent

return {
	projects = {
		parent["jest.main.config"],
		parent["jest.mockDataModel.config"]
	}
}