local Parent = script:FindFirstAncestor("SocialCarousel").Parent
local ReactModule = require(Parent.React)
local UniversalAppPolicy = require(Parent.UniversalAppPolicy).UniversalAppPolicy
local CryoModule = require(Parent.Cryo)
local CreateTreeWithProvidersFunction = require(Parent.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders

local function MockProvider(p1)
	-- upvalues: ReactModule (copy), UniversalAppPolicy (copy)
	return ReactModule.createElement(UniversalAppPolicy.Provider, {
		policy = {
			function()
				return {
					useGridPageLayout = function(): boolean
						return true
					end,
					getCanUsePlatformChat = function(): boolean
						return false
					end
				}
			end
		}
	}, p1)
end

local NewResult = require(Parent.Rodux).Store.new(function(_, _)
	return {
		ScreenSize = Vector2.new(600, 300),
		TopBar = { topBarHeight = 0 },
		GlobalGuiInset = { left = 0, top = 0, right = 0, bottom = 0 }
	}
end)

return function(p1, p2)
	-- upvalues: CreateTreeWithProvidersFunction (copy), CryoModule (copy), MockProvider (copy), NewResult (copy)
	return CreateTreeWithProvidersFunction(p1, CryoModule.Dictionary.join(p2, {
		includeFoundationProvider = true,
		mockProvider = MockProvider,
		store = NewResult
	}))
end