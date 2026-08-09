local parent = script:FindFirstAncestor("SocialCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local playerTile = UIBloxModule.App.Tile.PlayerTile
local interactable = UIBloxModule.Core.Control.Interactable
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local playerNameModule = require(script.Parent.PlayerName)
local constantsModule = require(script.Parent.Constants)
local fFlagUseSizeInClipRect = require(parent.SharedFlags).FFlagUseSizeInClipRect

local var5 = function() --[[ line: 16 ]] end

local t = {
	tileSize = constantsModule.TILE_SIZE,
	nameTopPadding = constantsModule.NAME_TOP_PADDING,
	contextualTopPadding = constantsModule.CONTEXTUAL_TOP_PADDING
}

return function(p0) --[[ line: 51 ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), playerTile (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), playerNameModule (ref), fFlagUseSizeInClipRect (ref), interactable (ref), var5 (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	local tileSize = var7.tileSize
	
	local _ = function() --[[ line: 55 ]]
		-- upvalues: var7 (ref)
		return if var7.renderButtons then var7.renderButtons() else nil
	end
	
	local _ = function() --[[ line: 75 ]]
		-- upvalues: var7 (ref)
		return if var7.renderContextualInfo then var7.renderContextualInfo() else nil
	end
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = var7.layoutOrder,
		Size = if fFlagUseSizeInClipRect then UDim2.new(0, tileSize, 1, 0) else UDim2.fromOffset(tileSize, 0)
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
			PlayerTile = (function() --[[ line: 59 ]]
				-- upvalues: var7 (ref), reactModule (copy), playerTile (copy), getStandardSizeAvatarHeadShotRbxthumb (copy)
				return if var7.renderPlayerTile then var7.renderPlayerTile() else reactModule.createElement(playerTile, {
					title = "",
					Selectable = true,
					tileSize = UDim2.fromOffset(var7.tileSize, var7.tileSize),
					thumbnail = if var7.headshotImageUrl then var7.headshotImageUrl else getStandardSizeAvatarHeadShotRbxthumb(var7.userId),
					onActivated = var7.onActivatedTile,
					buttons = if var7.renderButtons then var7.renderButtons() else nil,
					buttonRef = var7.buttonRef
				})
			end)()
		}),
		NameTopPadding = if var7.nameTopPadding then reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, var7.nameTopPadding)
		}) else nil,
		UserInfo = reactModule.createElement(interactable, {
			LayoutOrder = 3,
			[reactModule.Event.Activated] = var7.onActivatedContextual,
			AutomaticSize = Enum.AutomaticSize.XY,
			onStateChanged = var5,
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
				PlayerName = (function() --[[ line: 79 ]]
					-- upvalues: var7 (ref), reactModule (copy), playerNameModule (copy)
					return if var7.renderPlayerName then var7.renderPlayerName() else var7.userName and reactModule.createElement(playerNameModule, { name = var7.userName, width = var7.tileSize }) or nil
				end)()
			}),
			ContextualTopPadding = if var7.contextualTopPadding then reactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, var7.contextualTopPadding)
			}) else nil,
			ContextualInfoFrame = reactModule.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				ContextualInfo = if var7.renderContextualInfo then var7.renderContextualInfo() else nil
			})
		})
	})
end