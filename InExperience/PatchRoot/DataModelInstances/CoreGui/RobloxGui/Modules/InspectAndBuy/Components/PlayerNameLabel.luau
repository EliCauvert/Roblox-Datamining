local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local ColorsModule = require(Parent.Colors)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local InspectAndBuyContextModule = require(Parent.Components.InspectAndBuyContext)
local PlayerNameLabel = RoactModule.PureComponent:extend("PlayerNameLabel")
local Verified = require(CorePackages.Workspace.Packages.VerifiedBadges).emoji.verified

function PlayerNameLabel.render(p1) --[[ Line: 21 ]]
	-- upvalues: Players (copy), UserLibModule (copy), RobloxTranslatorModule (copy), Verified (copy), RoactModule (copy), InspectAndBuyContextModule (copy), ColorsModule (copy), AppFonts (copy)
	local Locale = p1.props.locale
	local View = p1.props.view
	local PlayerName = p1.props.playerName
	local Number: number? = tonumber(p1.props.playerId)
	local Player = Number and Players:GetPlayerByUserId(Number)
	local IsPlayerVerified = if Player then UserLibModule.Utils.isPlayerVerified(Player) else false
	local InGameInspectMenuLabelVerifiedAvatar = nil
	InGameInspectMenuLabelVerifiedAvatar = if PlayerName == "" then "" elseif IsPlayerVerified then RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.VerifiedAvatar", Locale, { PLAYER_NAME = PlayerName, VERIFIED_BADGE = Verified }) else RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.Avatar", Locale, { PLAYER_NAME = PlayerName })
	
	return RoactModule.createElement(InspectAndBuyContextModule.Consumer, {
		render = function(p2) --[[ Line: 43 ]]
			-- upvalues: View (copy), RoactModule (upval), ColorsModule (upval), InGameInspectMenuLabelVerifiedAvatar (ref), AppFonts (upval)
			local v1 = p2[View]
			
			return RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextScaled = true,
				TextSize = 36,
				LayoutOrder = 2,
				Size = UDim2.new(1, -(v1.AvatarHeadShotSize + v1.BorderPaddingSize * 2 + 10), 0, v1.TopSizeY),
				TextColor3 = ColorsModule.White,
				Text = InGameInspectMenuLabelVerifiedAvatar,
				Font = AppFonts.default:getBlack(),
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				TextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = 36 })
			})
		end
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 66 ]]
	return {
		view = p1.view,
		playerName = p1.playerName,
		playerId = p1.playerId,
		locale = p1.locale
	}
end)(PlayerNameLabel)