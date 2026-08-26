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

function playerNameLabel.render(p1)
	-- upvalues: playersService (ref), userLibModule (ref), robloxTranslatorModule (ref), verified (ref), roactModule (ref), inspectAndBuyContextModule (ref), colorsModule (ref), appFonts (ref)
	local locale = p1.props.locale
	local view = p1.props.view
	local playerName = p1.props.playerName
	local var1 = tonumber(p1.props.playerId)
	local var2 = var1 and playersService:GetPlayerByUserId(var1)
	local var3 = if playerName == "" then "" elseif if var2 then userLibModule.Utils.isPlayerVerified(var2) else false then robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.VerifiedAvatar", locale, { PLAYER_NAME = playerName, VERIFIED_BADGE = verified }) else robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.Avatar", locale, { PLAYER_NAME = playerName })
	
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: view (ref), roactModule (copy), colorsModule (copy), var3 (write), appFonts (copy)
			local var4 = p2[view]
			
			return roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextScaled = true,
				TextSize = 36,
				LayoutOrder = 2,
				Size = UDim2.new(1, -(var4.AvatarHeadShotSize + var4.BorderPaddingSize * 2 + 10), 0, var4.TopSizeY),
				TextColor3 = colorsModule.White,
				Text = var3,
				Font = appFonts.default:getBlack(),
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				TextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = 36 })
			})
		end
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		view = p1.view,
		playerName = p1.playerName,
		playerId = p1.playerId,
		locale = p1.locale
	}
end)(playerNameLabel)