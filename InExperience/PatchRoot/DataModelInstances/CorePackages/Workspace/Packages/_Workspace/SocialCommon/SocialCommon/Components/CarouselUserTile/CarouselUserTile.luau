local socialCommon = script:FindFirstAncestor("SocialCommon")
local parent = socialCommon.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local playerTile = UIBloxModule.App.Tile.PlayerTile
local interactable = UIBloxModule.Core.Control.Interactable
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local fFlagCarouselUserTileUseProfileFrameThumbnailModule = require(socialCommon.Flags.FFlagCarouselUserTileUseProfileFrameThumbnail)
local playerNameModule = require(script.Parent.PlayerName)
local constantsModule = require(script.Parent.Constants)

local var7 = function() --[[ line: 16 ]] end

local t = {
	tileSize = constantsModule.TILE_SIZE,
	nameTopPadding = constantsModule.NAME_TOP_PADDING,
	contextualTopPadding = constantsModule.CONTEXTUAL_TOP_PADDING
}

return function(p0) --[[ line: 51 ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), playerTile (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), fFlagCarouselUserTileUseProfileFrameThumbnailModule (ref), playerNameModule (ref), interactable (ref), var7 (ref)
	local var9 = cryoModule.Dictionary.join(t, p0)
	local tileSize = var9.tileSize
	
	local _ = function() --[[ line: 72 ]]
		-- upvalues: var9 (ref)
		return if var9.renderContextualInfo then var9.renderContextualInfo() else nil
	end
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = var9.layoutOrder,
		Size = UDim2.new(0, tileSize, 1, 0)
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PlayerTileFrame = reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(tileSize, tileSize)
		}, {
			PlayerTile = if var9.renderPlayerTile then var9.renderPlayerTile() else reactModule.createElement(playerTile, {
				title = "",
				Selectable = true,
				tileSize = UDim2.fromOffset(var9.tileSize, var9.tileSize),
				thumbnail = if var9.headshotImageUrl then var9.headshotImageUrl else getStandardSizeAvatarHeadShotRbxthumb(var9.userId, fFlagCarouselUserTileUseProfileFrameThumbnailModule),
				onActivated = var9.onActivatedTile,
				buttons = if var9.renderButtons then var9.renderButtons() else nil,
				buttonRef = var9.buttonRef
			})
		}),
		NameTopPadding = if var9.nameTopPadding then reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, var9.nameTopPadding)
		}) else nil,
		UserInfo = reactModule.createElement(interactable, {
			LayoutOrder = 3,
			[reactModule.Event.Activated] = var9.onActivatedContextual,
			AutomaticSize = Enum.AutomaticSize.XY,
			onStateChanged = var7,
			BackgroundTransparency = 1,
			Selectable = false
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			PlayerNameFrame = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				PlayerName = (function() --[[ line: 76 ]]
					-- upvalues: var9 (ref), reactModule (copy), playerNameModule (copy)
					return if var9.renderPlayerName then var9.renderPlayerName() else var9.userName and reactModule.createElement(playerNameModule, { name = var9.userName, width = var9.tileSize }) or nil
				end)()
			}),
			ContextualTopPadding = if var9.contextualTopPadding then reactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, var9.contextualTopPadding)
			}) else nil,
			ContextualInfoFrame = reactModule.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				ContextualInfo = if var9.renderContextualInfo then var9.renderContextualInfo() else nil
			})
		})
	})
end