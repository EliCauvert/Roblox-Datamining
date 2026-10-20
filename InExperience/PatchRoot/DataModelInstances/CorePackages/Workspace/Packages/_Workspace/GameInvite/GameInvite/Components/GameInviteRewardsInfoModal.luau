local Parent = script:FindFirstAncestor("GameInvite").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local PartialPageModal = require(Parent.UIBlox).App.Dialog.Modal.PartialPageModal
local LocalizationService = game:GetService("LocalizationService")
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local GetFStringReferralRewardsTermsURLFunction = require(Parent.SharedFlags).GetFStringReferralRewardsTermsURL
local EnableRewardsWebViewOverlay = game:DefineFastFlag("EnableRewardsWebViewOverlay", false)

local function _()
	return workspace.CurrentCamera.ViewportSize
end

local function v9(ExpiryUtc): string
	-- upvalues: LocalizationService (copy)
	if not ExpiryUtc or ExpiryUtc == "" then
		return ""
	end
	local _DateTime = DateTime and DateTime.fromIsoDate(ExpiryUtc) or nil
	
	if _DateTime then
		local RobloxLocaleId = LocalizationService.RobloxLocaleId
		
		return `{_DateTime:FormatLocalTime("LL", RobloxLocaleId)} {_DateTime:FormatLocalTime("LT", RobloxLocaleId)}`
	else
		return ""
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), PartialPageModal (copy), v9 (copy), EnableRewardsWebViewOverlay (copy), HttpService (copy), GetFStringReferralRewardsTermsURLFunction (copy), BrowserService (copy)
	return ReactModule.createElement("ScreenGui", {
		DisplayOrder = 100,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		RewardsInfoModalContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-full bg-over-media-100",
			onActivated = function()
				-- upvalues: p1 (copy)
				if p1.setModalOpen then
					p1.setModalOpen(false)
				end
			end
		}, {
			RewardsInfoModal = ReactModule.createElement(PartialPageModal, {
				title = p1.title,
				screenSize = workspace.CurrentCamera.ViewportSize,
				position = UDim2.new(0.5, 0, 0.5, 0),
				onCloseClicked = function()
					-- upvalues: p1 (copy)
					if p1.setModalOpen then
						p1.setModalOpen(false)
					end
				end
			}, {
				RewardsInfoModalContent = ReactModule.createElement(FoundationModule.View, {
					tag = "col size-full-0 auto-y gap-y-large padding-top-large",
					Size = UDim2.new(1, 0, 0, 180)
				}, {
					RewardsInfoModalTitle = ReactModule.createElement(FoundationModule.Text, {
						tag = "text-title-medium auto-xy text-align-x-left text-wrap",
						LayoutOrder = 0,
						Text = p1.rewardDetailsTitle
					}),
					RewardsInfoModalBody = ReactModule.createElement(FoundationModule.Text, {
						tag = "text-body-medium auto-xy text-align-x-left text-wrap padding-top-small",
						LayoutOrder = 1,
						Text = p1.rewardDetailsBody
					}),
					RewardsInfoModalLimitsTitle = ReactModule.createElement(FoundationModule.Text, {
						tag = "text-title-medium auto-xy text-align-x-left text-wrap padding-top-medium",
						LayoutOrder = 2,
						Text = p1.rewardLimitsTitle
					}),
					RewardInfoExpiresText = ReactModule.createElement(FoundationModule.Text, {
						tag = "text-body-medium auto-xy text-align-x-left text-wrap padding-top-small",
						LayoutOrder = 3,
						Text = p1.rewardsExpiresText .. " " .. v9(p1.expiryUtc)
					}),
					RewardsInfoModalLimitsBody = ReactModule.createElement(FoundationModule.Text, {
						tag = "text-body-medium auto-xy text-align-x-left text-wrap",
						LayoutOrder = 4,
						Text = p1.rewardLimitsBody
					}),
					RewardsInfoModalCreatorSupportText = ReactModule.createElement(FoundationModule.Text, {
						tag = "text-caption-medium auto-xy text-align-x-left text-wrap padding-top-xlarge",
						LayoutOrder = 5,
						Text = p1.rewardCreatorSupportText
					}),
					RewardsInfoModalTermsContainer = ReactModule.createElement(FoundationModule.View, {
						tag = "row grow auto-xy align-x-left padding-top-small",
						BackgroundTransparency = 1,
						LayoutOrder = 6,
						onActivated = function()
							-- upvalues: EnableRewardsWebViewOverlay (upval), HttpService (upval), GetFStringReferralRewardsTermsURLFunction (upval), p1 (copy), BrowserService (upval)
							BrowserService:SendCommand(if EnableRewardsWebViewOverlay then HttpService:JSONEncode({
								command = "open",
								visible = true,
								isGenericWebview = true,
								enableOverlayReplacement = true,
								url = GetFStringReferralRewardsTermsURLFunction(),
								title = p1.rewardsTerms
							}) else HttpService:JSONEncode({
								command = "open",
								url = GetFStringReferralRewardsTermsURLFunction(),
								title = p1.rewardsTerms
							}))
						end
					}, {
						RewardsInfoModalTermsText = ReactModule.createElement(FoundationModule.Text, {
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