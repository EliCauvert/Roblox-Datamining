local SocialCommon = script:FindFirstAncestor("SocialCommon")
local Parent = SocialCommon.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local PlayerTile = UIBloxModule.App.Tile.PlayerTile
local Interactable = UIBloxModule.Core.Control.Interactable
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local FFlagCarouselUserTileUseProfileFrameThumbnailModule = require(SocialCommon.Flags.FFlagCarouselUserTileUseProfileFrameThumbnail)
local PlayerNameModule = require(script.Parent.PlayerName)
local ConstantsModule = require(script.Parent.Constants)

local function OnStateChanged() end

local config = {
	tileSize = ConstantsModule.TILE_SIZE,
	nameTopPadding = ConstantsModule.NAME_TOP_PADDING,
	contextualTopPadding = ConstantsModule.CONTEXTUAL_TOP_PADDING
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), PlayerTile (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), FFlagCarouselUserTileUseProfileFrameThumbnailModule (copy), PlayerNameModule (copy), Interactable (copy), OnStateChanged (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local TileSize = JoinResult.tileSize
	
	local function _()
		-- upvalues: JoinResult (copy)
		return if JoinResult.renderContextualInfo then JoinResult.renderContextualInfo() else nil
	end
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = JoinResult.layoutOrder,
		Size = UDim2.new(0, TileSize, 1, 0)
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PlayerTileFrame = ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(TileSize, TileSize)
		}, {
			PlayerTile = if JoinResult.renderPlayerTile then JoinResult.renderPlayerTile() else ReactModule.createElement(PlayerTile, {
				title = "",
				Selectable = true,
				tileSize = UDim2.fromOffset(JoinResult.tileSize, JoinResult.tileSize),
				thumbnail = if JoinResult.headshotImageUrl then JoinResult.headshotImageUrl else GetStandardSizeAvatarHeadShotRbxthumbFunction(JoinResult.userId, FFlagCarouselUserTileUseProfileFrameThumbnailModule),
				onActivated = JoinResult.onActivatedTile,
				buttons = if JoinResult.renderButtons then JoinResult.renderButtons() else nil,
				buttonRef = JoinResult.buttonRef
			})
		}),
		NameTopPadding = if JoinResult.nameTopPadding then ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, JoinResult.nameTopPadding)
		}) else nil,
		UserInfo = ReactModule.createElement(Interactable, {
			LayoutOrder = 3,
			[ReactModule.Event.Activated] = JoinResult.onActivatedContextual,
			AutomaticSize = Enum.AutomaticSize.XY,
			onStateChanged = OnStateChanged,
			BackgroundTransparency = 1,
			Selectable = false
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			PlayerNameFrame = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				PlayerName = (function()
					-- upvalues: JoinResult (copy), ReactModule (upval), PlayerNameModule (upval)
					return if JoinResult.renderPlayerName then JoinResult.renderPlayerName() else JoinResult.userName and ReactModule.createElement(PlayerNameModule, { name = JoinResult.userName, width = JoinResult.tileSize }) or nil
				end)()
			}),
			ContextualTopPadding = if JoinResult.contextualTopPadding then ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, JoinResult.contextualTopPadding)
			}) else nil,
			ContextualInfoFrame = ReactModule.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				ContextualInfo = if JoinResult.renderContextualInfo then JoinResult.renderContextualInfo() else nil
			})
		})
	})
end