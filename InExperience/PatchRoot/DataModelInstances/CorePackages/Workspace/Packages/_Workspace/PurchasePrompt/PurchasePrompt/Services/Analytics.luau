local parent = script.Parent.Parent
local playersService = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local marketplaceService = game:GetService("MarketplaceService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local _ = require(parent.Utils.getPaymentPlatform)
local getFFlagEnableLuobuInGameUpsellModule = require(parent.Flags.GetFFlagEnableLuobuInGameUpsell)
local getFFlagUsePlatformNameForUnknownModule = require(parent.Flags.GetFFlagUsePlatformNameForUnknown)
local getFFlagEnableQuestIAPAnalyticsModule = require(parent.Flags.GetFFlagEnableQuestIAPAnalytics)

return {
	new = function() --[[ line: 18 ]]
		-- upvalues: userInputService (ref), getFFlagUsePlatformNameForUnknownModule (ref), httpService (ref), getFFlagEnableQuestIAPAnalyticsModule (ref), getFFlagEnableLuobuInGameUpsellModule (ref), runService (ref), rbxAnalyticsService (ref), marketplaceService (ref), playersService (ref)
		local t = {}
		setmetatable(t, {
			__tostring = function() --[[ line: 22 ]]
				return "Service(Analytics)"
			end
		})
		
		local function GetPlatformString() --[[ line: 27 ]]
			-- upvalues: userInputService (copy), getFFlagUsePlatformNameForUnknownModule (copy), httpService (copy), getFFlagEnableQuestIAPAnalyticsModule (copy), getFFlagEnableLuobuInGameUpsellModule (copy)
			local platform = userInputService:GetPlatform()
			local var12 = if getFFlagUsePlatformNameForUnknownModule() then tostring(platform) else "UNKNOWN"
			
			if platform == Enum.Platform.Windows then
				var12 = "Windows"
			elseif platform == Enum.Platform.OSX then
				var12 = "OSX"
			elseif platform == Enum.Platform.IOS then
				var12 = "IOS"
			elseif platform == Enum.Platform.Android then
				local userAgent = httpService:GetUserAgent()
				var12 = if getFFlagEnableQuestIAPAnalyticsModule() and string.find(userAgent, "OculusQuest3Store") then "Quest" elseif string.find(userAgent, "AmazonAppStore") then "Amazon" else "Android"
			elseif platform == Enum.Platform.XBoxOne then
				var12 = "XBoxOne"
			elseif platform == Enum.Platform.UWP then
				var12 = "UWP"
			elseif platform == Enum.Platform.PS4 then
				var12 = "PlayStation"
			end
			if getFFlagEnableLuobuInGameUpsellModule() then
				var12 += "-Luobu"
			end
			return var12
		end
		
		local function _(p0) --[[ line: 65 | named "ReportPlatformCounter" ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter(p0 .. GetPlatformString())
		end
		
		function t.sendCounter(p1) --[[ line: 72 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter(p1)
		end
		
		local _ = function(p2, p3) --[[ line: 79 | named "ReportEvent" ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", p2, p3 or {})
		end
		
		function t.signalEvent(value, p4) --[[ line: 86 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", value, p4 or {})
		end
		
		function t.reportRobuxUpsellStarted() --[[ line: 90 ]]
			-- upvalues: marketplaceService (copy)
			return marketplaceService:ReportRobuxUpsellStarted()
		end
		
		function t.signalPurchaseSuccess(value, p5, p6, p7) --[[ line: 94 ]]
			-- upvalues: marketplaceService (copy), playersService (copy)
			if p5 == Enum.InfoType.Product then
				marketplaceService:SignalClientPurchaseSuccess(p7.receipt, playersService.LocalPlayer.UserId, value)
				
				return
			end
			marketplaceService:ReportAssetSale(value, p6)
		end
		
		function t.signalPremiumUpsellShownPremium() --[[ line: 102 ]]
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellShownPremium", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("PremiumUpsellShownPremium" .. GetPlatformString())
		end
		
		function t.signalPremiumUpsellShownNonPremium() --[[ line: 107 ]]
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellShownNonPremium", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("PremiumUpsellShownNonPremium" .. GetPlatformString())
		end
		
		function t.signalPremiumUpsellConfirmed() --[[ line: 112 ]]
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellConfirmed", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("PremiumUpsellConfirmed" .. GetPlatformString())
		end
		
		function t.signalPremiumUpsellPrecheckFail() --[[ line: 117 ]]
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellPrecheckFail", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("PremiumUpsellPrecheckFail" .. GetPlatformString())
		end
		
		function t.signalPremiumUpsellInvalidProducts() --[[ line: 122 ]]
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellInvalidProducts", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("PremiumUpsellInvalidProducts" .. GetPlatformString())
		end
		
		function t.signalPremiumUpsellInvalidPlatform() --[[ line: 127 ]]
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellInvalidPlatform", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("PremiumUpsellInvalidPlatform" .. GetPlatformString())
		end
		
		function t.signalAdultLegalTextShown() --[[ line: 132 ]]
			-- upvalues: rbxAnalyticsService (copy)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "AdultLegalTextShown", { gameID = game.GameId })
		end
		
		function t.signalFailedPurchasePostUpsell() --[[ line: 136 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("FailedBalanceCheckPostUpsell" .. GetPlatformString())
		end
		
		function t.signalProductPurchaseShown(value, p8) --[[ line: 140 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = tostring(p8)
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseShown", t or {})
			end
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("ProductPurchaseShown" .. GetPlatformString())
		end
		
		function t.signalProductPurchaseUpsellShown(value, p9, p10) --[[ line: 149 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = tostring(p9),
				iapProductId = p10
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseUpsellShown", t or {})
			end
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("ProductPurchaseUpsellShown" .. GetPlatformString())
		end
		
		function t.signalProductPurchaseConfirmed(value, p11) --[[ line: 159 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = tostring(p11)
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseConfirmed", t or {})
			end
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("ProductPurchaseConfirmed" .. GetPlatformString())
		end
		
		function t.signalProductPurchaseUpsellConfirmed(value, p12, p13) --[[ line: 168 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = tostring(p12),
				iapProductId = p13
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseUpsellConfirmed", t or {})
			end
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("ProductPurchaseUpsellConfirmed" .. GetPlatformString())
		end
		
		function t.signalScaryModalShown(value, p14, p15) --[[ line: 178 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p14,
				iapProductId = p15 or ""
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ScaryModalShown", t or {})
			end
			local text = "ScaryModalShown" .. p14
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter(text .. GetPlatformString())
		end
		
		function t.signalScaryModalConfirmed(value, p16, p17) --[[ line: 188 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p16,
				iapProductId = p17 or ""
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ScaryModalConfirmed", t or {})
			end
			local text = "ScaryModalConfirmed" .. p16
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter(text .. GetPlatformString())
		end
		
		function t.signalScaryModalCanceled(value, p18, p19) --[[ line: 198 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p18,
				iapProductId = p19 or ""
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ScaryModalCanceled", t or {})
			end
			local text = "ScaryModalCanceled" .. p18
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter(text .. GetPlatformString())
		end
		
		function t.signalXboxInGamePurchaseCanceled(value, p20, p21) --[[ line: 208 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p20,
				iapProductId = p21 or ""
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseCanceled", t or {})
			end
			if not runService:IsStudio() then
				rbxAnalyticsService:ReportCounter("XboxPaymentsInGamePurchaseCanceled")
			end
		end
		
		function t.signalXboxInGamePurchaseSuccess(value, p22, p23) --[[ line: 220 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p22,
				iapProductId = p23 or ""
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseSuccess", t or {})
			end
			if not runService:IsStudio() then
				rbxAnalyticsService:ReportCounter("XboxPaymentsInGamePurchaseSuccess")
			end
		end
		
		function t.signalXboxInGamePurchaseFailure(value, p24, p25) --[[ line: 232 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p24,
				iapProductId = p25 or ""
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseFailure", t or {})
			end
			if not runService:IsStudio() then
				rbxAnalyticsService:ReportCounter("XboxPaymentsInGamePurchaseFailure")
			end
		end
		
		function t.signalTwoSVSettingsErrorShown(value, p26) --[[ line: 244 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p26
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "2SVSettingsErrorShown", t or {})
			end
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("2SVSettingsErrorShown" .. GetPlatformString())
		end
		
		function t.signalTwoSVSettingsErrorConfirmed(value, p27) --[[ line: 253 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p27
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "2SVSettingsErrorConfirmed", t or {})
			end
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("2SVSettingsErrorConfirmed" .. GetPlatformString())
		end
		
		function t.signalRobuxUpsellInGameIXP(value) --[[ line: 262 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "RobuxUpsellInGameIXP", t or {})
			end
			if value then
				if runService:IsStudio() then return end
				rbxAnalyticsService:ReportCounter("RobuxUpsellInGameIXP" .. GetPlatformString())
			end
		end
		
		function t.signalAvatarCreationPurchaseSubmit() --[[ line: 269 ]]
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "AvatarCreationPurchaseSubmit", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("AvatarCreationPurchaseSubmit" .. GetPlatformString())
		end
		
		function t.signalUserSettingEligibilityModal(value) --[[ line: 274 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = { gameID = game.GameId, requestType = value }
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "UserSettingEligibilityModalShown", t or {})
			end
			local text = "UserSettingEligibilityModalShown" .. value
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter(text .. GetPlatformString())
		end
		
		function t.signalEconomicRestrictionError(value, p28) --[[ line: 282 ]]
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			local t = {
				gameID = game.GameId,
				violationType = value,
				timeoutMinutes = p28
			}
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "EconomicRestrictionErrorShown", t or {})
		end
		
		return t
	end
}