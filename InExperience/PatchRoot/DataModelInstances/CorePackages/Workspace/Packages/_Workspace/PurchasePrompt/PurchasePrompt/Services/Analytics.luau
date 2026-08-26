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
	new = function()
		-- upvalues: userInputService (ref), getFFlagUsePlatformNameForUnknownModule (ref), httpService (ref), getFFlagEnableQuestIAPAnalyticsModule (ref), getFFlagEnableLuobuInGameUpsellModule (ref), runService (ref), rbxAnalyticsService (ref), marketplaceService (ref), playersService (ref)
		local t = {}
		setmetatable(t, {
			__tostring = function()
				return "Service(Analytics)"
			end
		})
		
		local function GetPlatformString()
			-- upvalues: userInputService (copy), getFFlagUsePlatformNameForUnknownModule (copy), httpService (copy), getFFlagEnableQuestIAPAnalyticsModule (copy), getFFlagEnableLuobuInGameUpsellModule (copy)
			local platform = userInputService:GetPlatform()
			local var1 = if getFFlagUsePlatformNameForUnknownModule() then tostring(platform) else "UNKNOWN"
			
			if platform == Enum.Platform.Windows then
				var1 = "Windows"
			elseif platform == Enum.Platform.OSX then
				var1 = "OSX"
			elseif platform == Enum.Platform.IOS then
				var1 = "IOS"
			elseif platform == Enum.Platform.Android then
				local userAgent = httpService:GetUserAgent()
				var1 = if getFFlagEnableQuestIAPAnalyticsModule() and string.find(userAgent, "OculusQuest3Store") then "Quest" elseif string.find(userAgent, "AmazonAppStore") then "Amazon" else "Android"
			elseif platform == Enum.Platform.XBoxOne then
				var1 = "XBoxOne"
			elseif platform == Enum.Platform.UWP then
				var1 = "UWP"
			elseif platform == Enum.Platform.PS4 then
				var1 = "PlayStation"
			end
			if getFFlagEnableLuobuInGameUpsellModule() then
				var1 += "-Luobu"
			end
			return var1
		end
		
		local function _(p1)
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter(p1 .. GetPlatformString())
		end
		
		function t.sendCounter(p1)
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter(p1)
		end
		
		local _ = function(p1, p2)
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", p1, p2 or {})
		end
		
		function t.signalEvent(value, p1)
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", value, p1 or {})
		end
		
		function t.reportRobuxUpsellStarted()
			-- upvalues: marketplaceService (copy)
			return marketplaceService:ReportRobuxUpsellStarted()
		end
		
		function t.signalPurchaseSuccess(value, p1, p2, p3)
			-- upvalues: marketplaceService (copy), playersService (copy)
			if p1 == Enum.InfoType.Product then
				marketplaceService:SignalClientPurchaseSuccess(p3.receipt, playersService.LocalPlayer.UserId, value)
				
				return
			end
			marketplaceService:ReportAssetSale(value, p2)
		end
		
		function t.signalPremiumUpsellShownPremium()
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellShownPremium", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("PremiumUpsellShownPremium" .. GetPlatformString())
		end
		
		function t.signalPremiumUpsellShownNonPremium()
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellShownNonPremium", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("PremiumUpsellShownNonPremium" .. GetPlatformString())
		end
		
		function t.signalPremiumUpsellConfirmed()
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellConfirmed", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("PremiumUpsellConfirmed" .. GetPlatformString())
		end
		
		function t.signalPremiumUpsellPrecheckFail()
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellPrecheckFail", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("PremiumUpsellPrecheckFail" .. GetPlatformString())
		end
		
		function t.signalPremiumUpsellInvalidProducts()
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellInvalidProducts", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("PremiumUpsellInvalidProducts" .. GetPlatformString())
		end
		
		function t.signalPremiumUpsellInvalidPlatform()
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellInvalidPlatform", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("PremiumUpsellInvalidPlatform" .. GetPlatformString())
		end
		
		function t.signalAdultLegalTextShown()
			-- upvalues: rbxAnalyticsService (copy)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "AdultLegalTextShown", { gameID = game.GameId })
		end
		
		function t.signalFailedPurchasePostUpsell()
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("FailedBalanceCheckPostUpsell" .. GetPlatformString())
		end
		
		function t.signalProductPurchaseShown(value, p1)
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = tostring(p1)
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseShown", t or {})
			end
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("ProductPurchaseShown" .. GetPlatformString())
		end
		
		function t.signalProductPurchaseUpsellShown(value, p1, p2)
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = tostring(p1),
				iapProductId = p2
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseUpsellShown", t or {})
			end
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("ProductPurchaseUpsellShown" .. GetPlatformString())
		end
		
		function t.signalProductPurchaseConfirmed(value, p1)
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = tostring(p1)
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseConfirmed", t or {})
			end
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("ProductPurchaseConfirmed" .. GetPlatformString())
		end
		
		function t.signalProductPurchaseUpsellConfirmed(value, p1, p2)
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = tostring(p1),
				iapProductId = p2
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseUpsellConfirmed", t or {})
			end
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("ProductPurchaseUpsellConfirmed" .. GetPlatformString())
		end
		
		function t.signalScaryModalShown(value, p1, p2)
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p1,
				iapProductId = p2 or ""
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
		
		function t.signalScaryModalConfirmed(value, p1, p2)
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p1,
				iapProductId = p2 or ""
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
		
		function t.signalScaryModalCanceled(value, p1, p2)
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p1,
				iapProductId = p2 or ""
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
		
		function t.signalXboxInGamePurchaseCanceled(value, p1, p2)
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p1,
				iapProductId = p2 or ""
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseCanceled", t or {})
			end
			if not runService:IsStudio() then
				rbxAnalyticsService:ReportCounter("XboxPaymentsInGamePurchaseCanceled")
			end
		end
		
		function t.signalXboxInGamePurchaseSuccess(value, p1, p2)
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p1,
				iapProductId = p2 or ""
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseSuccess", t or {})
			end
			if not runService:IsStudio() then
				rbxAnalyticsService:ReportCounter("XboxPaymentsInGamePurchaseSuccess")
			end
		end
		
		function t.signalXboxInGamePurchaseFailure(value, p1, p2)
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p1,
				iapProductId = p2 or ""
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseFailure", t or {})
			end
			if not runService:IsStudio() then
				rbxAnalyticsService:ReportCounter("XboxPaymentsInGamePurchaseFailure")
			end
		end
		
		function t.signalTwoSVSettingsErrorShown(value, p1)
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p1
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "2SVSettingsErrorShown", t or {})
			end
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("2SVSettingsErrorShown" .. GetPlatformString())
		end
		
		function t.signalTwoSVSettingsErrorConfirmed(value, p1)
			-- upvalues: runService (copy), rbxAnalyticsService (copy), GetPlatformString (ref)
			local t = {
				gameID = game.GameId,
				productId = value,
				requestType = p1
			}
			
			if not runService:IsStudio() then
				rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "2SVSettingsErrorConfirmed", t or {})
			end
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("2SVSettingsErrorConfirmed" .. GetPlatformString())
		end
		
		function t.signalRobuxUpsellInGameIXP(value)
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
		
		function t.signalAvatarCreationPurchaseSubmit()
			-- upvalues: rbxAnalyticsService (copy), runService (copy), GetPlatformString (ref)
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "AvatarCreationPurchaseSubmit", { gameID = game.GameId })
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:ReportCounter("AvatarCreationPurchaseSubmit" .. GetPlatformString())
		end
		
		function t.signalUserSettingEligibilityModal(value)
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
		
		function t.signalEconomicRestrictionError(value, p1)
			-- upvalues: runService (copy), rbxAnalyticsService (copy)
			local t = {
				gameID = game.GameId,
				violationType = value,
				timeoutMinutes = p1
			}
			
			if runService:IsStudio() then
				return
			end
			rbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "EconomicRestrictionErrorShown", t or {})
		end
		
		return t
	end
}