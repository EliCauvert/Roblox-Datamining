local avatarExperienceGifting = script:FindFirstAncestor("AvatarExperienceGifting")
local parent = avatarExperienceGifting.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local foundationProvider = foundationModule.FoundationProvider
local theme = foundationModule.Enums.Theme
local device = foundationModule.Enums.Device
local useStyleSheet = foundationModule.Hooks.useStyleSheet
local t = {
	Default = theme.Dark,
	Light = theme.Light,
	Dark = theme.Dark
}
local t_1 = {
	Default = device.Desktop,
	Desktop = device.Desktop,
	Console = device.Console
}

local function StyleLinkPortal(p1)
	-- upvalues: useStyleSheet (ref), reactRobloxModule (ref), reactModule (ref)
	return reactRobloxModule.createPortal(reactModule.createElement("StyleLink", { StyleSheet = useStyleSheet() }), p1.overlay)
end

return {
	name = avatarExperienceGifting.Name,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), foundationProvider (ref), t (ref), t_1 (ref), StyleLinkPortal (ref)
		return function(p2)
			-- upvalues: reactModule (copy), foundationProvider (copy), t (copy), t_1 (copy), p1 (ref), StyleLinkPortal (copy)
			local var1 = reactModule.useRef(Instance.new("Frame"))
			
			if var1.current.Parent ~= p2.focus then
				var1.current.Parent = p2.focus
			end
			reactModule.useLayoutEffect(function()
				-- upvalues: var1 (ref)
				var1.current.Name = "AvatarExperienceGiftingOverlay"
				var1.current.Size = UDim2.fromScale(1, 1)
				var1.current.BackgroundTransparency = 1
			end, {})
			
			return reactModule.createElement(foundationProvider, {
				theme = if p2 then t[p2.theme] else t.Default,
				device = if p2 then t_1[p2.platform] else t_1.Default,
				preferences = p2 and p2.settings,
				overlayGui = var1.current
			}, {
				Story = reactModule.createElement(p1, p2),
				StyleLink = reactModule.createElement(StyleLinkPortal, { overlay = var1.current })
			})
		end
	end,
	storyRoots = { avatarExperienceGifting }
}