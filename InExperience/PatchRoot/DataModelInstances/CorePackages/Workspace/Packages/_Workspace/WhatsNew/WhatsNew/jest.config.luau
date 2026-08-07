local whatsNew = script:FindFirstAncestor("WhatsNew")

return {
	projects = {
		whatsNew["jest.main.config"],
		whatsNew["jest.mockDataModel.config"]
	}
}