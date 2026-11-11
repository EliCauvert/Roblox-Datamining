local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
require(CorePackages.Packages.UIBlox).init(require(CorePackages.Workspace.Packages.RobloxAppUIBloxConfig))
local StoryStoreModule = require(script.Parent.Helpers.StoryStore)
local ChatSettingsModule = require(script.Parent.ChatSettings)
RoactModule.setGlobalConfig({ elementTracing = true, propValidation = true })

return {
	roact = RoactModule,
	mapStory = function(p1)
		-- upvalues: RoactModule (copy), RoactRoduxModule (copy), StoryStoreModule (copy), CryoModule (copy), ChatSettingsModule (copy)
		return function(p2)
			-- upvalues: RoactModule (upval), RoactRoduxModule (upval), StoryStoreModule (upval), p1 (copy), CryoModule (upval), ChatSettingsModule (upval)
			return RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = StoryStoreModule }, {
				Story = RoactModule.createElement(p1, CryoModule.Dictionary.join(p2, { chatSettings = ChatSettingsModule }))
			})
		end
	end
}