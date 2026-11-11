local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.Moments)["jest.main.config"],
		require(Parent.Moments)["jest.mockDataModel.config"],
		require(Parent.MomentsCommon)["jest.config"],
		require(Parent.MomentsCreation)["jest.config"],
		require(Parent.MomentsTypes)["jest.config"]
	}
}