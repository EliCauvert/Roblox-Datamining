local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local DeviceModule = require(Foundation.Enums.Device)
local FlagsModule = require(Foundation.Utility.Flags)
local FoundationModule = require(Foundation.Providers.Foundation)
local ThemeModule = require(Foundation.Enums.Theme)
local TypesModule = require(Foundation.Utility.Stories.Types)
local TokenOverridesStoreModule = require(script.Parent.TokenOverridesStore)
local IsPluginSecurityModule = require(Foundation.Utility.isPluginSecurity)
local UseStyleSheetFunction = require(Foundation.Providers.Style.StyleSheetContext).useStyleSheet

local function useTokenOverrides()
	-- upvalues: TokenOverridesStoreModule (copy), ReactModule (copy)
	local KenOverridesStoreModule = TokenOverridesStoreModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: KenOverridesStoreModule (copy)
		return KenOverridesStoreModule.getTokenOverrides()
	end)
	ReactModule.useEffect(function()
		-- upvalues: KenOverridesStoreModule (copy), UseStateResult2 (copy)
		local SubscribeResult = KenOverridesStoreModule.subscribe(function(p1)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(p1)
		end)
		
		return function()
			-- upvalues: SubscribeResult (copy)
			SubscribeResult()
		end
	end, { KenOverridesStoreModule })
	
	return UseStateResult
end

local function StyleLinkPortal(p1)
	-- upvalues: UseStyleSheetFunction (copy), ReactRobloxModule (copy), ReactModule (copy)
	local UseStyleSheetResult = UseStyleSheetFunction()
	
	return if UseStyleSheetResult and p1.overlay then ReactRobloxModule.createPortal(ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetResult }), p1.overlay) else nil
end

local function useCreateOverlay(p1)
	-- upvalues: TypesModule (copy), ReactModule (copy)
	local FlipbookStoryProps = TypesModule.toFlipbookStoryProps(p1)
	local Widget = if FlipbookStoryProps then FlipbookStoryProps.widget else p1.focus
	local IsStorybookEmbed = Widget.Name == "StorybookEmbed"
	local UseRefResult = ReactModule.useRef(Instance.new("Frame"))
	
	if UseRefResult.current.Parent ~= Widget then
		UseRefResult.current.Parent = Widget
	end
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current.Size = UDim2.fromScale(1, 1)
		UseRefResult.current.BackgroundTransparency = 1
		
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current:Destroy()
		end
	end, {})
	
	return if IsStorybookEmbed then nil else UseRefResult.current
end

return function(p1)
	-- upvalues: useCreateOverlay (copy), ThemeModule (copy), useTokenOverrides (copy), TypesModule (copy), DeviceModule (copy), FlagsModule (copy), IsPluginSecurityModule (copy), ReactModule (copy), FoundationModule (copy), StyleLinkPortal (copy)
	return function(p2)
		-- upvalues: useCreateOverlay (upval), ThemeModule (upval), useTokenOverrides (upval), TypesModule (upval), DeviceModule (upval), FlagsModule (upval), IsPluginSecurityModule (upval), ReactModule (upval), FoundationModule (upval), p1 (copy), StyleLinkPortal (upval)
		local UseCreateOverlayResult = useCreateOverlay(p2)
		local ThemeModuleEntry = ThemeModule[p2.theme]
		local UseTokenOverridesResult = useTokenOverrides()
		local DeveloperStorybookStoryProps = TypesModule.toDeveloperStorybookStoryProps(p2)
		local Device = nil
		local Settings = nil
		
		if DeveloperStorybookStoryProps then
			Device = DeviceModule[DeveloperStorybookStoryProps.platform]
			Settings = DeveloperStorybookStoryProps.settings
		end
		local FoundationPopoverPluginSupport = FlagsModule.FoundationPopoverPluginSupport
		
		if FlagsModule.FoundationPopoverPluginSecurityGate then
			FoundationPopoverPluginSupport = FoundationPopoverPluginSupport and IsPluginSecurityModule()
		end
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
			FoundationContext = ReactModule.createElement(FoundationModule, {
				theme = ThemeModuleEntry,
				device = Device,
				preferences = Settings,
				scale = Settings and Settings.scale,
				overlayGui = UseCreateOverlayResult,
				plugin = if FoundationPopoverPluginSupport then p2.plugin else nil,
				tokenOverrides = UseTokenOverridesResult
			}, {
				Child = ReactModule.createElement(p1, p2),
				StyleLink = ReactModule.createElement(StyleLinkPortal, if UseCreateOverlayResult then { overlay = UseCreateOverlayResult } else nil)
			})
		})
	end
end