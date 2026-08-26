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
local var1 = roduxModule.Store.new(function(p1)
	return p1
end, { ScreenSize = Vector2.new(390, 844) }, { roduxModule.thunkMiddleware })

local function _(p1)
	-- upvalues: reactModule (ref), localizationRoactContext (ref), localizationProvider (ref)
	return function(p2)
		-- upvalues: reactModule (copy), localizationRoactContext (copy), localizationProvider (copy), p1 (ref)
		local var2 = reactModule.useContext(localizationRoactContext)
		
		return reactModule.createElement(localizationProvider, {
			localization = reactModule.useMemo(function()
				-- upvalues: var2 (ref)
				return setmetatable({
					Format = function(_, p3, p4)
						-- upvalues: var2 (copy)
						local ok, status = pcall(function()
							-- upvalues: var2 (copy), p3 (ref), p4 (ref)
							return var2:Format(p3, p4)
						end)
						
						return if ok then status else `\194\171{p3}\194\187`
					end
				}, { __index = var2 })
			end, { var2 })
		}, { Story = reactModule.createElement(p1, p2) })
	end
end

return {
	name = "SocialCommon",
	storyRoots = { socialCommon },
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), localizationRoactContext (ref), localizationProvider (ref), foundationProvider (ref), roactRoduxModule (ref), var1 (ref), createStyleProvider (ref), mockLocale (ref)
		local var2 = function(p2)
			-- upvalues: reactModule (copy), localizationRoactContext (copy), localizationProvider (copy), p1 (ref)
			local var3 = reactModule.useContext(localizationRoactContext)
			
			return reactModule.createElement(localizationProvider, {
				localization = reactModule.useMemo(function()
					-- upvalues: var3 (ref)
					return setmetatable({
						Format = function(_, p3, p4)
							-- upvalues: var3 (copy)
							local ok, status = pcall(function()
								-- upvalues: var3 (copy), p3 (ref), p4 (ref)
								return var3:Format(p3, p4)
							end)
							
							return if ok then status else `\194\171{p3}\194\187`
						end
					}, { __index = var3 })
				end, { var3 })
			}, { Story = reactModule.createElement(p1, p2) })
		end
		
		return function(p2)
			-- upvalues: reactModule (copy), foundationProvider (copy), roactRoduxModule (copy), var1 (copy), createStyleProvider (copy), mockLocale (copy), var2 (ref)
			return reactModule.createElement(foundationProvider, {
				device = "Phone",
				colorMode = if p2 and p2.theme == "Light" then "Light" else "Dark"
			}, {
				Store = reactModule.createElement(roactRoduxModule.StoreProvider, { store = var1 }, {
					Style = createStyleProvider({ Localization = mockLocale(var2, p2) })
				})
			})
		end
	end
}