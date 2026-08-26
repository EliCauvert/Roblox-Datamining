local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local colorModeModule = require(foundation.Enums.ColorMode)
local deviceModule = require(foundation.Enums.Device)
local foundationModule = require(foundation.Providers.Foundation)
local typesModule = require(foundation.Utility.Stories.Types)
local tokenOverridesStoreModule = require(script.Parent.TokenOverridesStore)
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local useStyleSheet = require(foundation.Providers.Style.StyleSheetContext).useStyleSheet

local function useTokenOverrides()
	-- upvalues: tokenOverridesStoreModule (ref), reactModule (ref)
	local var1 = tokenOverridesStoreModule()
	local var2, var3 = reactModule.useState(function()
		-- upvalues: var1 (ref)
		return var1.getTokenOverrides()
	end)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		local var4 = var1.subscribe(function(p1)
			-- upvalues: var3 (copy)
			var3(p1)
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4()
		end
	end, { var1 })
	
	return var2
end

local function StyleLinkPortal(p1)
	-- upvalues: useStyleSheet (ref), reactRobloxModule (ref), reactModule (ref)
	local var1 = useStyleSheet()
	
	return if var1 and p1.overlay then reactRobloxModule.createPortal(reactModule.createElement("StyleLink", { StyleSheet = var1 }), p1.overlay) else nil
end

local function useCreateOverlay(p1)
	-- upvalues: typesModule (ref), reactModule (ref)
	local var1 = typesModule.toFlipbookStoryProps(p1)
	local var2 = if var1 then var1.widget else p1.focus
	local isStorybookEmbed = var2.Name == "StorybookEmbed"
	local var3 = reactModule.useRef(Instance.new("Frame"))
	
	if var3.current.Parent ~= var2 then
		var3.current.Parent = var2
	end
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		var3.current.Size = UDim2.fromScale(1, 1)
		var3.current.BackgroundTransparency = 1
		
		return function()
			-- upvalues: var3 (copy)
			var3.current:Destroy()
		end
	end, {})
	
	return if isStorybookEmbed then nil else var3.current
end

return function(p1)
	-- upvalues: useCreateOverlay (ref), colorModeModule (ref), useTokenOverrides (ref), typesModule (ref), deviceModule (ref), reactModule (ref), foundationModule (ref), isPluginSecurityModule (ref), StyleLinkPortal (ref)
	return function(p2)
		-- upvalues: useCreateOverlay (copy), colorModeModule (copy), useTokenOverrides (copy), typesModule (copy), deviceModule (copy), reactModule (copy), foundationModule (copy), isPluginSecurityModule (copy), p1 (ref), StyleLinkPortal (copy)
		local var1 = useCreateOverlay(p2)
		local theme = colorModeModule[p2.theme]
		local var2 = useTokenOverrides()
		local var3 = typesModule.toDeveloperStorybookStoryProps(p2)
		local platform = nil
		local settings = nil
		
		if var3 then
			platform = deviceModule[var3.platform]
			settings = var3.settings
		end
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
			FoundationContext = reactModule.createElement(foundationModule, {
				colorMode = theme,
				device = platform,
				preferences = settings,
				scale = settings and settings.scale,
				overlayGui = var1,
				plugin = if isPluginSecurityModule() then p2.plugin else nil,
				tokenOverrides = var2
			}, {
				Child = reactModule.createElement(p1, p2),
				StyleLink = reactModule.createElement(StyleLinkPortal, if var1 then { overlay = var1 } else nil)
			})
		})
	end
end