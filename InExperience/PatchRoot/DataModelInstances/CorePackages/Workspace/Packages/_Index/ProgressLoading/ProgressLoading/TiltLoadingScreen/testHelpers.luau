local Parent = script:FindFirstAncestor("ProgressLoading").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local InExperienceLocalesModule = require(Parent.InExperienceLocales)
local LocalizationService = game:GetService("LocalizationService")

return {
	makeAnimationBindings = function() --[[ Line: 11 ]]
		-- upvalues: ReactModule (copy)
		return {
			keyart = {
				rotation = ReactModule.createBinding(15),
				sizeScale = ReactModule.createBinding(1),
				coverTransparency = ReactModule.createBinding(1)
			},
			frame = {
				rotation = ReactModule.createBinding(-15),
				sizeScale = ReactModule.createBinding(1),
				groupTransparency = ReactModule.createBinding(0)
			},
			title = {
				reveal = ReactModule.createBinding(1),
				slide = ReactModule.createBinding(UDim.new(0, 0))
			},
			creator = {
				reveal = ReactModule.createBinding(1),
				slide = ReactModule.createBinding(UDim.new(0, 0))
			},
			verified = { reveal = ReactModule.createBinding(1) }
		}
	end,
	makeStatusPanelProps = function(List) --[[ Line: 37 ]]
		local config = {
			status = "",
			statusText = "",
			queuePosition = nil,
			queueTreatment = nil,
			followUserId = 0,
			isSubjectToChinaPolicies = false,
			onAutoJoinNewServer = function() --[[ Line: 45 ]] end,
			onJoinNewServer = function() --[[ Line: 46 ]] end,
			onJoinTheLine = function() --[[ Line: 47 ]] end,
			onShowConnectionHealth = function() --[[ Line: 48 ]] end
		}
		
		if List then
			for i, value in List do
				config[i] = value
			end
		end
		return config
	end,
	renderWithFoundation = function(Callback, Subject) --[[ Line: 58 ]]
		-- upvalues: ReactModule (copy), FoundationModule (copy), LocalizationModule (copy), InExperienceLocalesModule (copy), LocalizationService (copy)
		return Callback(ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			Localization = ReactModule.createElement(LocalizationModule.LocalizationProvider, {
				localization = InExperienceLocalesModule.Localization.new(LocalizationService.RobloxLocaleId)
			}, { Subject = Subject })
		}))
	end
}