local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local assetCardModule = require(appChat.Components.ChatConversation.AssetCardComponents.AssetCard)
local playButtonModule = require(script.Parent.PlayButton)
local viewDetailsButtonModule = require(script.Parent.ViewDetailsButton)
local gameCard = roactModule.PureComponent:extend("GameCard")
gameCard.defaultProps = {
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

function gameCard.makeButtons(p0, _) --[[ line: 64 ]]
	-- upvalues: roactModule (ref), skeleton (ref), radius (ref), playButtonModule (ref), viewDetailsButtonModule (ref)
	if not p0.props.playabilityStatus then return end
	local isPlayable = p0.props.playabilityStatus.isPlayable
	
	if p0.props.isLoading then
		return {
			loading = roactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, 32), radius = radius.Small })
		}
	elseif p0.props.isPlayButtonEnabled and isPlayable == true then
		return {
			playButton = roactModule.createElement(playButtonModule, {
				placeId = p0.props.placeId,
				universeId = p0.props.universeId,
				text = p0.props.playText,
				conversationId = p0.props.conversationId,
				onActivated = function() --[[ line: 88 ]]
					-- upvalues: p0 (ref)
					p0.props.onPlayButtonActivated(p0.props)
				end,
				eventStream = p0.props.eventStream
			})
		}
	elseif p0.props.viewDetailsEnabled then
		return {
			viewDetails = roactModule.createElement(viewDetailsButtonModule, {
				text = p0.props.viewDetailsText,
				onActivated = function() --[[ line: 100 ]]
					-- upvalues: p0 (ref)
					p0.props.openDetails(p0.props)
				end,
				eventStream = p0.props.eventStream
			})
		}
	end
end

function gameCard.render(p1) --[[ line: 110 ]]
	-- upvalues: UIBloxModule (ref), roactModule (ref), assetCardModule (ref)
	return UIBloxModule.Style.withStyle(function(p2) --[[ line: 111 ]]
		-- upvalues: p1 (ref), roactModule (copy), assetCardModule (copy)
		if not p1.props.universeId then
			return roactModule.createElement(assetCardModule, {
				isLoading = true,
				cardTitle = p1.props.gameName or "",
				cardBodyText = p1.props.gameDescription or "",
				cardIcon = p1.props.gameIcon or ""
			}, {
				fill = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 32)
				})
			})
		end
		local noDescriptionText = nil
		
		if p1.props.gameDescription then
			noDescriptionText = p1.props.gameDescription:gsub("%s", " ")
			
			if noDescriptionText:gsub("^%s+$", "") == "" then
				noDescriptionText = p1.props.noDescriptionText
			end
		end
		return roactModule.createElement(assetCardModule, {
			isLoading = p1.props.isLoading,
			cardTitle = p1.props.gameName,
			cardBodyText = noDescriptionText,
			cardIcon = p1.props.gameIcon,
			contentLoadedCallback = p1.props.contentLoadedCallback,
			bodyActivated = function() --[[ line: 131 ]]
				-- upvalues: p1 (copy)
				if p1.props.viewDetailsEnabled then
					p1.props.openDetails(p1.props)
				end
			end
		}, p1:makeButtons(p2))
	end)
end

return gameCard