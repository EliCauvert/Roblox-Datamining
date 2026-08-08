local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local mockLocale = require(parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local dependenciesModule = require(squads.dependencies)
local cryo = dependenciesModule.Cryo
local foundation = dependenciesModule.Foundation
local roact = dependenciesModule.Roact
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
roact.setGlobalConfig({ propValidation = true, elementTracing = true })
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local t_1 = { language = "en-us" }

local function useCreateOverlay(p0) --[[ line: 44 ]]
	-- upvalues: reactModule (ref)
	local var7 = reactModule.useRef(Instance.new("Frame"))
	
	if var7.current.Parent ~= p0.focus then
		var7.current.Parent = p0.focus
	end
	reactModule.useEffect(function() --[[ line: 52 ]]
		-- upvalues: var7 (ref)
		var7.current.Size = UDim2.fromScale(1, 1)
		var7.current.BackgroundTransparency = 1
		
		return function() --[[ line: 56 ]]
			-- upvalues: var7 (copy)
			var7.current:Destroy()
		end
	end, {})
	
	return var7.current
end

return {
	name = "Squads",
	storyRoot = squads,
	roact = roact,
	mapDefinition = function(p1) --[[ line: 68 ]]
		-- upvalues: cryo (ref), t_1 (ref)
		return cryo.Dictionary.join(p1, { controls = cryo.Dictionary.join(t_1, p1.controls or {}) })
	end,
	mapStory = function(p2) --[[ line: 72 ]]
		-- upvalues: useCreateOverlay (ref), t (ref), roact (ref), foundation (ref), appStyleProvider (ref), mockLocale (ref)
		return function(p3) --[[ line: 73 ]]
			-- upvalues: useCreateOverlay (copy), t (copy), roact (copy), foundation (copy), appStyleProvider (copy), mockLocale (copy), p2 (ref)
			local var8 = if p3 then t[p3.theme] else t.Default
			
			return roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				roact.createElement(foundation.FoundationProvider, {
					device = "Desktop",
					colorMode = var8.themeName,
					overlayGui = useCreateOverlay(p3)
				}, {
					roact.createElement(appStyleProvider, { style = var8 }, { Child = mockLocale(p2, p3) })
				})
			})
		end
	end
}