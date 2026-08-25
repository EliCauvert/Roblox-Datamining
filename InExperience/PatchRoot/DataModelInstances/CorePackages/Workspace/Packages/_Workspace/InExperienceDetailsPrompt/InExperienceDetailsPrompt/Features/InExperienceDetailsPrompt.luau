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

local function sheetChildren(p0)
	-- upvalues: reactModule (ref), sheet (ref), inExperienceDetailsPromptErrorContentModule (ref), inExperienceDetailsPromptHeaderModule (ref), inExperienceDetailsPromptContentModule (ref), inExperienceDetailsPromptActionsModule (ref), fFlagLuaAppIedpFixPlayButton (ref)
	return if p0.errorType then {
		Content = reactModule.createElement(sheet.Content, nil, {
			ErrorContent = reactModule.createElement(inExperienceDetailsPromptErrorContentModule, { errorType = p0.errorType })
		})
	} else {
		Header = reactModule.createElement(inExperienceDetailsPromptHeaderModule, {
			name = p0.name,
			imageUri = p0.imageUri,
			creator = p0.creator
		}),
		Content = reactModule.createElement(sheet.Content, nil, {
			MainContent = reactModule.createElement(inExperienceDetailsPromptContentModule, {
				ageRecommendation = p0.ageRecommendation,
				rating = p0.rating
			})
		}),
		Actions = reactModule.createElement(inExperienceDetailsPromptActionsModule, {
			playability = p0.playability,
			onJoin = p0.onJoin,
			rootPlaceId = if fFlagLuaAppIedpFixPlayButton then p0.rootPlaceId else nil,
			playabilityRetrievalStatus = p0.playabilityRetrievalStatus
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