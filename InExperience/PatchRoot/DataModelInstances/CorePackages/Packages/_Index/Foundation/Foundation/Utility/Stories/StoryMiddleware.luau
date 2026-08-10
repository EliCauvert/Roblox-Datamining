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

local function useTokenOverrides() --[[ line: 20 ]]
	-- upvalues: tokenOverridesStoreModule (ref), reactModule (ref)
	local var12 = tokenOverridesStoreModule()
	local var13, var14 = reactModule.useState(function() --[[ line: 22 ]]
		-- upvalues: var12 (ref)
		return var12.getTokenOverrides()
	end)
	reactModule.useEffect(function() --[[ line: 26 ]]
		-- upvalues: var12 (ref), var14 (ref)
		local var15 = var12.subscribe(function(p0) --[[ line: 27 ]]
			-- upvalues: var14 (copy)
			var14(p0)
		end)
		
		return function() --[[ line: 30 ]]
			-- upvalues: var15 (ref)
			var15()
		end
	end, { var12 })
	
	return var13
end

local function StyleLinkPortal(p1) --[[ line: 50 ]]
	-- upvalues: useStyleSheet (ref), reactRobloxModule (ref), reactModule (ref)
	local var16 = useStyleSheet()
	
	return if var16 and p1.overlay then reactRobloxModule.createPortal(reactModule.createElement("StyleLink", { StyleSheet = var16 }), p1.overlay) else nil
end

local function useCreateOverlay(p2) --[[ line: 65 ]]
	-- upvalues: typesModule (ref), reactModule (ref)
	local var17 = typesModule.toFlipbookStoryProps(p2)
	local var18 = if var17 then var17.widget else p2.focus
	local isStorybookEmbed = var18.Name == "StorybookEmbed"
	local var20 = reactModule.useRef(Instance.new("Frame"))
	
	if var20.current.Parent ~= var18 then
		var20.current.Parent = var18
	end
	reactModule.useEffect(function() --[[ line: 79 ]]
		-- upvalues: var20 (ref)
		var20.current.Size = UDim2.fromScale(1, 1)
		var20.current.BackgroundTransparency = 1
		
		return function() --[[ line: 83 ]]
			-- upvalues: var20 (copy)
			var20.current:Destroy()
		end
	end, {})
	
	return if isStorybookEmbed then nil else var20.current
end

return function(p3) --[[ line: 91 | named "StoryMiddleware" ]]
	-- upvalues: useCreateOverlay (ref), colorModeModule (ref), useTokenOverrides (ref), typesModule (ref), deviceModule (ref), reactModule (ref), foundationModule (ref), isPluginSecurityModule (ref), StyleLinkPortal (ref)
	return function(p4) --[[ line: 93 ]]
		-- upvalues: useCreateOverlay (copy), colorModeModule (copy), useTokenOverrides (copy), typesModule (copy), deviceModule (copy), reactModule (copy), foundationModule (copy), isPluginSecurityModule (copy), p3 (ref), StyleLinkPortal (copy)
		local var21 = useCreateOverlay(p4)
		local theme = colorModeModule[p4.theme]
		local var22 = useTokenOverrides()
		local var23 = typesModule.toDeveloperStorybookStoryProps(p4)
		local platform = nil
		local settings = nil
		
		if var23 then
			platform = deviceModule[var23.platform]
			settings = var23.settings
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
				theme = theme,
				device = platform,
				preferences = settings,
				scale = settings and settings.scale,
				overlayGui = var21,
				plugin = if isPluginSecurityModule() then p4.plugin else nil,
				tokenOverrides = var22
			}, {
				Child = reactModule.createElement(p3, p4),
				StyleLink = reactModule.createElement(StyleLinkPortal, if var21 then { overlay = var21 } else nil)
			})
		})
	end
end