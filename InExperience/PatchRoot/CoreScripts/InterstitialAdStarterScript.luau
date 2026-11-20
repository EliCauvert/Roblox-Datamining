local CorePackages = game:GetService("CorePackages")
require(CorePackages.Packages.UIBlox).init(require(CorePackages.Workspace.Packages.CoreScriptsInitializer).UIBloxInGameConfig)
local InterstitialAdPlayerModule = require(CorePackages.Workspace.Packages.InterstitialAdPlayer)
local Ad, UserId, Finished, VisibilityChanged, Experience = ...
InterstitialAdPlayerModule.mount(InterstitialAdPlayerModule.createEngineHost({
	ad = Ad,
	userId = UserId,
	experience = Experience,
	finished = Finished,
	visibilityChanged = VisibilityChanged
}))