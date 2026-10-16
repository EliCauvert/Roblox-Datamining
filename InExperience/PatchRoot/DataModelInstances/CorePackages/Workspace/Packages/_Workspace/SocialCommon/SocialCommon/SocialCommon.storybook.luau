local SocialCommon = script:FindFirstAncestor("SocialCommon")
local Parent = SocialCommon.Parent
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoduxModule = require(Parent.Rodux)
local LocalizationModule = require(Parent.Localization)
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local LocalizationProvider = LocalizationModule.LocalizationProvider
local LocalizationRoactContext = LocalizationModule.LocalizationRoactContext
local CreateStyleProviderFunction = require(Parent.Dev.UnitTestHelpers).createStyleProvider
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local NewResult = RoduxModule.Store.new(function(p1) --[[ Line: 19 ]]
	return p1
end, { ScreenSize = Vector2.new(390, 844) }, { RoduxModule.thunkMiddleware })

local function _(p1) --[[ Line: 25 | Named "withTolerantLocalization" ]]
	-- upvalues: ReactModule (copy), LocalizationRoactContext (copy), LocalizationProvider (copy)
	return function(p2) --[[ Line: 26 ]]
		-- upvalues: ReactModule (upval), LocalizationRoactContext (upval), LocalizationProvider (upval), p1 (copy)
		local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
		
		return ReactModule.createElement(LocalizationProvider, {
			localization = ReactModule.useMemo(function() --[[ Line: 29 ]]
				-- upvalues: UseContextResult (copy)
				return (setmetatable({
					Format = function(_, p3, p4) --[[ Line: 31 ]]
						-- upvalues: UseContextResult (upval)
						local Success, Result = pcall(function() --[[ Line: 32 ]]
							-- upvalues: UseContextResult (upval), p3 (copy), p4 (copy)
							return UseContextResult:Format(p3, p4)
						end)
						
						return if Success then Result else `«{p3}»`
					end
				}, { __index = UseContextResult }))
			end, { UseContextResult })
		}, { Story = ReactModule.createElement(p1, p2) })
	end
end

return {
	name = "SocialCommon",
	storyRoots = { SocialCommon },
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1) --[[ Line: 48 ]]
		-- upvalues: ReactModule (copy), LocalizationRoactContext (copy), LocalizationProvider (copy), FoundationProvider (copy), RoactRoduxModule (copy), NewResult (copy), CreateStyleProviderFunction (copy), MockLocaleFunction (copy)
		local function v14(p2) --[[ Line: 26 ]]
			-- upvalues: ReactModule (upval), LocalizationRoactContext (upval), LocalizationProvider (upval), p1 (copy)
			local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
			
			return ReactModule.createElement(LocalizationProvider, {
				localization = ReactModule.useMemo(function() --[[ Line: 29 ]]
					-- upvalues: UseContextResult (copy)
					return (setmetatable({
						Format = function(_, p3, p4) --[[ Line: 31 ]]
							-- upvalues: UseContextResult (upval)
							local Success, Result = pcall(function() --[[ Line: 32 ]]
								-- upvalues: UseContextResult (upval), p3 (copy), p4 (copy)
								return UseContextResult:Format(p3, p4)
							end)
							
							return if Success then Result else `«{p3}»`
						end
					}, { __index = UseContextResult }))
				end, { UseContextResult })
			}, { Story = ReactModule.createElement(p1, p2) })
		end
		
		return function(p2) --[[ Line: 51 ]]
			-- upvalues: ReactModule (upval), FoundationProvider (upval), RoactRoduxModule (upval), NewResult (upval), CreateStyleProviderFunction (upval), MockLocaleFunction (upval), v14 (copy)
			return ReactModule.createElement(FoundationProvider, {
				device = "Phone",
				colorMode = if p2 and p2.theme == "Light" then "Light" else "Dark"
			}, {
				Store = ReactModule.createElement(RoactRoduxModule.StoreProvider, { store = NewResult }, {
					Style = CreateStyleProviderFunction({ Localization = MockLocaleFunction(v14, p2) })
				})
			})
		end
	end
}