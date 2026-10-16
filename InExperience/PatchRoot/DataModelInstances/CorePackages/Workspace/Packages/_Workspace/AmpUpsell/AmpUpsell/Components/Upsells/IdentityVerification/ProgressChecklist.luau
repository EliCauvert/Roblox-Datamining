local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local ProgressTileModule = require(script.Parent.ProgressTile)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local IDVStep = require(AmpUpsell.Common.Enums).IDVStep

return function(p1) --[[ Line: 15 | Named "ProgressChecklist" ]]
	-- upvalues: UseLocalizationFunction (copy), IDVStep (copy), ReactModule (copy), ProgressTileModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		connectedMobile = "Verification.Identity.Label.ConnectingToMobile",
		verifyingYou = "Verification.Identity.Label.VerifyingYou",
		waitingForResults = "Verification.Identity.Label.VerificationWaitingForResults",
		updatingRbxProfile = "Verification.Identity.Label.UpdatingRoblox"
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, p1.entryHeight * 4),
		LayoutOrder = p1.layoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		MobileCheck = ReactModule.createElement(ProgressTileModule, {
			layoutOrder = 1,
			frameHeight = p1.entryHeight,
			finished = IDVStep.ConnectedMobile <= p1.latestStepCompleted,
			progressText = UseLocalizationResult.connectedMobile
		}),
		VerifiedCheck = ReactModule.createElement(ProgressTileModule, {
			layoutOrder = 2,
			frameHeight = p1.entryHeight,
			finished = IDVStep.Verified <= p1.latestStepCompleted,
			progressText = UseLocalizationResult.verifyingYou
		}),
		GotResultsCheck = ReactModule.createElement(ProgressTileModule, {
			layoutOrder = 3,
			frameHeight = p1.entryHeight,
			finished = IDVStep.GotResults <= p1.latestStepCompleted,
			progressText = UseLocalizationResult.waitingForResults
		}),
		UpdateProfileCheck = ReactModule.createElement(ProgressTileModule, {
			layoutOrder = 4,
			frameHeight = p1.entryHeight,
			finished = IDVStep.UpdatedRobloxProfile <= p1.latestStepCompleted,
			progressText = UseLocalizationResult.updatingRbxProfile
		})
	})
end