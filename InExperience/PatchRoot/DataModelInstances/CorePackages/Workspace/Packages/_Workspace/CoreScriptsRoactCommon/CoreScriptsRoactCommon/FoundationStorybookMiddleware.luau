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

local function StyleLinkPortal(p1)
	-- upvalues: useStyleSheet (ref), reactRobloxModule (ref)
	return if useStyleSheet() and p1.overlay then reactRobloxModule.createPortal(nil, p1.overlay) else nil
end

local function useCreateOverlay(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(Instance.new("Frame"))
	
	if var1.current.Parent ~= p1.focus then
		var1.current.Parent = p1.focus
	end
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		var1.current.Size = UDim2.fromScale(1, 1)
		var1.current.BackgroundTransparency = 1
		
		return function()
			-- upvalues: var1 (copy)
			var1.current:Destroy()
		end
	end, {})
	
	return var1.current
end

return function(p1)
	-- upvalues: useCreateOverlay (ref), t (ref), reactModule (ref), foundationProvider (ref), t_1 (ref), StyleLinkPortal (ref)
	return function(p2)
		-- upvalues: useCreateOverlay (copy), t (copy), reactModule (copy), foundationProvider (copy), t_1 (copy), p1 (ref), StyleLinkPortal (copy)
		local var1 = useCreateOverlay(p2)
		
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
				colorMode = t[p2.theme],
				device = t_1[p2.platform],
				preferences = p2.settings,
				scale = p2.settings and p2.settings.scale,
				overlayGui = var1
			}, {
				Child = reactModule.createElement(p1, p2),
				StyleLink = reactModule.createElement(StyleLinkPortal, { overlay = var1 })
			})
		})
	end
end