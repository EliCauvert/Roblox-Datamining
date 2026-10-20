local AvatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local Parent = AvatarExperienceGifting.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
local FoundationProvider = FoundationModule.FoundationProvider
local Theme = FoundationModule.Enums.Theme
local Device = FoundationModule.Enums.Device
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet
local config = {
	Default = Theme.Dark,
	Light = Theme.Light,
	Dark = Theme.Dark
}
local config1 = {
	Default = Device.Desktop,
	Desktop = Device.Desktop,
	Console = Device.Console
}

local function StyleLinkPortal(p1)
	-- upvalues: UseStyleSheetFunction (copy), ReactRobloxModule (copy), ReactModule (copy)
	return ReactRobloxModule.createPortal(ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetFunction() }), p1.overlay)
end

return {
	name = AvatarExperienceGifting.Name,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy), config (copy), config1 (copy), StyleLinkPortal (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), config (upval), config1 (upval), p1 (copy), StyleLinkPortal (upval)
			local UseRefResult = ReactModule.useRef(Instance.new("Frame"))
			
			if UseRefResult.current.Parent ~= p2.focus then
				UseRefResult.current.Parent = p2.focus
			end
			ReactModule.useLayoutEffect(function()
				-- upvalues: UseRefResult (copy)
				UseRefResult.current.Name = "AvatarExperienceGiftingOverlay"
				UseRefResult.current.Size = UDim2.fromScale(1, 1)
				UseRefResult.current.BackgroundTransparency = 1
			end, {})
			
			return ReactModule.createElement(FoundationProvider, {
				theme = p2 and config[p2.theme] or config.Default,
				device = p2 and config1[p2.platform] or config1.Default,
				preferences = p2 and p2.settings,
				overlayGui = UseRefResult.current
			}, {
				Story = ReactModule.createElement(p1, p2),
				StyleLink = ReactModule.createElement(StyleLinkPortal, { overlay = UseRefResult.current })
			})
		end
	end,
	storyRoots = { AvatarExperienceGifting }
}