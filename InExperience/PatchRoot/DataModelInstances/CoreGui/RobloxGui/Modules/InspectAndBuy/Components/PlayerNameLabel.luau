local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local colorsModule = require(parent.Colors)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local verifiedBadgesModule = require(corePackagesService.Workspace.Packages.VerifiedBadges)
local userLibModule = require(corePackagesService.Workspace.Packages.UserLib)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local playerNameLabel = roactModule.PureComponent:extend("PlayerNameLabel")
local verified = verifiedBadgesModule.emoji.verified

function playerNameLabel.render(p0)
	-- upvalues: playersService (ref), userLibModule (ref), robloxTranslatorModule (ref), verified (ref), roactModule (ref), inspectAndBuyContextModule (ref), colorsModule (ref), appFonts (ref)
	local locale = p0.props.locale
	local view = p0.props.view
	local playerName = p0.props.playerName
	local var10 = tonumber(p0.props.playerId)
	local var11 = var10 and playersService:GetPlayerByUserId(var10)
	local var12 = if playerName == "" then "" elseif if var11 then userLibModule.Utils.isPlayerVerified(var11) else false then robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.VerifiedAvatar", locale, { PLAYER_NAME = playerName, VERIFIED_BADGE = verified }) else robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.Avatar", locale, { PLAYER_NAME = playerName })
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p1)
			-- upvalues: view (ref), roactModule (copy), colorsModule (copy), var12 (write), appFonts (copy)
			local var13 = p1[view]
			
			return roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextScaled = true,
				TextSize = 36,
				LayoutOrder = 2,
				Size = UDim2.new(1, -(var13.AvatarHeadShotSize + var13.BorderPaddingSize * 2 + 10), 0, var13.TopSizeY),
				TextColor3 = colorsModule.White,
				Text = var12,
				Font = appFonts.default:getBlack(),
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				TextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = 36 })
			})
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p2, _)
	return {
		view = p2.view,
		playerName = p2.playerName,
		playerId = p2.playerId,
		locale = p2.locale
	}
end)(playerNameLabel)