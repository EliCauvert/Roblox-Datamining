local shareSheet = script:FindFirstAncestor("ShareSheet")

return {
	projects = {
		shareSheet["jest.main.config"],
		shareSheet["jest.mockDataModel.config"]
	}
}