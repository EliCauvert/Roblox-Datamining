local Reactions = script:FindFirstAncestor("Reactions")
local Parent = Reactions.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Success, Result = pcall(function()
	-- upvalues: Parent (copy)
	return require(Parent.Dev.ReactRoblox)
end)

if not Success then
	Result = require(script:FindFirstAncestor("Packages").ReactRoblox)
end
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local FoundationProvider = FoundationModule.FoundationProvider
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet

local function StyleLinkPortal(p1)
	-- upvalues: UseStyleSheetFunction (copy), Result (ref), ReactModule (copy)
	return Result.createPortal(ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetFunction() }), p1.overlay)
end

return {
	name = Reactions.Name,
	roact = ReactModule,
	reactRoblox = Result,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy), ColorMode (copy), Device (copy), StyleLinkPortal (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), ColorMode (upval), Device (upval), p1 (copy), StyleLinkPortal (upval)
			local UseRefResult = ReactModule.useRef(nil)
			
			if UseRefResult.current == nil then
				local FoundationOverlay = Instance.new("Frame")
				FoundationOverlay.Name = "FoundationOverlay"
				FoundationOverlay.Size = UDim2.fromScale(1, 1)
				FoundationOverlay.BackgroundTransparency = 1
				FoundationOverlay.ZIndex = 1000
				UseRefResult.current = FoundationOverlay
			end
			local Current = UseRefResult.current
			
			if Current.Parent ~= p2.focus then
				Current.Parent = p2.focus
			end
			ReactModule.useEffect(function()
				-- upvalues: Current (copy)
				return function()
					-- upvalues: Current (upval)
					Current:Destroy()
				end
			end, { Current })
			
			return ReactModule.createElement(FoundationProvider, {
				colorMode = ColorMode[p2.theme] or ColorMode.Dark,
				device = Device[p2.platform] or Device.Desktop,
				overlayGui = Current
			}, {
				Story = ReactModule.createElement(p1, p2),
				StyleLink = ReactModule.createElement(StyleLinkPortal, { overlay = Current })
			})
		end
	end,
	storyRoots = { Reactions }
}