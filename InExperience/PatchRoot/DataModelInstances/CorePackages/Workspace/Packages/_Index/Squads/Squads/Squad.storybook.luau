local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local MockLocaleFunction = require(Parent.Dev.SocialTestHelpers).StoryHelpers.mockLocale
local DependenciesModule = require(Squads.dependencies)
local Cryo = DependenciesModule.Cryo
local Foundation = DependenciesModule.Foundation
local Roact = DependenciesModule.Roact
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
Roact.setGlobalConfig({ propValidation = true, elementTracing = true })
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local config1 = { language = "en-us" }

local function useCreateOverlay(p1) --[[ Line: 44 ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(Instance.new("Frame"))
	
	if UseRefResult.current.Parent ~= p1.focus then
		UseRefResult.current.Parent = p1.focus
	end
	ReactModule.useEffect(function() --[[ Line: 52 ]]
		-- upvalues: UseRefResult (copy)
		UseRefResult.current.Size = UDim2.fromScale(1, 1)
		UseRefResult.current.BackgroundTransparency = 1
		
		return function() --[[ Line: 56 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current:Destroy()
		end
	end, {})
	
	return UseRefResult.current
end

return {
	name = "Squads",
	storyRoot = Squads,
	roact = Roact,
	mapDefinition = function(p1) --[[ Line: 68 ]]
		-- upvalues: Cryo (copy), config1 (copy)
		return Cryo.Dictionary.join(p1, {
			controls = Cryo.Dictionary.join(config1, p1.controls or {})
		})
	end,
	mapStory = function(p1) --[[ Line: 72 ]]
		-- upvalues: useCreateOverlay (copy), config (copy), Roact (copy), Foundation (copy), AppStyleProvider (copy), MockLocaleFunction (copy)
		return function(p2) --[[ Line: 73 ]]
			-- upvalues: useCreateOverlay (upval), config (upval), Roact (upval), Foundation (upval), AppStyleProvider (upval), MockLocaleFunction (upval), p1 (copy)
			local Entry = p2 and config[p2.theme] or config.Default
			
			return Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				Roact.createElement(Foundation.FoundationProvider, {
					device = "Desktop",
					colorMode = Entry.themeName,
					overlayGui = useCreateOverlay(p2)
				}, {
					Roact.createElement(AppStyleProvider, { style = Entry }, { Child = MockLocaleFunction(p1, p2) })
				})
			})
		end
	end
}