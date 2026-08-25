local parent = script:FindFirstAncestor("ProgressLoading").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local inExperienceLocalesModule = require(parent.InExperienceLocales)
local localizationService = game:GetService("LocalizationService")

return {
	makeAnimationBindings = function()
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
	makeStatusPanelProps = function(p0)
		local t = {
			status = "",
			statusText = "",
			queuePosition = nil,
			queueTreatment = nil,
			followUserId = 0,
			isSubjectToChinaPolicies = false,
			onAutoJoinNewServer = function() end,
			onJoinNewServer = function() end,
			onJoinTheLine = function() end,
			onShowConnectionHealth = function() end
		}
		
		if p0 then
			for i, v in p0 do
				t[i] = v
			end
		end
		return t
	end,
	renderWithFoundation = function(p1, p2)
		-- upvalues: reactModule (ref), foundationModule (ref), localizationModule (ref), inExperienceLocalesModule (ref), localizationService (ref)
		return p1(reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			Localization = reactModule.createElement(localizationModule.LocalizationProvider, {
				localization = inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
			}, { Subject = p2 })
		}))
	end
}