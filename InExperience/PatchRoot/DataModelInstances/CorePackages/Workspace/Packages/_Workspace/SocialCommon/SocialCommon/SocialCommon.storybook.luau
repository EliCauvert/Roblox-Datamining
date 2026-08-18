local socialCommon = script:FindFirstAncestor("SocialCommon")
local parent = socialCommon.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local roactRoduxModule = require(parent.RoactRodux)
local roduxModule = require(parent.Rodux)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local unitTestHelpersModule = require(parent.Dev.UnitTestHelpers)
local socialTestHelpersModule = require(parent.Dev.SocialTestHelpers)
local foundationProvider = foundationModule.FoundationProvider
local localizationProvider = localizationModule.LocalizationProvider
local localizationRoactContext = localizationModule.LocalizationRoactContext
local createStyleProvider = unitTestHelpersModule.createStyleProvider
local mockLocale = socialTestHelpersModule.StoryHelpers.mockLocale
local var9 = roduxModule.Store.new(function(p0) --[[ line: 19 ]]
	return p0
end, { ScreenSize = Vector2.new(390, 844) }, { roduxModule.thunkMiddleware })

local function _(p1) --[[ line: 25 | named "withTolerantLocalization" ]]
	-- upvalues: reactModule (ref), localizationRoactContext (ref), localizationProvider (ref)
	return function(p2) --[[ line: 26 ]]
		-- upvalues: reactModule (copy), localizationRoactContext (copy), localizationProvider (copy), p1 (ref)
		local var10 = reactModule.useContext(localizationRoactContext)
		
		return reactModule.createElement(localizationProvider, {
			localization = reactModule.useMemo(function() --[[ line: 29 ]]
				-- upvalues: var10 (ref)
				return setmetatable({
					Format = function(_, p3, p4) --[[ line: 31 ]]
						-- upvalues: var10 (copy)
						local ok, status = pcall(function() --[[ line: 32 ]]
							-- upvalues: var10 (copy), p3 (ref), p4 (ref)
							return var10:Format(p3, p4)
						end)
						
						return if ok then status else `\194\171{p3}\194\187`
					end
				}, { __index = var10 })
			end, { var10 })
		}, { Story = reactModule.createElement(p1, p2) })
	end
end

return {
	name = "SocialCommon",
	storyRoots = { socialCommon },
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p5) --[[ line: 48 ]]
		-- upvalues: reactModule (ref), localizationRoactContext (ref), localizationProvider (ref), foundationProvider (ref), roactRoduxModule (ref), var9 (ref), createStyleProvider (ref), mockLocale (ref)
		local var11 = function(p6) --[[ line: 26 ]]
			-- upvalues: reactModule (copy), localizationRoactContext (copy), localizationProvider (copy), p5 (ref)
			local var10 = reactModule.useContext(localizationRoactContext)
			
			return reactModule.createElement(localizationProvider, {
				localization = reactModule.useMemo(function() --[[ line: 29 ]]
					-- upvalues: var10 (ref)
					return setmetatable({
						Format = function(_, p7, p8) --[[ line: 31 ]]
							-- upvalues: var10 (copy)
							local ok, status = pcall(function() --[[ line: 32 ]]
								-- upvalues: var10 (copy), p7 (ref), p8 (ref)
								return var10:Format(p7, p8)
							end)
							
							return if ok then status else `\194\171{p7}\194\187`
						end
					}, { __index = var10 })
				end, { var10 })
			}, { Story = reactModule.createElement(p5, p6) })
		end
		
		return function(p9) --[[ line: 51 ]]
			-- upvalues: reactModule (copy), foundationProvider (copy), roactRoduxModule (copy), var9 (copy), createStyleProvider (copy), mockLocale (copy), var11 (ref)
			return reactModule.createElement(foundationProvider, {
				device = "Phone",
				colorMode = if p9 and p9.theme == "Light" then "Light" else "Dark"
			}, {
				Store = reactModule.createElement(roactRoduxModule.StoreProvider, { store = var9 }, {
					Style = createStyleProvider({ Localization = mockLocale(var11, p9) })
				})
			})
		end
	end
}