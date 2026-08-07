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
	mapStory = function(p0) --[[ line: 19 ]]
		-- upvalues: roactModule (ref), roactRoduxModule (ref), storyStoreModule (ref), cryoModule (ref), chatSettingsModule (ref)
		return function(p1) --[[ line: 20 ]]
			-- upvalues: roactModule (copy), roactRoduxModule (copy), storyStoreModule (copy), p0 (ref), cryoModule (copy), chatSettingsModule (copy)
			return roactModule.createElement(roactRoduxModule.StoreProvider, { store = storyStoreModule }, {
				Story = roactModule.createElement(p0, cryoModule.Dictionary.join(p1, { chatSettings = chatSettingsModule }))
			})
		end
	end
}