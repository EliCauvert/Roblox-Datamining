local parent = script:FindFirstAncestor("GameInvite").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local partialPageModal = require(parent.UIBlox).App.Dialog.Modal.PartialPageModal
local localizationService = game:GetService("LocalizationService")
local browserService = game:GetService("BrowserService")
local httpService = game:GetService("HttpService")
local getFStringReferralRewardsTermsURL = require(parent.SharedFlags).GetFStringReferralRewardsTermsURL
local enableRewardsWebViewOverlay = game:DefineFastFlag("EnableRewardsWebViewOverlay", false)

local _ = function() --[[ line: 27 ]]
	return workspace.CurrentCamera.ViewportSize
end

local var6 = function(p0) --[[ line: 32 ]]
	-- upvalues: localizationService (ref)
	if not p0 or p0 == "" then
		return ""
	end
	local var7 = DateTime and DateTime.fromIsoDate(p0) or nil
	
	if var7 then
		local robloxLocaleId = localizationService.RobloxLocaleId
		
		return `{var7:FormatLocalTime("LL", robloxLocaleId)} {var7:FormatLocalTime("LT", robloxLocaleId)}`
	end
	return ""
end

return function(p1) --[[ line: 46 ]]
	-- upvalues: reactModule (ref), foundationModule (ref), partialPageModal (ref), var6 (ref), enableRewardsWebViewOverlay (ref), httpService (ref), getFStringReferralRewardsTermsURL (ref), browserService (ref)
	return reactModule.createElement("ScreenGui", {
		DisplayOrder = 100,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		RewardsInfoModalContainer = reactModule.createElement(foundationModule.View, {
			tag = "size-full-full bg-over-media-100",
			onActivated = function() --[[ line: 55 ]]
				-- upvalues: p1 (ref)
				if p1.setModalOpen then
					p1.setModalOpen(false)
				end
			end
		}, {
			RewardsInfoModal = reactModule.createElement(partialPageModal, {
				title = p1.title,
				screenSize = workspace.CurrentCamera.ViewportSize,
				position = UDim2.new(0.5, 0, 0.5, 0),
				onCloseClicked = function() --[[ line: 65 ]]
					-- upvalues: p1 (ref)
					if p1.setModalOpen then
						p1.setModalOpen(false)
					end
				end
			}, {
				RewardsInfoModalContent = reactModule.createElement(foundationModule.View, {
					tag = "col size-full-0 auto-y gap-y-large padding-top-large",
					Size = UDim2.new(1, 0, 0, 180)
				}, {
					RewardsInfoModalTitle = reactModule.createElement(foundationModule.Text, {
						tag = "text-title-medium auto-xy text-align-x-left text-wrap",
						LayoutOrder = 0,
						Text = p1.rewardDetailsTitle
					}),
					RewardsInfoModalBody = reactModule.createElement(foundationModule.Text, {
						tag = "text-body-medium auto-xy text-align-x-left text-wrap padding-top-small",
						LayoutOrder = 1,
						Text = p1.rewardDetailsBody
					}),
					RewardsInfoModalLimitsTitle = reactModule.createElement(foundationModule.Text, {
						tag = "text-title-medium auto-xy text-align-x-left text-wrap padding-top-medium",
						LayoutOrder = 2,
						Text = p1.rewardLimitsTitle
					}),
					RewardInfoExpiresText = reactModule.createElement(foundationModule.Text, {
						tag = "text-body-medium auto-xy text-align-x-left text-wrap padding-top-small",
						LayoutOrder = 3,
						Text = p1.rewardsExpiresText .. " " .. var6(p1.expiryUtc)
					}),
					RewardsInfoModalLimitsBody = reactModule.createElement(foundationModule.Text, {
						tag = "text-body-medium auto-xy text-align-x-left text-wrap",
						LayoutOrder = 4,
						Text = p1.rewardLimitsBody
					}),
					RewardsInfoModalCreatorSupportText = reactModule.createElement(foundationModule.Text, {
						tag = "text-caption-medium auto-xy text-align-x-left text-wrap padding-top-xlarge",
						LayoutOrder = 5,
						Text = p1.rewardCreatorSupportText
					}),
					RewardsInfoModalTermsContainer = reactModule.createElement(foundationModule.View, {
						tag = "row grow auto-xy align-x-left padding-top-small",
						BackgroundTransparency = 1,
						LayoutOrder = 6,
						onActivated = function() --[[ line: 109 ]]
							-- upvalues: enableRewardsWebViewOverlay (copy), httpService (copy), getFStringReferralRewardsTermsURL (copy), p1 (ref), browserService (copy)
							browserService:SendCommand(if enableRewardsWebViewOverlay then httpService:JSONEncode({
								command = "open",
								visible = true,
								isGenericWebview = true,
								enableOverlayReplacement = true,
								url = getFStringReferralRewardsTermsURL(),
								title = p1.rewardsTerms
							}) else httpService:JSONEncode({
								command = "open",
								url = getFStringReferralRewardsTermsURL(),
								title = p1.rewardsTerms
							}))
						end
					}, {
						RewardsInfoModalTermsText = reactModule.createElement(foundationModule.Text, {
							tag = "text-label-small auto-xy text-align-x-left text-wrap",
							RichText = true,
							Text = `<u><b>{p1.rewardsTerms}</b></u>`
						})
					})
				})
			})
		})
	})
end