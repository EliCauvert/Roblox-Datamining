local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local StyleProviderWithDefaultTheme = require(CorePackages.Workspace.Packages.Style).StyleProviderWithDefaultTheme

return {
	name = "sharetargetgame",
	storyRoot = script,
	middleware = function(p1, p2)
		-- upvalues: CorePackages (copy), RoactModule (copy), StyleProviderWithDefaultTheme (copy)
		require(CorePackages.Packages.UIBlox).init(require(CorePackages.Workspace.Packages.RobloxAppUIBloxConfig))
		local StoryRoot = RoactModule.mount(RoactModule.createElement(StyleProviderWithDefaultTheme, nil, { Story = RoactModule.createElement(p1) }), p2, "StoryRoot")
		
		return function()
			-- upvalues: RoactModule (upval), StoryRoot (copy)
			RoactModule.unmount(StoryRoot)
		end
	end
}