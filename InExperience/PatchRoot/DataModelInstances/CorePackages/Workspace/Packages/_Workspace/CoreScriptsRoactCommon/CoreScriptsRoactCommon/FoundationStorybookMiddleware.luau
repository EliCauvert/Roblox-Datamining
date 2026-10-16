local Parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationProvider = FoundationModule.FoundationProvider
local config = {
	Default = FoundationModule.Enums.ColorMode.Dark,
	Light = FoundationModule.Enums.ColorMode.Light,
	Dark = FoundationModule.Enums.ColorMode.Dark
}
local config1 = {
	Default = "Desktop",
	Desktop = "Desktop",
	Console = "Console"
}
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet

local function StyleLinkPortal(p1) --[[ Line: 25 ]]
	-- upvalues: UseStyleSheetFunction (copy), ReactRobloxModule (copy)
	return if UseStyleSheetFunction() and p1.overlay then ReactRobloxModule.createPortal(nil, p1.overlay) else nil
end

local function useCreateOverlay(p1) --[[ Line: 35 ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(Instance.new("Frame"))
	
	if UseRefResult.current.Parent ~= p1.focus then
		UseRefResult.current.Parent = p1.focus
	end
	ReactModule.useEffect(function() --[[ Line: 43 ]]
		-- upvalues: UseRefResult (copy)
		UseRefResult.current.Size = UDim2.fromScale(1, 1)
		UseRefResult.current.BackgroundTransparency = 1
		
		return function() --[[ Line: 47 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current:Destroy()
		end
	end, {})
	
	return UseRefResult.current
end

return function(p1) --[[ Line: 62 | Named "FoundationStorybookMiddleware" ]]
	-- upvalues: useCreateOverlay (copy), config (copy), ReactModule (copy), FoundationProvider (copy), config1 (copy), StyleLinkPortal (copy)
	return function(p2) --[[ Line: 63 ]]
		-- upvalues: useCreateOverlay (upval), config (upval), ReactModule (upval), FoundationProvider (upval), config1 (upval), p1 (copy), StyleLinkPortal (upval)
		local UseCreateOverlayResult = useCreateOverlay(p2)
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 10),
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10)
			}),
			FoundationContext = ReactModule.createElement(FoundationProvider, {
				colorMode = config[p2.theme],
				device = config1[p2.platform],
				preferences = p2.settings,
				scale = p2.settings and p2.settings.scale,
				overlayGui = UseCreateOverlayResult
			}, {
				Child = ReactModule.createElement(p1, p2),
				StyleLink = ReactModule.createElement(StyleLinkPortal, { overlay = UseCreateOverlayResult })
			})
		})
	end
end