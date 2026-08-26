local inExperienceDetailsPrompt = script:FindFirstAncestor("InExperienceDetailsPrompt")
local parent = inExperienceDetailsPrompt.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local sheet = foundationModule.Sheet
local useScaledValue = foundationModule.Hooks.useScaledValue
local _ = require(parent.DataHydration)
local inExperienceDetailsPromptErrorContentModule = require(inExperienceDetailsPrompt.Features.InExperienceDetailsPromptErrorContent)
local inExperienceDetailsPromptHeaderModule = require(inExperienceDetailsPrompt.Features.InExperienceDetailsPromptHeader)
local inExperienceDetailsPromptContentModule = require(inExperienceDetailsPrompt.Features.InExperienceDetailsPromptContent)
local inExperienceDetailsPromptActionsModule = require(inExperienceDetailsPrompt.Features.InExperienceDetailsPromptActions)
local fFlagLuaAppIedpOverlayAndNavigationFix = require(parent.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix
local fFlagLuaAppIedpFixPlayButton = require(parent.SharedFlags).FFlagLuaAppIedpFixPlayButton

local function sheetChildren(p1)
	-- upvalues: reactModule (ref), sheet (ref), inExperienceDetailsPromptErrorContentModule (ref), inExperienceDetailsPromptHeaderModule (ref), inExperienceDetailsPromptContentModule (ref), inExperienceDetailsPromptActionsModule (ref), fFlagLuaAppIedpFixPlayButton (ref)
	return if p1.errorType then {
		Content = reactModule.createElement(sheet.Content, nil, {
			ErrorContent = reactModule.createElement(inExperienceDetailsPromptErrorContentModule, { errorType = p1.errorType })
		})
	} else {
		Header = reactModule.createElement(inExperienceDetailsPromptHeaderModule, {
			name = p1.name,
			imageUri = p1.imageUri,
			creator = p1.creator
		}),
		Content = reactModule.createElement(sheet.Content, nil, {
			MainContent = reactModule.createElement(inExperienceDetailsPromptContentModule, {
				ageRecommendation = p1.ageRecommendation,
				rating = p1.rating
			})
		}),
		Actions = reactModule.createElement(inExperienceDetailsPromptActionsModule, {
			playability = p1.playability,
			onJoin = p1.onJoin,
			rootPlaceId = if fFlagLuaAppIedpFixPlayButton then p1.rootPlaceId else nil,
			playabilityRetrievalStatus = p1.playabilityRetrievalStatus
		})
	}
end

return function(p1)
	-- upvalues: useScaledValue (ref), reactModule (ref), sheet (ref), fFlagLuaAppIedpOverlayAndNavigationFix (ref), sheetChildren (ref)
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		ref = p1.focusRootRef,
		sheetRef = if fFlagLuaAppIedpOverlayAndNavigationFix then p1.sheetRef else nil,
		snapPoints = { useScaledValue(260) },
		onClose = p1.onClose
	}, sheetChildren(p1))
end