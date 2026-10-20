local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.InterventionShared)["jest.config"],
		require(Parent.InAppIntervention)["jest.config"],
		require(Parent.NotApprovedPage)["jest.config"],
		require(Parent.UniversalFeatureRestrictions)["jest.config"],
		game.CoreGui.RobloxGui.Modules.LuaApp.Models.UserModerationApi["jest.config"],
		game.CoreGui.RobloxGui.Modules.LuaApp.Components.Moderation["jest.config"]
	}
}