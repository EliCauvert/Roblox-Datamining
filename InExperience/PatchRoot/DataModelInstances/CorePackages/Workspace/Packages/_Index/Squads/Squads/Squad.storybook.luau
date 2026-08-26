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

local function useCreateOverlay(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(Instance.new("Frame"))
	
	if var1.current.Parent ~= p1.focus then
		var1.current.Parent = p1.focus
	end
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		var1.current.Size = UDim2.fromScale(1, 1)
		var1.current.BackgroundTransparency = 1
		
		return function()
			-- upvalues: var1 (copy)
			var1.current:Destroy()
		end
	end, {})
	
	return var1.current
end

return {
	name = "Squads",
	storyRoot = squads,
	roact = roact,
	mapDefinition = function(p1)
		-- upvalues: cryo (ref), t_1 (ref)
		return cryo.Dictionary.join(p1, { controls = cryo.Dictionary.join(t_1, p1.controls or {}) })
	end,
	mapStory = function(p1)
		-- upvalues: useCreateOverlay (ref), t (ref), roact (ref), foundation (ref), appStyleProvider (ref), mockLocale (ref)
		return function(p2)
			-- upvalues: useCreateOverlay (copy), t (copy), roact (copy), foundation (copy), appStyleProvider (copy), mockLocale (copy), p1 (ref)
			local var1 = if p2 then t[p2.theme] else t.Default
			
			return roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				roact.createElement(foundation.FoundationProvider, {
					device = "Desktop",
					colorMode = var1.themeName,
					overlayGui = useCreateOverlay(p2)
				}, {
					roact.createElement(appStyleProvider, { style = var1 }, { Child = mockLocale(p1, p2) })
				})
			})
		end
	end
}