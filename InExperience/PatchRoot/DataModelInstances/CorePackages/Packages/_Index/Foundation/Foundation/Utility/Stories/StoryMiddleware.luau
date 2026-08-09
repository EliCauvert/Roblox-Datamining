local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local deviceModule = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local foundationModule = require(foundation.Providers.Foundation)
local themeModule = require(foundation.Enums.Theme)
local typesModule = require(foundation.Utility.Stories.Types)
local tokenOverridesStoreModule = require(script.Parent.TokenOverridesStore)
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local useStyleSheet = require(foundation.Providers.Style.StyleSheetContext).useStyleSheet

local function useTokenOverrides() --[[ line: 21 ]]
	-- upvalues: tokenOverridesStoreModule (ref), reactModule (ref)
	local var13 = tokenOverridesStoreModule()
	local var14, var15 = reactModule.useState(function() --[[ line: 23 ]]
		-- upvalues: var13 (ref)
		return var13.getTokenOverrides()
	end)
	reactModule.useEffect(function() --[[ line: 27 ]]
		-- upvalues: var13 (ref), var15 (ref)
		local var16 = var13.subscribe(function(p0) --[[ line: 28 ]]
			-- upvalues: var15 (copy)
			var15(p0)
		end)
		
		return function() --[[ line: 31 ]]
			-- upvalues: var16 (ref)
			var16()
		end
	end, { var13 })
	
	return var14
end

local function StyleLinkPortal(p1) --[[ line: 51 ]]
	-- upvalues: useStyleSheet (ref), reactRobloxModule (ref), reactModule (ref)
	local var17 = useStyleSheet()
	
	return if var17 and p1.overlay then reactRobloxModule.createPortal(reactModule.createElement("StyleLink", { StyleSheet = var17 }), p1.overlay) else nil
end

local function useCreateOverlay(p2) --[[ line: 66 ]]
	-- upvalues: typesModule (ref), reactModule (ref)
	local var18 = typesModule.toFlipbookStoryProps(p2)
	local var19 = if var18 then var18.widget else p2.focus
	local isStorybookEmbed = var19.Name == "StorybookEmbed"
	local var21 = reactModule.useRef(Instance.new("Frame"))
	
	if var21.current.Parent ~= var19 then
		var21.current.Parent = var19
	end
	reactModule.useEffect(function() --[[ line: 80 ]]
		-- upvalues: var21 (ref)
		var21.current.Size = UDim2.fromScale(1, 1)
		var21.current.BackgroundTransparency = 1
		
		return function() --[[ line: 84 ]]
			-- upvalues: var21 (copy)
			var21.current:Destroy()
		end
	end, {})
	
	return if isStorybookEmbed then nil else var21.current
end

return function(p3) --[[ line: 92 | named "StoryMiddleware" ]]
	-- upvalues: useCreateOverlay (ref), themeModule (ref), useTokenOverrides (ref), typesModule (ref), deviceModule (ref), flagsModule (ref), isPluginSecurityModule (ref), reactModule (ref), foundationModule (ref), StyleLinkPortal (ref)
	return function(p4) --[[ line: 94 ]]
		-- upvalues: useCreateOverlay (copy), themeModule (copy), useTokenOverrides (copy), typesModule (copy), deviceModule (copy), flagsModule (copy), isPluginSecurityModule (copy), reactModule (copy), foundationModule (copy), p3 (ref), StyleLinkPortal (copy)
		local var22 = useCreateOverlay(p4)
		local theme = themeModule[p4.theme]
		local var23 = useTokenOverrides()
		local var24 = typesModule.toDeveloperStorybookStoryProps(p4)
		local platform = nil
		local settings = nil
		
		if var24 then
			platform = deviceModule[var24.platform]
			settings = var24.settings
		end
		local foundationPopoverPluginSupport = flagsModule.FoundationPopoverPluginSupport
		
		if flagsModule.FoundationPopoverPluginSecurityGate then
			foundationPopoverPluginSupport = foundationPopoverPluginSupport and isPluginSecurityModule()
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
				overlayGui = var22,
				plugin = if foundationPopoverPluginSupport then p4.plugin else nil,
				tokenOverrides = var23
			}, {
				Child = reactModule.createElement(p3, p4),
				StyleLink = reactModule.createElement(StyleLinkPortal, if var22 then { overlay = var22 } else nil)
			})
		})
	end
end