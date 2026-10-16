local ShareSheet = script:FindFirstAncestor("ShareSheet")

return {
	projects = {
		ShareSheet["jest.main.config"],
		ShareSheet["jest.mockDataModel.config"]
	}
}