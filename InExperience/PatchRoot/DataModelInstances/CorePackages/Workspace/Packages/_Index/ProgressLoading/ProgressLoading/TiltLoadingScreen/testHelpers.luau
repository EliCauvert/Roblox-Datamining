local parent = script:FindFirstAncestor("ProgressLoading").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local inExperienceLocalesModule = require(parent.InExperienceLocales)
local localizationService = game:GetService("LocalizationService")

return {
	makeAnimationBindings = function() --[[ line: 11 ]]
		-- upvalues: reactModule (ref)
		return {
			keyart = {
				rotation = reactModule.createBinding(15),
				sizeScale = reactModule.createBinding(1),
				coverTransparency = reactModule.createBinding(1)
			},
			frame = {
				rotation = reactModule.createBinding(-15),
				sizeScale = reactModule.createBinding(1),
				groupTransparency = reactModule.createBinding(0)
			},
			title = {
				reveal = reactModule.createBinding(1),
				slide = reactModule.createBinding(UDim.new(0, 0))
			},
			creator = {
				reveal = reactModule.createBinding(1),
				slide = reactModule.createBinding(UDim.new(0, 0))
			},
			verified = { reveal = reactModule.createBinding(1) }
		}
	end,
	makeStatusPanelProps = function(p0) --[[ line: 37 ]]
		local t = {
			status = "",
			statusText = "",
			queuePosition = nil,
			queueTreatment = nil,
			followUserId = 0,
			isSubjectToChinaPolicies = false,
			onAutoJoinNewServer = function() --[[ line: 45 ]] end,
			onJoinNewServer = function() --[[ line: 46 ]] end,
			onJoinTheLine = function() --[[ line: 47 ]] end,
			onShowConnectionHealth = function() --[[ line: 48 ]] end
		}
		
		if p0 then
			for i, v in p0 do
				t[i] = v
			end
		end
		return t
	end,
	renderWithFoundation = function(p1, p2) --[[ line: 58 ]]
		-- upvalues: reactModule (ref), foundationModule (ref), localizationModule (ref), inExperienceLocalesModule (ref), localizationService (ref)
		return p1(reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			Localization = reactModule.createElement(localizationModule.LocalizationProvider, {
				localization = inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
			}, { Subject = p2 })
		}))
	end
}