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

local var1 = function() end

local t = {
	tileSize = constantsModule.TILE_SIZE,
	nameTopPadding = constantsModule.NAME_TOP_PADDING,
	contextualTopPadding = constantsModule.CONTEXTUAL_TOP_PADDING
}

return function(p1)
	-- upvalues: llama (ref), t (ref), roact (ref), playerTile (ref), getUserAvatarImageModule (ref), playerNameModule (ref), interactable (ref), var1 (ref)
	local var2 = llama.Dictionary.join(t, p1)
	local tileSize = var2.tileSize
	
	local _ = function()
		-- upvalues: var2 (ref)
		return if var2.renderButtons then var2.renderButtons() else nil
	end
	
	local _ = function()
		-- upvalues: var2 (ref)
		return if var2.renderContextualInfo then var2.renderContextualInfo() else nil
	end
	
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = var2.layoutOrder,
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
			PlayerTile = (function()
				-- upvalues: var2 (ref), roact (copy), playerTile (copy), getUserAvatarImageModule (copy)
				return if var2.renderPlayerTile then var2.renderPlayerTile() else roact.createElement(playerTile, {
					tileSize = UDim2.fromOffset(var2.tileSize, var2.tileSize),
					thumbnail = getUserAvatarImageModule(var2.userId),
					onActivated = var2.onActivatedTile,
					buttons = if var2.renderButtons then var2.renderButtons() else nil
				})
			end)()
		}),
		NameTopPadding = if var2.nameTopPadding then roact.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, var2.nameTopPadding)
		}) else nil,
		UserInfo = roact.createElement(interactable, {
			LayoutOrder = 3,
			[roact.Event.Activated] = var2.onActivatedContextual,
			AutomaticSize = Enum.AutomaticSize.XY,
			onStateChanged = var1,
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
				PlayerName = (function()
					-- upvalues: var2 (ref), roact (copy), playerNameModule (copy)
					return if var2.renderPlayerName then var2.renderPlayerName() else var2.userName and roact.createElement(playerNameModule, { name = var2.userName, width = var2.tileSize }) or nil
				end)()
			}),
			ContextualTopPadding = if var2.contextualTopPadding then roact.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, var2.contextualTopPadding)
			}) else nil,
			ContextualInfoFrame = roact.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				ContextualInfo = if var2.renderContextualInfo then var2.renderContextualInfo() else nil
			})
		})
	})
end