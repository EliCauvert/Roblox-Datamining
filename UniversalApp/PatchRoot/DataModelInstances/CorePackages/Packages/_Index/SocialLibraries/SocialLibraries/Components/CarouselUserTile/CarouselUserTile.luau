local SocialLibraries = script:FindFirstAncestor("SocialLibraries")
local DependenciesModule = require(SocialLibraries.dependencies)
local Roact = DependenciesModule.Roact
local Llama = DependenciesModule.llama
local UIBlox = DependenciesModule.UIBlox
local PlayerTile = UIBlox.App.Tile.PlayerTile
local Interactable = UIBlox.Core.Control.Interactable
local GetUserAvatarImageModule = require(SocialLibraries.User.getUserAvatarImage)
local PlayerNameModule = require(script.Parent.PlayerName)
local _ = require(script.Parent.StyleTypes)
local ConstantsModule = require(script.Parent.Constants)

local function OnStateChanged() --[[ Line: 16 ]] end

local config = {
	tileSize = ConstantsModule.TILE_SIZE,
	nameTopPadding = ConstantsModule.NAME_TOP_PADDING,
	contextualTopPadding = ConstantsModule.CONTEXTUAL_TOP_PADDING
}

return function(p1) --[[ Line: 49 ]]
	-- upvalues: Llama (copy), config (copy), Roact (copy), PlayerTile (copy), GetUserAvatarImageModule (copy), PlayerNameModule (copy), Interactable (copy), OnStateChanged (copy)
	local JoinResult = Llama.Dictionary.join(config, p1)
	local TileSize = JoinResult.tileSize
	
	local function _() --[[ Line: 53 ]]
		-- upvalues: JoinResult (copy)
		return if JoinResult.renderButtons then JoinResult.renderButtons() else nil
	end
	
	local _ = function() --[[ Line: 70 ]]
		-- upvalues: JoinResult (copy)
		return if JoinResult.renderContextualInfo then JoinResult.renderContextualInfo() else nil
	end
	
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = JoinResult.layoutOrder,
		Size = UDim2.fromOffset(TileSize, 0)
	}, {
		UIListLayout = Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		PlayerTileFrame = Roact.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(TileSize, TileSize)
		}, {
			PlayerTile = (function() --[[ Line: 59 ]]
				-- upvalues: JoinResult (copy), Roact (upval), PlayerTile (upval), GetUserAvatarImageModule (upval)
				return if JoinResult.renderPlayerTile then JoinResult.renderPlayerTile() else Roact.createElement(PlayerTile, {
					tileSize = UDim2.fromOffset(JoinResult.tileSize, JoinResult.tileSize),
					thumbnail = GetUserAvatarImageModule(JoinResult.userId),
					onActivated = JoinResult.onActivatedTile,
					buttons = if JoinResult.renderButtons then JoinResult.renderButtons() else nil
				})
			end)()
		}),
		NameTopPadding = if JoinResult.nameTopPadding then Roact.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, JoinResult.nameTopPadding)
		}) else nil,
		UserInfo = Roact.createElement(Interactable, {
			LayoutOrder = 3,
			[Roact.Event.Activated] = JoinResult.onActivatedContextual,
			AutomaticSize = Enum.AutomaticSize.XY,
			onStateChanged = OnStateChanged,
			BackgroundTransparency = 1
		}, {
			UIListLayout = Roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			PlayerNameFrame = Roact.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				PlayerName = (function() --[[ Line: 76 ]]
					-- upvalues: JoinResult (copy), Roact (upval), PlayerNameModule (upval)
					return if JoinResult.renderPlayerName then JoinResult.renderPlayerName() else JoinResult.userName and Roact.createElement(PlayerNameModule, { name = JoinResult.userName, width = JoinResult.tileSize }) or nil
				end)()
			}),
			ContextualTopPadding = if JoinResult.contextualTopPadding then Roact.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, JoinResult.contextualTopPadding)
			}) else nil,
			ContextualInfoFrame = Roact.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				ContextualInfo = if JoinResult.renderContextualInfo then JoinResult.renderContextualInfo() else nil
			})
		})
	})
end