local ReactionsUserList = script:FindFirstAncestor("ReactionsUserList")
local Parent = ReactionsUserList.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Dev.Localization)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
local RoactNavigationModule = require(Parent.Dev.RoactNavigation)
local RoactRoduxModule = require(Parent.Dev.RoactRodux)
local RobloxAppLocalesModule = require(Parent.Dev.RobloxAppLocales)
local RoduxModule = require(Parent.Dev.Rodux)
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local FoundationProvider = FoundationModule.FoundationProvider
local LocalizationProvider = LocalizationModule.LocalizationProvider
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet

local function StyleLinkPortal(p1)
	-- upvalues: UseStyleSheetFunction (copy), ReactRobloxModule (copy), ReactModule (copy)
	return ReactRobloxModule.createPortal(ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetFunction() }), p1.overlay)
end

local function createStore()
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(function(p1)
		return p1
	end, {
		ScreenSize = Vector2.new(600, 600),
		TopBar = { topBarHeight = 0 },
		GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 0 }
	}, { RoduxModule.thunkMiddleware })
end

local config = {
	state = { routeName = "appPage" },
	isFocused = function(): boolean
		return true
	end,
	addListener = function()
		return { remove = function() end }
	end,
	getParam = function(_, p1)
		return p1
	end,
	navigate = function() end
}
local EnUs = RobloxAppLocalesModule.Localization.new("en-us")

return {
	name = ReactionsUserList.Name,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy), ColorMode (copy), Device (copy), StyleLinkPortal (copy), LocalizationProvider (copy), EnUs (copy), RoactRoduxModule (copy), createStore (copy), RoactNavigationModule (copy), config (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), ColorMode (upval), Device (upval), StyleLinkPortal (upval), LocalizationProvider (upval), EnUs (upval), RoactRoduxModule (upval), createStore (upval), RoactNavigationModule (upval), config (upval), p1 (copy)
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
				StyleLink = ReactModule.createElement(StyleLinkPortal, { overlay = Current }),
				Localization = ReactModule.createElement(LocalizationProvider, { localization = EnUs }, {
					Store = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = createStore() }, {
						Navigation = ReactModule.createElement(RoactNavigationModule.Provider, { value = config }, { Story = ReactModule.createElement(p1, p2) })
					})
				})
			})
		end
	end,
	storyRoots = { ReactionsUserList }
}