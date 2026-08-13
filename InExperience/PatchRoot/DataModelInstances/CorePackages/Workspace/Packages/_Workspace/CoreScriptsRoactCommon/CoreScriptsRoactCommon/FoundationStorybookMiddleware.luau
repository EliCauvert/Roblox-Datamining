local parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local foundationProvider = foundationModule.FoundationProvider
local t = {
	Default = foundationModule.Enums.ColorMode.Dark,
	Light = foundationModule.Enums.ColorMode.Light,
	Dark = foundationModule.Enums.ColorMode.Dark
}
local t_1 = {
	Default = "Desktop",
	Desktop = "Desktop",
	Console = "Console"
}
local useStyleSheet = foundationModule.Hooks.useStyleSheet

local function StyleLinkPortal(p0) --[[ line: 25 ]]
	-- upvalues: useStyleSheet (ref), reactRobloxModule (ref)
	return if useStyleSheet() and p0.overlay then reactRobloxModule.createPortal(nil, p0.overlay) else nil
end

local function useCreateOverlay(p1) --[[ line: 35 ]]
	-- upvalues: reactModule (ref)
	local var7 = reactModule.useRef(Instance.new("Frame"))
	
	if var7.current.Parent ~= p1.focus then
		var7.current.Parent = p1.focus
	end
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: var7 (ref)
		var7.current.Size = UDim2.fromScale(1, 1)
		var7.current.BackgroundTransparency = 1
		
		return function() --[[ line: 47 ]]
			-- upvalues: var7 (copy)
			var7.current:Destroy()
		end
	end, {})
	
	return var7.current
end

return function(p2) --[[ line: 62 | named "FoundationStorybookMiddleware" ]]
	-- upvalues: useCreateOverlay (ref), t (ref), reactModule (ref), foundationProvider (ref), t_1 (ref), StyleLinkPortal (ref)
	return function(p3) --[[ line: 63 ]]
		-- upvalues: useCreateOverlay (copy), t (copy), reactModule (copy), foundationProvider (copy), t_1 (copy), p2 (ref), StyleLinkPortal (copy)
		local var8 = useCreateOverlay(p3)
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 10),
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10)
			}),
			FoundationContext = reactModule.createElement(foundationProvider, {
				colorMode = t[p3.theme],
				device = t_1[p3.platform],
				preferences = p3.settings,
				scale = p3.settings and p3.settings.scale,
				overlayGui = var8
			}, {
				Child = reactModule.createElement(p2, p3),
				StyleLink = reactModule.createElement(StyleLinkPortal, { overlay = var8 })
			})
		})
	end
end