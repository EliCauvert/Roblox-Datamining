local InExperienceDetailsPrompt = script:FindFirstAncestor("InExperienceDetailsPrompt")
local Parent = InExperienceDetailsPrompt.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Sheet = FoundationModule.Sheet
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local _ = require(Parent.DataHydration)
local InExperienceDetailsPromptErrorContentModule = require(InExperienceDetailsPrompt.Features.InExperienceDetailsPromptErrorContent)
local InExperienceDetailsPromptHeaderModule = require(InExperienceDetailsPrompt.Features.InExperienceDetailsPromptHeader)
local InExperienceDetailsPromptContentModule = require(InExperienceDetailsPrompt.Features.InExperienceDetailsPromptContent)
local InExperienceDetailsPromptActionsModule = require(InExperienceDetailsPrompt.Features.InExperienceDetailsPromptActions)
local FFlagLuaAppIedpOverlayAndNavigationFix = require(Parent.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix
local FFlagLuaAppIedpFixPlayButton = require(Parent.SharedFlags).FFlagLuaAppIedpFixPlayButton

local function sheetChildren(p1)
	-- upvalues: ReactModule (copy), Sheet (copy), InExperienceDetailsPromptErrorContentModule (copy), InExperienceDetailsPromptHeaderModule (copy), InExperienceDetailsPromptContentModule (copy), InExperienceDetailsPromptActionsModule (copy), FFlagLuaAppIedpFixPlayButton (copy)
	return if p1.errorType then {
		Content = ReactModule.createElement(Sheet.Content, nil, {
			ErrorContent = ReactModule.createElement(InExperienceDetailsPromptErrorContentModule, { errorType = p1.errorType })
		})
	} else {
		Header = ReactModule.createElement(InExperienceDetailsPromptHeaderModule, {
			name = p1.name,
			imageUri = p1.imageUri,
			creator = p1.creator
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			MainContent = ReactModule.createElement(InExperienceDetailsPromptContentModule, {
				ageRecommendation = p1.ageRecommendation,
				rating = p1.rating
			})
		}),
		Actions = ReactModule.createElement(InExperienceDetailsPromptActionsModule, {
			playability = p1.playability,
			onJoin = p1.onJoin,
			rootPlaceId = if FFlagLuaAppIedpFixPlayButton then p1.rootPlaceId else nil,
			playabilityRetrievalStatus = p1.playabilityRetrievalStatus
		})
	}
end

return function(p1)
	-- upvalues: UseScaledValueFunction (copy), ReactModule (copy), Sheet (copy), FFlagLuaAppIedpOverlayAndNavigationFix (copy), sheetChildren (copy)
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		ref = p1.focusRootRef,
		sheetRef = if FFlagLuaAppIedpOverlayAndNavigationFix then p1.sheetRef else nil,
		snapPoints = { (UseScaledValueFunction(260)) },
		onClose = p1.onClose
	}, (sheetChildren(p1)))
end