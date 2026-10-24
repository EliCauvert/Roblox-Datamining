local Parent = script.Parent.Parent
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local _ = require(Parent.Utils.getPaymentPlatform)
local GetFFlagEnableLuobuInGameUpsellModule = require(Parent.Flags.GetFFlagEnableLuobuInGameUpsell)
local GetFFlagUsePlatformNameForUnknownModule = require(Parent.Flags.GetFFlagUsePlatformNameForUnknown)
local GetFFlagEnableQuestIAPAnalyticsModule = require(Parent.Flags.GetFFlagEnableQuestIAPAnalytics)

return {
	new = function()
		-- upvalues: UserInputService (copy), GetFFlagUsePlatformNameForUnknownModule (copy), HttpService (copy), GetFFlagEnableQuestIAPAnalyticsModule (copy), GetFFlagEnableLuobuInGameUpsellModule (copy), RunService (copy), RbxAnalyticsService (copy), MarketplaceService (copy), Players (copy)
		local t = {}
		setmetatable(t, {
			__tostring = function(): string
				return "Service(Analytics)"
			end
		})
		
		local function GetPlatformString(): string
			-- upvalues: UserInputService (upval), GetFFlagUsePlatformNameForUnknownModule (upval), HttpService (upval), GetFFlagEnableQuestIAPAnalyticsModule (upval), GetFFlagEnableLuobuInGameUpsellModule (upval)
			local Platform = UserInputService:GetPlatform()
			local Text: string = if GetFFlagUsePlatformNameForUnknownModule() then tostring(Platform) else "UNKNOWN"
			
			if Platform == Enum.Platform.Windows then
				Text = "Windows"
			elseif Platform == Enum.Platform.OSX then
				Text = "OSX"
			elseif Platform == Enum.Platform.IOS then
				Text = "IOS"
			elseif Platform == Enum.Platform.Android then
				local UserAgent: string = HttpService:GetUserAgent()
				Text = if GetFFlagEnableQuestIAPAnalyticsModule() and string.find(UserAgent, "OculusQuest3Store") then "Quest" elseif string.find(UserAgent, "AmazonAppStore") then "Amazon" else "Android"
			elseif Platform == Enum.Platform.XBoxOne then
				Text = "XBoxOne"
			elseif Platform == Enum.Platform.UWP then
				Text = "UWP"
			elseif Platform == Enum.Platform.PS4 then
				Text = "PlayStation"
			end
			if GetFFlagEnableLuobuInGameUpsellModule() then
				Text += "-Luobu"
			end
			return Text
		end
		
		local function _(Text)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter(Text .. GetPlatformString())
				
				return
			end
		end
		
		function t.sendCounter(CounterName)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval)
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter(CounterName)
				
				return
			end
		end
		
		local _ = function(EventName, p1)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval)
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", EventName, p1 or {})
				
				return
			end
		end
		
		function t.signalEvent(EventName, p1)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval)
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", EventName, p1 or {})
				
				return
			end
		end
		
		function t.reportRobuxUpsellStarted()
			-- upvalues: MarketplaceService (upval)
			return MarketplaceService:ReportRobuxUpsellStarted()
		end
		
		function t.signalPurchaseSuccess(AssetId, InfoType, RobuxAmount, p1)
			-- upvalues: MarketplaceService (upval), Players (upval)
			if InfoType == Enum.InfoType.Product then
				MarketplaceService:SignalClientPurchaseSuccess(p1.receipt, Players.LocalPlayer.UserId, AssetId)
				
				return
			else
				MarketplaceService:ReportAssetSale(AssetId, RobuxAmount)
			end
		end
		
		function t.signalAdultLegalTextShown()
			-- upvalues: RbxAnalyticsService (upval)
			RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "AdultLegalTextShown", { gameID = game.GameId })
		end
		
		function t.signalFailedPurchasePostUpsell()
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter("FailedBalanceCheckPostUpsell" .. GetPlatformString())
				
				return
			end
		end
		
		function t.signalProductPurchaseShown(ProductId, p1)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			local config = {
				gameID = game.GameId,
				productId = ProductId,
				requestType = tostring(p1)
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseShown", config or {})
			end
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter("ProductPurchaseShown" .. GetPlatformString())
				
				return
			end
		end
		
		function t.signalProductPurchaseUpsellShown(ProductId, p1, IapProductId)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			local config = {
				gameID = game.GameId,
				productId = ProductId,
				requestType = tostring(p1),
				iapProductId = IapProductId
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseUpsellShown", config or {})
			end
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter("ProductPurchaseUpsellShown" .. GetPlatformString())
				
				return
			end
		end
		
		function t.signalProductPurchaseConfirmed(ProductId, p1)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			local config = {
				gameID = game.GameId,
				productId = ProductId,
				requestType = tostring(p1)
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseConfirmed", config or {})
			end
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter("ProductPurchaseConfirmed" .. GetPlatformString())
				
				return
			end
		end
		
		function t.signalProductPurchaseUpsellConfirmed(ProductId, p1, IapProductId)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			local config = {
				gameID = game.GameId,
				productId = ProductId,
				requestType = tostring(p1),
				iapProductId = IapProductId
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseUpsellConfirmed", config or {})
			end
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter("ProductPurchaseUpsellConfirmed" .. GetPlatformString())
				
				return
			end
		end
		
		function t.signalScaryModalShown(ProductId, RequestType, p1)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			local config = {
				gameID = game.GameId,
				productId = ProductId,
				requestType = RequestType,
				iapProductId = p1 or ""
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ScaryModalShown", config or {})
			end
			local Text = "ScaryModalShown" .. RequestType
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter(Text .. GetPlatformString())
				
				return
			end
		end
		
		function t.signalScaryModalConfirmed(ProductId, RequestType, p1)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			local config = {
				gameID = game.GameId,
				productId = ProductId,
				requestType = RequestType,
				iapProductId = p1 or ""
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ScaryModalConfirmed", config or {})
			end
			local Text = "ScaryModalConfirmed" .. RequestType
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter(Text .. GetPlatformString())
				
				return
			end
		end
		
		function t.signalScaryModalCanceled(ProductId, RequestType, p1)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			local config = {
				gameID = game.GameId,
				productId = ProductId,
				requestType = RequestType,
				iapProductId = p1 or ""
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "ScaryModalCanceled", config or {})
			end
			local Text = "ScaryModalCanceled" .. RequestType
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter(Text .. GetPlatformString())
				
				return
			end
		end
		
		function t.signalXboxInGamePurchaseCanceled(ProductId, RequestType, p1)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval)
			local config = {
				gameID = game.GameId,
				productId = ProductId,
				requestType = RequestType,
				iapProductId = p1 or ""
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseCanceled", config or {})
			end
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter("XboxPaymentsInGamePurchaseCanceled")
			end
		end
		
		function t.signalXboxInGamePurchaseSuccess(ProductId, RequestType, p1)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval)
			local config = {
				gameID = game.GameId,
				productId = ProductId,
				requestType = RequestType,
				iapProductId = p1 or ""
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseSuccess", config or {})
			end
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter("XboxPaymentsInGamePurchaseSuccess")
			end
		end
		
		function t.signalXboxInGamePurchaseFailure(ProductId, RequestType, p1)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval)
			local config = {
				gameID = game.GameId,
				productId = ProductId,
				requestType = RequestType,
				iapProductId = p1 or ""
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseFailure", config or {})
			end
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter("XboxPaymentsInGamePurchaseFailure")
			end
		end
		
		function t.signalTwoSVSettingsErrorShown(ProductId, RequestType)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			local config = {
				gameID = game.GameId,
				productId = ProductId,
				requestType = RequestType
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "2SVSettingsErrorShown", config or {})
			end
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter("2SVSettingsErrorShown" .. GetPlatformString())
				
				return
			end
		end
		
		function t.signalTwoSVSettingsErrorConfirmed(ProductId, RequestType)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			local config = {
				gameID = game.GameId,
				productId = ProductId,
				requestType = RequestType
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "2SVSettingsErrorConfirmed", config or {})
			end
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter("2SVSettingsErrorConfirmed" .. GetPlatformString())
				
				return
			end
		end
		
		function t.signalRobuxUpsellInGameIXP(p1)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			local t = {}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "RobuxUpsellInGameIXP", t or {})
			end
			if p1 then
				if RunService:IsStudio() then return end
				RbxAnalyticsService:ReportCounter("RobuxUpsellInGameIXP" .. GetPlatformString())
			end
		end
		
		function t.signalAvatarCreationPurchaseSubmit()
			-- upvalues: RbxAnalyticsService (upval), RunService (upval), GetPlatformString (copy)
			RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "AvatarCreationPurchaseSubmit", { gameID = game.GameId })
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter("AvatarCreationPurchaseSubmit" .. GetPlatformString())
				
				return
			end
		end
		
		function t.signalUserSettingEligibilityModal(RequestType)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval), GetPlatformString (copy)
			local config = { gameID = game.GameId, requestType = RequestType }
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "UserSettingEligibilityModalShown", config or {})
			end
			local Text = "UserSettingEligibilityModalShown" .. RequestType
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:ReportCounter(Text .. GetPlatformString())
				
				return
			end
		end
		
		function t.signalEconomicRestrictionError(ViolationType, TimeoutMinutes)
			-- upvalues: RunService (upval), RbxAnalyticsService (upval)
			local config = {
				gameID = game.GameId,
				violationType = ViolationType,
				timeoutMinutes = TimeoutMinutes
			}
			
			if not RunService:IsStudio() then
				RbxAnalyticsService:SetRBXEvent("client", "InGamePrompt", "EconomicRestrictionErrorShown", config or {})
				
				return
			end
		end
		
		return t
	end
}