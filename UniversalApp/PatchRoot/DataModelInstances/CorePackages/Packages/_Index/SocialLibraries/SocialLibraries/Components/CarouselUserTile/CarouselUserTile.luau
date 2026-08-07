local socialLibraries = script:FindFirstAncestor("SocialLibraries")
local dependenciesModule = require(socialLibraries.dependencies)
local roact = dependenciesModule.Roact
local llama = dependenciesModule.llama
local UIBlox = dependenciesModule.UIBlox
local playerTile = UIBlox.App.Tile.PlayerTile
local interactable = UIBlox.Core.Control.Interactable
local getUserAvatarImageModule = require(socialLibraries.User.getUserAvatarImage)
local playerNameModule = require(script.Parent.PlayerName)
local _ = require(script.Parent.StyleTypes)
local constantsModule = require(script.Parent.Constants)

local var5 = function() --[[ line: 16 ]] end

local t = {
	tileSize = constantsModule.TILE_SIZE,
	nameTopPadding = constantsModule.NAME_TOP_PADDING,
	contextualTopPadding = constantsModule.CONTEXTUAL_TOP_PADDING
}

return function(p0) --[[ line: 49 ]]
	-- upvalues: llama (ref), t (ref), roact (ref), playerTile (ref), getUserAvatarImageModule (ref), playerNameModule (ref), interactable (ref), var5 (ref)
	local var7 = llama.Dictionary.join(t, p0)
	local tileSize = var7.tileSize
	
	local _ = function() --[[ line: 53 ]]
		-- upvalues: var7 (ref)
		return if var7.renderButtons then var7.renderButtons() else nil
	end
	
	local _ = function() --[[ line: 70 ]]
		-- upvalues: var7 (ref)
		return if var7.renderContextualInfo then var7.renderContextualInfo() else nil
	end
	
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = var7.layoutOrder,
		Size = UDim2.fromOffset(tileSize, 0)
	}, {
		UIListLayout = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PlayerTileFrame = roact.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(tileSize, tileSize)
		}, {
			PlayerTile = (function() --[[ line: 59 ]]
				-- upvalues: var7 (ref), roact (copy), playerTile (copy), getUserAvatarImageModule (copy)
				return if var7.renderPlayerTile then var7.renderPlayerTile() else roact.createElement(playerTile, {
					tileSize = UDim2.fromOffset(var7.tileSize, var7.tileSize),
					thumbnail = getUserAvatarImageModule(var7.userId),
					onActivated = var7.onActivatedTile,
					buttons = if var7.renderButtons then var7.renderButtons() else nil
				})
			end)()
		}),
		NameTopPadding = if var7.nameTopPadding then roact.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, var7.nameTopPadding)
		}) else nil,
		UserInfo = roact.createElement(interactable, {
			LayoutOrder = 3,
			[roact.Event.Activated] = var7.onActivatedContextual,
			AutomaticSize = Enum.AutomaticSize.XY,
			onStateChanged = var5,
			BackgroundTransparency = 1
		}, {
			UIListLayout = roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			PlayerNameFrame = roact.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				PlayerName = (function() --[[ line: 76 ]]
					-- upvalues: var7 (ref), roact (copy), playerNameModule (copy)
					return if var7.renderPlayerName then var7.renderPlayerName() else var7.userName and roact.createElement(playerNameModule, { name = var7.userName, width = var7.tileSize }) or nil
				end)()
			}),
			ContextualTopPadding = if var7.contextualTopPadding then roact.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, var7.contextualTopPadding)
			}) else nil,
			ContextualInfoFrame = roact.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				ContextualInfo = if var7.renderContextualInfo then var7.renderContextualInfo() else nil
			})
		})
	})
end