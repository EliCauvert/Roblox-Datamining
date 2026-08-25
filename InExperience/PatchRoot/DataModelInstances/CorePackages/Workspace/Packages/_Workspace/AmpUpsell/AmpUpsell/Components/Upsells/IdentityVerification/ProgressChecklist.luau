local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local progressTileModule = require(script.Parent.ProgressTile)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local IDVStep = require(ampUpsell.Common.Enums).IDVStep

return function(p0)
	-- upvalues: useLocalization (ref), IDVStep (ref), reactModule (ref), progressTileModule (ref)
	local var3 = useLocalization({
		connectedMobile = "Verification.Identity.Label.ConnectingToMobile",
		verifyingYou = "Verification.Identity.Label.VerifyingYou",
		waitingForResults = "Verification.Identity.Label.VerificationWaitingForResults",
		updatingRbxProfile = "Verification.Identity.Label.UpdatingRoblox"
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, p0.entryHeight * 4),
		LayoutOrder = p0.layoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		MobileCheck = reactModule.createElement(progressTileModule, {
			layoutOrder = 1,
			frameHeight = p0.entryHeight,
			finished = IDVStep.ConnectedMobile <= p0.latestStepCompleted,
			progressText = var3.connectedMobile
		}),
		VerifiedCheck = reactModule.createElement(progressTileModule, {
			layoutOrder = 2,
			frameHeight = p0.entryHeight,
			finished = IDVStep.Verified <= p0.latestStepCompleted,
			progressText = var3.verifyingYou
		}),
		GotResultsCheck = reactModule.createElement(progressTileModule, {
			layoutOrder = 3,
			frameHeight = p0.entryHeight,
			finished = IDVStep.GotResults <= p0.latestStepCompleted,
			progressText = var3.waitingForResults
		}),
		UpdateProfileCheck = reactModule.createElement(progressTileModule, {
			layoutOrder = 4,
			frameHeight = p0.entryHeight,
			finished = IDVStep.UpdatedRobloxProfile <= p0.latestStepCompleted,
			progressText = var3.updatingRbxProfile
		})
	})
end