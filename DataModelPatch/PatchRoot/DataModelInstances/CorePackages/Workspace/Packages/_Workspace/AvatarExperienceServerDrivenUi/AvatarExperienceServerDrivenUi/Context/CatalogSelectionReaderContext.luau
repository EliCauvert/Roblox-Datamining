local Parent = script:FindFirstAncestor("AvatarExperienceServerDrivenUi").Parent
local SignalsModule = require(Parent.Signals)

return {
	Context = require(Parent.React).createContext({
		activeCategoryId = SignalsModule.createSignal(nil),
		activeSubcategoryId = SignalsModule.createSignal(nil)
	})
}