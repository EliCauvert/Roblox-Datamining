local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local AssetCardModule = require(AppChat.Components.ChatConversation.AssetCardComponents.AssetCard)
local PlayButtonModule = require(script.Parent.PlayButton)
local ViewDetailsButtonModule = require(script.Parent.ViewDetailsButton)
local GameCard = RoactModule.PureComponent:extend("GameCard")
GameCard.defaultProps = {
	isPlayButtonEnabled = true,
	playText = "Play",
	viewDetailsText = "View Details",
	noDescriptionText = "Placeholder: No Description",
	gameName = nil,
	gameIcon = nil,
	gameDescription = nil,
	contentLoadedCallback = nil,
	bodyActivated = nil,
	playabilityStatus = nil,
	conversationId = nil,
	universeId = nil,
	placeId = nil,
	price = nil,
	eventStream = nil,
	playButtonActivated = nil,
	viewDetailsActivated = nil,
	viewDetailsEnabled = true
}

function GameCard.makeButtons(p1, _)
	-- upvalues: RoactModule (copy), Skeleton (copy), Radius (copy), PlayButtonModule (copy), ViewDetailsButtonModule (copy)
	if not p1.props.playabilityStatus then return end
	local IsPlayable = p1.props.playabilityStatus.isPlayable
	
	if p1.props.isLoading then
		return {
			loading = RoactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 32), radius = Radius.Small })
		}
	elseif p1.props.isPlayButtonEnabled and IsPlayable == true then
		return {
			playButton = RoactModule.createElement(PlayButtonModule, {
				placeId = p1.props.placeId,
				universeId = p1.props.universeId,
				text = p1.props.playText,
				conversationId = p1.props.conversationId,
				onActivated = function()
					-- upvalues: p1 (copy)
					p1.props.onPlayButtonActivated(p1.props)
				end,
				eventStream = p1.props.eventStream
			})
		}
	elseif not p1.props.viewDetailsEnabled then return end
	return {
		viewDetails = RoactModule.createElement(ViewDetailsButtonModule, {
			text = p1.props.viewDetailsText,
			onActivated = function()
				-- upvalues: p1 (copy)
				p1.props.openDetails(p1.props)
			end,
			eventStream = p1.props.eventStream
		})
	}
end

function GameCard.render(p1)
	-- upvalues: UIBloxModule (copy), RoactModule (copy), AssetCardModule (copy)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), AssetCardModule (upval)
		if not p1.props.universeId then
			return RoactModule.createElement(AssetCardModule, {
				isLoading = true,
				cardTitle = p1.props.gameName or "",
				cardBodyText = p1.props.gameDescription or "",
				cardIcon = p1.props.gameIcon or ""
			}, {
				fill = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 32)
				})
			})
		end
		local Text = nil
		
		if p1.props.gameDescription then
			Text = p1.props.gameDescription:gsub("%s", " ")
			
			if Text:gsub("^%s+$", "") == "" then
				Text = p1.props.noDescriptionText
			end
		end
		return RoactModule.createElement(AssetCardModule, {
			isLoading = p1.props.isLoading,
			cardTitle = p1.props.gameName,
			cardBodyText = Text,
			cardIcon = p1.props.gameIcon,
			contentLoadedCallback = p1.props.contentLoadedCallback,
			bodyActivated = function()
				-- upvalues: p1 (upval)
				if p1.props.viewDetailsEnabled then
					p1.props.openDetails(p1.props)
				end
			end
		}, p1:makeButtons(p2))
	end)
end

return GameCard