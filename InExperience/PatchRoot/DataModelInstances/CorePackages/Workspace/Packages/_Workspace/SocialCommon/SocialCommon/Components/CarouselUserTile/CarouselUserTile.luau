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

local var1 = function() end

local t = {
	tileSize = constantsModule.TILE_SIZE,
	nameTopPadding = constantsModule.NAME_TOP_PADDING,
	contextualTopPadding = constantsModule.CONTEXTUAL_TOP_PADDING
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), playerTile (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), fFlagCarouselUserTileUseProfileFrameThumbnailModule (ref), playerNameModule (ref), interactable (ref), var1 (ref)
	local var2 = cryoModule.Dictionary.join(t, p1)
	local tileSize = var2.tileSize
	
	local _ = function()
		-- upvalues: var2 (ref)
		return if var2.renderContextualInfo then var2.renderContextualInfo() else nil
	end
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = var2.layoutOrder,
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
			PlayerTile = if var2.renderPlayerTile then var2.renderPlayerTile() else reactModule.createElement(playerTile, {
				title = "",
				Selectable = true,
				tileSize = UDim2.fromOffset(var2.tileSize, var2.tileSize),
				thumbnail = if var2.headshotImageUrl then var2.headshotImageUrl else getStandardSizeAvatarHeadShotRbxthumb(var2.userId, fFlagCarouselUserTileUseProfileFrameThumbnailModule),
				onActivated = var2.onActivatedTile,
				buttons = if var2.renderButtons then var2.renderButtons() else nil,
				buttonRef = var2.buttonRef
			})
		}),
		NameTopPadding = if var2.nameTopPadding then reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, var2.nameTopPadding)
		}) else nil,
		UserInfo = reactModule.createElement(interactable, {
			LayoutOrder = 3,
			[reactModule.Event.Activated] = var2.onActivatedContextual,
			AutomaticSize = Enum.AutomaticSize.XY,
			onStateChanged = var1,
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
				PlayerName = (function()
					-- upvalues: var2 (ref), reactModule (copy), playerNameModule (copy)
					return if var2.renderPlayerName then var2.renderPlayerName() else var2.userName and reactModule.createElement(playerNameModule, { name = var2.userName, width = var2.tileSize }) or nil
				end)()
			}),
			ContextualTopPadding = if var2.contextualTopPadding then reactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, var2.contextualTopPadding)
			}) else nil,
			ContextualInfoFrame = reactModule.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				ContextualInfo = if var2.renderContextualInfo then var2.renderContextualInfo() else nil
			})
		})
	})
end