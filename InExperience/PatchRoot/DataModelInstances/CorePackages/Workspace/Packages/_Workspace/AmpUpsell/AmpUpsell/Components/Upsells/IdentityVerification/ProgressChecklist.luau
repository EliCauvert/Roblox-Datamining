local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local progressTileModule = require(script.Parent.ProgressTile)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local IDVStep = require(ampUpsell.Common.Enums).IDVStep

return function(p1)
	-- upvalues: useLocalization (ref), IDVStep (ref), reactModule (ref), progressTileModule (ref)
	local var1 = useLocalization({
		connectedMobile = "Verification.Identity.Label.ConnectingToMobile",
		verifyingYou = "Verification.Identity.Label.VerifyingYou",
		waitingForResults = "Verification.Identity.Label.VerificationWaitingForResults",
		updatingRbxProfile = "Verification.Identity.Label.UpdatingRoblox"
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, p1.entryHeight * 4),
		LayoutOrder = p1.layoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		MobileCheck = reactModule.createElement(progressTileModule, {
			layoutOrder = 1,
			frameHeight = p1.entryHeight,
			finished = IDVStep.ConnectedMobile <= p1.latestStepCompleted,
			progressText = var1.connectedMobile
		}),
		VerifiedCheck = reactModule.createElement(progressTileModule, {
			layoutOrder = 2,
			frameHeight = p1.entryHeight,
			finished = IDVStep.Verified <= p1.latestStepCompleted,
			progressText = var1.verifyingYou
		}),
		GotResultsCheck = reactModule.createElement(progressTileModule, {
			layoutOrder = 3,
			frameHeight = p1.entryHeight,
			finished = IDVStep.GotResults <= p1.latestStepCompleted,
			progressText = var1.waitingForResults
		}),
		UpdateProfileCheck = reactModule.createElement(progressTileModule, {
			layoutOrder = 4,
			frameHeight = p1.entryHeight,
			finished = IDVStep.UpdatedRobloxProfile <= p1.latestStepCompleted,
			progressText = var1.updatingRbxProfile
		})
	})
end