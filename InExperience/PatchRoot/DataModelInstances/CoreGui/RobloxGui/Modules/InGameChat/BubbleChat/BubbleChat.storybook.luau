local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
require(corePackagesService.Packages.UIBlox).init(require(corePackagesService.Workspace.Packages.RobloxAppUIBloxConfig))
local storyStoreModule = require(script.Parent.Helpers.StoryStore)
local chatSettingsModule = require(script.Parent.ChatSettings)
roactModule.setGlobalConfig({ elementTracing = true, propValidation = true })

return {
	roact = roactModule,
	mapStory = function(p1)
		-- upvalues: roactModule (ref), roactRoduxModule (ref), storyStoreModule (ref), cryoModule (ref), chatSettingsModule (ref)
		return function(p2)
			-- upvalues: roactModule (copy), roactRoduxModule (copy), storyStoreModule (copy), p1 (ref), cryoModule (copy), chatSettingsModule (copy)
			return roactModule.createElement(roactRoduxModule.StoreProvider, { store = storyStoreModule }, {
				Story = roactModule.createElement(p1, cryoModule.Dictionary.join(p2, { chatSettings = chatSettingsModule }))
			})
		end
	end
}